Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC81C001DE
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 14:05:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A253B404E4;
	Sun,  6 Aug 2023 14:05:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A253B404E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id urc7LLps60yE; Sun,  6 Aug 2023 14:05:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 975964156A;
	Sun,  6 Aug 2023 14:05:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 975964156A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7DE901BF909
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:05:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 027A24048D
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:04:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 027A24048D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z5ycEBSXnq9B for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 14:04:49 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D0F640201
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 14:04:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D0F640201
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 671D5A4C10ED;
 Sun,  6 Aug 2023 16:02:44 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46282)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qSeLE-0000Bn-0Z;
 Sun, 06 Aug 2023 16:02:44 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  6 Aug 2023 16:02:39 +0200
Message-Id: <20230806140241.4155773-11-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230806140241.4155773-1-bernd@kuhls.net>
References: <20230806140241.4155773-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691330564;
 bh=E3I3OFw1Rnyg+OTCIs6I+nuAmXV6/Z6TdkHXQ0DsOoM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nbFwhAjC34inYPZ8Pt0Q6mfXs8Pb7VbFZMfMZa+ZClyVq3EcKc9zQer/Aa2p9GSK2
 /VxWvBUspBEx3Evn577SF3hemS1KNt8tlEnusZxGQF8E2W4dPyPUVoV44b1wbnzUCd
 T8cTB7cLmwFF864xcxyXNjFz9IvQ/wBlkvfJnT+WsBvUv5MNE27IjdxGuWnDd1gGm5
 Clp9fcul6Go/iUm6lgFvcRYa6Wh/HWQWd+tDPIM1ISo6bLUyOJla19k5f36dTi5rNA
 RUVAVrMJ2DrSlVbmpqbPMJcOYpMroPVzerjudLVWedQS5pHFsAqfIBE8ED+ka+Hka/
 lZ2ILa9p5to8g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=nbFwhAjC
Subject: [Buildroot] [PATCH/next v9 10/12] package/libv4l: optionally use
 libudev
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Bernd Kuhls <bernd.kuhls@t-online.de>, Sen Hastings <sen@phobosdpl.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Bernd Kuhls <bernd.kuhls@t-online.de>

libv4l only requires libudev, not a full udev daemon.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libv4l/libv4l.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index 1142a7442f..094cf74f67 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -44,9 +44,9 @@ ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
 LIBV4L_DEPENDENCIES += libgl
 endif
 
-ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+ifeq ($(BR2_PACKAGE_HAS_LIBUDEV),y)
 LIBV4L_CONF_OPTS += --with-libudev --with-udevdir=/usr/lib/udev
-LIBV4L_DEPENDENCIES += udev
+LIBV4L_DEPENDENCIES += libudev
 else
 LIBV4L_CONF_OPTS += --without-libudev
 endif
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
