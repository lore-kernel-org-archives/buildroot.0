Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68D6CFC53E
	for <buildroot@archiver.kernel.org>; Mon, 14 Oct 2024 10:21:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A5D4607A9;
	Mon, 14 Oct 2024 10:21:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hY3Sl0r0t-nN; Mon, 14 Oct 2024 10:21:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C53B607D3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C53B607D3;
	Mon, 14 Oct 2024 10:21:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 95A421BF2F0
 for <buildroot@lists.busybox.net>; Mon, 14 Oct 2024 10:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8345040373
 for <buildroot@lists.busybox.net>; Mon, 14 Oct 2024 10:21:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D5S5aHn5SM5q for <buildroot@lists.busybox.net>;
 Mon, 14 Oct 2024 10:21:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 431E840296
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 431E840296
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 431E840296
 for <buildroot@buildroot.org>; Mon, 14 Oct 2024 10:21:32 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-431157a490eso6711645e9.0
 for <buildroot@buildroot.org>; Mon, 14 Oct 2024 03:21:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728901290; x=1729506090;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NpnMWrNJidwcsOUYYRT66xklu921q50xoH8O9H8Vrqs=;
 b=xVeEXbMZHgxhGyG7xFfj5GnVjgwEKoByki57e0czSgq4xyMC2Pu7YxXNlKNQ5mwv30
 za87lugtHYkZpSWEJ6IT8u37GjORiQcEtN2sXBHtozZqamvapvZrJpwt47hZNKt7LJrx
 uaMv0ers+6W80cTI96OyjvW7jMxI3WY0UEb3QKjNEr+kf37Z96tnoSAy/0+Ox4eUe6va
 jt4aOv+qJn+DU71HMRvrfxe2zGHoIa1b4V+fMb7LIE8elgZq17izEUe08yy0t0cNcIZk
 /mUjTZ5cm2qrQncR22a38WwCgmBhdrOKEvYJn8vPQ9Zp9We3v/99fAdYV0ygXebRaEwM
 hr3g==
X-Gm-Message-State: AOJu0YyQFbnqi9diqShkqM/u+FXD3d5dgUrm1a22ThQFHXausZy2RD51
 v0zHYMHm089SnMjQ4ikMoktM1Q/Zmt6rA64SezITtmwaWR4qFbTNggyjfVE0oPvQGInt6PF88gx
 g+Cc=
X-Google-Smtp-Source: AGHT+IF2GTUuTueF37u7mSTclcFPbCuXvBX7L6cXejEX0Ss4AX2DWok51iUmRxB7Az5leWCxx60TVA==
X-Received: by 2002:a05:600c:350f:b0:42c:bb35:b6d0 with SMTP id
 5b1f17b1804b1-4311dea4351mr39943205e9.1.1728901289614; 
 Mon, 14 Oct 2024 03:21:29 -0700 (PDT)
Received: from adam-laptop.amarulasolutions.com
 ([2001:b07:6467:4426:e642:fe3c:c003:b424])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431182d7ca3sm116402605e9.2.2024.10.14.03.21.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2024 03:21:29 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 14 Oct 2024 12:21:19 +0200
Message-ID: <20241014102123.3727883-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241014102123.3727883-1-adam.duskett@amarulasolutions.com>
References: <20241014102123.3727883-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1728901290; x=1729506090;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NpnMWrNJidwcsOUYYRT66xklu921q50xoH8O9H8Vrqs=;
 b=BLOV8L2b1Rf7h+PJ2EBOYSWntdELS5Cfuq7G7Gw4UsmNmxH3fUEcNKlWhiiElR85Ch
 JCD4+nnw8fm0GdiT95Nc6tYDVyZl5J83SHnEGKdyIeZ0q63WxDWjOtlw6ddPEhgh/MCB
 sGlFXoXW9MFs2tQHvRC6nXWWdKdDE5QIt9RJ8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=BLOV8L2b
Subject: [Buildroot] [PATCH 2/6] package/mender: remove /var/lib/mender
 symlinking
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The logic behind making /var/lib/mender a symlink to itself is to
detect if a filesystem is read-only. However, this creates a few problems:

  1) The logic confusing.

  2) The official mender documentation suggests four partitions minimum:
     - boot
     - rootfs A
     - rootfs B
     - data

     If a user is to follow the official documentation, which they should,
     then there is no need for any additional logic for a system setup with
     a read-only filesystem, as the data partition is always read-write.

  3) The post-build.sh script in the board/mender/x86_64 directory removes
     the symlink.

  - Remove symlinking /var/lib/mender to itself

  - Remove the difficult to understand logic dealing with the symlinks
    in S42mender, mender-client.service.

  - Remove the logic dealing with the symlink in
    board/mender/x86_64/post-build.sh

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 board/mender/x86_64/post-build.sh    |  5 -----
 package/mender/S42mender             | 16 ----------------
 package/mender/mender-client.service | 11 -----------
 package/mender/mender.mk             |  3 +--
 4 files changed, 1 insertion(+), 34 deletions(-)

diff --git a/board/mender/x86_64/post-build.sh b/board/mender/x86_64/post-build.sh
index bc4f4b8f11..0c52eb7be5 100755
--- a/board/mender/x86_64/post-build.sh
+++ b/board/mender/x86_64/post-build.sh
@@ -31,11 +31,6 @@ parse_args() {
 # Create a persistent directory to mount the data partition at.
 mender_fixup() {
     pushd "${TARGET_DIR}"
-    if [[ -L var/lib/mender ]]; then
-        rm var/lib/mender
-        mkdir -p var/lib/mender
-    fi
-
     # The common paradigm is to have the persistent data volume at /data for mender.
     if [[ ! -L data ]]; then
         ln -s var/lib/mender data
diff --git a/package/mender/S42mender b/package/mender/S42mender
index 0f2077d089..70116ed4eb 100644
--- a/package/mender/S42mender
+++ b/package/mender/S42mender
@@ -8,22 +8,6 @@ PIDFILE="/var/run/${DAEMON}.pid"
 DAEMON_ARGS="daemon"
 
 start() {
-	# If /var/lib/mender is a symlink to /var/run/mender, and
-	#   - the filesystem is RO (i.e. we can not rm the symlink),
-	#     create the directory pointed to by the symlink.
-	#   - the filesystem is RW (i.e. we can rm the symlink),
-	#     replace the symlink with an actual directory
-	if [ -L /var/lib/mender ] && [ "$(readlink /var/lib/mender)" = "/var/run/mender" ]
-	then
-		if rm -f /var/lib/mender >/dev/null 2>&1; then
-			mkdir -p /var/lib/mender
-		else
-			echo "No persistent location to store mender data. Data will be lost"
-			echo "at reboot. Are you sure this is what you want to do?"
-			mkdir -p "$(readlink /var/lib/mender)"
-		fi
-	fi
-
 	printf "Starting mender service: "
 	umask 077
 	start-stop-daemon -bmSqp "$PIDFILE" -x ${DAEMON_PATH} -- ${DAEMON_ARGS}
diff --git a/package/mender/mender-client.service b/package/mender/mender-client.service
index 5539a56fd6..47e439993c 100644
--- a/package/mender/mender-client.service
+++ b/package/mender/mender-client.service
@@ -6,17 +6,6 @@ After=systemd-resolved.service
 Type=idle
 User=root
 Group=root
-ExecStartPre=/bin/sh -c '\
-if [ -L /var/lib/mender \
-     -a "$(readlink /var/lib/mender)" = "/var/run/mender" ]; then \
-    if rm -f /var/lib/mender >/dev/null 2>&1; then \
-        mkdir -p /var/lib/mender; \
-    else \
-        echo "No persistent location to store mender data. Data will be lost" \
-        echo "at reboot. Are you sure this is what you want to do?"; \
-        mkdir -p "$(readlink /var/lib/mender)"; \
-    fi; \
-fi'
 ExecStart=/usr/bin/mender daemon
 Restart=on-abort
 
diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index ee1398244b..e6a2740e80 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -72,8 +72,7 @@ define MENDER_INSTALL_CONFIG_FILES
 	$(INSTALL) -D -m 0755 $(MENDER_PKGDIR)/device_type \
 			$(TARGET_DIR)/etc/mender/device_type
 
-	mkdir -p $(TARGET_DIR)/var/lib
-	ln -snf /var/run/mender $(TARGET_DIR)/var/lib/mender
+	mkdir -p $(TARGET_DIR)/var/lib/mender
 	$(foreach f,$(MENDER_UPDATE_MODULES_FILES), \
 		$(INSTALL) -D -m 0755 $(@D)/support/modules/$(notdir $(f)) \
 			$(TARGET_DIR)/usr/share/mender/modules/v3/$(notdir $(f))
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
