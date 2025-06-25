Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F5F4C7EE2A
	for <buildroot@archiver.kernel.org>; Wed, 25 Jun 2025 13:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2F4341DD9;
	Wed, 25 Jun 2025 13:56:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Et7xdxPIYIB3; Wed, 25 Jun 2025 13:56:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC37641D63
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC37641D63;
	Wed, 25 Jun 2025 13:56:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 57F8FEDF
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 13:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 499B040707
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 13:56:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E8gXd2Ug7VZ0 for <buildroot@buildroot.org>;
 Wed, 25 Jun 2025 13:56:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2DE74096A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2DE74096A
 for <buildroot@buildroot.org>; Wed, 25 Jun 2025 13:56:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 92A7E84354; Wed, 25 Jun 2025 13:56:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 25 Jun 2025 15:55:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e339bef04bd0bfcf70e75de9a097ba4e82785494
X-Git-Newrev: 17399baa7c857aadeb52b849ec5e9f32b4f4221d
X-Patchwork-Hint: ignore
Message-Id: <20250625135614.92A7E84354@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcurl: unbreak threads + c-ares
 conditional
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=17399baa7c857aadeb52b849ec5e9f32b4f4221d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 0fce7a9623 ("package/libcurl: fix build w/ threads + c-ares") added a
conditional for threads + c-ares, but ended up with a end-parenthesis too
many - so the condition is never true.  Fix that.

Reported-by: Tibault Damman <tibault.damman@basalte.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 5a3a668f06..e390c9d1bf 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -38,7 +38,7 @@ LIBCURL_IGNORE_CVES += CVE-2024-32928
 
 # threaded resolver cannot be used with c-ares
 # https://github.com/curl/curl/commit/d364f1347f05c53eea5d25a15b4ad8a62ecc85b8
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS)x$(BR2_PACKAGE_C_ARES)),yx)
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS)x$(BR2_PACKAGE_C_ARES),yx)
 LIBCURL_CONF_OPTS += --enable-threaded-resolver
 else
 LIBCURL_CONF_OPTS += --disable-threaded-resolver
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
