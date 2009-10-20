From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 20 Oct 2009 23:11:53 +0200
Subject: [Buildroot] [PATCH] Add sysstat tools
In-Reply-To: <1255892589.19306.107.camel@coalu.atr> (Lionel Landwerlin's
	message of "Sun\, 18 Oct 2009 21\:03\:09 +0200")
References: <1255096083.22093.0.camel@coalu.atr>
	<1255118149.2236.3.camel@coalu.atr>
	<1255874745.19306.8.camel@coalu.atr> <20091018154732.GB13529@mx.loc>
	<1255892589.19306.107.camel@coalu.atr>
Message-ID: <878wf5src6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Lionel" == Lionel Landwerlin <lionel.landwerlin@openwide.fr> writes:

 Lionel> Hi Bernhard,
 Lionel> Thanks a lot for reviewing my patch. I made some correction following
 Lionel> your review :

 Lionel>       * The description has been completed (from the sysstat website).
 Lionel>       * I rebased my patch on the last git revision and the
 Lionel>         install-strip rule doesn't seem required anymore, so I removed
 Lionel>         the patch.
 Lionel>       * Removed dependency on uclibc.
 Lionel>       * Filled INSTALL_DOC according to BR2_HAVE_DOCUMENTATION.
 Lionel>       * And last, INSTALL_ISAG is set to 'n' to avoid the isag script
 Lionel>         installation which is a postprocessing script depending on
 Lionel>         tcl/tk.

Thanks, committed. There were still a few minor issues, but I've fixed
those myself.

 Lionel> Maybe later I will add the rules for host installation, but it doesn't
 Lionel> look like a high priority to me.

 Lionel> Here is a new patch :

 Lionel> [PATCH] Add sysstat tools

 Lionel> Signed-off-by: Lionel Landwerlin <lionel.landwerlin@openwide.fr>
 Lionel> ---
 Lionel>  package/Config.in          |    3 ++-
 Lionel>  package/sysstat/Config.in  |   40 ++++++++++++++++++++++++++++++++++++++++
 Lionel>  package/sysstat/sysstat.mk |   26 ++++++++++++++++++++++++++
 Lionel>  3 files changed, 68 insertions(+), 1 deletions(-)
 Lionel>  create mode 100644 package/sysstat/Config.in
 Lionel>  create mode 100644 package/sysstat/sysstat.mk

 Lionel> diff --git a/package/Config.in b/package/Config.in
 Lionel> index ff7fc3d..aa02d2b 100644
 Lionel> --- a/package/Config.in
 Lionel> +++ b/package/Config.in
 Lionel> @@ -270,7 +270,8 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 Lionel>  source "package/sfdisk/Config.in"
 Lionel>  endif
 Lionel>  source "package/smartmontools/Config.in"
 Lionel> -if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 Lionel> +source "package/sysstat/Config.in"
 Lionel> +if BR2_PACKAGE_BUSYBOX_HIDE_OTHERS

Don't change SHOW_OTHERS to HIDE_OTHERS.

 Lionel> +
 Lionel> +	  http://pagesperso-orange.fr/sebastien.godard/
 Lionel> +	  ftp://ibiblio.org/pub/Linux/system/status/


One URL should be enough.


 Lionel> +SYSSTAT_SOURCE = sysstat-$(SYSSTAT_VERSION).tar.bz2
 Lionel> +SYSSTAT_SITE = http://pagesperso-orange.fr/sebastien.godard/
 Lionel> +SYSSTAT_AUTORECONF = NO
 Lionel> +SYSSTAT_LIBTOOL_PATCH = NO
 Lionel> +SYSSTAT_INSTALL_STAGING = YES


sysstat is a collection of programs, not a library - So there afaik
isn't any reason to install into staging.


 Lionel> +SYSSTAT_INSTALL_TARGET = YES
 Lionel> +
 Lionel> +# Should be --disable-man-group, it might be a little mistake in the
 Lionel> +# configure.in script.
 Lionel> +SYSSTAT_CONF_OPT = --enable-man-group
 Lionel> +ifneq ($(BR2_HAVE_DOCUMENTATION),y)
 Lionel> +SYSSTAT_CONF_OPT += --disable-documentation
 Lionel> +endif
 Lionel> +
 Lionel> +# The isag tool is a post processing script that depends on tcl/tk
 Lionel> +# among other things. So we don't install it.
 Lionel> +SYSSTAT_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) INSTALL_ISAG=n

You are forgetting to add a make target (E.G. install), so nothing will
get installed.


-- 
Bye, Peter Korsgaard
