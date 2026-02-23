Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C64EC1136
	for <buildroot@archiver.kernel.org>; Mon, 23 Feb 2026 20:47:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 178FD60B1E;
	Mon, 23 Feb 2026 20:47:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hL53-Gg_c5ZU; Mon, 23 Feb 2026 20:47:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1B2260AD7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771879676;
	bh=QhEMsA4/kUeLy+1zhUvr1vGwmpOqLSNoa6VkZmOnPy4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LzcDjUGQXgrYGdC8NsqawKTia6W0lF90G1yzxIHzQJpjLN2IKoxvl6tAHArcNubxc
	 F51Ewwf5S3KQ/VSXJUdQ5v1gyrOVWxjyEHi/pr5MLvOAYKOoLaun8JpE82ij6mfGSU
	 VrSOjk75Js3QFa7M57KAZ2tL8G9P6rwJk2UokStcB7bFDIYCmARohVKO/sr3UsLlRg
	 OhPlPd2kI2JQAKR7jddm5HWPKA8edJg0xtCBi998HxiZ9WXgh/e6V98FuSjIkKw2/P
	 1Gb2SEzOvJ8t4NnUl3QVuysaDk2zT579jOGBGAY2sFa6b7e93MbqPVYZnIDAHx455w
	 N3FTH4+nBXkvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1B2260AD7;
	Mon, 23 Feb 2026 20:47:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C7E9237
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 20:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41EEE838DB
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 20:47:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XJEC9W7LLT12 for <buildroot@buildroot.org>;
 Mon, 23 Feb 2026 20:47:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80A6D80EDB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80A6D80EDB
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 20:47:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6E05887142; Mon, 23 Feb 2026 20:47:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 23 Feb 2026 21:44:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d27aad788d679d2a828a6bd2cb97854462201c4c
X-Git-Newrev: 421b5545f8110faf2de9b2165956d9d897f483fe
X-Patchwork-Hint: ignore
Message-Id: <20260223204753.6E05887142@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/snort: Fix build with gcc-15.x
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/421b5545f8110faf2de9b2165956d9d897f483fe
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes:
https://autobuild.buildroot.net/results/3b9/3b92d275a32721bd2cbb10e15c392054dfd42c63/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/snort/0009-gcc-15-fix.patch | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/snort/0009-gcc-15-fix.patch b/package/snort/0009-gcc-15-fix.patch
new file mode 100644
index 0000000000..227ad5ffc5
--- /dev/null
+++ b/package/snort/0009-gcc-15-fix.patch
@@ -0,0 +1,36 @@
+Fix build with gcc-15.x
+
+Adapted from: https://lists.openembedded.org/g/openembedded-devel/topic/meta_oe_patch_2_8_snort/112466576
+
+Upstream-Status: Backport [resolved in snort3 https://github.com/snort3/snort3/commit/c3cc27355ac302bd24ee3e9d613166898ec2be64]
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+
+Downloaded from
+https://gitweb.gentoo.org/repo/gentoo.git/tree/net-analyzer/snort/files/snort-2.9.20-gcc-15-fix.patch?id=410cb3ac09ab3d55e96876634c4d58005d9ead89
+
+Upstream: https://github.com/snort3/snort3/commit/c3cc27355ac302bd24ee3e9d613166898ec2be64
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+--- a/src/dynamic-preprocessors/dcerpc2/spp_dce2.c
++++ b/src/dynamic-preprocessors/dcerpc2/spp_dce2.c
+@@ -160,7 +160,7 @@ static void DCE2_ReloadSwapFree(void *);
+ static void DCE2_AddPortsToPaf(struct _SnortConfig *, DCE2_Config *, tSfPolicyId);
+ static void DCE2_ScAddPortsToPaf(struct _SnortConfig *, void *);
+ static uint32_t max(uint32_t a, uint32_t b);
+-static uint32_t DCE2_GetReloadSafeMemcap();
++static uint32_t DCE2_GetReloadSafeMemcap(tSfPolicyUserContextId pConfig);
+ 
+ static bool dce2_file_cache_is_enabled = false;
+ static bool dce2_file_cache_was_enabled = false;
+--- a/src/preprocessors/HttpInspect/include/file_decomp_PDF.h
++++ b/src/preprocessors/HttpInspect/include/file_decomp_PDF.h
+@@ -80,6 +80,6 @@ fd_status_t File_Decomp_Init_PDF( fd_session_p_t SessionPtr );
+ 
+ fd_status_t File_Decomp_End_PDF( fd_session_p_t SessionPtr );
+ 
+-fd_status_t File_Decomp_PDF();
++fd_status_t File_Decomp_PDF( fd_session_p_t SessionPtr );
+ 
+ #endif /* FILE_DECOMP_PDF_H */
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
