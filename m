From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 25 Sep 2012 23:15:49 +0200
Subject: [Buildroot] [PATCH v8 01/11] host-qemu: new package
In-Reply-To: <1348593508-14254-1-git-send-email-francois.perrad@gadz.org>
References: <1348593508-14254-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <50621F05.1070708@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/25/12 19:18, Francois Perrad wrote:
> only user mode for the current target architecture
>
> Signed-off-by: Francois Perrad<francois.perrad@gadz.org>
[snip]
> diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
> new file mode 100644
> index 0000000..379507c
> --- /dev/null
> +++ b/package/qemu/Config.in.host
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_HOST_QEMU
> +	bool "host qemu"
> +	help
> +	  QEMU is a generic and open source machine emulator and virtualizer.
> +
> +	  In user mode emulation, QEMU runs single cross-compiled programs.
> +	  Fast cross-compilation and cross-debugging are the main targets
> +	  for user-mode emulation.
> +
> +	  In system mode emulation, QEMU emulates a full computer system,
> +	  including peripherals, and handles the filesystem image generated
> +	  by Buildroot.
> +	  (Buildroot is shipped with many configs/qemu_*_defconfig files).

  If only user mode is supported, that should be documented in the help text.

> +
> +	  http://qemu.org/
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> new file mode 100644
> index 0000000..d727f49
> --- /dev/null
> +++ b/package/qemu/qemu.mk
> @@ -0,0 +1,43 @@
> +#############################################################
> +#
> +# qemu
> +#
> +#############################################################
> +
> +QEMU_VERSION = 1.2.0
> +QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.bz2
> +QEMU_SITE = http://wiki.qemu.org/download
> +
> +HOST_QEMU_DEPENDENCIES =

  This can be removed.

> +
> +QEMU_ARCH=$(ARCH)
> +ifeq ($(QEMU_ARCH),i686)
> +    QEMU_ARCH=i386
> +endif
> +HOST_QEMU_TARGETS=$(QEMU_ARCH)-linux-user

  We normally put spaces before and after =

> +
> +define HOST_QEMU_CONFIGURE_CMDS
> +	(cd $(@D); ./configure                          \
> +		--target-list="$(HOST_QEMU_TARGETS)"    \
> +		--prefix="$(HOST_DIR)/usr"              \
> +		--interp-prefix=$(STAGING_DIR)          \
> +		--cc="$(HOSTCC)"                        \
> +		--host-cc="$(HOSTCC)"                   \
> +		--extra-cflags="$(HOST_CFLAGS)"         \
> +		--extra-ldflags="$(HOST_LDFLAGS)"       \
> +	)
> +endef
> +
> +define HOST_QEMU_BUILD_CMDS
> +	$(MAKE) -C $(@D) all
> +endef
> +
> +define HOST_QEMU_INSTALL_CMDS
> +	$(MAKE) -C $(@D) install
> +endef
> +
> +define HOST_QEMU_CLEAN_CMDS
> +	$(MAKE) -C $(@D) clean
> +endef
> +
> +$(eval $(host-generic-package))

  This looks very much like a $(host-autotools-package).  Even if the
configure is not a proper autoconf script and barfs on all the unknown
options that buildroot adds, you can still override the CONFIGURE_CMDS.
But I expect that just setting HOST_QEMU_CONF_OPT will be enough.


  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
