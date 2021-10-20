Return-Path: <SRS0=oNq7=PI=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 263D4C433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 21:38:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8B286121E
	for <buildroot@archiver.kernel.org>; Wed, 20 Oct 2021 21:38:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D8B286121E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6497407AF;
	Wed, 20 Oct 2021 21:38:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7XnsimQ1aR4T; Wed, 20 Oct 2021 21:38:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23851404FD;
	Wed, 20 Oct 2021 21:38:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 11C501BF2C2
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 21:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 488CA83A80
 for <buildroot@lists.busybox.net>; Wed, 20 Oct 2021 21:37:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yicf0qFbsHAR for <buildroot@lists.busybox.net>;
 Wed, 20 Oct 2021 21:37:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C9FD83B27
 for <buildroot@buildroot.org>; Wed, 20 Oct 2021 21:37:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 75055881CA; Wed, 20 Oct 2021 21:34:08 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 20 Oct 2021 23:36:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 77f4d2f8efcb6e3d842cd9719311907ecec6147b
X-Git-Newrev: d904c4d22d97b3d263cfbfde9da8fab5717032ff
X-Patchwork-Hint: ignore
Message-Id: <20211020213408.75055881CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ipcalc: add geoip support
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

commit: https://git.buildroot.net/buildroot/commit/?id=d904c4d22d97b3d263cfbfde9da8fab5717032ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ipcalc/ipcalc.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/ipcalc/ipcalc.mk b/package/ipcalc/ipcalc.mk
index 145b6904b9..8a43200456 100644
--- a/package/ipcalc/ipcalc.mk
+++ b/package/ipcalc/ipcalc.mk
@@ -10,7 +10,12 @@ IPCALC_SOURCE = ipcalc-$(IPCALC_VERSION).tar.bz2
 IPCALC_LICENSE = GPL-2.0+
 IPCALC_LICENSE_FILES = COPYING
 
-IPCALC_CONF_OPTS = -Duse_geoip=disabled
+ifeq ($(BR2_PACKAGE_GEOIP),y)
+IPCALC_CONF_OPTS += -Duse_geoip=enabled
+IPCALC_DEPENDENCIES += host-pkgconf geoip
+else
+IPCALC_CONF_OPTS += -Duse_geoip=disabled
+endif
 
 ifeq ($(BR2_PACKAGE_LIBMAXMINDDB),y)
 IPCALC_CONF_OPTS += -Duse_maxminddb=enabled
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
