From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 26 Mar 2019 01:03:44 +0100
Subject: [Buildroot] [PATCH v4 4/6] quazip: Patch .pro file to correctly
 crosscompile and use qmake infra
In-Reply-To: <20190322183904.22401-5-anaumann@ultratronik.de>
References: <20190322183904.22401-1-anaumann@ultratronik.de>
 <20190322183904.22401-5-anaumann@ultratronik.de>
Message-ID: <b3a49305-0d36-e13b-2dd0-416df4ec1cc6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22/03/2019 19:39, Andreas Naumann wrote:
> The quazip .pro files uses the target only prefix for cross staging install.
> This breaks using the new qmake infra, so add a minor patch to fix this.
> 
> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
> ---
>  .../0001-Fix-crosscompile-staging-install.patch  | 16 ++++++++++++++++
>  package/quazip/quazip.mk                         | 10 ----------
>  2 files changed, 16 insertions(+), 10 deletions(-)
>  create mode 100644 package/quazip/0001-Fix-crosscompile-staging-install.patch
> 
> diff --git a/package/quazip/0001-Fix-crosscompile-staging-install.patch b/package/quazip/0001-Fix-crosscompile-staging-install.patch
> new file mode 100644
> index 0000000000..96cae37283
> --- /dev/null
> +++ b/package/quazip/0001-Fix-crosscompile-staging-install.patch
> @@ -0,0 +1,16 @@

 You need a commit message and a SoB here. Also, preferably a git formatted patch.

 There's an active upstream at https://github.com/stachenov/quazip so please
send a PR.

> +Index: quazip-0.7.6/quazip/quazip.pro
> +===================================================================
> +--- quazip-0.7.6.orig/quazip/quazip.pro
> ++++ quazip-0.7.6/quazip/quazip.pro
> +@@ -47,9 +47,9 @@ CONFIG(debug, debug|release) {
> + }
> + 
> + unix:!symbian {
> +-    headers.path=$$PREFIX/include/quazip
> ++    headers.path=$$[QT_INSTALL_PREFIX]/include/quazip
> +     headers.files=$$HEADERS
> +-    target.path=$$PREFIX/lib/$${LIB_ARCH}
> ++    target.path=$$[QT_INSTALL_PREFIX]/lib/$${LIB_ARCH}
> +     QMAKE_PKGCONFIG_DESTDIR = pkgconfig
> +     INSTALLS += headers target
> + 
> diff --git a/package/quazip/quazip.mk b/package/quazip/quazip.mk
> index eef423b58a..1b34c9fc2a 100644
> --- a/package/quazip/quazip.mk
> +++ b/package/quazip/quazip.mk
> @@ -13,14 +13,4 @@ QUAZIP_DEPENDENCIES = \
>  QUAZIP_LICENSE = LGPL-2.1
>  QUAZIP_LICENSE_FILES = COPYING
>  
> -QUAZIP_CONF_OPTS = PREFIX=/usr
> -
> -define QUAZIP_INSTALL_STAGING_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install INSTALL_ROOT=$(STAGING_DIR)
> -endef
> -
> -define QUAZIP_INSTALL_TARGET_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install INSTALL_ROOT=$(TARGET_DIR)

 How come this used to work if they were using PREFIX instead of QT_INSTALL_PREFIX?

 Regards,
 Arnout

> -endef
> -
>  $(eval $(qmake-package))
> 
