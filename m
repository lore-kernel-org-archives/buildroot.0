From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 04 Sep 2013 18:38:26 +0200
Subject: [Buildroot] [PATCH 1/1] aiccu: new package
In-Reply-To: <1378165788-7386-1-git-send-email-rommel@layer-7.net>
References: <1378165788-7386-1-git-send-email-rommel@layer-7.net>
Message-ID: <52276202.6010508@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/03/13 01:49, Michael Rommel wrote:
> Automatic IPv6 Connectivity Configuration Utility for users of a
> IPv6 tunnel broker, developed by sixxs.net
>
> Signed-off-by: Michael Rommel <rommel@layer-7.net>
> ---
>   package/Config.in                                  |    1 +
>   package/aiccu/Config.in                            |   21 ++++
>   .../aiccu/aiccu-0001-gnutls-and-uclibc-fixes.patch |  104 ++++++++++++++++++++
>   .../aiccu-0002-install-correct-init-script.patch   |   17 ++++
>   package/aiccu/aiccu.mk                             |   26 +++++
>   5 files changed, 169 insertions(+)
>   create mode 100644 package/aiccu/Config.in
>   create mode 100644 package/aiccu/aiccu-0001-gnutls-and-uclibc-fixes.patch

  Did you upstream this patch?

>   create mode 100644 package/aiccu/aiccu-0002-install-correct-init-script.patch
[snip]
> diff --git a/package/aiccu/aiccu-0002-install-correct-init-script.patch b/package/aiccu/aiccu-0002-install-correct-init-script.patch
> new file mode 100644
> index 0000000..15e9268
> --- /dev/null
> +++ b/package/aiccu/aiccu-0002-install-correct-init-script.patch
> @@ -0,0 +1,17 @@
> +Makefile: remove hardcoded .debian part from install command, debian
> +	  version does not work under buildroot
> +
> +Signed-off-by: Michael Rommel <rommel@layer-7.net>
> +
> +diff -purN aiccu_20070115.orig/Makefile aiccu_20070115/Makefile
> +--- aiccu_20070115.orig/Makefile	2007-01-11 01:29:33.000000000 +0100
> ++++ aiccu_20070115/Makefile	2013-09-03 00:47:06.153662575 +0200
> +@@ -86,7 +86,7 @@ ifeq ($(shell echo "A${RPM_BUILD_ROOT}")
> + 	@cp doc/HOWTO  ${DESTDIR}${dirdoc}
> + 	@echo "Installing Debian-style init.d"
> + 	@mkdir -p ${DESTDIR}${diretc}init.d
> +-	@cp doc/${PROJECT}.init.debian ${DESTDIR}${diretc}init.d/${PROJECT}
> ++	@cp doc/${PROJECT}.init ${DESTDIR}${diretc}init.d/${PROJECT}

  The init script should be called Sxxaiccu (replace xx by an appropriate 
number). And you can do the required chmod here as well. Or better yet, 
use 'install -D -m 0755' (which removes the need for mkdir as well).

  However, I propose to instead install it manually from the .mk file 
(using the _INSTALL_INIT_SYSV variable) and to remove the incorrect init 
script in a post-install hook. Maybe there's even a target to install 
just the interesting bits and skip the howto and init scripts?

> + else
> + 	@echo "Installing Redhat-style init.d"
> + 	@mkdir -p ${DESTDIR}${diretc}init.d
> diff --git a/package/aiccu/aiccu.mk b/package/aiccu/aiccu.mk
> new file mode 100644
> index 0000000..0eb605b
> --- /dev/null
> +++ b/package/aiccu/aiccu.mk
> @@ -0,0 +1,26 @@
> +################################################################################
> +#
> +# aiccu
> +#
> +################################################################################
> +
> +AICCU_VERSION = 20070115

  Ouch, that's old...

> +AICCU_SOURCE = aiccu_$(AICCU_VERSION).tar.gz
> +AICCU_SITE = http://www.sixxs.net/archive/sixxs/aiccu/unix/
> +AICCU_LICENSE = SixXS License, concise redistribution license
> +AICCU_LICENSE_FILES = doc/LICENSE
> +AICCU_DEPENDENCIES = gnutls
> +
> +define AICCU_BUILD_CMDS
> +	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
> +endef
> +
> +define AICCU_INSTALL_TARGET_CMDS
> +	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
> +endef
> +
> +define AICCU_PERMISSIONS
> +	/etc/init.d/aiccu  f  4755  0  0  -  -  -  -  -

  Does it really have to be setuid? That is very weird for an init script.

  Regards,
  Arnout

> +endef
> +
> +$(eval $(generic-package))
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
