Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A9CCA0EED
	for <buildroot@archiver.kernel.org>; Sat, 23 Aug 2025 15:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AA3D61367;
	Sat, 23 Aug 2025 15:05:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lbHfarZ6M5Cn; Sat, 23 Aug 2025 15:05:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEC6E61333
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEC6E61333;
	Sat, 23 Aug 2025 15:05:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CF4A171E
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 15:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C18646128F
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 15:05:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EAmHJ227zZZY for <buildroot@buildroot.org>;
 Sat, 23 Aug 2025 15:05:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5F02B61289
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F02B61289
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F02B61289
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 15:05:50 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3c6412336d4so798016f8f.2
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 08:05:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755961548; x=1756566348;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u3ZoIwpERZilhzB0Of4xD1Lhi6D5+2p5wZ/tbt9Z4Uo=;
 b=anp7OAjfRtcr3JZl1bbFPs/7/maX6fzHIHjMzYOKATBji9G6FJq5fCcX//nq+vMc73
 B2vgZwxC2fCAw3X4HzaZ+ljXbdLQR9DqBr7CtP86eJsF5xNeGLVMG6MD1STVBrzEHBV8
 v5e9MCvo/SqesWZ5NyEbK+qF8HURkzun+A3AgjMJ2CgTECAVIlw4T0PpOGspBVvbRE7x
 2CzsnzKxjgBRIm1YNb7Y1NCA+7xfAxJyi/sHH7JMV1DJHU3L4NQPL6sCYG4ymrR6hdoU
 jq5gEGU/CYjuOHIHkAlNKwR1fSW9NAgKM9q91IuD7P1DF7nSdQb87yl3ppydhEnYrAaW
 hJNw==
X-Gm-Message-State: AOJu0YyjTxIH1evHXaOAeDazBFjNaoHz1jIugv2+xk8m1sBbSx/dUpaL
 FloEeFVpOMpbm1UXX1MMAmbOzr8f9zKl1sbgc5TJhPrRtf/s8/Zwmn8cWksvhw30iGsVsuR1xmN
 G5khs
X-Gm-Gg: ASbGncvnSa3S36nn3TgwfRi4Fv0U6W32cHkKTr9To100ADE8vWrzP862RME0jn2AlNS
 naJACmpaBBWw+gjIE2UL/4i6Lv5bMBmBfAPsowCmnrKUROBxY0YTGzJBPu6Br7MatjXi/cDzvLi
 NG1AI20f5paLNkTDZV3EBiSmOOqOOuvpRlmlifHjjVCjqP+qJhwaw5cgcd6HuOtdgk6F1IRuZE4
 roXPsDI+6Yhj/YW07jezbXiTXBoCb2RQcszXH+VRXk+w2FrEPH5uPCOeR7ytcbvB/7UPBlca9cF
 cn9rRei+WwyhVN+DQOmcz7uUAfLbRd3yisryEVVYTAbL1VeqlGt7BnqC9Ow9foBIjgiGDgbXytH
 rj9h3kYyAw9WQFszufdmqG3/zBhlVtchzCp9K0pbv/p0xOfcH5KqvIr3rUaLzwdTUfm2CYpSxJS
 weOybTRp2njtC9njjWZc8J
X-Google-Smtp-Source: AGHT+IF9uxBTg6cVhOHuXWejOwwniOWYxzanPelGGRuGHJ6a9AcW1M1pzhjQKh1UoB5DrqKpB9OaSg==
X-Received: by 2002:a05:6000:26cb:b0:3b7:952c:5de with SMTP id
 ffacd0b85a97d-3c5dc638421mr4229771f8f.29.1755961548067; 
 Sat, 23 Aug 2025 08:05:48 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c711d9f389sm3833503f8f.60.2025.08.23.08.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Aug 2025 08:05:47 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>,
	Julien Olivain <ju.o@free.fr>
Date: Sat, 23 Aug 2025 17:05:43 +0200
Message-ID: <20250823150543.3233205-4-romain.naour@smile.fr>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250823150543.3233205-1-romain.naour@smile.fr>
References: <20250823150543.3233205-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1755961548; x=1756566348; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u3ZoIwpERZilhzB0Of4xD1Lhi6D5+2p5wZ/tbt9Z4Uo=;
 b=ZSwNw1wBAnT0VBi2t4uFwtEtTt8UPASXUqqoZnOO+VK9V08rtNR0CAcOd1eRAP/hJs
 hevSz7MdRDDb8tdg4ulpBImVyy09KBs6/SyBYUDhcQbmcTiStD5Kz+yhXompSRdsBbtV
 wKTC6f0YxVwhjrTfJK0YpnvpmVWyTN0klUlXs=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=ZSwNw1wB
Subject: [Buildroot] [PATCH 4/4] package/thttpd: remove package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Despite the last thttpd release 2.29 back in 2018, the package doesn't
build with modern compiler (gcc-15) and Autoconf (newer than 2.13) [1].

Remove TestThttpd from our testsuite.

[1] https://lore.kernel.org/buildroot/20250811203206.1506378-1-romain.naour@smile.fr/

Cc: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 Config.in.legacy                             |  7 +++
 package/Config.in                            |  1 -
 package/thttpd/Config.in                     |  9 ----
 package/thttpd/S90thttpd                     | 54 --------------------
 package/thttpd/thttpd.hash                   |  3 --
 package/thttpd/thttpd.mk                     | 46 -----------------
 package/thttpd/thttpd.service                | 10 ----
 support/testing/tests/package/test_thttpd.py | 26 ----------
 8 files changed, 7 insertions(+), 149 deletions(-)
 delete mode 100644 package/thttpd/Config.in
 delete mode 100644 package/thttpd/S90thttpd
 delete mode 100644 package/thttpd/thttpd.hash
 delete mode 100644 package/thttpd/thttpd.mk
 delete mode 100644 package/thttpd/thttpd.service
 delete mode 100644 support/testing/tests/package/test_thttpd.py

diff --git a/Config.in.legacy b/Config.in.legacy
index efb59dc535..084563fa19 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.08"
 
+config BR2_PACKAGE_THTTPD
+	bool "thttpd has been removed"
+	select BR2_LEGACY
+	help
+	  thttpd is no longer maintained actively by upstream and has
+	  been removed from Buildroot.
+
 config BR2_PACKAGE_LIBCURL_BEARSSL
 	bool "libcurl removed BearSSL support"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 137f74ed82..41084c033c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2695,7 +2695,6 @@ endif
 	source "package/tcping/Config.in"
 	source "package/tcpreplay/Config.in"
 	source "package/tftpd/Config.in"
-	source "package/thttpd/Config.in"
 	source "package/tinc/Config.in"
 	source "package/tinyproxy/Config.in"
 	source "package/tinyssh/Config.in"
diff --git a/package/thttpd/Config.in b/package/thttpd/Config.in
deleted file mode 100644
index bd97bc7a75..0000000000
--- a/package/thttpd/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_THTTPD
-	bool "thttpd"
-	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
-	help
-	  thttpd is a simple, small, portable, fast, and secure HTTP
-	  server
-
-	  http://www.acme.com/software/thttpd/
diff --git a/package/thttpd/S90thttpd b/package/thttpd/S90thttpd
deleted file mode 100644
index 94b079b050..0000000000
--- a/package/thttpd/S90thttpd
+++ /dev/null
@@ -1,54 +0,0 @@
-#!/bin/sh
-
-DAEMON="thttpd"
-PIDFILE="/var/run/$DAEMON.pid"
-
-THTTPD_ARGS="-C /etc/thttpd.conf"
-
-# shellcheck source=/dev/null
-[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
-
-start() {
-	printf 'Starting %s: ' "$DAEMON"
-	# shellcheck disable=SC2086 # we need the word splitting
-	start-stop-daemon -S -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \
-		-- $THTTPD_ARGS
-	status=$?
-	if [ "$status" -eq 0 ]; then
-		echo "OK"
-	else
-		echo "FAIL"
-	fi
-	return "$status"
-}
-
-stop() {
-	printf 'Stopping %s: ' "$DAEMON"
-	start-stop-daemon -K -q -p "$PIDFILE"
-	status=$?
-	if [ "$status" -eq 0 ]; then
-		# thttpd does not remove the pid file on exit
-		rm -f "$PIDFILE"
-		echo "OK"
-	else
-		echo "FAIL"
-	fi
-	return "$status"
-}
-
-restart() {
-	stop
-	sleep 1
-	start
-}
-
-case "$1" in
-	start|stop|restart)
-		"$1";;
-	reload)
-		# Restart, since there is no true "reload" feature.
-		restart;;
-	*)
-		echo "Usage: $0 {start|stop|restart|reload}"
-		exit 1
-esac
diff --git a/package/thttpd/thttpd.hash b/package/thttpd/thttpd.hash
deleted file mode 100644
index a29b9b2dcb..0000000000
--- a/package/thttpd/thttpd.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  99c09f47da326b1e7b5295c45549d2b65534dce27c44812cf7eef1441681a397  thttpd-2.29.tar.gz
-sha256  be059e6b8219d5bb5480fa6a2864bbb34892f56951d03d08b356bc1fa8c81a01  thttpd.c
diff --git a/package/thttpd/thttpd.mk b/package/thttpd/thttpd.mk
deleted file mode 100644
index d9cb5c9071..0000000000
--- a/package/thttpd/thttpd.mk
+++ /dev/null
@@ -1,46 +0,0 @@
-################################################################################
-#
-# thttpd
-#
-################################################################################
-
-THTTPD_VERSION = 2.29
-THTTPD_SITE = https://acme.com/software/thttpd
-THTTPD_LICENSE = BSD-2-Clause
-THTTPD_LICENSE_FILES = thttpd.c
-THTTPD_CPE_ID_VENDOR = acme
-
-THTTPD_MAKE = $(MAKE1)
-
-ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
-THTTPD_DEPENDENCIES += libxcrypt
-endif
-
-define THTTPD_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/thttpd $(TARGET_DIR)/usr/sbin/thttpd
-	$(INSTALL) -D -m 0755 $(@D)/extras/htpasswd $(TARGET_DIR)/usr/bin/htpasswd
-	$(INSTALL) -D -m 0755 $(@D)/extras/makeweb $(TARGET_DIR)/usr/bin/makeweb
-	$(INSTALL) -D -m 0755 $(@D)/extras/syslogtocern $(TARGET_DIR)/usr/bin/syslogtocern
-	$(INSTALL) -D -m 0755 $(@D)/scripts/thttpd_wrapper $(TARGET_DIR)/usr/sbin/thttpd_wrapper
-	$(SED) 's:/usr/local/sbin:/usr/sbin:g' -e \
-		's:/usr/local/www/thttpd_config:/etc/thttpd.conf:g' \
-		$(TARGET_DIR)/usr/sbin/thttpd_wrapper
-	$(INSTALL) -d $(TARGET_DIR)/var/www/data
-	$(INSTALL) -d $(TARGET_DIR)/var/www/logs
-	echo "dir=/var/www/data" > $(TARGET_DIR)/etc/thttpd.conf
-	echo 'cgipat=**.cgi' >> $(TARGET_DIR)/etc/thttpd.conf
-	echo "logfile=/var/www/logs/thttpd_log" >> $(TARGET_DIR)/etc/thttpd.conf
-	echo "pidfile=/var/run/thttpd.pid" >> $(TARGET_DIR)/etc/thttpd.conf
-endef
-
-define THTTPD_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 0755 package/thttpd/S90thttpd \
-		$(TARGET_DIR)/etc/init.d/S90thttpd
-endef
-
-define THTTPD_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 0644 package/thttpd/thttpd.service \
-		$(TARGET_DIR)/usr/lib/systemd/system/thttpd.service
-endef
-
-$(eval $(autotools-package))
diff --git a/package/thttpd/thttpd.service b/package/thttpd/thttpd.service
deleted file mode 100644
index e3c93e7b3c..0000000000
--- a/package/thttpd/thttpd.service
+++ /dev/null
@@ -1,10 +0,0 @@
-[Unit]
-Description=Tiny HTTP Daemon
-
-[Service]
-PIDFile=/run/thttpd.pid
-ExecStart=/usr/sbin/thttpd -D -C /etc/thttpd.conf
-Restart=always
-
-[Install]
-WantedBy=multi-user.target
diff --git a/support/testing/tests/package/test_thttpd.py b/support/testing/tests/package/test_thttpd.py
deleted file mode 100644
index 007bc91f2d..0000000000
--- a/support/testing/tests/package/test_thttpd.py
+++ /dev/null
@@ -1,26 +0,0 @@
-import os
-
-import infra.basetest
-
-
-class TestThttpd(infra.basetest.BRTest):
-    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
-        """
-        BR2_PACKAGE_THTTPD=y
-        BR2_TARGET_ROOTFS_CPIO=y
-        # BR2_TARGET_ROOTFS_TAR is not set
-        """
-
-    def test_run(self):
-        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
-        self.emulator.boot(arch="armv5",
-                           kernel="builtin",
-                           options=["-initrd", cpio_file])
-        self.emulator.login()
-
-        msg = "Hello Buildroot!"
-
-        self.assertRunOk("thttpd -V")
-        self.assertRunOk(f"echo '{msg}' > /var/www/data/index.html")
-        self.assertRunOk("wget http://localhost/index.html")
-        self.assertRunOk(f"grep -F '{msg}' index.html")
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
