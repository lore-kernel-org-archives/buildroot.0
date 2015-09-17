From: Brendan Heading <brendanheading@gmail.com>
Date: Thu, 17 Sep 2015 01:10:46 +0100
Subject: [Buildroot] causes of stack-protector build issues
Message-ID: <CA+BsyQ6xvoM9mP9-pgJ4LmWvy-CLyJgxjYPtDpjMLwjUQO2fuQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, list,

As previously discussed I've been looking at the causes of problems
related to certain test builds where the stack smashing protection is
disabled, but where this isn't detected correctly. I've detailed the
cause, and the proposed solution at the bottom.

==========================

short explanation

GCC checks the __GLIBC__ and __GLIBC_MINOR__ macros. Normally (in
uclibc) they are set to 2 and 2, respectively.

In uclibc-ng they were recently (less than a month ago) bumped to 2
and 10 respectively. When the minor number is greater than 4, the GCC
configure script assumes that SSP is built into the C library, without
checking any further.

GCC is then built with specs that do not attempt to link the libssp
helper library when a program is compiled with stack protection
enabled. This fools the configure scripts used in packages, but of
course the packages don't link at the end as the helpers are missing.

Fix is to force GCC to enable or disable SSP by setting
gcc_cv_libc_provides_ssp when appropriate.

==========================

detailed recap of the problem/cause

When stack smashing protection is enabled during compile, the GCC
compiler emits function calls to __stack_chk_* helper functions. These
functions can be implemented in either the C library or in
libssp/libssp_nonshared libraries that can be optionally supplied by
the compiler.

GCC 4.9.3 (I've not checked any other versions yet) uses a number of
heuristics to determine whether or not stack protection is present in
the C library. In order, these are as follows - I've intentionally
simplified them:

1. if gcc_cv_libc_provides_ssp is already set to "yes" (ie in the env,
or config.cache)
2. if the musl toolchain is in use - this patch added by buildroot
3. if the GLIBC major version >= 2 and the minor version >=4
4. if the tuple contains linux, kfreebsd-gnu or knetbsd-gnu AND
__UCLIBC_HAS_SSP__ or __BIONIC__ is set in features.h
5. if the tuple contains *-*-gnu*
6. if the tuple is for darwin or freebsd, do a func check for __stack_chk_fail.

If any of the above conditions is true, gcc_cv_libc_provides_ssp is
set to "yes", otherwise it is set to "no".

"yes" causes TARGET_LIBC_PROVIDES_SSP to be defined as 1 in confdefs.h.

If TARGET_LIBC_PROVIDES_SSP is *not* defined, GCC's specs are set up
such that the fstack-protector flag results in a link to libssp being
emitted. If it *is* defined, then the stack protector flag emits no
extra links as it expects the helpers to be found in the C library.

In my tests, I found that uclibc 0.9.33 sets the __GLIBC__ (major) to
2 and __GLIBC_MINOR__ to 2 in features.h. This causes GCC to
(ultimately) decide that the libc does not support SSP.

However, uclibc-ng seems to set the versions to 2, and 10
respectively. This causes GCC's configure script to enable SSP without
checking if the helper functions exist as per (3) above.

The problem arises in sudo and ruby because the test which checks if
the -fstack-protector flag works properly only tests a simple empty
main(). Since this does not generate any calls to the SSP helpers, it
will compile and link fine as GCC's specs do not emit a link to
libssp.

==========================

Why does the br-arm-full-2015.08-rc1-38-gad0f85e.tar.bz2 toolchain not
show the problem with sudo or ruby ?

This is a GCC 4.7 toolchain. in features.h, the __GLIBC_MINOR__
version is set to 2 which means that the GCC build correctly detects
that the C library does not support SSP.

Further analysis shows that this toolchain is built against uclibc-ng
version 1.0.5. The change which updated features.h to minor version 10
was added in 1.0.6, which is the version where these problems have
been seen. The bump was done in the following commit:

http://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/include/features.h?id=4ff3a6c8eb91db71d6dc3d2932b66e848bd20ac3

In any case, sudo attempts to use the -fstack-protector-strong option,
This was introduced in GCC 4.9.x, so it fails which causes sudo to be
built without protection irrespective of the state of the libc.

==========================

Proposed solution

In package/gcc/gcc-initial/gcc-initial.mk, and also the equivalent
-final.mk, we should pass:

gcc_cv_libc_provides_ssp=no

... in the CONF_ENV settings where buildroot has been configured with
SSP disabled.

Note that there is an existing setting of this variable in
gcc-initial.mk, however it only sets it to "yes" if it's enabled in
the config, and does not force it to "no" in any other case, which
would cause the toolchain to make an inappropriate guess. It's also
set up as a target-specific variable in the Makefile, which seems like
an odd decision. In my patch I will remove this and set the variable
through the CONF_ENV setting.

If there are no objections I'll submit the patch soon.

==========================

regards

Brendan
