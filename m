Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F72BC28B2F
	for <buildroot@archiver.kernel.org>; Sat, 15 Mar 2025 19:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7AA883B42;
	Sat, 15 Mar 2025 19:57:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8GR6O_An9U3E; Sat, 15 Mar 2025 19:57:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6A4A83B88
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6A4A83B88;
	Sat, 15 Mar 2025 19:57:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BD1CCC8
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 19:57:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ACDD5411D8
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 19:57:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xPXi4umCmNzH for <buildroot@buildroot.org>;
 Sat, 15 Mar 2025 19:57:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5D2A641147
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D2A641147
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5D2A641147
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 19:57:17 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3913958ebf2so2531103f8f.3
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 12:57:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742068636; x=1742673436;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=szgM6VGlzNKdHE8F31LP0AS/TLxKrxotTaGflZALo8U=;
 b=fTJ4jqlMXyw8Tw8t/59/xDTSNuF0aumm+2KVLy8F2KJOzmsw347zKBJK0ZFMzwNg5+
 IYkileN6WIT80gwv+/YTouSXHsFdwn0UUVpiDDTpt60UDr4m3As7nsSlASS/HwQ25Jol
 /YRBrC9vqGFoz+Oty4uwtNWBq4LPy5gtqNHyIq5upFqGn0/Ta9dwOkiX7js2En1QO7Po
 Q6Vfs4VfZy62tcWiTgoXk0E0qbS4yAQuNBSFynXP04wNrCgEz6GI+MfWtOIos9dJqSDn
 QZUXK+XpIu0kH/XpWhC4Duf3HUE3jk8A+kuvFLZ2Pvmh9GxGjDx5ql2UhzKRTt0rMJds
 YIOA==
X-Gm-Message-State: AOJu0YyuS0a1cZSw0HlQtGOoX2sqOIlcAyWqA6vzvxQpk4u3XRi6AG5s
 5FCsOvbL0jQw9ClIjxdOc6JKLIk5SQXNPQ1jhtAZdmpXj7Hzyb/fXBLb3g==
X-Gm-Gg: ASbGncu8RvrYnOWD0U4h+qKxCCg/difeeqOCcLU+w6VK0umtV2hYxAXtPv17XrgzHMf
 l4GtZQswQs6UWl4zutDsawpPSUtp4kSD0q6KnWRpcMMkcFlds6PGgQGwaQPL0Q7auyWJBqJj3KA
 a7KcwCyFB5J+yvD8PRFDoSvCK0oyVHOFjjXH0VLrrk4ozc/S57ioGTAil67h+qRA6yq1h0Dm3Q0
 tLvwcMxe52QXd3THdAM10+iSPHkv80vDydTS0DhJGqGfB9Xo+du9urdJKyU1tB96QvxoBBMI7br
 gVUtlA9b8n9YC/09aoMw7g8TJeX9dhhj+CbmCARIAY2q+1TuXs+y8jM=
X-Google-Smtp-Source: AGHT+IEa6n+e4+omm5S+ZpwquLfJvLdBfgKJT1AWuLbySGLC1elp1sHOzqnkb8JyZoR7aopRHxNClw==
X-Received: by 2002:a05:6000:25f1:b0:385:faaa:9d1d with SMTP id
 ffacd0b85a97d-3971e971cc3mr10081600f8f.35.1742068635789; 
 Sat, 15 Mar 2025 12:57:15 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c8975afesm9756836f8f.47.2025.03.15.12.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Mar 2025 12:57:15 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 15 Mar 2025 20:57:05 +0100
Message-ID: <a85da00b056460e7309652f40c6f15fb4b4dcd38.1742068624.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1742068624.git.yann.morin.1998@free.fr>
References: <cover.1742068624.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742068636; x=1742673436; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=szgM6VGlzNKdHE8F31LP0AS/TLxKrxotTaGflZALo8U=;
 b=UdgGc/9SYlTS3GP4J22ggqSOqxOEB65Tz46wlvlloVtGvLB8bOjp4tKtMnvrMC+QT9
 NhiNcl2U/3ajNAE5mCIM1OEdFXWRMNUNzjweFvfPlNM8L845DDE6JK/ysBQU+0oaZakY
 zFVp4wIb7R8/vYY5voi3aiZsKrtX20fZ4NoTW+rr4rORMX4wuazZd5Er6KW6M6zCGPaf
 sOWMD6QD1J9o1sn+4u0GYwsn4vZfe770Pkf5p7bTJoQ+3dWsE/j/7px4uLcRG96gjygi
 wRQtVm5sGBj4djmR7A+TROvT8OWzjZB7IWiaIQ83Hef1FCWtYWG035fmwfPfm0AVE6Bb
 w/xw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UdgGc/9S
Subject: [Buildroot] [PATCH 07/14 v4] package/cgroupfs-v2-mount: new package
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
Changes v2 -> v3;
  - enable cgroups in the kernel
  - really unmount on stop, rather than mounting again
---
 package/Config.in                             |  1 +
 package/cgroupfs-v2-mount/Config.in           | 10 +++++
 package/cgroupfs-v2-mount/S30cgroupfs2        | 44 +++++++++++++++++++
 .../cgroupfs-v2-mount/cgroupfs-v2-mount.mk    | 20 +++++++++
 4 files changed, 75 insertions(+)
 create mode 100644 package/cgroupfs-v2-mount/Config.in
 create mode 100644 package/cgroupfs-v2-mount/S30cgroupfs2
 create mode 100644 package/cgroupfs-v2-mount/cgroupfs-v2-mount.mk

diff --git a/package/Config.in b/package/Config.in
index 0c9b5bb6cf..7d8540869d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2809,6 +2809,7 @@ menu "System tools"
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
index 0000000000..42839ef921
--- /dev/null
+++ b/package/cgroupfs-v2-mount/S30cgroupfs2
@@ -0,0 +1,44 @@
+#!/bin/sh
+
+DAEMON=cgroupfs2
+
+start() {
+	printf 'Mounting %s: ' "${DAEMON}"
+	mkdir -p /sys/fs/cgroup
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
+	umount /sys/fs/cgroup
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
index 0000000000..10e18d8d41
--- /dev/null
+++ b/package/cgroupfs-v2-mount/cgroupfs-v2-mount.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# cgroupfs-v2-mount
+#
+################################################################################
+
+CGROUPFS_V2_MOUNT_VERSION =
+CGROUPFS_V2_MOUNT_SITE =
+
+define CGROUPFS_V2_MOUNT_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS)
+endef
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
