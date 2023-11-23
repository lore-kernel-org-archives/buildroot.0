Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37026C5AD4C
	for <buildroot@archiver.kernel.org>; Thu, 23 Nov 2023 15:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE7596133C;
	Thu, 23 Nov 2023 15:31:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE7596133C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2H5uwoQ_Sood; Thu, 23 Nov 2023 15:31:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1819760C15;
	Thu, 23 Nov 2023 15:31:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1819760C15
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 455CD1BF410
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 15:31:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2862E41E11
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 15:31:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2862E41E11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WV42NybG_eVq for <buildroot@lists.busybox.net>;
 Thu, 23 Nov 2023 15:31:45 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6967D4190A
 for <buildroot@buildroot.org>; Thu, 23 Nov 2023 15:31:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6967D4190A
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-394-7qZRwYyBMjG6i6pdZpi0dg-1; Thu, 23 Nov 2023 10:31:42 -0500
X-MC-Unique: 7qZRwYyBMjG6i6pdZpi0dg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AFA56101A54C
 for <buildroot@buildroot.org>; Thu, 23 Nov 2023 15:31:42 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.208.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 13680492BFD;
 Thu, 23 Nov 2023 15:31:41 +0000 (UTC)
From: Anthony Harivel <aharivel@redhat.com>
To: buildroot@buildroot.org
Date: Thu, 23 Nov 2023 16:31:31 +0100
Message-ID: <20231123153131.1253841-1-aharivel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1700753504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2EMKz0pqUW0qlqtxKLVZ/aDS8NCfBz7G77TX/LbE78c=;
 b=c+33IFER/eYSdvyGZOEn+x2cQOqdsJXL27weGUootgLuhZKYDogv87PHjkSm2wmj9ub/Mv
 lKm6zDq70LJDAuU1DiXf40+uz3Q4nC4NBWjDSB9MdbwQZ1TWtgw6/yfWQ73iNd4lCMxDwg
 9pIZiMgv1KmWY/bIIScTxUhZGRvPqKM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=c+33IFER
Subject: [Buildroot] [PATCH 1/1] package/util-linux: add an option to enable
 lscpu
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
Cc: Anthony Harivel <aharivel@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

lscpu displays information about CPU architecture and needs to be
explicitly enable for compilation.

Signed-off-by: Anthony Harivel <aharivel@redhat.com>
---
 package/util-linux/Config.in     | 9 ++++++++-
 package/util-linux/util-linux.mk | 1 +
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
index be87494b35cf..3eb1b2e1c9a3 100644
--- a/package/util-linux/Config.in
+++ b/package/util-linux/Config.in
@@ -58,7 +58,7 @@ config BR2_PACKAGE_UTIL_LINUX_BINARIES
 	  blkdiscard, blkid, blockdev, chcpu, choom, col, colcrt, colrm,
 	  column, ctrlaltdel, dmesg, fdisk, fincore, findfs, findmnt,
 	  flock, fsfreeze, fstrim, getopt, hexdump, ipcmk, isosize,
-	  ldattach, look, lsblk, lscpu, lsipc, lslocks, lsns, mcookie,
+	  ldattach, look, lsblk, lsipc, lslocks, lsns, mcookie,
 	  mkfs, mkswap, namei, prlimit, readprofile, renice, rev,
 	  rtcwake, script, scriptlive, scriptreplay, setarch, setsid,
 	  sfdisk, swaplabel, swapoff, swapon, uuidgen, uuidparse,
@@ -211,6 +211,13 @@ config BR2_PACKAGE_UTIL_LINUX_LOSETUP
 	help
 	  Set up and control loop devices
 
+config BR2_PACKAGE_UTIL_LINUX_LSCPU
+	bool "lscpu"
+	depends on BR2_USE_MMU # libsmartcols
+	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
+	help
+	  Display information about the CPU architecture
+
 config BR2_PACKAGE_UTIL_LINUX_LSFD
 	bool "lsfd"
 	depends on BR2_USE_MMU # libsmartcols
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 72126adb005f..3546c07337e0 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -161,6 +161,7 @@ UTIL_LINUX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LOGGER),--enable-logger,--disable-logger) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LOGIN),--enable-login,--disable-login) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LOSETUP),--enable-losetup,--disable-losetup) \
+	$(if $(BR2_PACKAGE_UTIL_LINUX_LSCPU),--enable-lscpu,--disable-lscpu) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LSFD),--enable-lsfd,--disable-lsfd) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LSLOGINS),--enable-lslogins,--disable-lslogins) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX_LSMEM),--enable-lsmem,--disable-lsmem) \
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
