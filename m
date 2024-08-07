Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D5BDC3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 19:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C66B5809EC;
	Wed,  7 Aug 2024 19:41:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zMIt0G43X2yZ; Wed,  7 Aug 2024 19:41:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D190680AF0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D190680AF0;
	Wed,  7 Aug 2024 19:41:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3A9DF1BF2E3
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 19:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 273D0400FB
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 19:41:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ztmGiVKD1gP for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 19:41:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06BE6400D1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06BE6400D1
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 19:41:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6EE1F84554; Wed,  7 Aug 2024 19:41:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Aug 2024 21:40:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d84d9241c8e0e4cbe872d4e8bb86dcfa3781f974
X-Git-Newrev: 359b3228e24642ee9d7603af8f664b1832c5f98b
X-Patchwork-Hint: ignore
Message-Id: <20240807194121.6EE1F84554@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libjcat: fix linking,
 add missing intl library
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=359b3228e24642ee9d7603af8f664b1832c5f98b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For musl/uClibc-ng toolchains we need to explicitely link
libintl. The problem exist since the addition of the package
in commit e52605c092d8eaa926da8720ae498a38eddb5205.

Fixes:
 - http://autobuild.buildroot.net/results/58c/58c7ecbcfab96ebbc7a20291d4712cf64094b9f7/
 - http://autobuild.buildroot.net/results/5d7/5d7c5dea0213f5a24489c397c5703c0601b2f12d/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libjcat/libjcat.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libjcat/libjcat.mk b/package/libjcat/libjcat.mk
index e13e5dbfb7..c365c1914b 100644
--- a/package/libjcat/libjcat.mk
+++ b/package/libjcat/libjcat.mk
@@ -10,7 +10,9 @@ LIBJCAT_SOURCE = libjcat-$(LIBJCAT_VERSION).tar.xz
 LIBJCAT_LICENSE = LGPL-2.1+
 LIBJCAT_LICENSE_FILES = LICENSE
 LIBJCAT_INSTALL_STAGING = YES
-LIBJCAT_DEPENDENCIES = host-pkgconf json-glib libglib2
+LIBJCAT_DEPENDENCIES = host-pkgconf json-glib libglib2 $(TARGET_NLS_DEPENDENCIES)
+
+LIBJCAT_LDFLAGS = $(TARGET_NLS_LIBS)
 
 LIBJCAT_CONF_OPTS = \
 	-Dgtkdoc=false \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
