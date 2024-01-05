Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C07EC3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 10:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD813421CB;
	Fri,  5 Jan 2024 10:56:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD813421CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ne28CBukE99v; Fri,  5 Jan 2024 10:56:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30941421A0;
	Fri,  5 Jan 2024 10:56:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30941421A0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8633A1BF997
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 10:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66DD54367D
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 10:55:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66DD54367D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7y3tfYwcZCD0 for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 10:55:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B036B4368E
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 10:55:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B036B4368E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 83447843B4; Fri,  5 Jan 2024 10:55:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 5 Jan 2024 11:41:59 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 14a8579cd0a6cf099d4ab12f2b097a7e2e15dbb5
X-Git-Newrev: ae514155a16a9f5c075d8623f47ae8b323f687e7
X-Patchwork-Hint: ignore
Message-Id: <20240105105526.83447843B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/libcurl: security
 bump to version 8.5.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=ae514155a16a9f5c075d8623f47ae8b323f687e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Fixes the following security issues:

- CVE-2023-46218: cookie mixed case PSL bypass

  This flaw allows a malicious HTTP server to set "super cookies" in curl
  that are then passed back to more origins than what is otherwise allowed
  or possible.  This allows a site to set cookies that then would get sent
  to different and unrelated sites and domains.

  https://curl.se/docs/CVE-2023-46218.html

- CVE-2023-46219: HSTS long file name clears contents

  When saving HSTS data to an excessively long file name, curl could end up
  removing all contents, making subsequent requests using that file unaware
  of the HSTS status they should otherwise use.

  https://curl.se/docs/CVE-2023-46219.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit aaa9438b96f88b1ecbf5eb9a1aebef8010835b8d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.hash | 4 ++--
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index ecd5d63909..d5c20d29d3 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://curl.se/download/curl-8.4.0.tar.xz.asc
+# https://curl.se/download/curl-8.5.0.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  16c62a9c4af0f703d28bda6d7bbf37ba47055ad3414d70dec63e2e6336f2a82d  curl-8.4.0.tar.xz
+sha256  42ab8db9e20d8290a3b633e7fbb3cec15db34df65fd1015ef8ac1e4723750eeb  curl-8.5.0.tar.xz
 sha256  b1d7feb949ea5023552029fbe0bf5db4f23c2f85e9b8e51e18536f0ecbf9c524  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 2c87821a48..3ecc587a52 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 8.4.0
+LIBCURL_VERSION = 8.5.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
