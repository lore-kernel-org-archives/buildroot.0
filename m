Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F153C433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 19:16:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFFB460F90
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 19:16:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CFFB460F90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FEA060732;
	Sat,  9 Oct 2021 19:16:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J_vwfHUTgWde; Sat,  9 Oct 2021 19:16:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F20136070F;
	Sat,  9 Oct 2021 19:16:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 684F61BF31A
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 19:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 540576072A
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 19:16:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pziv8aL4yYXn for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 19:16:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3DACA6070F
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 19:16:54 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 040701BF203;
 Sat,  9 Oct 2021 19:16:50 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Buildroot List <buildroot@buildroot.org>
Date: Sat,  9 Oct 2021 21:16:41 +0200
Message-Id: <20211009191646.1076266-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211009191646.1076266-1-thomas.petazzoni@bootlin.com>
References: <20211009191646.1076266-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/5] package/gdb: append to dependencies in
 conditional
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
Cc: Michael Fischer <mf@go-sys.de>, Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Repeat after me: "Forcing the value of <pkg>_DEPENDENCIES inside a
conditional is the root of all evil."

Repeat after me: "Forcing the value of <pkg>_DEPENDENCIES inside a
conditional is the root of all evil."

Repeat after me: "Forcing the value of <pkg>_DEPENDENCIES inside a
conditional is the root of all evil."

Repeat after me: "Forcing the value of <pkg>_DEPENDENCIES inside a
conditional is the root of all evil."

Enough? :-)

Due to this mistake, any other GDB_DEPENDENCIES defined before this
assignment were lost. For example, the host-flex host-bison added
inside the GDB_FROM_GIT==y condition were ignored if
BR2_PACKAGE_GDB_DEBUGGER.

Fixes the build of all ARC configurations that have
BR2_PACKAGE_GDB_DEBUGGER enabled.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gdb/gdb.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index f9010019f5..4ead75289e 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -147,7 +147,7 @@ ifeq ($(BR2_PACKAGE_GDB_DEBUGGER),y)
 GDB_CONF_OPTS += \
 	--enable-gdb \
 	--with-curses
-GDB_DEPENDENCIES = ncurses \
+GDB_DEPENDENCIES += ncurses \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 else
 GDB_CONF_OPTS += \
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
