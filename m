Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939A8C7115B
	for <buildroot@archiver.kernel.org>; Mon, 23 Jun 2025 17:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5147B80CF7;
	Mon, 23 Jun 2025 17:37:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qHF0SgYM1poH; Mon, 23 Jun 2025 17:37:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5370980CDF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5370980CDF;
	Mon, 23 Jun 2025 17:37:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 116C5767
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 17:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC253403CA
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 17:37:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HTMdmZ0_JQKy for <buildroot@buildroot.org>;
 Mon, 23 Jun 2025 17:37:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6213440050
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6213440050
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6213440050
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 17:37:53 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:656e:cf44:475c:a8d2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 52C2DB00565;
 Mon, 23 Jun 2025 19:37:46 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Romain Naour <romain.naour@smile.fr>, Julien Olivain <ju.o@free.fr>
Date: Mon, 23 Jun 2025 19:37:32 +0200
Message-ID: <20250623173733.16049-1-ju.o@free.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750700271;
 bh=7k7/kE65qa6QznBRiaTyfNsAg4f+jD6HV0MWObftKQE=;
 h=From:To:Cc:Subject:Date:From;
 b=t0MmE3kurFSu/zj9feq9nx2XA3lSb9bKuWr/QN1DheIMwHwZbbJnl4VmdjBXpKInB
 7hG+nGZAuyHMfXWQ1V0pgMsQkxUaMzy2ntEZNIE78cd0ZXe3t9/5DdVeyEOkOUfMhM
 QRe8ouZ9Ip+df93ydUmfy5OkJXq3WW8IO5HthKLp6yyv7+RlNGmkaJQ5HP4qQILw4p
 GD3B8O3rwbnkauUHLDhoieDZhllYdj9WGmf/y14CHNE4v639jgysfBJxho3/iLs9zy
 x2s8d0kveVLAJ1/p0qQcZdizjEKIWGKLbG2tGE9Oq1fWL9cVGbPjd/jhzj0w+s7Odw
 oZvB0Toh36Oyg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=t0MmE3ku
Subject: [Buildroot] [PATCH 1/2] boot/edk2: add security fix for
 CVE-2024-38805
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit adds a security fix from the upstream commit:
https://github.com/tianocore/edk2/commit/b3a2f7ff24e156e8c4d694fffff01e95a048c536

It fixes CVE-2024-38805:
https://www.cve.org/CVERecord?id=CVE-2024-38805
Note: at the time of this commit, this CVE is "reserved" by a CNA.
Details will come later.

See also the associated pull request:
https://github.com/tianocore/edk2/pull/11042

This commit also adds the corresponding _IGNORE_CVES entry.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
For convenience, I also published those patches here:
https://gitlab.com/jolivain/buildroot/-/commits/edk2-stable202505_bump
The Buildroot mailing list may change EDK2 patch DOS newlines which
makes patches not applying with patchwork.
---
 ...Dxe-Fix-for-out-of-bound-memory-acce.patch | 75 +++++++++++++++++++
 boot/edk2/edk2.mk                             |  3 +
 2 files changed, 78 insertions(+)
 create mode 100644 boot/edk2/0001-NetworkPkg-IScsiDxe-Fix-for-out-of-bound-memory-acce.patch

diff --git a/boot/edk2/0001-NetworkPkg-IScsiDxe-Fix-for-out-of-bound-memory-acce.patch b/boot/edk2/0001-NetworkPkg-IScsiDxe-Fix-for-out-of-bound-memory-acce.patch
new file mode 100644
index 0000000000..4cc66eb0fe
--- /dev/null
+++ b/boot/edk2/0001-NetworkPkg-IScsiDxe-Fix-for-out-of-bound-memory-acce.patch
@@ -0,0 +1,75 @@
+From 0a3b2a29b96b11fb858974044359c806c6b0a111 Mon Sep 17 00:00:00 2001
+From: Santhosh Kumar V <santhoshkumarv@ami.com>
+Date: Wed, 7 May 2025 18:53:30 +0530
+Subject: [PATCH] NetworkPkg/IScsiDxe:Fix for out of bound memory access for
+ bz4207 (CVE-2024-38805)
+
+In IScsiBuildKeyValueList, check if we have any data left (Len > 0) before advancing the Data pointer and reducing Len.
+Avoids wrapping Len. Also Used SafeUint32SubSafeUint32Sub call to reduce the Len .
+
+Upstream: https://github.com/tianocore/edk2/commit/b3a2f7ff24e156e8c4d694fffff01e95a048c536
+Signed-off-by: santhosh kumar V <santhoshkumarv@ami.com>
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ NetworkPkg/IScsiDxe/IScsiProto.c | 29 ++++++++++++++++++++++++-----
+ 1 file changed, 24 insertions(+), 5 deletions(-)
+
+diff --git a/NetworkPkg/IScsiDxe/IScsiProto.c b/NetworkPkg/IScsiDxe/IScsiProto.c
+index ef587649a0..53a0ff801d 100644
+--- a/NetworkPkg/IScsiDxe/IScsiProto.c
++++ b/NetworkPkg/IScsiDxe/IScsiProto.c
+@@ -1880,6 +1880,8 @@ IScsiBuildKeyValueList (
+ {
+   LIST_ENTRY            *ListHead;
+   ISCSI_KEY_VALUE_PAIR  *KeyValuePair;
++  EFI_STATUS            Status;
++  UINT32                Result;
+ 
+   ListHead = AllocatePool (sizeof (LIST_ENTRY));
+   if (ListHead == NULL) {
+@@ -1903,9 +1905,14 @@ IScsiBuildKeyValueList (
+       Data++;
+     }
+ 
+-    if (*Data == '=') {
++    // Here Len must not be zero.
++    // The value of Len is size of data buffer. Actually, Data is make up of strings.
++    // AuthMethod=None\0TargetAlias=LIO Target\0 TargetPortalGroupTag=1\0
++    // (1) Len == 0, *Data != '=' goto ON_ERROR
++    // (2) *Data == '=', Len != 0 normal case.
++    // (3) *Data == '=', Len == 0, Between Data and Len are mismatch, Len isn't all size of data, as error.
++    if ((Len > 0) && (*Data == '=')) {
+       *Data = '\0';
+-
+       Data++;
+       Len--;
+     } else {
+@@ -1915,10 +1922,22 @@ IScsiBuildKeyValueList (
+ 
+     KeyValuePair->Value = Data;
+ 
+-    InsertTailList (ListHead, &KeyValuePair->List);
++    Status = SafeUint32Add ((UINT32)AsciiStrLen (KeyValuePair->Value), 1, &Result);
++    if (EFI_ERROR (Status)) {
++      DEBUG ((DEBUG_ERROR, "%a Memory Overflow is Detected.\n", __func__));
++      FreePool (KeyValuePair);
++      goto ON_ERROR;
++    }
+ 
+-    Data += AsciiStrLen (KeyValuePair->Value) + 1;
+-    Len  -= (UINT32)AsciiStrLen (KeyValuePair->Value) + 1;
++    Status = SafeUint32Sub (Len, Result, &Len);
++    if (EFI_ERROR (Status)) {
++      DEBUG ((DEBUG_ERROR, "%a Out of bound memory access Detected.\n", __func__));
++      FreePool (KeyValuePair);
++      goto ON_ERROR;
++    }
++
++    InsertTailList (ListHead, &KeyValuePair->List);
++    Data += Result;
+   }
+ 
+   return ListHead;
+-- 
+2.49.0
+
diff --git a/boot/edk2/edk2.mk b/boot/edk2/edk2.mk
index bc4049b2de..ad88835f8f 100644
--- a/boot/edk2/edk2.mk
+++ b/boot/edk2/edk2.mk
@@ -14,6 +14,9 @@ EDK2_DEPENDENCIES = edk2-platforms host-python3 host-acpica host-util-linux
 EDK2_INSTALL_TARGET = NO
 EDK2_INSTALL_IMAGES = YES
 
+# 0001-NetworkPkg-IScsiDxe-Fix-for-out-of-bound-memory-acce.patch
+EDK2_IGNORE_CVES += CVE-2024-38805
+
 ifeq ($(BR2_ENABLE_DEBUG),y)
 EDK2_BUILD_TYPE = DEBUG
 ifeq ($(BR2_TARGET_EDK2_OVMF_DEBUG_ON_SERIAL),y)
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
