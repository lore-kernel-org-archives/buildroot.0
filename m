From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Mar 2020 22:47:26 +0100
Subject: [Buildroot] [PATCH 1/2]
 package/gobject-introspection/g-ir-scanner: do not set default compiler
 values
In-Reply-To: <20200320222359.88689-1-aduskett@gmail.com>
References: <20200320222359.88689-1-aduskett@gmail.com>
Message-ID: <20200321214726.GN4290@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2020-03-20 15:23 -0700, aduskett at gmail.com spake thusly:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> Commit 8b0aeafce2a22913e6a44818227f6a39e3225157 set 7 new variables in
> g-ir-scanner.in:
> 
> export CPP="${CPP:-${HOST_DIR}/bin/@BASENAME_TARGET_CPP@}"
> export CC="${CC:-${HOST_DIR}/bin/@BASENAME_TARGET_CC@}"
> export CXX="${CXX:-${HOST_DIR}/bin/@BASENAME_TARGET_CXX@}"
> CPPFLAGS="${CPPFLAGS:- at TARGET_CPPFLAGS@}"
> CFLAGS="${CFLAGS:- at TARGET_CFLAGS@}"
> CXXFLAGS="${CXXFLAGS:- at TARGET_CXXFLAGS@}"
> LDFLAGS="${LDFLAGS:- at TARGET_LDFLAGS@}"
> 
> However, defaulting to CPP, CC, or CXX breaks some packages because they may
> hard code CC to the system CC.
> 
> One such package is libostree which has the line
> "INTROSPECTION_SCANNER_ENV = CC=gcc" in the Makefile.

But then, that's clearly a bug in libostree! They should not ever try to
call a hard-coded compiler. If a user would even do a native build with
an alternate compiler:

    CC=${HOME}/foo/bin/my-gcc-12.42 ./configure

Then the above would also break anyway. It's not even just about
cross-compilation. We should fix libostree and send them the fix.
Probably they should do something like:

    INTROSPECTION_SCANNER_ENV = CC=${CC}

With that commit log of yours, the problem is now obvious, while it did
not look like it when we discussed on IRC, hence my comments now...

Note that my comments above do not preclude us fixing our wrapper with
this patch of yours, but if there is no need to do, I'd like to avoid
it.

Regards,
Yann E. MORIN.

> Because g-ir-scanner defaults CC to a predefined CC instead of explicitly
> overwriting it, the CC passed from the makefile is used, and linking errors
> occur as a result.
> 
> Remove the defaults for the following and explicitly set the paths to the
> proper cross-toolchain binaries:
> CPP, CC, CXX
> 
> Fixes
> http://autobuild.buildroot.org/results/f8a14307e6feff61acd963d6cd2aac289e6d1647
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/gobject-introspection/g-ir-scanner.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/gobject-introspection/g-ir-scanner.in b/package/gobject-introspection/g-ir-scanner.in
> index 22df7be309..6fc495389e 100644
> --- a/package/gobject-introspection/g-ir-scanner.in
> +++ b/package/gobject-introspection/g-ir-scanner.in
> @@ -5,9 +5,9 @@
>  # the variables blank (LDFLAGS, CFLAGS, and CPPFLAGS.)
>  # Export these variables to ensure all build systems can generate .gir and
>  # .typelib files properly.
> -export CPP="${CPP:-${HOST_DIR}/bin/@BASENAME_TARGET_CPP@}"
> -export CC="${CC:-${HOST_DIR}/bin/@BASENAME_TARGET_CC@}"
> -export CXX="${CXX:-${HOST_DIR}/bin/@BASENAME_TARGET_CXX@}"
> +export CPP="${HOST_DIR}/bin/@BASENAME_TARGET_CPP@"
> +export CC="${HOST_DIR}/bin/@BASENAME_TARGET_CC@"
> +export CXX="${HOST_DIR}/bin/@BASENAME_TARGET_CXX@"
>  export CPPFLAGS="${CPPFLAGS:- at TARGET_CPPFLAGS@}"
>  export CFLAGS="${CFLAGS:- at TARGET_CFLAGS@}"
>  export CXXFLAGS="${CXXFLAGS:- at TARGET_CXXFLAGS@}"
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
