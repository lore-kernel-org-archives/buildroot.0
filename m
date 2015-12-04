From: =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Date: Fri, 4 Dec 2015 17:52:31 +0100
Subject: [Buildroot] [PATCH] wine: fix sane related build failure
In-Reply-To: <1436094900-3217-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1436094900-3217-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <5661C4CF.7030709@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Moving this discussion to the correct thread...
I meanwhile submitted https://bugs.winehq.org/show_bug.cgi?id=39660 which didn't caught much attention yet.
But I looked at it myself and I think I found a way to avoid patching Wine.
Wines configure exposes special COMPONENT_CFLAGS and COMPONENT_LIBS variables which get prioritized over "guessed" tools.
What's your opinion on this (afaict it works):


diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index 38576db..e29d616 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -173,8 +173,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_SANE_BACKENDS),y)
 WINE_CONF_OPTS += --with-sane
+WINE_CONF_OPTS += SANE_CFLAGS="`$(STAGING_DIR)/usr/bin/sane-config --cflags 2>/dev/null`"
+WINE_CONF_OPTS += SANE_LIBS="`$(STAGING_DIR)/usr/bin/sane-config --ldflags 2>/dev/null`"
 WINE_DEPENDENCIES += sane-backends
-WINE_CONF_ENV += SANE_CONFIG=$(STAGING_DIR)/usr/bin/sane-config
 else
 WINE_CONF_OPTS += --without-sane
 endif



Am 05.07.2015 um 13:15 schrieb Thomas Petazzoni:
> If sane is installed system-wide on the build machine, then the
> sane-config binary found is the one of the system, which returns
> incorrect library paths for cross-compilation.
> 
> To fix this, this commit adds a patch to wine to make it support a
> SANE_CONFIG environment variable, and then adjusts wine.mk to
> explicitly pass the path to $(STAGING_DIR)/usr/bin/sane-config.
> 
> Fixes:
> 
>   http://autobuild.buildroot.org/results/8bd/8bdc1eed55075313403aa8a6c9af6a427bce198e/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/wine/0003-sane-config-fix.patch | 21 +++++++++++++++++++++
>  package/wine/wine.mk                    |  1 +
>  2 files changed, 22 insertions(+)
>  create mode 100644 package/wine/0003-sane-config-fix.patch
> 
> diff --git a/package/wine/0003-sane-config-fix.patch b/package/wine/0003-sane-config-fix.patch
> new file mode 100644
> index 0000000..d53843a
> --- /dev/null
> +++ b/package/wine/0003-sane-config-fix.patch
> @@ -0,0 +1,21 @@
> +Add support for SANE_CONFIG variable
> +
> +Instead of using directly the sane-config command, allow to pass a
> +SANE_CONFIG environment variable to override where to find the
> +sane-config tool.
> +
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +
> +Index: b/configure.ac
> +===================================================================
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -1375,7 +1375,7 @@
> + if test "x$with_sane" != "xno"
> + then
> +     ac_save_CPPFLAGS="$CPPFLAGS"
> +-    WINE_PACKAGE_FLAGS(SANE,[libsane],,[`sane-config --cflags 2>/dev/null`],[`sane-config --ldflags 2>/dev/null`])
> ++    WINE_PACKAGE_FLAGS(SANE,[libsane],,[`${SANE_CONFIG:-sane-config} --cflags 2>/dev/null`],[`${SANE_CONFIG:-sane-config} --ldflags 2>/dev/null`])
> +     AC_CHECK_HEADER(sane/sane.h,
> +         [WINE_CHECK_SONAME(sane,sane_init,,[SANE_CFLAGS=""],[$SANE_LIBS])],
> +         [SANE_CFLAGS=""])
> diff --git a/package/wine/wine.mk b/package/wine/wine.mk
> index 1ae038e..d6fb9c6 100644
> --- a/package/wine/wine.mk
> +++ b/package/wine/wine.mk
> @@ -174,6 +174,7 @@ endif
>  ifeq ($(BR2_PACKAGE_SANE_BACKENDS),y)
>  WINE_CONF_OPTS += --with-sane
>  WINE_DEPENDENCIES += sane-backends
> +WINE_CONF_ENV += SANE_CONFIG=$(STAGING_DIR)/usr/bin/sane-config
>  else
>  WINE_CONF_OPTS += --without-sane
>  endif
> 
