From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Oct 2015 22:08:45 +0200
Subject: [Buildroot] [PATCH 3/3] gcc: simplify musl patches for SSP
 support
In-Reply-To: <1445087350-4947-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1445087350-4947-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1445087350-4947-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20151017200845.GA32247@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-10-17 15:09 +0200, Thomas Petazzoni spake thusly:
> Now that we are always explicitly passing gcc_cv_libc_provides_ssp,
> there is no longer any reason to modify the gcc configure/configure.ac
> to take into account the musl case. When a musl toolchain is being
> built, BR2_TOOLCHAIN_HAS_SSP is always 'y', and therefore
> gcc_cv_libc_provides_ssp=yes is always passed when building
> gcc-initial and gcc-final.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/gcc/4.7.4/900-musl-support.patch     | 36 ----------------------------
>  package/gcc/4.8.5/900-musl-support.patch     | 36 ----------------------------
>  package/gcc/4.9.3/900-musl-support.patch     | 36 ----------------------------
>  package/gcc/5.2.0/904-musl-libc-config.patch | 36 ----------------------------
>  4 files changed, 144 deletions(-)
> 
> diff --git a/package/gcc/4.7.4/900-musl-support.patch b/package/gcc/4.7.4/900-musl-support.patch
> index 1cb6701..67b8c30 100644
> --- a/package/gcc/4.7.4/900-musl-support.patch
> +++ b/package/gcc/4.7.4/900-musl-support.patch
> @@ -323,24 +323,6 @@ Index: b/gcc/configure
>  ===================================================================
>  --- a/gcc/configure
>  +++ b/gcc/configure
> -@@ -26791,6 +26791,9 @@
> - else
> -   gcc_cv_libc_provides_ssp=no
> -     case "$target" in
> -+       *-*-musl*)
> -+         # All versions of musl provide stack protector
> -+	 gcc_cv_libc_provides_ssp=yes;;
> -        *-*-linux* | *-*-kfreebsd*-gnu | *-*-knetbsd*-gnu)
> -       # glibc 2.4 and later provides __stack_chk_fail and
> -       # either __stack_chk_guard, or TLS access to stack guard canary.
> -@@ -26824,6 +26827,7 @@
> - 	 # <http://gcc.gnu.org/ml/gcc/2008-10/msg00130.html>) and for now
> - 	 # simply assert that glibc does provide this, which is true for all
> - 	 # realistically usable GNU/Hurd configurations.
> -+	 # All supported versions of musl provide it as well
> - 	 gcc_cv_libc_provides_ssp=yes;;
> -        *-*-darwin* | *-*-freebsd*)
> - 	 ac_fn_c_check_func "$LINENO" "__stack_chk_fail" "ac_cv_func___stack_chk_fail"
>  @@ -26906,6 +26910,9 @@
>         gcc_cv_target_dl_iterate_phdr=no
>       fi
> @@ -355,24 +337,6 @@ Index: b/gcc/configure.ac
>  ===================================================================
>  --- a/gcc/configure.ac
>  +++ b/gcc/configure.ac
> -@@ -4669,6 +4669,9 @@
> -       gcc_cv_libc_provides_ssp,
> -       [gcc_cv_libc_provides_ssp=no
> -     case "$target" in
> -+       *-*-musl*)
> -+         # All versions of musl provide stack protector
> -+	 gcc_cv_libc_provides_ssp=yes;;
> -        *-*-linux* | *-*-kfreebsd*-gnu | *-*-knetbsd*-gnu)
> -       [# glibc 2.4 and later provides __stack_chk_fail and
> -       # either __stack_chk_guard, or TLS access to stack guard canary.
> -@@ -4702,6 +4705,7 @@
> - 	 # <http://gcc.gnu.org/ml/gcc/2008-10/msg00130.html>) and for now
> - 	 # simply assert that glibc does provide this, which is true for all
> - 	 # realistically usable GNU/Hurd configurations.
> -+	 # All supported versions of musl provide it as well
> - 	 gcc_cv_libc_provides_ssp=yes;;
> -        *-*-darwin* | *-*-freebsd*)
> - 	 AC_CHECK_FUNC(__stack_chk_fail,[gcc_cv_libc_provides_ssp=yes],
>  @@ -4767,6 +4771,9 @@
>         gcc_cv_target_dl_iterate_phdr=no
>       fi
> diff --git a/package/gcc/4.8.5/900-musl-support.patch b/package/gcc/4.8.5/900-musl-support.patch
> index 761f018..6743a88 100644
> --- a/package/gcc/4.8.5/900-musl-support.patch
> +++ b/package/gcc/4.8.5/900-musl-support.patch
> @@ -486,24 +486,6 @@ Index: b/gcc/configure
>  ===================================================================
>  --- a/gcc/configure
>  +++ b/gcc/configure
> -@@ -26821,6 +26821,9 @@
> - else
> -   gcc_cv_libc_provides_ssp=no
> -     case "$target" in
> -+       *-*-musl*)
> -+         # All versions of musl provide stack protector
> -+	 gcc_cv_libc_provides_ssp=yes;;
> -        *-*-linux* | *-*-kfreebsd*-gnu | *-*-knetbsd*-gnu)
> -       # glibc 2.4 and later provides __stack_chk_fail and
> -       # either __stack_chk_guard, or TLS access to stack guard canary.
> -@@ -26854,6 +26857,7 @@
> - 	 # <http://gcc.gnu.org/ml/gcc/2008-10/msg00130.html>) and for now
> - 	 # simply assert that glibc does provide this, which is true for all
> - 	 # realistically usable GNU/Hurd configurations.
> -+	 # All supported versions of musl provide it as well
> - 	 gcc_cv_libc_provides_ssp=yes;;
> -        *-*-darwin* | *-*-freebsd*)
> - 	 ac_fn_c_check_func "$LINENO" "__stack_chk_fail" "ac_cv_func___stack_chk_fail"
>  @@ -26936,6 +26940,9 @@
>         gcc_cv_target_dl_iterate_phdr=no
>       fi
> @@ -518,24 +500,6 @@ Index: b/gcc/configure.ac
>  ===================================================================
>  --- a/gcc/configure.ac
>  +++ b/gcc/configure.ac
> -@@ -4750,6 +4750,9 @@
> -       gcc_cv_libc_provides_ssp,
> -       [gcc_cv_libc_provides_ssp=no
> -     case "$target" in
> -+       *-*-musl*)
> -+         # All versions of musl provide stack protector
> -+	 gcc_cv_libc_provides_ssp=yes;;
> -        *-*-linux* | *-*-kfreebsd*-gnu | *-*-knetbsd*-gnu)
> -       [# glibc 2.4 and later provides __stack_chk_fail and
> -       # either __stack_chk_guard, or TLS access to stack guard canary.
> -@@ -4783,6 +4786,7 @@
> - 	 # <http://gcc.gnu.org/ml/gcc/2008-10/msg00130.html>) and for now
> - 	 # simply assert that glibc does provide this, which is true for all
> - 	 # realistically usable GNU/Hurd configurations.
> -+	 # All supported versions of musl provide it as well
> - 	 gcc_cv_libc_provides_ssp=yes;;
> -        *-*-darwin* | *-*-freebsd*)
> - 	 AC_CHECK_FUNC(__stack_chk_fail,[gcc_cv_libc_provides_ssp=yes],
>  @@ -4848,6 +4852,9 @@
>         gcc_cv_target_dl_iterate_phdr=no
>       fi
> diff --git a/package/gcc/4.9.3/900-musl-support.patch b/package/gcc/4.9.3/900-musl-support.patch
> index 56502b8..a711b06 100644
> --- a/package/gcc/4.9.3/900-musl-support.patch
> +++ b/package/gcc/4.9.3/900-musl-support.patch
> @@ -452,24 +452,6 @@ Index: b/gcc/configure
>  ===================================================================
>  --- a/gcc/configure
>  +++ b/gcc/configure
> -@@ -27328,6 +27328,9 @@
> - else
> -   gcc_cv_libc_provides_ssp=no
> -     case "$target" in
> -+       *-*-musl*)
> -+         # All versions of musl provide stack protector
> -+	 gcc_cv_libc_provides_ssp=yes;;
> -        *-*-linux* | *-*-kfreebsd*-gnu | *-*-knetbsd*-gnu)
> -       # glibc 2.4 and later provides __stack_chk_fail and
> -       # either __stack_chk_guard, or TLS access to stack guard canary.
> -@@ -27360,6 +27363,7 @@
> - 	 # <http://gcc.gnu.org/ml/gcc/2008-10/msg00130.html>) and for now
> - 	 # simply assert that glibc does provide this, which is true for all
> - 	 # realistically usable GNU/Hurd configurations.
> -+	 # All supported versions of musl provide it as well
> - 	 gcc_cv_libc_provides_ssp=yes;;
> -        *-*-darwin* | *-*-freebsd*)
> - 	 ac_fn_c_check_func "$LINENO" "__stack_chk_fail" "ac_cv_func___stack_chk_fail"
>  @@ -27449,6 +27453,9 @@
>         gcc_cv_target_dl_iterate_phdr=no
>       fi
> @@ -484,24 +466,6 @@ Index: b/gcc/configure.ac
>  ===================================================================
>  --- a/gcc/configure.ac
>  +++ b/gcc/configure.ac
> -@@ -5016,6 +5016,9 @@
> -       gcc_cv_libc_provides_ssp,
> -       [gcc_cv_libc_provides_ssp=no
> -     case "$target" in
> -+       *-*-musl*)
> -+         # All versions of musl provide stack protector
> -+	 gcc_cv_libc_provides_ssp=yes;;
> -        *-*-linux* | *-*-kfreebsd*-gnu | *-*-knetbsd*-gnu)
> -       # glibc 2.4 and later provides __stack_chk_fail and
> -       # either __stack_chk_guard, or TLS access to stack guard canary.
> -@@ -5042,6 +5045,7 @@
> - 	 # <http://gcc.gnu.org/ml/gcc/2008-10/msg00130.html>) and for now
> - 	 # simply assert that glibc does provide this, which is true for all
> - 	 # realistically usable GNU/Hurd configurations.
> -+	 # All supported versions of musl provide it as well
> - 	 gcc_cv_libc_provides_ssp=yes;;
> -        *-*-darwin* | *-*-freebsd*)
> - 	 AC_CHECK_FUNC(__stack_chk_fail,[gcc_cv_libc_provides_ssp=yes],
>  @@ -5108,6 +5112,9 @@
>         gcc_cv_target_dl_iterate_phdr=no
>       fi
> diff --git a/package/gcc/5.2.0/904-musl-libc-config.patch b/package/gcc/5.2.0/904-musl-libc-config.patch
> index c4eddb4..8549140 100644
> --- a/package/gcc/5.2.0/904-musl-libc-config.patch
> +++ b/package/gcc/5.2.0/904-musl-libc-config.patch
> @@ -225,24 +225,6 @@ Index: b/gcc/configure
>  ===================================================================
>  --- a/gcc/configure
>  +++ b/gcc/configure
> -@@ -27681,6 +27681,9 @@
> - else
> -   gcc_cv_libc_provides_ssp=no
> -     case "$target" in
> -+       *-*-musl*)
> -+	 # All versions of musl provide stack protector
> -+	 gcc_cv_libc_provides_ssp=yes;;
> -        *-*-linux* | *-*-kfreebsd*-gnu | *-*-knetbsd*-gnu)
> -       # glibc 2.4 and later provides __stack_chk_fail and
> -       # either __stack_chk_guard, or TLS access to stack guard canary.
> -@@ -27713,6 +27716,7 @@
> - 	 # <http://gcc.gnu.org/ml/gcc/2008-10/msg00130.html>) and for now
> - 	 # simply assert that glibc does provide this, which is true for all
> - 	 # realistically usable GNU/Hurd configurations.
> -+	 # All supported versions of musl provide it as well
> - 	 gcc_cv_libc_provides_ssp=yes;;
> -        *-*-darwin* | *-*-freebsd*)
> - 	 ac_fn_c_check_func "$LINENO" "__stack_chk_fail" "ac_cv_func___stack_chk_fail"
>  @@ -27809,6 +27813,9 @@
>         gcc_cv_target_dl_iterate_phdr=no
>       fi
> @@ -257,24 +239,6 @@ Index: b/gcc/configure.ac
>  ===================================================================
>  --- a/gcc/configure.ac
>  +++ b/gcc/configure.ac
> -@@ -5199,6 +5199,9 @@
> -       gcc_cv_libc_provides_ssp,
> -       [gcc_cv_libc_provides_ssp=no
> -     case "$target" in
> -+       *-*-musl*)
> -+	 # All versions of musl provide stack protector
> -+	 gcc_cv_libc_provides_ssp=yes;;
> -        *-*-linux* | *-*-kfreebsd*-gnu | *-*-knetbsd*-gnu)
> -       # glibc 2.4 and later provides __stack_chk_fail and
> -       # either __stack_chk_guard, or TLS access to stack guard canary.
> -@@ -5225,6 +5228,7 @@
> - 	 # <http://gcc.gnu.org/ml/gcc/2008-10/msg00130.html>) and for now
> - 	 # simply assert that glibc does provide this, which is true for all
> - 	 # realistically usable GNU/Hurd configurations.
> -+	 # All supported versions of musl provide it as well
> - 	 gcc_cv_libc_provides_ssp=yes;;
> -        *-*-darwin* | *-*-freebsd*)
> - 	 AC_CHECK_FUNC(__stack_chk_fail,[gcc_cv_libc_provides_ssp=yes],
>  @@ -5298,6 +5302,9 @@
>         gcc_cv_target_dl_iterate_phdr=no
>       fi
> -- 
> 2.6.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
