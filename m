Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66055CD4F5B
	for <buildroot@archiver.kernel.org>; Tue, 19 May 2026 18:20:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA5C060B64;
	Tue, 19 May 2026 18:20:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VtdtDp-0GeeG; Tue, 19 May 2026 18:20:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D191760B5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779214853;
	bh=oNBKJXYSTcQer5phKHwI1sPoP320GiH6B0fPLIFeXxI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QK0l8RjC43fQ/TTXe+V4ltxeIcJ+HlVOgJIQtpll7MoKXoV8Vk4CidOAh6Yjzjebm
	 Thzb+6FCeSMhQFsKnuE5+w4wq8sYqZsPDe9AvCc5a4NqQdEV5tBB/KcU7mVQvy2e8W
	 Z2rkePhYwo/ms3PBb9ivszcCN3BZuQTn0vsIraKu38L4EpMJwk/MjKaSAeTDgKuDrQ
	 2dTGmUY3hQK5Ph5geU21uMh7P/jOhjzovlYrKcYWXqbzL8b74YydOUlXVH03glm9Mc
	 5/sBYubefoNgLpCQA8rdRZ4KxF91RAsEf5rlLTJC2YADrB7jEqhKukx5URcx2QXTSE
	 RpTlBU66XJwUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D191760B5C;
	Tue, 19 May 2026 18:20:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 76D15265
 for <buildroot@buildroot.org>; Tue, 19 May 2026 18:20:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5BC3640D6D
 for <buildroot@buildroot.org>; Tue, 19 May 2026 18:20:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iRXWSakJ4cYE for <buildroot@buildroot.org>;
 Tue, 19 May 2026 18:20:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4B0F740D5D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B0F740D5D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4B0F740D5D
 for <buildroot@buildroot.org>; Tue, 19 May 2026 18:20:51 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0431.dip0.t-ipconnect.de [91.58.4.49])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 67135A4C0886;
 Tue, 19 May 2026 20:20:49 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53084)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wPP3h-0000000050H-0vm2;
 Tue, 19 May 2026 18:20:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 19 May 2026 20:20:49 +0200
Message-ID: <20260519182049.890882-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779214849;
 bh=rT3zpzBTWb6MSLIa45GEm0tvhUCcMZGfvpcjDBnnTJw=;
 h=From:To:Cc:Subject:Date:From;
 b=i73zgCrfgtnxw8s4BRdwrNe1zJboFpOfBEExtnNBLc6alEez7bUU9mR/KJy2vCCiO
 zQUugvsttfaZDm2EtS99yzDwVN6RSzVn2IhsUHP4GmxoS9EXXMUTniscyge5ipQ5+v
 0vSuAAX0kL2z8tCanheTCLS13V8JOzhFxEiE50aFBNb+TwomdDapJ5EX4fmOpbBXYD
 bd/yPVsatXEsWdYX8jv/BddeYn/+QQoBERTwt5ZcXQZr6qYNoybDO/lrhqtE+/hui/
 uMsP46dwyKWNgLI/ez0Vs07nwruPAXsTkiu4aWu6C5t1YvDVzO16IJ69xOqyq90XBb
 qNvXDfTcGbNvQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=i73zgCrf
Subject: [Buildroot] [PATCH 1/1] package/util-linux: security bump version
 to 2.42.1
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

https://www.kernel.org/pub/linux/utils/util-linux/v2.42/v2.42.1-ReleaseNotes

https://www.kernel.org/pub/linux/utils/util-linux/v2.42/v2.42-ReleaseNotes
"Security fixes:

 CVE-2026-27456 - mount(8) TOCTOU symlink attack via loop device.
   The SUID mount follows symlinks when resolving loop backing file
   paths. On systems where non-root users are permitted to mount loop
   devices (via 'user' option in fstab), this allows access to
   arbitrary files.

 CWE-190 - Integer overflow in libblkid parse_dos_extended().
   A crafted MBR disk image can cause uint32_t wraparound in EBR
   chain processing, causing reported partitions to not match the
   on-disk layout. Tools like udisks may then register a partition
   at logical sector 0."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/util-linux/util-linux.hash | 4 ++--
 package/util-linux/util-linux.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index 5a5656212c..631d0b5651 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,5 +1,5 @@
-# From https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.41/sha256sums.asc
-sha256  a8c213cc06048862602a42b2d299b340001f6d05c4407b549f3e03521df83688  util-linux-2.41.4.tar.xz
+# From https://www.kernel.org/pub/linux/utils/util-linux/v2.42/sha256sums.asc
+sha256  82e9158eb12a9b0b569d84e1687fed9dd18fe89ccd8ef5ac3427218a7c0d7f7f  util-linux-2.42.1.tar.xz
 # License files, locally calculated
 sha256  4c2db318192bda62f3f8fcf71488bb5e602ae4385eba281d711b46cc13a40bb3  README.licensing
 sha256  527f738966ca396cd5a68c1509390de2a780c6b614d9ee57f7544a6161938ed1  Documentation/licenses/COPYING.BSD-2-Clause
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index a7c5cea8bb..d540e75807 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -7,8 +7,8 @@
 # When making changes to this file, please check if
 # util-linux-libs/util-linux-libs.mk needs to be updated accordingly as well.
 
-UTIL_LINUX_VERSION_MAJOR = 2.41
-UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).4
+UTIL_LINUX_VERSION_MAJOR = 2.42
+UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).1
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
