Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCC0FC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:46:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84E7960231
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:46:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 84E7960231
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63343405B1;
	Tue,  3 Aug 2021 21:46:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mNikgbGvrimt; Tue,  3 Aug 2021 21:46:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95EC94059D;
	Tue,  3 Aug 2021 21:46:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 16CAC1BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A543F608B1
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IIretbztyIoR for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E46666063A
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3AB6D85F62; Tue,  3 Aug 2021 21:09:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 11 Jun 2021 14:11:14 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d495593de17e04ed36094fa899f0710dfbbc9f01
X-Git-Newrev: d94c42b93e3f8daddcf80b9be2b7b51fe456337b
X-Patchwork-Hint: ignore
Message-Id: <20210803210949.3AB6D85F62@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/squid: security bump
 to version 4.15
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

commit: https://git.buildroot.net/buildroot/commit/?id=d94c42b93e3f8daddcf80b9be2b7b51fe456337b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes the following security issues:

- CVE-2021-28651: Denial of Service in URN processing
  Due to a buffer management bug Squid is vulnerable to a Denial of service
  attack against the server it is operating on.

  This attack is limited to proxies which attempt to resolve a "urn:"
  resource identifier.  Support for this resolving is enabled by default in
  all Squid.

  https://github.com/squid-cache/squid/security/advisories/GHSA-ch36-9jhx-phm4

- CVE-2021-28652: Denial of Service issue in Cache Manager
  Due to an incorrect parser validation bug Squid is vulnerable to a Denial
  of Service attack against the Cache Manager API.

  https://github.com/squid-cache/squid/security/advisories/GHSA-m47m-9hvw-7447

- CVE-2021-28662: Denial of Service in HTTP Response Processing
  Due to an input validation bug Squid is vulnerable to a Denial of Service
  against all clients using the proxy.

  https://github.com/squid-cache/squid/security/advisories/GHSA-jjq6-mh2h-g39h

- CVE-2021-31806, CVE-2021-31807, CVE-2021-31808: Multiple Issues in HTTP
  Range header
  Due to an incorrect input validation bug Squid is vulnerable to
  a Denial of Service attack against all clients using the proxy.

  https://github.com/squid-cache/squid/security/advisories/GHSA-pxwq-f3qr-w2xf

- CVE-2021-33620: Denial of Service in HTTP Response processing
  Due to an input validation bug Squid is vulnerable to a Denial of Service
  against all clients using the proxy.

  https://github.com/squid-cache/squid/security/advisories/GHSA-572g-rvwr-6c7f

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/squid/squid.hash | 8 ++++----
 package/squid/squid.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index a2aaba5fd5..12a9e5d293 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,6 +1,6 @@
-# From http://www.squid-cache.org/Versions/v4/squid-4.14.tar.xz.asc
-md5  7d9ba82703cd770b2ede169a0c1de94a  squid-4.14.tar.xz
-sha1  71ae13a845a6a7ffc69ce11086ea3e427625bc08  squid-4.14.tar.xz
+# From http://www.squid-cache.org/Versions/v4/squid-4.15.tar.xz.asc
+md5  a593de9dc888dfeca4f1f7db2cd7d3b9  squid-4.15.tar.xz
+sha1  60bda34ba39657e2d870c8c1d2acece8a69c3075  squid-4.15.tar.xz
 # Locally calculated
-sha256  f1097daa6434897c159bc100978b51347c0339041610845d0afa128151729ffc  squid-4.14.tar.xz
+sha256  b693a4e5ab2811a8a854f60de0a62afbbf3a952bb1d047952c9ae01321f84a25  squid-4.15.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 7e6865f8ed..b23a8d26ed 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQUID_VERSION = 4.14
+SQUID_VERSION = 4.15
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
 SQUID_SITE = http://www.squid-cache.org/Versions/v4
 SQUID_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
