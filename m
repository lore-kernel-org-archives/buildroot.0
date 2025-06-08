Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A87C5AD49
	for <buildroot@archiver.kernel.org>; Sun,  8 Jun 2025 11:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8700D60EA6;
	Sun,  8 Jun 2025 11:30:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XRfwnqbOXuNW; Sun,  8 Jun 2025 11:30:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB1C660EC5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB1C660EC5;
	Sun,  8 Jun 2025 11:30:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 95B981F2
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 11:30:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 764AF408FA
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 11:30:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Q_HMxsS2vKR for <buildroot@buildroot.org>;
 Sun,  8 Jun 2025 11:30:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1DA1408B7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C1DA1408B7
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 11:30:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B086887936; Sun,  8 Jun 2025 11:30:27 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 8 Jun 2025 13:10:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 00f0fca15a696eafae688b58c0df220ef5a2e2dc
X-Git-Newrev: 0fce7a9623315cd58750df984b3b9d630eda1700
X-Patchwork-Hint: ignore
Message-Id: <20250608113027.B086887936@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcurl: fix build w/ threads +
 c-ares
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

commit: https://git.buildroot.net/buildroot/commit/?id=0fce7a9623315cd58750df984b3b9d630eda1700
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
