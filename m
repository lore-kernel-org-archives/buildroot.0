Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C94C61CE8
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 20:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C19DF40785;
	Thu, 12 Jun 2025 20:31:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k0mFMVLTWik3; Thu, 12 Jun 2025 20:31:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE80B40770
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE80B40770;
	Thu, 12 Jun 2025 20:31:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C44DE1E0
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C1C9081E16
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:31:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9g5yJLKCAfYL for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 20:31:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B9CF80BC2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B9CF80BC2
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:31:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F08B4835DC; Thu, 12 Jun 2025 20:31:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Jun 2025 22:11:29 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 105442445d9ec58c2d3dc769a4a53729bd57bd3a
X-Git-Newrev: d4c080b56df5dfd34b148f9719eed02cc649a852
X-Patchwork-Hint: ignore
Message-Id: <20250612203114.F08B4835DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libcurl: fix
 build w/ threads + c-ares
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

commit: https://git.buildroot.net/buildroot/commit/?id=d4c080b56df5dfd34b148f9719eed02cc649a852
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Fixes:
https://autobuild.buildroot.net/results/680b825b93989e6aef247593c198094a6ed916f7/

Since curl 8.14.0 with commit d364f1347f05 ("configure: catch asking for
double resolver without https-rr"), configure errors out when
--enabled-threaded-resolver is used together with --enable-ares (unless the
experimental HTTPS-RR support is enabled), so disable the threaded resolver
when c-ares is enabled.

https://github.com/curl/curl/commit/d364f1347f05c53eea5d25a15b4ad8a62ecc85b8

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 0fce7a9623315cd58750df984b3b9d630eda1700)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libcurl/libcurl.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 8501910ac5..5a3a668f06 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -36,7 +36,9 @@ LIBCURL_CONF_OPTS = \
 # https://nvd.nist.gov/vuln/detail/CVE-2024-32928
 LIBCURL_IGNORE_CVES += CVE-2024-32928
 
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+# threaded resolver cannot be used with c-ares
+# https://github.com/curl/curl/commit/d364f1347f05c53eea5d25a15b4ad8a62ecc85b8
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS)x$(BR2_PACKAGE_C_ARES)),yx)
 LIBCURL_CONF_OPTS += --enable-threaded-resolver
 else
 LIBCURL_CONF_OPTS += --disable-threaded-resolver
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
