Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 970C8C433F5
	for <buildroot@archiver.kernel.org>; Tue, 21 Dec 2021 15:01:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3CDDF4016B;
	Tue, 21 Dec 2021 15:01:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z-ETNCRZQ2Tw; Tue, 21 Dec 2021 15:01:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 023B440A1C;
	Tue, 21 Dec 2021 15:01:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 75AEF1BF5DA
 for <buildroot@lists.busybox.net>; Tue, 21 Dec 2021 15:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 663D3408E9
 for <buildroot@lists.busybox.net>; Tue, 21 Dec 2021 15:01:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Is_e8128oXyn for <buildroot@lists.busybox.net>;
 Tue, 21 Dec 2021 15:01:13 +0000 (UTC)
X-Greylist: delayed 00:05:56 by SQLgrey-1.8.0
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4893A408DD
 for <buildroot@buildroot.org>; Tue, 21 Dec 2021 15:01:13 +0000 (UTC)
Received: from machine.home (lfbn-lyo-1-1484-111.w86-207.abo.wanadoo.fr
 [86.207.51.111])
 by linux.microsoft.com (Postfix) with ESMTPSA id 6A7CA20B717A;
 Tue, 21 Dec 2021 06:55:21 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6A7CA20B717A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1640098522;
 bh=qTRa5imnT21YfoHxOoJoFle0iW4/CKR7RkO0vVCIkUw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IoWafbVe3FIwdcQJqT7gExtGZkB/8jkYqebeGR6nuD4yLJvigVJvWwjwJ+nwBi2vc
 0TzlSoGvggHXh1odGMVRm/DqVECZsDPtbGCKMfnaAvz5fnqeZy+wpypRC9M6vBccgU
 LG3i+5dkC13VfKGRlPie4+oUgvMSFKZEabhP102Q=
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org
Date: Tue, 21 Dec 2021 15:54:28 +0100
Message-Id: <20211221145428.43829-2-flaniel@linux.microsoft.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211221145428.43829-1-flaniel@linux.microsoft.com>
References: <20211221145428.43829-1-flaniel@linux.microsoft.com>
MIME-Version: 1.0
Subject: [Buildroot] [RFC PATCH v1 1/2] package/pahole: new host package
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
Cc: Francis Laniel <flaniel@linux.microsoft.com>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

pahole is a tool used to show data structure embedded in debugging information
formats like DWARF.
It is notably needed by the Linux kernel to generate BPF Type Format (BTF)
information used by Compile Once - Run Everywhere (CO-RE) BPF tools.

Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
---
 DEVELOPERS                    |  3 +++
 package/Config.in.host        |  1 +
 package/pahole/Config.in.host |  6 ++++++
 package/pahole/pahole.hash    |  2 ++
 package/pahole/pahole.mk      | 20 ++++++++++++++++++++
 5 files changed, 32 insertions(+)
 create mode 100644 package/pahole/Config.in.host
 create mode 100644 package/pahole/pahole.hash
 create mode 100644 package/pahole/pahole.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 64db6c51d0..70df957415 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -939,6 +939,9 @@ N:	Floris Bos <bos@je-eigen-domein.nl>
 F:	package/ipmitool/
 F:	package/odhcploc/
 
+N:	Francis Laniel <flaniel@linux.microsoft.com>
+F:	package/pahole/
+
 N:	Francisco Gonzalez <gzmorell@gmail.com>
 F:	package/ser2net/
 
diff --git a/package/Config.in.host b/package/Config.in.host
index 6e5a5c5fc5..ae512c5643 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -60,6 +60,7 @@ menu "Host utilities"
 	source "package/omap-u-boot-utils/Config.in.host"
 	source "package/openocd/Config.in.host"
 	source "package/opkg-utils/Config.in.host"
+	source "package/pahole/Config.in.host"
 	source "package/parted/Config.in.host"
 	source "package/patchelf/Config.in.host"
 	source "package/pigz/Config.in.host"
diff --git a/package/pahole/Config.in.host b/package/pahole/Config.in.host
new file mode 100644
index 0000000000..e427629632
--- /dev/null
+++ b/package/pahole/Config.in.host
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HOST_PAHOLE
+	bool "host pahole"
+	help
+	  Pahole and other DWARF utils.
+
+	  https://git.kernel.org/pub/scm/devel/pahole/pahole.git
diff --git a/package/pahole/pahole.hash b/package/pahole/pahole.hash
new file mode 100644
index 0000000000..2573fde8c9
--- /dev/null
+++ b/package/pahole/pahole.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 76b7eaf5747dbb7250a1a50185136d4639e0d70aa11c5d7c68139c0c8ca9be80 pahole-v1.22-br1.tar.gz
diff --git a/package/pahole/pahole.mk b/package/pahole/pahole.mk
new file mode 100644
index 0000000000..1f69f5391e
--- /dev/null
+++ b/package/pahole/pahole.mk
@@ -0,0 +1,20 @@
+########################################################################
+#
+# pahole
+#
+########################################################################
+
+PAHOLE_VERSION = v1.22
+PAHOLE_SITE = git://git.kernel.org/pub/scm/devel/pahole/pahole.git
+PAHOLE_SITE_METHOD = git
+# pahole contains git submodule and relies on them to be built.
+# We need to add this option to fetch the submodules before creating the
+# archive.
+PAHOLE_GIT_SUBMODULES = YES
+# Better to build it statically so we do not rely on the host having
+# corresponding libraries.
+HOST_PAHOLE_CONF_OPTS = -DBUILD_SHARED_LIBS=OFF -D__LIB=lib
+PAHOLE_LICENSE = GPL-2.0
+PAHOLE_LICENSE_FILES = COPYING
+
+$(eval $(host-cmake-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
