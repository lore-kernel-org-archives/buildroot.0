Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73FC5C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 14:00:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 119AB822DB;
	Sat,  4 Nov 2023 14:00:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 119AB822DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kAAD52gdtpkN; Sat,  4 Nov 2023 14:00:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F3F8822C7;
	Sat,  4 Nov 2023 14:00:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F3F8822C7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C4F381BF30C
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 14:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9ED0760F31
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 14:00:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9ED0760F31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7iZYjCHObR9T for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 14:00:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C363960E03
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 14:00:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C363960E03
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A8A5E86331; Sat,  4 Nov 2023 14:00:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 14:56:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e1ca2601cab69052c0f49936b403b57586953280
X-Git-Newrev: e60fde3451236545c7ffc39d4885106507121730
X-Patchwork-Hint: ignore
Message-Id: <20231104140039.A8A5E86331@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ethtool: switch to git snapshot
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e60fde3451236545c7ffc39d4885106507121730
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream tarball does not include several header files leading to build
errors with older kernels. For details see:
https://patchwork.kernel.org/project/netdevbpf/patch/20231005163053.1800218-1-florian.fainelli@broadcom.com/

Switch _SITE to git snapshot and add _AUTORECONF = YES which needs
host-pkgconf to fix subsequent configure error:

./configure: line 4723: PKG_PROG_PKG_CONFIG: command not found

./configure: line 5055: syntax error near unexpected token `MNL,'
./configure: line 5055: `    PKG_CHECK_MODULES(MNL, libmnl)'

Fixes:
http://autobuild.buildroot.net/results/69e/69e01b7f370920630d132fc43a40104fa5b3959f/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ethtool/ethtool.hash | 3 +--
 package/ethtool/ethtool.mk   | 7 +++++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/ethtool/ethtool.hash b/package/ethtool/ethtool.hash
index 8d2bf58420..812e4dd8d1 100644
--- a/package/ethtool/ethtool.hash
+++ b/package/ethtool/ethtool.hash
@@ -1,5 +1,4 @@
-# From https://www.kernel.org/pub/software/network/ethtool/sha256sums.asc
-sha256  814171ea4b8026b081c0741dbbf32e6968311483ecf64711232faec2ac70a14c  ethtool-6.5.tar.xz
 # Locally calculated
+sha256  b1f5fa66f71c3bab9daeacbd77e010b52c47df0a711b216847f78405f3299189  ethtool-6.5.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  5d632934396f90c82dfebe3c9512648bbb6333b406113d0cd331b0e0aa2d34a1  LICENSE
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index 94d14b123b..ee710e0021 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -5,8 +5,11 @@
 ################################################################################
 
 ETHTOOL_VERSION = 6.5
-ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
-ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
+ETHTOOL_SITE = https://git.kernel.org/pub/scm/network/ethtool/ethtool.git/snapshot
+# needed only for autoreconf
+ETHTOOL_DEPENDENCIES = host-pkgconf
+# GIT version, shipped without configure
+ETHTOOL_AUTORECONF = YES
 ETHTOOL_LICENSE = GPL-2.0
 ETHTOOL_LICENSE_FILES = LICENSE COPYING
 ETHTOOL_CPE_ID_VENDOR = kernel
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
