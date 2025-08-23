Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43438CA0EFA
	for <buildroot@archiver.kernel.org>; Sat, 23 Aug 2025 19:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 183E383E0A;
	Sat, 23 Aug 2025 19:50:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ztNtTaenLox; Sat, 23 Aug 2025 19:50:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3D0583DD2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3D0583DD2;
	Sat, 23 Aug 2025 19:50:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3375919C
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 19:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC91741635
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 19:50:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Drm0uElKDBz7 for <buildroot@buildroot.org>;
 Sat, 23 Aug 2025 19:50:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A890841621
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A890841621
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A890841621
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 19:50:00 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-45b4d89217aso16176335e9.2
 for <buildroot@buildroot.org>; Sat, 23 Aug 2025 12:50:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755978599; x=1756583399;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CrXHlDGVxmLIIJSGtFg+aP0VZF6FgC7EVbNpgwX/mbQ=;
 b=LYBrCjQsqo9PeiuM5AvcWgndGVG1V8CRWT0FHba8NVHxc7qy/eOlKAF9Gx8X2d+iNB
 Q8yNJ4KFkoy9PCn5fEaHtnrWRbCBeOpnAPwkZKuDzhFFSb/K2OX2JOzyCr4p/BinEW1U
 ZWmgFGrQgk3DqpR3DQwRQj1XZ4FEmSH771Nr1MfkaU3iMgQUN4nrreJRa5dhMkxVuAbE
 fMZV1CQozqVyp7kpAdE7ZDX+pYYfLauTycUWBUFI0h7g7hAnCGAqNPMLddE5T68IPcA6
 5BDJQyW9uFSvZynQ2XSNxZiwjF1jPX88pBVCkCwSROkHvQoqkjOpUocrSk3RHSdQNwuP
 g3mQ==
X-Gm-Message-State: AOJu0YwaIV0hndDzmSnPfKnpgMId2TNnH1oXH4ammKmkDTJgouYlPFze
 gRcH124/oKQ8vkoCt/xHy4E2Os4+WnTbh7j6zOGbL3G+LWTiYdHzqKjAJY6MXcuRCb4Im4LFzca
 JAETu
X-Gm-Gg: ASbGncskOnsJLvZNm+yswUWFiHUgxgCzwUYs/wIlRWIGXT/UbaJo6KYu0ixCKgJIzlK
 nZjJphC/2FcHwkxP1SWBcOY7T4QTUaekbfVs8hoWH7s2bOFFXKhJhstvmCuOyXRscw99s9HkH5m
 uE7UovoDme2Amu/mxr90gp1+2lpbeW2lQhX//FLg0B98pny0+BHTkmLH2pYE4/dS2ENHdGMordy
 CYwm22oODU4zldkgGNJb9rM6jszPSFezIp8r7UtCWyR9pgNvLhFDG4kjCRxmUEpFs4wuBMGCzZK
 eEfv8rDAS4DmkFbUXiyqT64jjYPkJVXEwMajY9WAOjwLa6mqoxKfJnJpbCaShXhXR0Gb4qpz6me
 hrf4vVEMnaEVbHquZu/JZ34GR+RWO1HhlvUrmasZqdaG2QlLW/a78SRCEFvm7ruqJwZf8iFFOvk
 TKuHywU/ZUNT3SE8fV8Yry
X-Google-Smtp-Source: AGHT+IH/lFhGiM6kRvXhrZwumfnoTvNDlyfNYwaUjqcWD20y4Y+1xB6z4P5g3jmfVbHVy+4pysjF3w==
X-Received: by 2002:a05:600c:3149:b0:456:28f4:a576 with SMTP id
 5b1f17b1804b1-45b517dd9a3mr52807775e9.27.1755978598650; 
 Sat, 23 Aug 2025 12:49:58 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b57444958sm45881125e9.2.2025.08.23.12.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Aug 2025 12:49:58 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>,
	Julien Olivain <ju.o@free.fr>
Date: Sat, 23 Aug 2025 21:49:53 +0200
Message-ID: <20250823194953.3458533-4-romain.naour@smile.fr>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250823194953.3458533-1-romain.naour@smile.fr>
References: <20250823194953.3458533-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1755978599; x=1756583399; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CrXHlDGVxmLIIJSGtFg+aP0VZF6FgC7EVbNpgwX/mbQ=;
 b=YZkG3ptlySLlqPsmpitfU+ZDkZKetuIy0De0iiWHBSCGmJNShfmzdndDS7jeqiLgBK
 A+IZo/mAoFU4ZF+Gq0AgbttkMZ9kc2aRDhxfmaoBBlrpJzQcjWyJHpm9JEl4F+yR2Zsj
 T5DRjsk0LDIhAi9ky+v5VpP4HDA99bpRmGqjg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=YZkG3ptl
Subject: [Buildroot] [PATCH v2 4/4] package/thttpd: remove package
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
V2: remove test_thttpd.py entry from DEVELOPERS file
---
 Config.in.legacy                             |  7 +++
 DEVELOPERS                                   |  1 -
 package/Config.in                            |  1 -
 package/thttpd/Config.in                     |  9 ----
 package/thttpd/S90thttpd                     | 54 --------------------
 package/thttpd/thttpd.hash                   |  3 --
 package/thttpd/thttpd.mk                     | 46 -----------------
 package/thttpd/thttpd.service                | 10 ----
 support/testing/tests/package/test_thttpd.py | 26 ----------
 9 files changed, 7 insertions(+), 150 deletions(-)
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
diff --git a/DEVELOPERS b/DEVELOPERS
index 8915eb6738..a4c2267e75 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2035,7 +2035,6 @@ F:	support/testing/tests/package/test_tcl.py
 F:	support/testing/tests/package/test_tcl/
 F:	support/testing/tests/package/test_tcpdump.py
 F:	support/testing/tests/package/test_tesseract_ocr.py
-F:	support/testing/tests/package/test_thttpd.py
 F:	support/testing/tests/package/test_trace_cmd.py
 F:	support/testing/tests/package/test_trace_cmd/
 F:	support/testing/tests/package/test_tree.py
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
