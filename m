Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8021C021A4
	for <buildroot@archiver.kernel.org>; Mon, 24 Feb 2025 21:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7662881761;
	Mon, 24 Feb 2025 21:22:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TFFVCMMA3Y85; Mon, 24 Feb 2025 21:22:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02D6F819B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02D6F819B8;
	Mon, 24 Feb 2025 21:22:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D4D994E
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 21:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F80D60E2E
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 21:22:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NCaJMH1bmhLY for <buildroot@buildroot.org>;
 Mon, 24 Feb 2025 21:22:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 59C4160E3A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59C4160E3A
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 59C4160E3A
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 21:22:27 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43989226283so33491845e9.1
 for <buildroot@buildroot.org>; Mon, 24 Feb 2025 13:22:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740432145; x=1741036945;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UO99Ok69EqbFcnnozLqFq0uaNXDsTXkHT2T3llzJe2s=;
 b=k24jiXokC6GdMGHC9o2EERQzRG32CBiZl6BP+plpXlVFnNGinEfeBzhHBAz3HTF/S0
 UfcxD8vVC89SuZFEG2zsVnqc0fc3zOakUw0nZUkr5uWVCt7bQ7B7F+bZXa6lYEpjsN+u
 14iaQBlHK+Bba1eLM3RR2pSqWRSHCqSvDXbsGL4yoE+nSy8dnCSswvllsyonKydifwiC
 KemfzEOVY3zPa5XIxTfXU68orGRFILIeguWiIYIUcloMPUocnAZz9xGF1A6KLx3oMlew
 C1CrmqIhfW9TCeWL1ageGUZ1WioTjUX1G4H6ytRXUjROLlUEsFP/edrT7o1mlkZZso+x
 xA2w==
X-Gm-Message-State: AOJu0YzPRg4sGbgY7D8x+XfnGFwSWmWuM/JjnXxbL+SXNk4l2TvUp++0
 j9zobICf45toED6yugnyxhJUeScpzmDmmfBdZeZVXX7MhWLx84fPWHBwQQ==
X-Gm-Gg: ASbGncuZf/OwIuzzTYAWDuaGn8lX7EC8IoyYDpwN3N6G1yHd8BJvP+n+WVem8ep0x4w
 7L9DWqzinLpZgEQ8b30ZXyIt1KkVxqhRUvYgJ+yX09UTDstRjiDdvBRV433Zm68YlkvBaCNNopB
 pKbdohPevuY7OeY/qGO9ayiENrjMppOTKT5QFnP/Vi34UwVo+WcoYkUQmbJ4WrwxlYkcBfkaCie
 uNF+aDx3iN1XNvpgn72+HrGqwtJKv38eprhbV4GomQBC241Djqs7OKood4qQPrrh2XAsY4v7IaC
 aT+Rd84LSmXM4jhRVRQIV4j6EmUYIcR5W60K
X-Google-Smtp-Source: AGHT+IHv2gTp3BPpye8mUN64UI4x3wiSIIvq33xp4N479Yvr6d4BxurODIyyNa7o/RD6ioGfHu0bIw==
X-Received: by 2002:a05:600c:1396:b0:439:88bb:d02d with SMTP id
 5b1f17b1804b1-439ae1d9a2dmr131343655e9.2.1740432145208; 
 Mon, 24 Feb 2025 13:22:25 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b01346d1sm119875635e9.0.2025.02.24.13.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2025 13:22:24 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 24 Feb 2025 22:22:19 +0100
Message-ID: <9bc442ebd9a45f4d51c26dbfda13ec3b874754da.1740432132.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1740432132.git.yann.morin.1998@free.fr>
References: <cover.1740432132.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740432145; x=1741036945; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UO99Ok69EqbFcnnozLqFq0uaNXDsTXkHT2T3llzJe2s=;
 b=fm7rJifBvdIUrREKtrv8uZMhtWrooHWgJh8QbnPpKWB6vVwz9SmfckAb3ojTJBP5JC
 oRAr38d8k0lP5ts0GbB5QGC1zfDXS4o7nzc5j+htbMyWdao9/jIWLV7NXUsNwyRmHD/W
 fcAw/EdVX5SjWI4qzENqx2WNCXZLTuQbuLsqgOeYCYN0gNCaGV76XO0n2KR5mwH2e14N
 bXF05ivdTMmIOCFlU22Uni/Ro0vSDlQmGu1k1YAzQ2Nqxvl6jskmNIUu+1O1K4ZR+Xgz
 1fiVNQeuFZlYyvxk0UTPhxrYu5OJECPtqr8LkAHRCEmSx4t3oLUDFJLR1+pWyQZdmmaM
 fGmQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fm7rJifB
Subject: [Buildroot] [PATCH 6/8 v2] package/cgroupfs-v2-mount: new package
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
index 33fcfd0597..a152268209 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2808,6 +2808,7 @@ menu "System tools"
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
