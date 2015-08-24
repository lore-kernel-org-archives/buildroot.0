From: Mauro Condarelli <mc5686@mclink.it>
Date: Mon, 24 Aug 2015 14:26:53 +0200
Subject: [Buildroot] [PATCH] core/pkg-kconfig: fix configurators
In-Reply-To: <1440265993-31292-1-git-send-email-yann.morin.1998@free.fr>
References: <1440265993-31292-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <55DB0D8D.5060908@mclink.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I can confirm this patch solves my problem, as shown in the following transcript:


mcon at ariag25 ~/emotiq/prove/v2-testing/Buildroot
$ ( cd buildroot && make O=../output linux-menuconfig )
PATH="/home/mcon/emotiq/prove/v2-testing/Buildroot/output/host/bin:/home/mcon/emotiq/prove/v2-testing/Buildroot/output/host/sbin:/home/mcon/emotiq/prove/v2-testing/Buildroot/output/host/usr/bin:/home/mcon/emotiq/prove/v2-testing/Buildroot/output/host/usr/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games" BR_BINARIES_DIR=/home/mcon/emotiq/prove/v2-testing/Buildroot/output/images /usr/bin/make -j3 -C /home/mcon/emotiq/prove/v2-testing/Buildroot/output/build/linux-4.1.4 HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" ARCH=arm INSTALL_MOD_PATH=/home/mcon/emotiq/prove/v2-testing/Buildroot/output/target CROSS_COMPILE=" /home/mcon/emotiq/prove/v2-testing/Buildroot/output/host/usr/bin/arm-buildroot-linux-gnueabi-" DEPMOD=/home/mcon/emotiq/prove/v2-testing/Buildroot/output/host/sbin/depmod menuconfig
make[1]: Entering directory '/home/mcon/emotiq/prove/v2-testing/Buildroot/output/build/linux-4.1.4'
   HOSTCC  scripts/kconfig/mconf.o
  *** Unable to find the ncurses libraries or the
  *** required header files.
  *** 'make menuconfig' requires the ncurses libraries.
  ***
  *** Install ncurses (ncurses-devel) and try again.
  ***
scripts/kconfig/Makefile:187: recipe for target 'scripts/kconfig/dochecklxdialog' failed
make[2]: *** [scripts/kconfig/dochecklxdialog] Error 1
Makefile:541: recipe for target 'menuconfig' failed
make[1]: *** [menuconfig] Error 2
make[1]: Leaving directory '/home/mcon/emotiq/prove/v2-testing/Buildroot/output/build/linux-4.1.4'
linux/linux.mk:386: recipe for target '/home/mcon/emotiq/prove/v2-testing/Buildroot/output/build/linux-4.1.4/.kconfig_editor_menuconfig' failed
make: *** [/home/mcon/emotiq/prove/v2-testing/Buildroot/output/build/linux-4.1.4/.kconfig_editor_menuconfig] Error 2
mcon at ariag25 ~/emotiq/prove/v2-testing/Buildroot
$ patch -p1
diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 375607f..158c386 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -96,6 +96,15 @@  $$(error Internal error: no value specified for $(2)_KCONFIG_FILE)
  endif
  endif

+# For the configurators, we do want to use the system-provided host tools, not
+# the ones we build. This is particularly true for pkg-config; if we use our
+# pkg-config (from host-pkgconf), then it would not look for the .pc from the
+# host, but we do need them, especially to find ncurses, GTK+, Qt (resp. for
+# menuconfig and nconfig, gconfig, xconfig).
+# So we simply remove our PATH and PKG_CONFIG_* variables.
+$(2)_CONFIGURATOR_MAKE_ENV = \
+       $$(filter-out PATH=% PKG_CONFIG=% PKG_CONFIG_SYSROOT_DIR=% PKG_CONFIG_LIBDIR=%,$$($(2)_MAKE_ENV))
+
  # Configuration editors (menuconfig, ...)
  #
  # We need to apply the configuration fixups right after a configuration
@@ -112,7 +121,7 @@  endif
  #
  $$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): $(1)-%: $$($(2)_DIR)/.kconfig_editor_%
  $$($(2)_DIR)/.kconfig_editor_%: $$($(2)_DIR)/.stamp_kconfig_fixup_done
-       $$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
+       $$($(2)_CONFIGURATOR_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
                 $$($(2)_KCONFIG_OPTS) $$(*)
         rm -f $$($(2)_DIR)/.stamp_{kconfig_fixup_done,configured,built}
         rm -f $$($(2)_DIR)/.stamp_{target,staging,images}_installed
patching file package/pkg-kconfig.mk
mcon at ariag25 ~/emotiq/prove/v2-testing/Buildroot
$( cd buildroot && make O=../output linux-menuconfig )
BR_BINARIES_DIR=/home/mcon/emotiq/prove/v2-testing/Buildroot/output/images /usr/bin/make -j3 -C /home/mcon/emotiq/prove/v2-testing/Buildroot/output/build/linux-4.1.4 HOSTCC="/usr/bin/gcc" HOSTCFLAGS="" ARCH=arm INSTALL_MOD_PATH=/home/mcon/emotiq/prove/v2-testing/Buildroot/output/target CROSS_COMPILE=" /home/mcon/emotiq/prove/v2-testing/Buildroot/output/host/usr/bin/arm-buildroot-linux-gnueabi-" DEPMOD=/home/mcon/emotiq/prove/v2-testing/Buildroot/output/host/sbin/depmod menuconfig
make[1]: Entering directory '/home/mcon/emotiq/prove/v2-testing/Buildroot/output/build/linux-4.1.4'
   HOSTCC  scripts/kconfig/mconf.o
   HOSTCC  scripts/kconfig/zconf.tab.o
   HOSTCC  scripts/kconfig/lxdialog/checklist.o
   HOSTCC  scripts/kconfig/lxdialog/util.o
   HOSTCC  scripts/kconfig/lxdialog/inputbox.o
   HOSTCC  scripts/kconfig/lxdialog/textbox.o
   HOSTCC  scripts/kconfig/lxdialog/yesno.o
   HOSTCC  scripts/kconfig/lxdialog/menubox.o
   HOSTLD  scripts/kconfig/mconf
scripts/kconfig/mconf  Kconfig


*** End of the configuration.
*** Execute 'make' to start the build or try 'make help'.

make[1]: Leaving directory '/home/mcon/emotiq/prove/v2-testing/Buildroot/output/build/linux-4.1.4'
rm -f /home/mcon/emotiq/prove/v2-testing/Buildroot/output/build/linux-4.1.4/.stamp_{kconfig_fixup_done,configured,built}
rm -f /home/mcon/emotiq/prove/v2-testing/Buildroot/output/build/linux-4.1.4/.stamp_{target,staging,images}_installed
/bin/sed -i -e "/\\<CONFIG_AEABI\\>/d" /home/mcon/emotiq/prove/v2-testing/Buildroot/output/build/linux-4.1.4/.config
echo 'CONFIG_AEABI=y' >> /home/mcon/emotiq/prove/v2-testing/Buildroot/output/build/linux-4.1.4/.config
# As the kernel gets compiled before root filesystems are
# built, we create a fake cpio file. It'll be
# replaced later by the real cpio archive, and the kernel will be
# rebuilt using the linux-rebuild-with-initramfs target.
/bin/sed -i -e "/\\<CONFIG_DEVTMPFS\\>/d" /home/mcon/emotiq/prove/v2-testing/Buildroot/output/build/linux-4.1.4/.config
echo 'CONFIG_DEVTMPFS=y' >> /home/mcon/emotiq/prove/v2-testing/Buildroot/output/build/linux-4.1.4/.config
/bin/sed -i -e "/\\<CONFIG_DEVTMPFS_MOUNT\\>/d" /home/mcon/emotiq/prove/v2-testing/Buildroot/output/build/linux-4.1.4/.config
echo 'CONFIG_DEVTMPFS_MOUNT=y' >> /home/mcon/emotiq/prove/v2-testing/Buildroot/output/build/linux-4.1.4/.config
/bin/sed -i -e "/\\<CONFIG_INOTIFY_USER\\>/d" /home/mcon/emotiq/prove/v2-testing/Buildroot/output/build/linux-4.1.4/.config
echo 'CONFIG_INOTIFY_USER=y' >> /home/mcon/emotiq/prove/v2-testing/Buildroot/output/build/linux-4.1.4/.config
/bin/sed -i -e "/\\<CONFIG_ARM_APPENDED_DTB\\>/d" /home/mcon/emotiq/prove/v2-testing/Buildroot/output/build/linux-4.1.4/.config
echo 'CONFIG_ARM_APPENDED_DTB=y' >> /home/mcon/emotiq/prove/v2-testing/Buildroot/output/build/linux-4.1.4/.config
make[1]: Entering directory '/home/mcon/emotiq/prove/v2-testing/Buildroot/output/build/linux-4.1.4'
   HOSTCC  scripts/kconfig/zconf.tab.o
   HOSTLD  scripts/kconfig/conf
scripts/kconfig/conf  --oldconfig Kconfig
#
# configuration written to .config
#
make[1]: Leaving directory '/home/mcon/emotiq/prove/v2-testing/Buildroot/output/build/linux-4.1.4'
mcon at ariag25 ~/emotiq/prove/v2-testing/Buildroot
$


Tested-by: Mauro Condarelli <mc5686@mclik.it>

Regards
Mauro




Il 22/08/2015 19:53, Yann E. MORIN ha scritto:
> Currently, the configurators are using $($(2)_MAKE_ENV) , often derived
> from $(TARGE_MAKE_ENV) , as the environment to be set when calling the
> various configurators.
>
> This means that our host tools are used first, most notably pkg-config
> (from host-pkgconf).
>
> However, this is inherently flawed. Our pkg-config, when set for the
> host, only searches .pc files in $(HOST_DIR) and never ever uses the
> ones from the host. For example, since we do not build a host-qt, our
> pkg-config would not find the host's QtCore.pc et al.
>
> Consequently, on some systems (but not on others?) most of the
> configurators fail to build, especially the latest kernel versions, as
> they have been starting to use pkg-config two years ago.
>
> Fix that by filtering-out sensible values out of the environment, but
> only when calling the configurators.
>
> Reported-by: Mauro Condarelli <mc5686@mclink.it>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Mauro Condarelli <mc5686@mclink.it>
> ---
>   package/pkg-kconfig.mk | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
> index 375607f..158c386 100644
> --- a/package/pkg-kconfig.mk
> +++ b/package/pkg-kconfig.mk
> @@ -96,6 +96,15 @@ $$(error Internal error: no value specified for $(2)_KCONFIG_FILE)
>   endif
>   endif
>   
> +# For the configurators, we do want to use the system-provided host tools, not
> +# the ones we build. This is particularly true for pkg-config; if we use our
> +# pkg-config (from host-pkgconf), then it would not look for the .pc from the
> +# host, but we do need them, especially to find ncurses, GTK+, Qt (resp. for
> +# menuconfig and nconfig, gconfig, xconfig).
> +# So we simply remove our PATH and PKG_CONFIG_* variables.
> +$(2)_CONFIGURATOR_MAKE_ENV = \
> +	$$(filter-out PATH=% PKG_CONFIG=% PKG_CONFIG_SYSROOT_DIR=% PKG_CONFIG_LIBDIR=%,$$($(2)_MAKE_ENV))
> +
>   # Configuration editors (menuconfig, ...)
>   #
>   # We need to apply the configuration fixups right after a configuration
> @@ -112,7 +121,7 @@ endif
>   #
>   $$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS)): $(1)-%: $$($(2)_DIR)/.kconfig_editor_%
>   $$($(2)_DIR)/.kconfig_editor_%: $$($(2)_DIR)/.stamp_kconfig_fixup_done
> -	$$($(2)_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
> +	$$($(2)_CONFIGURATOR_MAKE_ENV) $$(MAKE) -C $$($(2)_DIR) \
>   		$$($(2)_KCONFIG_OPTS) $$(*)
>   	rm -f $$($(2)_DIR)/.stamp_{kconfig_fixup_done,configured,built}
>   	rm -f $$($(2)_DIR)/.stamp_{target,staging,images}_installed
