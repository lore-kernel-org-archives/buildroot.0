Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05C7C021B8
	for <buildroot@archiver.kernel.org>; Sat,  1 Mar 2025 15:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47E8C42E0C;
	Sat,  1 Mar 2025 15:06:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VSqsJwDujw0N; Sat,  1 Mar 2025 15:06:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84DA242E20
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 84DA242E20;
	Sat,  1 Mar 2025 15:06:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 191AF181
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 15:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 50C3C84C5A
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 15:05:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5arIw5Elyfqr for <buildroot@buildroot.org>;
 Sat,  1 Mar 2025 15:05:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A8B6E84C47
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8B6E84C47
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A8B6E84C47
 for <buildroot@buildroot.org>; Sat,  1 Mar 2025 15:05:50 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4399deda38cso20052665e9.1
 for <buildroot@buildroot.org>; Sat, 01 Mar 2025 07:05:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740841548; x=1741446348;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8U6ogQIYerHSv1XFtt0g2SR+7Lr6dX5dbZTbpyM/bZA=;
 b=DMELYAIyUouex1r275vTi8H2aB/wdgbiEgyORizGoLbOe+Hz12nJr3lT4G35lmk5aB
 V0Usm8oXaAZfHQy1Gh6Ktzis30m/hYhrEDizJSITdh4GXSk3uSng9iAc9Mb7AkU4kzqt
 nMA9SKyupjQy4zi3uSkF/oS+09Tbyi5fty94DW8FUGFDBVgdvvRbEgbRCR9yVHdXy4bL
 pzwYQNBUF9VvOGLWTYWifH21y9W2UTjwhXXf04StUVNSr7iBGpWMMmU2oreMIGNnU+BR
 J4cC23Gh/hU9/s3GOKwHKuclEGQxGaa0IpP7qJl1G2G6nb1D3m7ZDKrtK1jbKUw1I8gr
 XNag==
X-Gm-Message-State: AOJu0YwCse38HrSMvQds0jpEdFBrlklTcpy+0EPbjbOiHuhkoxHcKoVi
 p9wg274ikrpkGvzACsNcWrQsDQv+cPIeUkz9SQZI9Ehs1O0tXUJlX3gmRg==
X-Gm-Gg: ASbGncvfSOGyohl8Gpmv5j0sWgyd3qt4i05aTOM1MZfv00LSHp7wkBQzhXdOHLWyEaP
 ybewdR51AWRJnJFtGjJbAXDywejhQBpU9detllgDb0+PkjPiurNkkVOX9l8yaUQrEmfl830GB6c
 mgcBb7AlHqPSU51u+qSPF1vjHYHt+UZt1ay/8Vz2JpAd7TK8rWZLWPnplXb2xINK6SodIorN6RI
 g2oC0CRB+HzyWV0jAiFq5w6hwsIDRi+aYBhLW2hJymN35qbJjgcRal/atcU0CRQfD31lWBTypuZ
 LPf9padFaf8EUCYqUrzPyBMEf/34lhkBjtmvQ9IBu1pMI/wDQwgMFSQ=
X-Google-Smtp-Source: AGHT+IGRuNvjEgsu16vX/8b+N5+HBagiHRCsEouimj9vYZg7nM1AXsTYjXjCtep4SadoV3emnJeM1g==
X-Received: by 2002:a05:600c:5250:b0:439:8a8c:d3d8 with SMTP id
 5b1f17b1804b1-43ba6774c0dmr66030235e9.29.1740841547502; 
 Sat, 01 Mar 2025 07:05:47 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba57145esm123806065e9.30.2025.03.01.07.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 07:05:47 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  1 Mar 2025 16:05:42 +0100
Message-ID: <6154bc570b65abd4140355bb79e27a9ca6820006.1740841539.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1740841539.git.yann.morin.1998@free.fr>
References: <cover.1740841539.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740841548; x=1741446348; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8U6ogQIYerHSv1XFtt0g2SR+7Lr6dX5dbZTbpyM/bZA=;
 b=kIsFFQi4QOF8TFgafW0Q8Lykz9o/A1UsCIpiOsh8+l7nikVKQ2yoEeYraBQRNbE9y5
 mxynQ4K5LmSXr6+2ewRpLVTmgJo8z5awq9PBP8kdbFUM6nAjKb2P014JsTh9TRZ5tS7o
 cQMwHaMC4e7UZ4z8DLjwfvcTPkP5T+aNc+GGHsVK+9YKdcxIO0TCUlknNCZ3ekjR6AYu
 5rM+sUNLNIReQ1xoQN7ohHv9MXfUBEYVaV7nsLUWLD6Y3ehqtk55i4jZMRItMYIWRDzD
 NOFx8qCdIe9R15mfWObFp22ZdozQqtyeNiCVu8g1mo+hAZfAj7uRIP/h5TK6Pz5du5MC
 BiqA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kIsFFQi4
Subject: [Buildroot] [PATCH 7/9 v3] package/cgroupfs-v2-mount: new package
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
