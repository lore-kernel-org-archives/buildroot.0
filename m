Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499BDCA1000
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 06:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D177D4120A;
	Mon,  1 Sep 2025 06:07:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bYXxp8WRVmdU; Mon,  1 Sep 2025 06:07:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AEE741167
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AEE741167;
	Mon,  1 Sep 2025 06:07:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A3D8210E
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 06:07:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0FC6607D8
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 06:07:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NfqMHLVgNDmH for <buildroot@buildroot.org>;
 Mon,  1 Sep 2025 06:07:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 653E6607A9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 653E6607A9
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 06:07:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5E35D86896; Mon,  1 Sep 2025 06:07:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 31 Aug 2025 18:15:11 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b4d919a0cde17b3a6fdbe8dce00e142bc891ff3c
X-Git-Newrev: 7bb7c0a231ab9aff6f5802fff21e60afd1d8dd93
X-Patchwork-Hint: ignore
Message-Id: <20250901060700.5E35D86896@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/quickjs: add
 patch for CVE-2025-46688
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7bb7c0a231ab9aff6f5802fff21e60afd1d8dd93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Fix the following vulnerability:

- CVE-2025-46688

    quickjs-ng through 0.9.0 has an incorrect size calculation in
    JS_ReadBigInt for a BigInt, leading to a heap-based buffer overflow.
    QuickJS before 2025-04-26 is also affected.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-46688
  - https://github.com/bellard/quickjs/commit/1eb05e44fad89daafa8ee3eb74b8520b4a37ec9a

The patch is different from upstream since the BigInt implementation has
been added post 2024-01-13 (see commit [1]). The BigInt fix has been
stripped out to only keep the buffer overflow in the string
implementation.

On master the following CVE has been addressed with commit [2].

[1] https://github.com/bellard/quickjs/commit/61e8b9442840bf94a2a9b0b872c8b3a197c1eac3
[2] c5c7c44fa5 package/quickjs: bump to version 2025-04-26

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...verflow-in-bjson-string-and-bigint-reader.patch | 29 ++++++++++++++++++++++
 package/quickjs/quickjs.mk                         |  3 +++
 2 files changed, 32 insertions(+)

diff --git a/package/quickjs/0001-fixed-buffer-overflow-in-bjson-string-and-bigint-reader.patch b/package/quickjs/0001-fixed-buffer-overflow-in-bjson-string-and-bigint-reader.patch
new file mode 100644
index 0000000000..ae4d8cf43e
--- /dev/null
+++ b/package/quickjs/0001-fixed-buffer-overflow-in-bjson-string-and-bigint-reader.patch
@@ -0,0 +1,29 @@
+From 1eb05e44fad89daafa8ee3eb74b8520b4a37ec9a Mon Sep 17 00:00:00 2001
+From: Fabrice Bellard <fabrice@bellard.org>
+Date: Mon, 7 Apr 2025 18:40:49 +0200
+Subject: [PATCH] fixed buffer overflow in BJSON String and BigInt reader
+ (#399)
+
+Upstream: https://github.com/bellard/quickjs/commit/1eb05e44fad89daafa8ee3eb74b8520b4a37ec9a
+CVE: CVE-2025-46688
+[thomas: backport JS_ReadBigInt function not present in 2024-01-13]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ quickjs.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/quickjs.c b/quickjs.c
+index 9be262e50..b2470ba64 100644
+--- a/quickjs.c
++++ b/quickjs.c
+@@ -35652,6 +35652,10 @@ static JSString *JS_ReadString(BCReaderState *s)
+         return NULL;
+     is_wide_char = len & 1;
+     len >>= 1;
++    if (len > JS_STRING_LEN_MAX) {
++        JS_ThrowInternalError(s->ctx, "string too long");
++        return NULL;
++    }
+     p = js_alloc_string(s->ctx, len, is_wide_char);
+     if (!p) {
+         s->error_state = -1;
diff --git a/package/quickjs/quickjs.mk b/package/quickjs/quickjs.mk
index 2bd9da1392..215deb8137 100644
--- a/package/quickjs/quickjs.mk
+++ b/package/quickjs/quickjs.mk
@@ -12,6 +12,9 @@ QUICKJS_LICENSE_FILES = LICENSE
 QUICKJS_CPE_ID_VALID = YES
 QUICKJS_INSTALL_STAGING = YES
 
+# 0001-fixed-buffer-overflow-in-bjson-string-and-bigint-reader.patch
+QUICKJS_IGNORE_CVES += CVE-2025-46688
+
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 QUICKJS_EXTRA_LIBS += -latomic
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
