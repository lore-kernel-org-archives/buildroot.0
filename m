Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD4DAC3DA7D
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 09:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 570A140573;
	Thu, 29 Dec 2022 09:35:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 570A140573
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 64B2XjUZhicK; Thu, 29 Dec 2022 09:35:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F53F40102;
	Thu, 29 Dec 2022 09:35:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F53F40102
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7731A1BF393
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:34:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C68E940573
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 09:34:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C68E940573
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T4eLXScTJ8hp for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 09:34:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBB7940586
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 09:34:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBB7940586
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D6E1E8705E; Thu, 29 Dec 2022 09:34:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 10:33:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 80fa5672da85a110e60be0d2143e85f9e08a0f4a
X-Git-Newrev: f934a00928b413fb3c190749a5bda578c6c02255
X-Patchwork-Hint: ignore
Message-Id: <20221229093420.D6E1E8705E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tiff: add zstd optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=f934a00928b413fb3c190749a5bda578c6c02255
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

zstd is an optional dependency which is enabled by default since version
4.0.10 and
https://gitlab.com/libtiff/libtiff/-/commit/62b9df5d2af68262fa6fcfb66086bf128f7d67c3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tiff/Config.in | 4 ++++
 package/tiff/tiff.mk   | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/package/tiff/Config.in b/package/tiff/Config.in
index cc9aa5cfd0..d1004d6668 100644
--- a/package/tiff/Config.in
+++ b/package/tiff/Config.in
@@ -72,4 +72,8 @@ config BR2_PACKAGE_TIFF_UTILITIES
 	help
 	  Install all tiff utilities.
 
+config BR2_PACKAGE_TIFF_ZSTD
+	bool "ZSTD compression"
+	select BR2_PACKAGE_ZSTD
+
 endif
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index a753065fde..90b28ff37a 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -100,5 +100,12 @@ else
 TIFF_CONF_OPTS += --disable-tools
 endif
 
+ifeq ($(BR2_PACKAGE_TIFF_ZSTD),y)
+TIFF_CONF_OPTS += --enable-zstd
+TIFF_DEPENDENCIES += zstd
+else
+TIFF_CONF_OPTS += --disable-zstd
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
