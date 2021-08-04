Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38382C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:51:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF28A603E7
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:51:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EF28A603E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B919740627;
	Thu,  5 Aug 2021 19:51:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xcgqmwOMi9jx; Thu,  5 Aug 2021 19:51:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11DB9405F6;
	Thu,  5 Aug 2021 19:51:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0F21F1BF361
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D95A83BA3
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:49:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MAefpDb7yDBf for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 19:49:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 604E083B62
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 19:49:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 1CD2A87DA7; Thu,  5 Aug 2021 19:49:39 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 16:28:50 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8dfd7a1f903d86584e7942ead1ad79e0185a3391
X-Git-Newrev: 8d56423d3d2308c620e61a952e36999c89e4d682
X-Patchwork-Hint: ignore
Message-Id: <20210805194939.1CD2A87DA7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/zstd: observe
 Buildroot optimisation flags
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=8d56423d3d2308c620e61a952e36999c89e4d682
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Use Buildroot's setting for optimization, zstd's build system
overrides CFLAGS (adds -O3), but MOREFLAGS can override again.
Quick tests show that using -O2 (like buildroot)
is actually a little faster than -O3 on x86_64 Atoms.

Disable the legacy format, these are just needed for
decompressing files created with pre-release version.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/zstd/zstd.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index a0976b0701..5a96c11309 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -12,6 +12,7 @@ ZSTD_LICENSE_FILES = LICENSE COPYING
 ZSTD_CPE_ID_VENDOR = facebook
 ZSTD_CPE_ID_PRODUCT = zstandard
 
+ZSTD_OPTS += ZSTD_LEGACY_SUPPORT=0
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 ZSTD_DEPENDENCIES += zlib
 ZSTD_OPTS += HAVE_ZLIB=1
@@ -33,6 +34,9 @@ else
 ZSTD_OPTS += HAVE_LZ4=0
 endif
 
+# zstd will append -O3 after $(CFLAGS), use MOREFLAGS to override again
+ZSTD_OPTS += MOREFLAGS="$(TARGET_OPTIMIZATION)"
+
 ifeq ($(BR2_STATIC_LIBS),y)
 ZSTD_BUILD_LIBS = libzstd.a
 ZSTD_INSTALL_LIBS = install-static
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
