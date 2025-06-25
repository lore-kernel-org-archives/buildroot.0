Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A2EBC7EE2A
	for <buildroot@archiver.kernel.org>; Wed, 25 Jun 2025 17:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3012A41878;
	Wed, 25 Jun 2025 17:34:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4teCKMIY4WD5; Wed, 25 Jun 2025 17:34:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C80E40C7E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C80E40C7E;
	Wed, 25 Jun 2025 17:34:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 864C043F
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 17:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CAB540D4F
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 17:34:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fbfdf7SQUg_O for <buildroot@buildroot.org>;
 Wed, 25 Jun 2025 17:34:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8ACE40C75
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8ACE40C75
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 17:34:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 95F38844A4; Wed, 25 Jun 2025 17:34:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 25 Jun 2025 19:29:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2b5544ab7a5fbab27086525831d468d2200a46c0
X-Git-Newrev: 14d07d1914766314afb5d7f9fbdeae10bb459bde
X-Patchwork-Hint: ignore
Message-Id: <20250625173422.95F38844A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/edk2: add security fix for
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=14d07d1914766314afb5d7f9fbdeae10bb459bde
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a security fix from the upstream commit:
https://github.com/tianocore/edk2/commit/b3a2f7ff24e156e8c4d694fffff01e95a048c536

It fixes CVE-2024-38805:
https://www.cve.org/CVERecord?id=CVE-2024-38805
Note: at the time of this commit, this CVE is "reserved" by a CNA.
Details will come later.

See also the associated pull request:
https://github.com/tianocore/edk2/pull/11042

This commit also adds the corresponding _IGNORE_CVES entry.

Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...IScsiDxe-Fix-for-out-of-bound-memory-acce.patch | 75 ++++++++++++++++++++++
 boot/edk2/edk2.mk                                  |  3 +
 2 files changed, 78 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
