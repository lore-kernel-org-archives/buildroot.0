Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D440C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 20:20:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B90F56128A
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 20:20:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B90F56128A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95B4382AEF;
	Sun,  3 Oct 2021 20:20:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dP_V8hiCi6J2; Sun,  3 Oct 2021 20:20:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1818B827FD;
	Sun,  3 Oct 2021 20:20:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 17ECC1BF44A
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 20:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1201E827FD
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 20:20:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LPpMQVciNfuf for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 20:20:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FDF582611
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 20:20:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 79A3B8880E; Sun,  3 Oct 2021 20:18:06 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 3 Oct 2021 22:20:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 349b0a08f6def2c400055bd53a1ad86c72f59f0f
X-Git-Newrev: 1b63bbb851426f4da7d97c6cacab2d5e7e2d59a4
X-Patchwork-Hint: ignore
Message-Id: <20211003201806.79A3B8880E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/htop: add optional dependency
 libcap
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

commit: https://git.buildroot.net/buildroot/commit/?id=1b63bbb851426f4da7d97c6cacab2d5e7e2d59a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/htop/htop.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index 22cc739e20..140d620f20 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -13,6 +13,13 @@ HTOP_CONF_ENV = HTOP_NCURSES_CONFIG_SCRIPT=$(STAGING_DIR)/usr/bin/$(NCURSES_CONF
 HTOP_LICENSE = GPL-2.0
 HTOP_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+HTOP_CONF_OPTS += --enable-capabilities
+HTOP_DEPENDENCIES += libcap
+else
+HTOP_CONF_OPTS += --disable-capabilities
+endif
+
 ifeq ($(BR2_PACKAGE_LM_SENSORS),y)
 HTOP_CONF_OPTS += --with-sensors
 HTOP_DEPENDENCIES += lm-sensors
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
