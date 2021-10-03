Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACFC2C433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 20:20:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2311F61278
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 20:20:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2311F61278
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F322782848;
	Sun,  3 Oct 2021 20:20:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ewnNtF2L6snE; Sun,  3 Oct 2021 20:20:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6740E846E4;
	Sun,  3 Oct 2021 20:20:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3B9B51BF963
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 20:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A5B9605C2
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 20:20:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wly0rn0TwGLK for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 20:20:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C81D605CB
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 20:20:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8734288707; Sun,  3 Oct 2021 20:18:06 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 3 Oct 2021 22:20:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1b63bbb851426f4da7d97c6cacab2d5e7e2d59a4
X-Git-Newrev: c83bf9720632bcd4d438094a9fc30feff69fc555
X-Patchwork-Hint: ignore
Message-Id: <20211003201806.8734288707@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/htop: add optional dependency hwloc
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

commit: https://git.buildroot.net/buildroot/commit/?id=c83bf9720632bcd4d438094a9fc30feff69fc555
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/htop/htop.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index 140d620f20..b5aab3c300 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -13,6 +13,13 @@ HTOP_CONF_ENV = HTOP_NCURSES_CONFIG_SCRIPT=$(STAGING_DIR)/usr/bin/$(NCURSES_CONF
 HTOP_LICENSE = GPL-2.0
 HTOP_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_HWLOC),y)
+HTOP_CONF_OPTS += --enable-hwloc
+HTOP_DEPENDENCIES += hwloc
+else
+HTOP_CONF_OPTS += --disable-hwloc
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 HTOP_CONF_OPTS += --enable-capabilities
 HTOP_DEPENDENCIES += libcap
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
