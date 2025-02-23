Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E36C021B2
	for <buildroot@archiver.kernel.org>; Sun, 23 Feb 2025 21:14:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A137360BB4;
	Sun, 23 Feb 2025 21:14:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KOwmQHzviS4d; Sun, 23 Feb 2025 21:14:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A1FA60BBC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A1FA60BBC;
	Sun, 23 Feb 2025 21:14:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 080AC920
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 21:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5213406FA
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 21:14:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5G2yRnpI5cV5 for <buildroot@buildroot.org>;
 Sun, 23 Feb 2025 21:14:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A4A06406F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4A06406F6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A4A06406F6
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 21:14:37 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4397e5d5d99so22630585e9.1
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 13:14:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740345275; x=1740950075;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QxrVtp2KdyiL7CfFV6NcTAdWNxHExIuGbfYLyh69bNU=;
 b=LEAoW8X5LIZkA9dpXgi+5kv1enzLvcPsU5AhXIHQX1XwaGUTbOoTkHeoqhaAtxuzGC
 wHPfSJxkPkcFrOUpv0Q6eet5uDnbsv8qypGhW2K9Djz/Dfue+6j6wLRx8+rwRk6V6tMA
 ZoeQ+1ueuc+dWFk9igUPac0cK//Xf1S7zFMDeKwyVV0W66h1Kh9jVha20QndjfCHLyvL
 H1sMykzvVBMFqieQkNvz/CPvbKU6e0kMCMPB9c3EpzHp+uJVX/fk+Y2pFMeVe4E2rzmj
 eBnbN6EnccdrJP5INE6uRhTGviDxNkikaYWA3JZOVgGi3fN6j3mfHl0wbwG7UEUrJVn/
 OQcA==
X-Gm-Message-State: AOJu0YxD9mMA+/drU4NyLSvqgvvSPodJI1vyBlZ7hA3FHAwlI06oN5/Z
 Cxg8hs2QOzhrrdGlFEyprT9qygTIRNlE3jtM3O4N5KdAYgw1j8H1/9c4ZQ==
X-Gm-Gg: ASbGnct6OAsdhMvw2DNpmlVzILOVRBFZRlhncsRNBM4Aqziy5n609TJoiYxNvR2jN8j
 +0CKKaj7lbsH93EKE610UY0DHxAZNeGMq/U80TJrq2oyg7w4/0Azl9WeN4xHqiKCNjnK5UWwGgh
 OVHluzvXBJH1yhXan5KQHSf1iSDy3ZhZhWluDYiTTdhiF/BwTJqqnCdvSRaMxzRyS8F+oAIjDTi
 qqbiiNt15YmzaX5/g/GcBKIMDYesdA+XrltMH5GBWIT/Ubb5SrLjGy6An0EW7WK8wexY6HeVf7J
 ocmSdmn4AY8LL8rJmTWFnW5xquC4ouUbttNx
X-Google-Smtp-Source: AGHT+IFa1FpnawHQlkYRJBWUaT/JBjNzFlF0tjdhRFeOrQ5k9f66KAlvebzrJwrs4fb7SHFRBHYBjg==
X-Received: by 2002:a05:600c:4f91:b0:439:955d:c4e2 with SMTP id
 5b1f17b1804b1-439ae1f15b6mr80374075e9.13.1740345275512; 
 Sun, 23 Feb 2025 13:14:35 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b030be5esm86757955e9.30.2025.02.23.13.14.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2025 13:14:35 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Feb 2025 22:14:30 +0100
Message-ID: <6e2121db5c3a55357a076027d41fe69a689d15c3.1740345268.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1740345268.git.yann.morin.1998@free.fr>
References: <cover.1740345268.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740345275; x=1740950075; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QxrVtp2KdyiL7CfFV6NcTAdWNxHExIuGbfYLyh69bNU=;
 b=SCr5cOclh9AlyBkqDywRAi98oRE4DU1Leeev0jhpvO8499hNESQktk4JlLLiqdJIW2
 /6XVoFXcprZzew+b+ntBy6Jk4QdLmTMwJXUTusY/i3gfS6W3bsuKYFu40IK2WFdmyrx1
 vP19H7pJaXb/agXYx66oi7WQXXbj3CPCwOP/51bQ7EyEEzeBGzi/ys0k1jH10jkXpi8F
 GH+RbAnVoAm8iaKZIMeyg/K9Y+1+NUlnw6r2zBpSDBpAgMXMML57jLQ48Kbr/ckJrp7T
 SlBumjSekdSjrJn2PIJqMIC81SkknPmnX+cHn+ecdJhhA0xWkGbJrq9lGsLLSRaVjQ8F
 5vzg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SCr5cOcl
Subject: [Buildroot] [PATCH 6/8] package/cgroupfs-v2-mount: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, the cgroupfs-mount package only mounts a cgroup v1 hierarchy,
but v1 is considered legacy and obsolete, while v2 has ben around for a
while now, and is required by some packages (e.g. podman whines about
v1).

cgroupfs-mount has not had a release in almost 8 years now, and only the
occasional commit since then and until more than 3 years ago. It's not
going to evolve...

Add a new package with a simple-enough sysv startup script, that mounts
the cgroup v2 hierarchy filesystem. For systemd, there's nothing to do,
as systemd handles the mount by itself.

Since both cgroup v1 and v2 use the same mountpoint, we can't have both
enabled at the same time, and thus we restrict the v2 to be hidden when
v1 is enabled (quite a few packages select the v1; changing those would
require that they be validated against v2 first...)

Note that, due to limitations in Kconfig, cgroupfs-v2-mount will appear
indented below cgroupfs-mount, because it has a (negative) dependnecy on
it. This spurious indentation is unfortunate and annoying, but benign;
fixing that would require breaking the dependency with a random Kconfig
symbole, which we dont have, and which we decided not to introduce jsut
for this one use-case (well, there's host-gnupg and host-gnupg2 that
have the exact same issue, but meh...)

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                             |  1 +
 package/cgroupfs-v2-mount/Config.in           | 10 +++++
 package/cgroupfs-v2-mount/S30cgroupfs2        | 43 +++++++++++++++++++
 .../cgroupfs-v2-mount/cgroupfs-v2-mount.mk    | 16 +++++++
 4 files changed, 70 insertions(+)
 create mode 100644 package/cgroupfs-v2-mount/Config.in
 create mode 100644 package/cgroupfs-v2-mount/S30cgroupfs2
 create mode 100644 package/cgroupfs-v2-mount/cgroupfs-v2-mount.mk

diff --git a/package/Config.in b/package/Config.in
index da21d45a98..5a3af06571 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2807,6 +2807,7 @@ menu "System tools"
 	source "package/balena-engine/Config.in"
 	source "package/bubblewrap/Config.in"
 	source "package/cgroupfs-mount/Config.in"
+	source "package/cgroupfs-v2-mount/Config.in"
 	source "package/circus/Config.in"
 	source "package/conmon/Config.in"
 	source "package/containerd/Config.in"
diff --git a/package/cgroupfs-v2-mount/Config.in b/package/cgroupfs-v2-mount/Config.in
new file mode 100644
index 0000000000..2dd2dbc089
--- /dev/null
+++ b/package/cgroupfs-v2-mount/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_CGROUPFS_V2_MOUNT
+	bool "cgroupfs-v2-mount"
+	depends on !BR2_INIT_SYSTEMD
+	depends on !BR2_PACKAGE_CGROUPFS_MOUNT
+	help
+	  Mount the cgroup v2 hierarchy filesystem.
+
+comment "cgroupfs-v2-mount is incompatible with cgroupfs-mount"
+	depends on !BR2_INIT_SYSTEMD
+	depends on BR2_PACKAGE_CGROUPFS_MOUNT
diff --git a/package/cgroupfs-v2-mount/S30cgroupfs2 b/package/cgroupfs-v2-mount/S30cgroupfs2
new file mode 100644
index 0000000000..7f80d1c405
--- /dev/null
+++ b/package/cgroupfs-v2-mount/S30cgroupfs2
@@ -0,0 +1,43 @@
+#!/bin/sh
+
+DAEMON=cgroupfs2
+
+start() {
+	printf 'Mounting %s: ' "${DAEMON}"
+	mount -t cgroup2 none /sys/fs/cgroup
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+stop() {
+	printf 'Unmounting %s: ' "${DAEMON}"
+	mount -t cgroup2 none /sys/fs/cgroup
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+restart() {
+	stop
+	start
+}
+
+case "$1" in
+	start|stop|restart)
+		"$1";;
+	reload)
+		# Restart, since there is no true "reload" feature.
+		restart;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+esac
diff --git a/package/cgroupfs-v2-mount/cgroupfs-v2-mount.mk b/package/cgroupfs-v2-mount/cgroupfs-v2-mount.mk
new file mode 100644
index 0000000000..66db3b3ffa
--- /dev/null
+++ b/package/cgroupfs-v2-mount/cgroupfs-v2-mount.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# cgroupfs-v2-mount
+#
+################################################################################
+
+CGROUPFS_V2_MOUNT_VERSION =
+CGROUPFS_V2_MOUNT_SITE =
+
+define CGROUPFS_V2_MOUNT_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D \
+		$(CGROUPFS_V2_MOUNT_PKGDIR)/S30cgroupfs2 \
+		$(TARGET_DIR)/etc/init.d/S30cgroupfs2
+endef
+
+$(eval $(generic-package))
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
