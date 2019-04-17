From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 18 Apr 2019 00:16:04 +0200
Subject: [Buildroot] [PATCH v5 2/2] qt5: Remove *.la/*.prl fixup script
In-Reply-To: <20190415205622.25268-2-anaumann@ultratronik.de>
References: <20190415205622.25268-1-anaumann@ultratronik.de>
 <20190415205622.25268-2-anaumann@ultratronik.de>
Message-ID: <83d7e0a5-4026-39e5-9896-67fd281ceb54@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15/04/2019 22:56, Andreas Naumann wrote:
> After fixing Prefix in our custom qt.conf, Qt computes and embeds the correct
> sysroot prefixed pathes in all *.la and *.prl files.
> So remove fixup of
> - *.la files because they are generically fixed anyway
> - *.prl files because occurences of absolute /usr/lib were no longer observed

 Applied to master, thanks.

 Can you keep an eye on autobuild failures caused by this? Note that the
failures may be in packages using qt5 (e.g. wireshark) so it may not be easy to
notice.

 Regards,
 Arnout

> 
> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
> ---
>  package/pkg-qmake.mk |  1 -
>  package/qt5/qt5.mk   | 15 ---------------
>  2 files changed, 16 deletions(-)
> 
> v4->v5
> - Split from qmake infra patch set
> - Remove macro as well (Arnout)
> - extend commit message a bit
> 
> diff --git a/package/pkg-qmake.mk b/package/pkg-qmake.mk
> index 404ba4c545..2bf16bf97f 100644
> --- a/package/pkg-qmake.mk
> +++ b/package/pkg-qmake.mk
> @@ -68,7 +68,6 @@ endif
>  ifndef $(2)_INSTALL_STAGING_CMDS
>  define $(2)_INSTALL_STAGING_CMDS
>  	$$(TARGET_MAKE_ENV) $$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_BUILDDIR) $$($(2)_INSTALL_STAGING_OPTS)
> -	$$(QT5_LA_PRL_FILES_FIXUP)
>  endef
>  endif
>  
> diff --git a/package/qt5/qt5.mk b/package/qt5/qt5.mk
> index 6da898121d..4e738c75db 100644
> --- a/package/qt5/qt5.mk
> +++ b/package/qt5/qt5.mk
> @@ -17,20 +17,5 @@ QT5_SITE = https://download.qt.io/official_releases/qt/$(QT5_VERSION_MAJOR)/$(QT
>  
>  include $(sort $(wildcard package/qt5/*/*.mk))
>  
> -define QT5_LA_PRL_FILES_FIXUP
> -	for i in $$(find $(STAGING_DIR)/usr/lib* -name "libQt5*.la"); do \
> -		$(SED)  "s:$(BASE_DIR):@BASE_DIR@:g" \
> -			-e "s:$(STAGING_DIR):@STAGING_DIR@:g" \
> -			-e "s:\(['= ]\)/usr:\\1 at STAGING_DIR@/usr:g" \
> -			-e "s:@STAGING_DIR@:$(STAGING_DIR):g" \
> -			-e "s:@BASE_DIR@:$(BASE_DIR):g" \
> -			$$i ; \
> -		$(SED) "/^dependency_libs=/s%-L/usr/lib %%g" $$i ; \
> -	done
> -	for i in $$(find $(STAGING_DIR)/usr/lib* -name "libQt5*.prl"); do \
> -		$(SED) "s%-L/usr/lib%%" $$i; \
> -	done
> -endef
> -
>  # Variable for other Qt applications to use
>  QT5_QMAKE = $(HOST_DIR)/bin/qmake -spec devices/linux-buildroot-g++
> 
