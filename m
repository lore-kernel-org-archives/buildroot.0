Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650A1C433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Dec 2021 17:49:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E619B4023D;
	Wed, 22 Dec 2021 17:49:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f2rlRfHeAk80; Wed, 22 Dec 2021 17:49:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFFA2402F6;
	Wed, 22 Dec 2021 17:49:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8E2A41BF27E
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 17:49:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 893318278F
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 17:49:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IepRvnLu81Zz for <buildroot@lists.busybox.net>;
 Wed, 22 Dec 2021 17:49:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76001826FF
 for <buildroot@buildroot.org>; Wed, 22 Dec 2021 17:49:25 +0000 (UTC)
Received: from machine.home (lfbn-lyo-1-1484-111.w86-207.abo.wanadoo.fr
 [86.207.51.111])
 by linux.microsoft.com (Postfix) with ESMTPSA id BE30620B717A;
 Wed, 22 Dec 2021 09:49:23 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com BE30620B717A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1640195364;
 bh=iLjh1RSaFNw+edZvpW8W7H7DV42GPmP6avp9mCEbVZs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=r0numt28G3yJHSEtX1P+Jh1vEuu+B1gcsAPQAXVudeLc9VFhztk53Vmf/IJKXkDhG
 oMpRWzu3mLOMcsi24EF2qMExTDIOWkH01lSmutQxVnFDA0vMPWe5/HmDE5Jl3TXftQ
 OfsCHxm1D5wWKm1feTmmdB6Hou1Rqyyj3GHykd9U=
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org
Date: Wed, 22 Dec 2021 18:49:04 +0100
Message-Id: <20211222174905.71902-2-flaniel@linux.microsoft.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211222174905.71902-1-flaniel@linux.microsoft.com>
References: <20211222174905.71902-1-flaniel@linux.microsoft.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/2] package/pahole: new host package
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

To be built, pahole needs __LIB to be set to lib at stated in its README.

Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
---
 DEVELOPERS                    |  3 +++
 package/Config.in.host        |  1 +
 package/pahole/Config.in.host |  6 ++++++
 package/pahole/pahole.hash    |  3 +++
 package/pahole/pahole.mk      | 18 ++++++++++++++++++
 5 files changed, 31 insertions(+)
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
index 0000000000..9ee2ef9429
--- /dev/null
+++ b/package/pahole/pahole.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 cde85af68b368f50a913be387f94f6b43612a04af6c92387b4dcabb712a668fe  pahole-v1.23-br1.tar.gz
+sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/pahole/pahole.mk b/package/pahole/pahole.mk
new file mode 100644
index 0000000000..26347cd8fd
--- /dev/null
+++ b/package/pahole/pahole.mk
@@ -0,0 +1,18 @@
+########################################################################
+#
+# pahole
+#
+########################################################################
+
+PAHOLE_VERSION = v1.23
+PAHOLE_SITE = git://git.kernel.org/pub/scm/devel/pahole/pahole.git
+PAHOLE_SITE_METHOD = git
+# pahole contains git submodule and relies on them to be built.
+PAHOLE_GIT_SUBMODULES = YES
+HOST_PAHOLE_DEPENDENCIES = host-elfutils
+# Defining __LIB is needed to build pahole.
+HOST_PAHOLE_CONF_OPTS = -D__LIB=lib
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
