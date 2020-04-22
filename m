From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Apr 2020 22:18:56 +0200
Subject: [Buildroot] [PATCH] package/apache: fix apxs destdir prefix
In-Reply-To: <1587545029-22187-1-git-send-email-angelo@amarulasolutions.com>
References: <1587545029-22187-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <20200422201856.GH5035@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Angelo, All,

On 2020-04-22 10:43 +0200, Angelo Compagnucci spake thusly:
> Apache version 2.4.43 introduced a problem in apxs path handling.
> In buildroot apxs and config_vars.mk, all the paths are expressed
> as absolute so the trick of guessing a destdir path to prefix to all
> the others is not needed and produces wrong paths in the form of
> destdir + full path.
> 
> Fixes:
> http://autobuild.buildroot.net/results/c41f31566974209897a3a1ec35afe2536fb248cc
> http://autobuild.buildroot.net/results/b93f19976ce96e79ea159c25ed74a7377c78f334
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  ...support-for-cross-compiling-to-apxs.-If-a.patch | 87 ++++++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 package/apache/0005-Revert-Add-support-for-cross-compiling-to-apxs.-If-a.patch
> 
> diff --git a/package/apache/0005-Revert-Add-support-for-cross-compiling-to-apxs.-If-a.patch b/package/apache/0005-Revert-Add-support-for-cross-compiling-to-apxs.-If-a.patch
> new file mode 100644
> index 0000000..2520a31
> --- /dev/null
> +++ b/package/apache/0005-Revert-Add-support-for-cross-compiling-to-apxs.-If-a.patch
> @@ -0,0 +1,87 @@
> +From 6d8eaefb733a99fa5a95d2b4a86706a7cbe12d36 Mon Sep 17 00:00:00 2001
> +From: Angelo Compagnucci <angelo@amarulasolutions.com>
> +Date: Wed, 22 Apr 2020 10:25:22 +0200
> +Subject: [PATCH] Revert "Add support for cross compiling to apxs. If apxs is
> + being executed from somewhere"
> +
> +This reverts commit c7d7b6d1a3b3c4b2c7ad19258fd0d388901a1c9d.

Rather than reverting an upstream patch that puports to actually support
cross-compilation, can we instead revisit our hack that shoehorns the
absolute patchs to begin  with?
    https://git.buildroot.org/buildroot/tree/package/apache/apache.mk#n101

Regards,
Yann E. MORIN.

> +In buildroot apxs and config_vars.mk, all the paths are expressed
> +as absolute so the trick of guessing a destdir path to prefix to all
> +the others is not needed and produces wrong paths in the form of
> +destdir + full path.
> +
> +Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> +---
> + support/apxs.in | 22 ++++++----------------
> + 1 file changed, 6 insertions(+), 16 deletions(-)
> +
> +diff --git a/support/apxs.in b/support/apxs.in
> +index 65e1288..6ba0bf0 100644
> +--- a/support/apxs.in
> ++++ b/support/apxs.in
> +@@ -23,20 +23,10 @@ package apxs;
> + ##  Configuration
> + ##
> + 
> +-#   are we building in a cross compile environment? If so, destdir contains
> +-#   the base directory of the cross compiled environment, otherwise destdir
> +-#   is the empty string.
> +-
> +-my $destdir = "";
> +-my $ddi = rindex($0, "@exp_bindir@");
> +-if ($ddi >= 0) {
> +-  $destdir = substr($0, 0, $ddi);
> +-}
> +-
> + my %config_vars = ();
> + 
> + my $installbuilddir = "@exp_installbuilddir@";
> +-get_config_vars($destdir . "$installbuilddir/config_vars.mk",\%config_vars);
> ++get_config_vars("$installbuilddir/config_vars.mk",\%config_vars);
> + 
> + # read the configuration variables once
> + 
> +@@ -51,10 +41,10 @@ my $CFG_CFLAGS     = join ' ', map { get_vars($_) }
> +   qw(SHLTCFLAGS CFLAGS NOTEST_CPPFLAGS EXTRA_CPPFLAGS EXTRA_CFLAGS);
> + my $CFG_LDFLAGS    = join ' ', map { get_vars($_) }
> +   qw(LDFLAGS NOTEST_LDFLAGS SH_LDFLAGS);
> +-my $includedir     = $destdir . get_vars("includedir");
> ++my $includedir     = get_vars("includedir");
> + my $CFG_INCLUDEDIR = eval qq("$includedir");
> + my $CFG_CC         = get_vars("CC");
> +-my $libexecdir     = $destdir . get_vars("libexecdir");
> ++my $libexecdir     = get_vars("libexecdir");
> + my $CFG_LIBEXECDIR = eval qq("$libexecdir");
> + my $sbindir        = get_vars("sbindir");
> + my $CFG_SBINDIR    = eval qq("$sbindir");
> +@@ -350,7 +340,7 @@ if ($opt_q) {
> +     }
> + }
> + 
> +-my $apr_config = $destdir . get_vars("APR_CONFIG");
> ++my $apr_config = get_vars("APR_CONFIG");
> + 
> + if (! -x "$apr_config") {
> +     error("$apr_config not found!");
> +@@ -361,7 +351,7 @@ my $apr_major_version = (split /\./, `$apr_config --version`)[0];
> + 
> + my $apu_config = "";
> + if ($apr_major_version < 2) {
> +-    $apu_config = $destdir . get_vars("APU_CONFIG");
> ++    $apu_config = get_vars("APU_CONFIG");
> + 
> +     if (! -x "$apu_config") {
> +         error("$apu_config not found!");
> +@@ -516,7 +506,7 @@ if ($opt_i or $opt_e) {
> +         #  use .so unambigiously for installed shared library modules
> +         $t =~ s|\.[^./\\]+$|\.so|;
> +         if ($opt_i) {
> +-	    push(@cmds, $destdir . "$installbuilddir/instdso.sh SH_LIBTOOL='" .
> ++	    push(@cmds, "$installbuilddir/instdso.sh SH_LIBTOOL='" .
> +                  "$libtool' $f $CFG_LIBEXECDIR");
> + 	    push(@cmds, "chmod 755 $CFG_LIBEXECDIR/$t");
> +         }
> +-- 
> +2.7.4
> +
> -- 
> 2.7.4
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
