From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 23 Jul 2007 12:39:03 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package:  alsa-utils
In-Reply-To: <20070723081054.1A77CA65F4@busybox.net>
References: <20070723081054.1A77CA65F4@busybox.net>
Message-ID: <20070723103903.GB7044@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 23, 2007 at 01:10:54AM -0700, ulf at uclibc.org wrote:
>Author: ulf
>Date: 2007-07-23 01:10:52 -0700 (Mon, 23 Jul 2007)
>New Revision: 19200
>
>Log:
>Add alsa-utils package
>
>Added:
>   trunk/buildroot/package/alsa-utils/
>   trunk/buildroot/package/alsa-utils/Config.in
>   trunk/buildroot/package/alsa-utils/alsa-utils.mk
>
>Modified:
>   trunk/buildroot/package/Config.in
>
>
>Changeset:
>Modified: trunk/buildroot/package/Config.in
>===================================================================
>--- trunk/buildroot/package/Config.in	2007-07-23 07:59:56 UTC (rev 19199)
>+++ trunk/buildroot/package/Config.in	2007-07-23 08:10:52 UTC (rev 19200)
>@@ -247,6 +247,7 @@
> 
> if BR2_AUDIO_SUPPORT
> source "package/alsa-lib/Config.in"
>+source "package/alsa-utils/Config.in"
> source "package/asterisk/Config.in"
> source "package/aumix/Config.in"
> source "package/libid3tag/Config.in"
>@@ -256,6 +257,16 @@
> source "package/mpg123/Config.in"
> endif
> 
>+menuconfig BR2_VIDEO_SUPPORT
>+	bool "Video libraries and applications"
>+	default y
>+	help
>+	  Support for video libraries and applications
>+
>+if BR2_VIDEO_SUPPORT
>+source "package/mplayer/Config.in"
>+endif

sigh. How is this related to the alsa-utils package?

>+
> menuconfig BR2_GRAPHIC_SUPPORT
> 	bool "Graphic libraries and applications (graphic/text)"
> 	default y
>

>Added: trunk/buildroot/package/alsa-utils/alsa-utils.mk
>===================================================================
>--- trunk/buildroot/package/alsa-utils/alsa-utils.mk	                        (rev 0)
>+++ trunk/buildroot/package/alsa-utils/alsa-utils.mk	2007-07-23 08:10:52 UTC (rev 19200)
>@@ -0,0 +1,93 @@
>+#############################################################
>+#
>+# alsa-utils
>+#
>+#############################################################
>+ALSA_UTILS_VER:=1.0.14

Ulf, you're kidding, are you?

>+ALSA_UTILS_SOURCE:=alsa-utils-$(ALSA_UTILS_VER).tar.bz2
>+ALSA_UTILS_SITE:=ftp://ftp.alsa-project.org/pub/utils
>+ALSA_UTILS_DIR:=$(BUILD_DIR)/alsa-utils-$(ALSA_UTILS_VER)
>+ALSA_UTILS_CAT:=$(BZCAT)
>+ALSA_UTILS_BINARY:=alsactl/alsactl
>+ALSA_UTILS_TARGET_BINARY:=usr/sbin/alsactl
>+
>+$(DL_DIR)/$(ALSA_UTILS_SOURCE):
>+	$(WGET) -P $(DL_DIR) $(ALSA_UTILS_SITE)/$(ALSA_UTILS_SOURCE)
>+
>+$(ALSA_UTILS_DIR)/.unpacked: $(DL_DIR)/$(ALSA_UTILS_SOURCE)
>+	$(ALSA_UTILS_CAT) $(DL_DIR)/$(ALSA_UTILS_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
>+	toolchain/patch-kernel.sh $(ALSA_UTILS_DIR) package/alsa-utils/ alsa-utils-$(ALSA_UTILS_VER)\*.patch\*
>+	$(CONFIG_UPDATE) $(ALSA_UTILS_DIR)
>+	@touch $(ALSA_UTILS_DIR)/.unpacked
>+
>+$(ALSA_UTILS_DIR)/.configured: $(ALSA_UTILS_DIR)/.unpacked
>+	(cd $(ALSA_UTILS_DIR); \
>+		$(TARGET_CONFIGURE_OPTS) \
>+		CFLAGS="$(TARGET_CFLAGS)" \
>+		LDFLAGS="$(TARGET_LDFLAGS)" \

TARGET_CONFIGURE_ARGS missing again

>+		./configure \
>+		--target=$(GNU_TARGET_NAME) \
>+		--host=$(GNU_TARGET_NAME) \
>+		--build=$(GNU_HOST_NAME) \
>+		--prefix=/usr \
>+	);
>+	@touch $@
