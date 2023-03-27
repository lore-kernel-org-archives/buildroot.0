Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B288C6FD1D
	for <buildroot@archiver.kernel.org>; Mon, 27 Mar 2023 21:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D2849408B0;
	Mon, 27 Mar 2023 21:14:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2849408B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XdlIQWynh0_B; Mon, 27 Mar 2023 21:14:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2571140BE4;
	Mon, 27 Mar 2023 21:14:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2571140BE4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 88F921BF2B4
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 21:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6304781FE9
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 21:14:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6304781FE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SHm8IffWdcab for <buildroot@lists.busybox.net>;
 Mon, 27 Mar 2023 21:14:30 +0000 (UTC)
X-Greylist: delayed 00:07:05 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04D1081D7D
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 04D1081D7D
 for <buildroot@buildroot.org>; Mon, 27 Mar 2023 21:14:28 +0000 (UTC)
Received: from localhost.localdomain ([146.241.97.239])
 by Aruba Outgoing Smtp  with ESMTPSA
 id gu3lpWleKt5Zogu3lpTqtg; Mon, 27 Mar 2023 23:07:22 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 27 Mar 2023 23:07:20 +0200
Message-Id: <20230327210720.1509775-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfFxGI2+ex4vWJXVxUBtAh7Bsym3nx/7KwUK8CANP5Cq/tqSg7DPCgcWCgQxXjz4lF0OoKutQ7AgJwX5L+NH0UmDwtuIrqjtG6+sVjAMhvkzzBDlyN3OL
 UoyWGuPmDAGwyaV6Sc0MT2j8TOt8uyZW5ro3KHkGZ18K+MrpArsbUCckOU0EGlOTHoXfbEsFEqNdzkmsE9tpPbZtygjKwT6uTiuP8fWE2+JBb5XNtpXIM/+D
 CqmqxoNvZJ1cv/3TaCv0QuqnPtEyZ+QZrXTZtG1j+xBBi6BHpRuhxSeOHw2DwXicCeOh/mby9xK2DDylfCGxzfk6CQg4gZXsIT83Z7wqoRc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1679951242; bh=ZuRj3VDE1NohTD/w4JPZYsJqsEeyW/j6tc2AMFE9Ghs=;
 h=From:To:Subject:Date:MIME-Version;
 b=AEyeeEZtzVGgZTSetFMiEutd+IXrlEHCYGlNaufR8GNQHFfXormn2Zy62aJG5grOW
 mMTKLUff0oJAPtG5u7zD9t1fTVkqJI1LBOQYbBktAogjqw5W8Kp60SVVq3jRR7K0Uv
 Loz+CByDCKllEvEIRdqlNH3qE1xKxnC5Y1IA7yIsocxtPFw7UCbt98sJ+pCypa0gzN
 apaKU1xCBTCZW9MfJB1ZrI367Qlb5eyAkqzH1Lu1WjXVXngn0QHzxyA+ddIA0z4sE7
 puMge9ApbxcN7tBgXrGGvRv+kSqB5jx8PXYZ4YuGOAs/CWNEiqSMV9zxrIoyQzKVQ3
 AVa9Zra6427kQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=AEyeeEZt
Subject: [Buildroot] [PATCH] package/rtl8723ds: fix typo CLAGS renaming with
 CFLAGS
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8723ds/rtl8723ds.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8723ds/rtl8723ds.mk b/package/rtl8723ds/rtl8723ds.mk
index 1bb164fa86..f62ce2bf6c 100644
--- a/package/rtl8723ds/rtl8723ds.mk
+++ b/package/rtl8723ds/rtl8723ds.mk
@@ -9,7 +9,7 @@ RTL8723DS_SITE = $(call github,lwfinger,rtl8723ds,$(RTL8723DS_VERSION))
 RTL8723DS_LICENSE = GPL-2.0
 RTL8723DS_LICENSE_FILES = COPYING
 
-RTL8723DS_USER_EXTRA_CLAGS = \
+RTL8723DS_USER_EXTRA_CFLAGS = \
 	-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
 	-DCONFIG_IOCTL_CFG80211 \
 	-DRTW_USE_CFG80211_STA_EVENT \
@@ -20,7 +20,7 @@ RTL8723DS_MODULE_MAKE_OPTS = \
 	CONFIG_RTL8723DS=m \
 	KVER=$(LINUX_VERSION_PROBED) \
 	KSRC=$(LINUX_DIR) \
-	USER_EXTRA_CFLAGS="$(RTL8723DS_USER_EXTRA_CLAGS)"
+	USER_EXTRA_CFLAGS="$(RTL8723DS_USER_EXTRA_CFLAGS)"
 
 define RTL8723DS_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
