From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Aug 2013 13:08:45 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <CAAXf6LVr5La-XtqhEt+d8CjPoxojnjxOFnL0NKkOsumH_mQsLQ@mail.gmail.com>
References: <20130828063005.74A7952C1BE@lolut.humanoidz.org>
 <20130828090812.43a7f849@skate>
 <e8f643690cf9b327505bc17c83d08441@sysmic.org>
 <CAAXf6LVr5La-XtqhEt+d8CjPoxojnjxOFnL0NKkOsumH_mQsLQ@mail.gmail.com>
Message-ID: <20130830130845.79f32d41@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Thu, 29 Aug 2013 17:12:14 +0200, Thomas De Schampheleire wrote:

> Thomas, can you save the strongswan build output somewhere, or check
> the output of the above checks and the value of HAVE_BACKTRACE ?

So, in the failing case, for some reason, it detects that backtrace
support is available:

[...]
checking for library containing backtrace... none required
checking for backtrace... yes
[...]

Relevant config.log output:

configure:16457: /home/test/outputs/a637f916962b6136dd6dd4f4b9ff4e1cab568ef3/output/host/usr/bin/x86_64-unknown-linux-uclibc-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -L/usr/lib conftest.c  >&5
/home/test/outputs/a637f916962b6136dd6dd4f4b9ff4e1cab568ef3/output/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-unknown-linux-uclibc/4.6.3/../../../../x86_64-unknown-linux-uclibc/bin/ld: warning: libc.so.0, needed by /home/test/outputs/a637f916962b6136dd6dd4f4b9ff4e1cab568ef3/output/host/opt/ext-toolchain/bin/../lib/gcc/x86_64-unknown-linux-uclibc/4.6.3/../../../../x86_64-unknown-linux-uclibc/lib/../lib64/libgcc_s.so, may conflict with libc.so.6
/home/test/outputs/a637f916962b6136dd6dd4f4b9ff4e1cab568ef3/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot/lib64/libc.so.0: warning: the `gets' function is dangerous and should not be used.
/home/test/outputs/a637f916962b6136dd6dd4f4b9ff4e1cab568ef3/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot/lib64/libc.so.0: warning: the `getpw' function is dangerous and should not be used.
/home/test/outputs/a637f916962b6136dd6dd4f4b9ff4e1cab568ef3/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot/lib64/libc.so.0: warning: the use of `mktemp' is dangerous, better use `mkstemp' or `mkdtemp'
/home/test/outputs/a637f916962b6136dd6dd4f4b9ff4e1cab568ef3/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot/lib64/libc.so.0: warning: the use of `tmpnam_r' is dangerous, better use `mkstemp'
/home/test/outputs/a637f916962b6136dd6dd4f4b9ff4e1cab568ef3/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot/lib64/libc.so.0: warning: warning: `siggetmask' is obsolete; `sigprocmask' is best
/home/test/outputs/a637f916962b6136dd6dd4f4b9ff4e1cab568ef3/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot/lib64/libc.so.0: warning: the use of `tmpnam' is dangerous, better use `mkstemp'
/home/test/outputs/a637f916962b6136dd6dd4f4b9ff4e1cab568ef3/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot/lib64/libc.so.0: warning: the use of `tempnam' is dangerous, better use `mkstemp'
configure:16457: $? = 0
configure:16457: result: yes

I believe the problem is caused by the -L/usr/lib. Since both the
target and host have the same architecture (x86-64), it probably links
with the host C library for this test (which has backtrace support)
instead of the target C library (which doesn't have it).

It is caused by the AC_LIB_PREFIX macro that provides the
--with-lib-prefix and --without-lib-prefix options, and that by default
adds ${prefix}/lib and ${prefix}/include to LDFLAGS and CPPFLAGS
respectively.

I've just sent a patch that passes --without-lib-prefix, as it fixes
the build failure.

Thanks,

Thomas Petazzoni
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
