Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB5EFC4332F
	for <buildroot@archiver.kernel.org>; Fri, 25 Nov 2022 09:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EE88610F5;
	Fri, 25 Nov 2022 09:36:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EE88610F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mG2k6Rv9ZIz0; Fri, 25 Nov 2022 09:36:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C01061108;
	Fri, 25 Nov 2022 09:36:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C01061108
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E1FAC1BF2B4
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 09:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD63F82179
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 09:35:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD63F82179
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cdlIXqTdB9L6 for <buildroot@lists.busybox.net>;
 Fri, 25 Nov 2022 09:35:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5775B81FA5
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5775B81FA5
 for <buildroot@busybox.net>; Fri, 25 Nov 2022 09:35:55 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 05394440A8D;
 Fri, 25 Nov 2022 11:33:06 +0200 (IST)
To: buildroot@busybox.net
Date: Fri, 25 Nov 2022 11:35:33 +0200
Message-Id: <58294107fad727dfc01e76ca23a47ab08a1ef9ea.1669368933.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1669368786;
 bh=rfFr7Z8KOwIT1ms0d0RAgdpH+mSH/l6yIeInxbVAzgQ=;
 h=From:To:Cc:Subject:Date:From;
 b=vaB5v/dNLrxmnPwK49+DMmOg6SnGp9QEG71L5yDQ33nPrsdcHcF3RkttMYtX2jYs+
 CP86iSrUw0ajD0fCYa8Q1VVjhbSbai7c88pxGBn6Qz/I/PIE3ejPsB9tGi/2hHOcif
 j2bkscYqtZlRsw9ey0DHL8c5dEvug07iAIIzrRW7zKm6ho/NFWptfk7HibQKJ9Sc8D
 Nr/4ZkOeWIHIOzROrTnCQTQSWpYi2u5LhGKBD4WQTnEaoiTCUdW7L868HHHAkXucuf
 V0KcEyFjCHVj3on80DRXr0kynnKvjoWjbixjnfcJ3oyQAxQUku1VEBCBE4fmS7c9AW
 qO48sObzm43qA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=vaB5v/dN
Subject: [Buildroot] [PATCH] package/dash: fix static with shared build
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When BR2_SHARED_STATIC_LIBS is enabled we pass both --enable-static and
--enable-shared to configure. dash configure.ac only looks for
--enable-static to make the build static. But when linking against
libedit pkg-config only returns dynamic linking dependencies, so the
indirect ncurses dependency in not mentioned. The end result is that
libedit can't find ncurses symbols on link.

BR2_SHARED_STATIC_LIBS only makes sense for libraries, not executable
binaries. Pass --disable-static unless BR2_STATIC_LIBS is enabled for
static only build.

Fixes:
http://autobuild.buildroot.net/results/137d39cc5ec436759a2fde3f26ce5633e0ad6c2e/
http://autobuild.buildroot.net/results/55a38e0e45212bf7403d9ccb626c9422e3affe72/
http://autobuild.buildroot.net/results/8f109f1a04a6a2ff6d8c4c920e499fbaec3f72b9/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/dash/dash.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index fed3a995511c..6efc71e5684e 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -27,6 +27,10 @@ else
 DASH_CONF_OPTS += --without-libedit
 endif
 
+ifeq ($(BR2_STATIC_LIBS),)
+DASH_CONF_OPTS += --disable-static
+endif
+
 define DASH_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/src/dash $(TARGET_DIR)/bin/dash
 endef
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
