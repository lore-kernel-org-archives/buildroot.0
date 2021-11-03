Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF8A5C433F5
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 22:35:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5B35610EA
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 22:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E5B35610EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AE06607A5;
	Wed,  3 Nov 2021 22:35:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4PuwJ4c1-ppq; Wed,  3 Nov 2021 22:35:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65B54607B3;
	Wed,  3 Nov 2021 22:35:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D2E281BF292
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 22:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C1834817E4
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 22:35:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ISR2TNb0HLMj for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 22:35:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BEA33817C3
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 22:35:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 01AE28A516; Wed,  3 Nov 2021 22:32:07 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 3 Nov 2021 23:35:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d66f0c0b62c407f2723c31b19469d29522ae968a
X-Git-Newrev: 9c1b9c279ed5fba9e1d3284c3a484837303b042e
X-Patchwork-Hint: ignore
Message-Id: <20211103223208.01AE28A516@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ipcalc: fix static build
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

commit: https://git.buildroot.net/buildroot/commit/?id=9c1b9c279ed5fba9e1d3284c3a484837303b042e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following static build failure raised since commit
77f4d2f8efcb6e3d842cd9719311907ecec6147b:

../ipcalc-maxmind.c:41:11: fatal error: dlfcn.h: No such file or directory
   41 | # include <dlfcn.h>
      |           ^~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/5f867aeab9c61538e34b14023d0ba327698d3c04

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ipcalc/ipcalc.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/ipcalc/ipcalc.mk b/package/ipcalc/ipcalc.mk
index 704844292a..dfe35e2cdc 100644
--- a/package/ipcalc/ipcalc.mk
+++ b/package/ipcalc/ipcalc.mk
@@ -10,6 +10,12 @@ IPCALC_SOURCE = ipcalc-$(IPCALC_VERSION).tar.bz2
 IPCALC_LICENSE = GPL-2.0+
 IPCALC_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_STATIC_LIBS),y)
+IPCALC_CONF_OPTS += -Duse_runtime_linking=disabled
+else
+IPCALC_CONF_OPTS += -Duse_runtime_linking=enabled
+endif
+
 ifeq ($(BR2_PACKAGE_GEOIP),y)
 IPCALC_CONF_OPTS += -Duse_geoip=enabled
 IPCALC_DEPENDENCIES += host-pkgconf geoip
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
