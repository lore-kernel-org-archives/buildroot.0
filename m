Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C21E77374
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 14:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FEB9820DF;
	Sat, 30 Sep 2023 14:15:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FEB9820DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vwQdC8o7Lz4z; Sat, 30 Sep 2023 14:15:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FC8B82075;
	Sat, 30 Sep 2023 14:15:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FC8B82075
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 39B881BF2A3
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 14:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10DD141584
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 14:15:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10DD141584
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SO5UmXyQIfCh for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 14:15:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2764414A1
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 14:15:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2764414A1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BBAC383A35; Sat, 30 Sep 2023 14:15:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 16:14:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 27fd001ce4054e367b371d910ca947e84fcfb7bf
X-Git-Newrev: 8510ff720072caa6e598572fa21cff10aff49046
X-Patchwork-Hint: ignore
Message-Id: <20230930141505.BBAC383A35@busybox.osuosl.org>
Subject: [Buildroot] [git commit] uacme: fix static builds with
 BR2_PACKAGE_MBEDTLS_COMPRESSION
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

commit: https://git.buildroot.net/buildroot/commit/?id=8510ff720072caa6e598572fa21cff10aff49046
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/2083eca8030e3f7ed8df388a7c29bc5d672b9512/

Uacme hardcodes the mbedtls linker flags / mbedtls does not provide a .pc
file, so we need to manually also link with zlib if mbedtls is built with
compression support.

Signed-off-by: Nicola Di Lieto <nicola.dilieto@gmail.com>
[Peter: Extend commit message]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uacme/uacme.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/uacme/uacme.mk b/package/uacme/uacme.mk
index 9b2360937b..b260bd85ee 100644
--- a/package/uacme/uacme.mk
+++ b/package/uacme/uacme.mk
@@ -13,12 +13,15 @@ UACME_LICENSE = GPL-3.0+
 UACME_LICENSE_FILES = COPYING
 UACME_DEPENDENCIES = libcurl
 
-UACME_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
+UACME_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99' LIBS="$(UACME_LIBS)"
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 UACME_CONF_OPTS += --with-gnutls
 UACME_DEPENDENCIES += gnutls
 else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
+ifeq ($(BR2_PACKAGE_MBEDTLS_COMPRESSION),y)
+    UACME_LIBS += -lz
+endif
 UACME_CONF_OPTS += --with-mbedtls
 UACME_DEPENDENCIES += mbedtls
 else ifeq ($(BR2_PACKAGE_OPENSSL),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
