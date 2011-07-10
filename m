From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 10 Jul 2011 22:10:38 +0200
Subject: [Buildroot] [PATCH 17/28] uboot-mkimage: new package
In-Reply-To: <2471ac07175a85be59fb24bdf604c19ecabc3b06.1309895466.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 5 Jul 2011 21:54:08 +0200")
References: <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
 <cover.1309895466.git.thomas.petazzoni@free-electrons.com>
 <2471ac07175a85be59fb24bdf604c19ecabc3b06.1309895466.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87ipr9yk01.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The mkimage for the host is now built by a package, so that
 Thomas> boot/u-boot/u-boot.mk is no longer responsible for doing this. It
 Thomas> makes things a lot easier to handle, as linux/linux.mk now simply
 Thomas> depends on host-uboot-mkimage.

Perhaps it would make sense to call it uboot-tools instead, if we move
fw_printenv over here as well (similar to the Debian package) - But ok,
that can be done later.

Committed, thanks.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  .../uboot-mkimage-2011.03-drop-configh.patch       |    0
 Thomas>  package/uboot-mkimage/uboot-mkimage.mk             |   16 ++++++++++++++++
 Thomas>  2 files changed, 16 insertions(+), 0 deletions(-)
 Thomas>  rename boot/u-boot/u-boot-2011.03-drop-configh.patch => package/uboot-mkimage/uboot-mkimage-2011.03-drop-configh.patch (100%)
 Thomas>  create mode 100644 package/uboot-mkimage/uboot-mkimage.mk

 Thomas> diff --git a/boot/u-boot/u-boot-2011.03-drop-configh.patch b/package/uboot-mkimage/uboot-mkimage-2011.03-drop-configh.patch
 Thomas> similarity index 100%
 Thomas> rename from boot/u-boot/u-boot-2011.03-drop-configh.patch
 Thomas> rename to package/uboot-mkimage/uboot-mkimage-2011.03-drop-configh.patch
 Thomas> diff --git a/package/uboot-mkimage/uboot-mkimage.mk b/package/uboot-mkimage/uboot-mkimage.mk
 Thomas> new file mode 100644
 Thomas> index 0000000..055348c
 Thomas> --- /dev/null
 Thomas> +++ b/package/uboot-mkimage/uboot-mkimage.mk
 Thomas> @@ -0,0 +1,16 @@
 Thomas> +UBOOT_MKIMAGE_VERSION = 2011.03
 Thomas> +UBOOT_MKIMAGE_SOURCE  = u-boot-$(UBOOT_MKIMAGE_VERSION).tar.bz2
 Thomas> +UBOOT_MKIMAGE_SITE    = ftp://ftp.denx.de/pub/u-boot
 Thomas> +
 Thomas> +define HOST_UBOOT_MKIMAGE_BUILD_CMDS
 Thomas> +	$(MAKE) -C $(@D) 			\
 Thomas> +		CROSS_COMPILE="$(TARGET_CROSS)" \
 Thomas> +		ARCH=$(U_BOOT_ARCH) 		\

I don't think CROSS_COMPILE / ARCH are needed for tools. It would be
good to set HOSTCC/CFLAGS/LDFLAGS to the host versions we're using
elsewhere in BR instead of using the defaults from u-boot.

I've fixed that in a followup patch.

-- 
Bye, Peter Korsgaard
