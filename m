From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 29 Nov 2012 16:00:02 +0100
Subject: [Buildroot] [PATCH 03/51] package/dtc: add option to install
	programs
In-Reply-To: <1354146890-27380-4-git-send-email-yann.morin.1998@free.fr>
References: <1354146890-27380-1-git-send-email-yann.morin.1998@free.fr>
 <1354146890-27380-4-git-send-email-yann.morin.1998@free.fr>
Message-ID: <50B77872.80005@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/11/12 00:54, Yann E. MORIN wrote:
> By default, we only install the libfdt library.
>
> As suggested by Arnout, add an option that also
> installs the few dtc programs.
>
> Cc: Arnout Vandecappelle<arnout@mind.be>
> Signed-off-by: "Yann E. MORIN"<yann.morin.1998@free.fr>
[snip]
> +# libfdt_install is our own install rule added by our patch
> +DTC_BUILD_RULE=$(if $(BR2_PACKAGE_DTC_BINARY),,libfdt)
> +DTC_INSTALL_RULE=$(if $(BR2_PACKAGE_DTC_BINARY),install,libfdt_install)
> +

  I (and I think Peter as well) prefer the more verbose

ifeq ($(BR2_PACKAGE_DTC_BINARY),y)
DTC_INSTALL_RULE = install
else
DTC_BUILD_RULE   = libfdt
DTC_INSTALL_RULE = libfdt_install
endif

  I would also call it _TARGET instead of _RULE.


>   define DTC_BUILD_CMDS
>   	$(TARGET_CONFIGURE_OPTS)    \
>   	CFLAGS="$(TARGET_CFLAGS)"   \
> -	$(MAKE) -C $(@D) PREFIX=/usr libfdt
> +	$(MAKE) -C $(@D) PREFIX=/usr $(DTC_BUILD_RULE)
>   endef
>
> -# libfdt_install is our own install rule added by our patch
> +# For staging, only the library is needed
>   define DTC_INSTALL_STAGING_CMDS
>   	$(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) PREFIX=/usr libfdt_install
>   endef
>
>   define DTC_INSTALL_TARGET_CMDS
> -	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) PREFIX=/usr libfdt_install
> +	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) PREFIX=/usr $(DTC_INSTALL_RULE)
>   endef

  I would prefer the same rule for staging and target install:

- it doesn't hurt to have the executable in staging;

- it's easier to read if it's the same;

- when we finally get around to creating $(make-package), the default install
commands will be
$(MAKE) -C $(@D) DESTDIR=... $($(PKG)_INSTALL_TARGET)
(where _INSTALL_TARGET is the same for target and staging and defaults to
'install')


  Regards,
  Arnout

>
>   define DTC_CLEAN_CMDS

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
