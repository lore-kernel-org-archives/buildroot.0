From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 5 Nov 2018 14:35:56 -0600
Subject: [Buildroot] [PATCH] Config.in: security hardening: disable
 FORTIFY_SOURCE for gcc < 6
In-Reply-To: <20181105200750.6039-1-romain.naour@gmail.com>
References: <20181105200750.6039-1-romain.naour@gmail.com>
Message-ID: <CANQCQpYGPBpEivKh893TPeoqoOtS+FxGmNjYvmgwGWoArOyu=A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain ,





On Mon, Nov 5, 2018, 14:07 Romain Naour <romain.naour@gmail.com wrote:

> As reported in the bug report [1], gcc < 6 doesn't build when
> FORTIFY_SOURCE is set to 1 or 2. The issue is related to the
> upstream bug report [2] but the patch fixing the issue for gcc 6
> has not been backported to earlier gcc versions.
>
> Add a dependency on gcc at least version 6 to BR2_FORTIFY_SOURCE_1
> and BR2_FORTIFY_SOURCE_2.
>

Sorry about the HTML email.

Could this dependency be conditional on if a internal toolchain is used?



> [1] https://bugs.busybox.net/show_bug.cgi?id=11476
> [2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=61164
> [3]
> https://github.com/gcc-mirror/gcc/commit/55f12fce4ccf77513644a247f9c401a5b1fa2402
>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
> To be backported up to Buildroot 2018.02.x.
> ---
>  Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Config.in b/Config.in
> index 584a1f087f..6176433fc0 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -798,6 +798,8 @@ config BR2_FORTIFY_SOURCE_NONE
>
>  config BR2_FORTIFY_SOURCE_1
>         bool "Conservative"
> +       # gcc bug https://gcc.gnu.org/bugzilla/show_bug.cgi?id=61164
> +       depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6
>         help
>           This option sets _FORTIFY_SOURCE to 1 and only introduces
>           checks that shouldn't change the behavior of conforming
> @@ -805,6 +807,8 @@ config BR2_FORTIFY_SOURCE_1
>
>  config BR2_FORTIFY_SOURCE_2
>         bool "Aggressive"
> +       # gcc bug https://gcc.gnu.org/bugzilla/show_bug.cgi?id=61164
> +       depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6
>         help
>           This option sets _FORTIFY_SOURCES to 2 and some more
>           checking is added, but some conforming programs might fail.
> --
> 2.14.5
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181105/39860aad/attachment.html>
