Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F01C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 20:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4ACB160C22;
	Thu, 30 Dec 2021 20:57:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PRcThG3ySC0D; Thu, 30 Dec 2021 20:57:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EEB160AC0;
	Thu, 30 Dec 2021 20:57:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D3ED71BF361
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:57:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BFDCB82862
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:57:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aFH2K2PxkSE3 for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 20:57:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC14B8129A
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 20:57:13 +0000 (UTC)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
 by mailout02.t-online.de (Postfix) with SMTP id 1220E3DDD;
 Thu, 30 Dec 2021 21:55:49 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.202.128]) by fwd84.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1n32Se-0zQVMn0; Thu, 30 Dec 2021 21:55:45 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:43666)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1n32Se-0003fx-IZ;
 Thu, 30 Dec 2021 21:55:44 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 21:55:43 +0100
Message-Id: <20211230205544.2056341-3-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211230205544.2056341-1-bernd.kuhls@t-online.de>
References: <20211230205544.2056341-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1640897745-00009E39-BC01888C/0/0 CLEAN NORMAL
X-TOI-MSGID: f1cb140a-5385-4572-9921-77cd2a7130e9
Subject: [Buildroot] [PATCH 3/4] package/Makefile.in: fix per-package build
 with gettext-gnu
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Building a package which needs -lintl fails because the package
gettext-gnu, containing this library, is not rsync'ed to the build
directory.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/Makefile.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index dae7a859fd..bd015da316 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -391,7 +391,7 @@ ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
 NLS_OPTS = --enable-nls
 TARGET_NLS_DEPENDENCIES = host-gettext
 ifeq ($(BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL),y)
-TARGET_NLS_DEPENDENCIES += gettext
+TARGET_NLS_DEPENDENCIES += gettext-gnu
 TARGET_NLS_LIBS += -lintl
 endif
 else
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
