Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83EE4C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 11:17:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E34F382443;
	Mon, 15 Aug 2022 11:17:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E34F382443
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SaLmZpWaGQz7; Mon, 15 Aug 2022 11:17:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB03482419;
	Mon, 15 Aug 2022 11:17:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB03482419
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CAF1A1BF34A
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 11:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0FF741504
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 11:17:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0FF741504
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jPuQZC4H-L4A for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 11:17:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75A41414A1
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 75A41414A1
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 11:17:21 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id qn6so12938124ejc.11
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 04:17:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=nJrjpxmXq06d3tBy9KCxQweUzIYG7bLRuZHTgc9v2PI=;
 b=iXWw7xKkWKzA5Rx15MN2Ia3aTiKnySlq7GvzNEVQdfOsCyMaPK/lpcdsDMGMHgtqp0
 KqcXl3sOnCNUV5Ihr2L1XMS469mpq2iiyDFltujUihDOvOAyGuuXo9JuQqfE5qCXb8Yk
 59zyD8hVfWp5U5RJOnqkhR+l2W1ztN6UnIBYnAtaBQKMzwyeoMGVjs4WxsAyYTd1tyRo
 K0XoEVSNShgvLvolYyaOYHfZvh+D7RBmlaWUVjuaIAhNYWKVH7s9V96Mce1WobwFmHxE
 mAjUhQOsKdKQ48938d1ot8nrrVCiljXYP1OvlVyRzwGPu0yKMZc2/RAwaCykTnkXExxS
 MWtg==
X-Gm-Message-State: ACgBeo23Mm2ZgTsJjlALGccjsqUUiN93JBP0DN4VjzsQQUyA6EMT8fYH
 7KnARsXtBafwO8L9+Qk2kARKKneHT3+hXRdr
X-Google-Smtp-Source: AA6agR5YwjDRS9P1zXjhcPGHRvmcgRiGSWjIwO9zy0LGp46Hiy93qZ1iPa5SwoeWsg840imwWio/xQ==
X-Received: by 2002:a17:907:2ceb:b0:730:e0ce:34f1 with SMTP id
 hz11-20020a1709072ceb00b00730e0ce34f1mr9902265ejc.293.1660562239705; 
 Mon, 15 Aug 2022 04:17:19 -0700 (PDT)
Received: from localhost.localdomain
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 eu18-20020a170907299200b00731582babcasm3961871ejc.71.2022.08.15.04.17.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 04:17:19 -0700 (PDT)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 13:17:09 +0200
Message-Id: <20220815111710.1459820-2-arnout@mind.be>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220815111710.1459820-1-arnout@mind.be>
References: <20220815111710.1459820-1-arnout@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=nJrjpxmXq06d3tBy9KCxQweUzIYG7bLRuZHTgc9v2PI=;
 b=TM86U8ohZocApQHPydBa8K7fiq8ceFAtW2p2OjhU2tGqu4cztskDzglCDFq8veP7wN
 fzpmLNtWl1jcC4vY/Q+9OpFcI7Z7X5H+Wyx4PFU193jK7kqWRjBRXMnbDdAPG3zU9RKL
 bM9cPI24bqilCHMN1Df+ZgDFL84ygPuisCzwT/tbUq1k2vqTLR70AQcuknQGCwOEeHnc
 GwpB5GGFfAAbgTm3UzuE+19R12+ePbLwf/XLGL8rpGQPQMTicVowwvuFUHphAlHimqjX
 0Xt4tiGtapK02T4tu2ypL/7xyvMidBikrxN6pItGh1qu549m2aEuWZy3HM74798jOzrh
 QMGw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=TM86U8oh
Subject: [Buildroot] [PATCH next v5 2/3] fs/cpio: new option to use dracut
 tool
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thierry Bultel <thierry.bultel@linatsea.fr>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thierry Bultel <thierry.bultel@linatsea.fr>

Adds an option to invoke the dracut host tool, providing
a configuration file, instead of having a full cpio archive
of the whole target directory.

A default configuration file is provided. It assumes busybox init.
ideally, a different default should be used in case of systemd init, but
that's left for future work.

Signed-off-by: Thierry Bultel <thierry.bultel@linatsea.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Changes v1 -> v2 (suggested by Arnout and Yann)
  - was a new fs type, now an option of cpio
  - deals with the case of a build with no kernel
  - gets the kernel name in a smarter way
  - checks for the name of dracut configuration file
Changes v2 -> v3
  - fixed a typo on the --no-kernel option for dracut
  - removed the unneeded dependency to kernel
  - added tests for cpio, for both full, and dracut modes
Changes v3 -> v4
  - Config.in: applied Yann's comments on syntax and option in choice
  - do no export TARGET_CROSS but give it in command line instead
  - use $(ROOTFS_CPIO_DIR) as base for tmp directory
  - let original, full cpio, first in the code, and dracut mode after
  - removed unwanted comment in dracut.conf (in tests)
Changes v4 -> v5 (Arnout)
  - move runtime test to separate patch;
  - fix check-package errors;
  - add default dracut.conf file, the one from the runtime test;
  - remove bash from dracut.conf;
  - remove dependency on busybox or systemd init;
  - add help text to BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE;
  - use our compression instead of dracut's;
  - still allow uimage;
  - add --sysroot option in dracut call;
  - adapt paths and environment according to changes in previous commit;
  - use : instead of . to separate ifeq conditions;
  - add support for reproducible (shared with cpio);
  - use ROOTFS_CPIO_OPTS instead of ROOTFS_CPIO_DRACUT_CMD_OPTS;
  - remove --keep option, isn't needed.
---
 fs/cpio/Config.in   | 34 +++++++++++++++++
 fs/cpio/cpio.mk     | 33 ++++++++++++++++
 fs/cpio/dracut.conf | 93 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 160 insertions(+)
 create mode 100644 fs/cpio/dracut.conf

diff --git a/fs/cpio/Config.in b/fs/cpio/Config.in
index c1151a2881..de83aaad65 100644
--- a/fs/cpio/Config.in
+++ b/fs/cpio/Config.in
@@ -7,6 +7,40 @@ config BR2_TARGET_ROOTFS_CPIO
 
 if BR2_TARGET_ROOTFS_CPIO
 
+choice
+	prompt "cpio type"
+	default BR2_TARGET_ROOTFS_CPIO_FULL
+
+config BR2_TARGET_ROOTFS_CPIO_FULL
+	bool "cpio the whole root filesystem"
+	help
+	  Build a cpio archive containing the whole the root filesystem.
+
+config BR2_TARGET_ROOTFS_CPIO_DRACUT
+	bool "Invoke dracut to make a partial initramfs"
+	select BR2_PACKAGE_HOST_DRACUT
+	select BR2_PACKAGE_HOST_UBOOT_TOOLS
+	help
+	  Build an additional initramfs using dracut. This only contains
+	  a subset of the rootfs, as determined by the configuration
+	  file.
+	  This can be useful to create a recovery system, for instance.
+
+endchoice
+
+if BR2_TARGET_ROOTFS_CPIO_DRACUT
+config BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE
+	string "dracut configuration file"
+	default "fs/cpio/dracut.conf"
+	help
+	  Dracut configuration file. It determines which parts of the
+	  rootfs get included in the cpio image. See dracut.conf(5) or
+	  https://github.com/dracutdevs/dracut/blob/master/man/dracut.conf.5.asc
+
+	  The default configuration file is suitable for busybox init.
+	  It doesn't, however, pivot_root into a full rootfs.
+endif
+
 choice
 	prompt "Compression method"
 	default BR2_TARGET_ROOTFS_CPIO_NONE
diff --git a/fs/cpio/cpio.mk b/fs/cpio/cpio.mk
index 81f8c393d1..b62d804ad8 100644
--- a/fs/cpio/cpio.mk
+++ b/fs/cpio/cpio.mk
@@ -36,6 +36,8 @@ ROOTFS_CPIO_DEPENDENCIES += host-cpio
 ROOTFS_CPIO_OPTS += --reproducible
 endif
 
+ifeq ($(BR2_TARGET_ROOTFS_CPIO_FULL),y)
+
 define ROOTFS_CPIO_CMD
 	cd $(TARGET_DIR) && \
 	find . \
@@ -44,6 +46,37 @@ define ROOTFS_CPIO_CMD
 	> $@
 endef
 
+else ifeq ($(BR2_TARGET_ROOTFS_CPIO_DRACUT),y)
+
+ROOTFS_CPIO_DEPENDENCIES += host-dracut
+
+ifeq ($(BR_BUILDING):$(BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE),y:)
+$(error No dracut config file name specified, check your BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE setting)
+endif
+
+ifeq ($(BR2_LINUX_KERNEL),y)
+ROOTFS_CPIO_DEPENDENCIES += linux
+ROOTFS_CPIO_OPTS += --kver $(LINUX_VERSION_PROBED)
+else
+ROOTFS_CPIO_OPTS += --no-kernel
+endif
+
+define ROOTFS_CPIO_CMD
+	mkdir -p $(ROOTFS_CPIO_DIR)/tmp
+
+	$(HOST_DIR)/bin/dracut \
+		$(ROOTFS_CPIO_OPTS) \
+		-c $(BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE) \
+		--sysroot $(TARGET_DIR) \
+		--tmpdir $(ROOTFS_CPIO_DIR)/tmp \
+		-M \
+		--force \
+		--no-compress \
+		$@
+endef
+
+endif #BR2_TARGET_ROOTFS_CPIO_DRACUT
+
 ifeq ($(BR2_TARGET_ROOTFS_CPIO_UIMAGE),y)
 ROOTFS_CPIO_DEPENDENCIES += host-uboot-tools
 define ROOTFS_CPIO_UBOOT_MKIMAGE
diff --git a/fs/cpio/dracut.conf b/fs/cpio/dracut.conf
new file mode 100644
index 0000000000..6184457723
--- /dev/null
+++ b/fs/cpio/dracut.conf
@@ -0,0 +1,93 @@
+#Simple dracut config for a system without systemd
+
+#Dracut configuration
+
+show_modules=yes
+i18n_install_all=no
+lvmconf=no
+mdadmconf=no
+early_microcode=no
+hostonly=no
+hostonly_cmdline=no
+use_fstab=no
+kernel_cmdline="rd.break=initqueue"
+do_strip=no
+
+# Dracut modules needed
+add_dracutmodules+=" \
+busybox-init
+"
+
+# Modules to ignore
+omit_dracutmodules+=" \
+bash \
+biosdevname \
+btrfs \
+bluetooth \
+busybox \
+caps \
+cifs \
+crypt \
+crypt-gpg \
+dash \
+dbus-broker \
+dbus-daemon \
+dm \
+dmraid \
+dmsquash-live-ntfs \
+dracut-systemd \
+fcoe \
+fcoe-uefi \
+fs-lib \
+iscsi \
+i18n \
+lvmmerge \
+lvm \
+lunmask \
+mdraid \
+memstrack \
+mksh \
+modsign \
+mount-root \
+multipath \
+nbd \
+network-legacy \
+network-wicked \
+nfs \
+nvdimm \
+nvmf \
+parse-lunmask \
+qemu \
+qemu-net \
+resume \
+rootfs-block \
+rngd \
+systemd \
+systemd-udevd \
+systemd-coredump \
+systemd-ask-password \
+systemd-timedated \
+systemd-rfkill \
+systemd-resolved \
+systemd-hostnamed \
+systemd-initrd \
+systemd-journald \
+systemd-ldconfig \
+systemd-networkd \
+systemd-timesyncd \
+systemd-veritysetup \
+systemd-modules-load \
+systemd-sysctl \
+systemd-repart \
+systemd-sysext \
+systemd-sysusers \
+systemd-tmpfiles \
+squash \
+ssh-client \
+stratis \
+tpm2-tss \
+udev-rules \
+url-lib \
+usrmount \
+"
+
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
