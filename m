Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F172C433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:10:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07A91615E4
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:10:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 07A91615E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8DD26066B;
	Sun,  7 Nov 2021 02:10:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zbXR_qn1_pXT; Sun,  7 Nov 2021 02:10:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59CBE60628;
	Sun,  7 Nov 2021 02:09:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 470BC1BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43A5581BC2
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:07:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qKt_V9CKJe4Z for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:07:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0876.aruba.it (smtpcmd0876.aruba.it [62.149.156.76])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72DF281BB2
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:07:09 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jXaNmuTiPFf01jXaOmqM5f; Sun, 07 Nov 2021 03:07:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636250829; bh=huteJfYecQqgkWaZBTWPKJdQvQBH7TYmc8BgmZL5Q4Y=;
 h=From:To:Subject:Date:MIME-Version;
 b=RM6wqE9jCCiuX2FAr5YvpMTjNQrd9XFZ2XDjTcy0YyNhXFRPk0DGaOzvEyX++jvWB
 XFGehhKyPRod1fengIojcpsuQaQbORyEhHbySBqw+FRMtL4vUMFB3QGt2t7GAgUSfr
 xZ0aL/M3Q1ZoNsOc8FEWj+2MJ0eKc5SUYTD8GFpkIAld6nG89TfyFl8fUWoOmYhGVT
 C6VXGE770ykH8ng0RrTBZb2nGji8upanjepEDr+1PB2fxNn+LCrS61H7Wu6Y63tHDp
 juAdN2Nw0RmVxrO1vnn3D53r98PhcccZ6k7+hOI1ZpQivP8T5UT2kSTGwoCTri7om/
 d772w2s1y3aZg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:07:07 +0100
Message-Id: <20211107020707.3058030-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfClpEgYvVRmXp4fZjrsZJi0CBVnY8QzjNjNtLUBlfw6bWd3TrPjphKc4LuJ50Xc2YJQTQmXnUJNMnzIPH45R5oevDNqquc8O3diDQYzl0TKrHWBwNLEM
 ZL0jOQnpb+WUzt7j0zOtjCZz0dUzlfLVYFLA8DPflYowPiqQdUNFMATXzB8Dc9dasLyRQzimUpAY57gTL9su9pf6wefbT+gpkJTh2VvEYaTxkIOSeYFB86QU
 lSjTo3/2Ykim4M2qPqInzgpB8Yj4q9SdOrRqNFqt2dLMZ7ZAJt258P2YxQMTZZWuDTNgsT+rQuyT7mY2u8kONDdq7Tws5OaUn3QXsZRZCfXe/2CF7kKP9IcX
 +jqBOzhuDW1vzX4ofCHbUptI1KmSTstOP41Y3irAyWJwL9iCZBcbewz7WoXnm+twI42qDywPQ+N6BbbaoDD9g8hZRBxZyBcb6RYQMXwjO3Ey43K2J7gTOsjB
 bJaBQhVEnTsX/cH0pLsDR6WxOlG5OWbf3j5O/9ErUXuJLkA955rrgbfa/7o1uUx1e4B5VzL7XIlZ5U/gGEWztHQNbthCB6g4lZsh5xJHL6aqhJTwhgqQNU4r
 SY4rdaB+e8nxS+unEMlPH2hwHUTkdfLZFhFB5X3/b6Eh2CJkEYF8bIBqR1Ke1Aegz6DbL3zGi2Mn3em3bR9bTqttv22AQnNkr5sYRz9Jdqifwu/xArpGuclv
 J4zM9kn2xwuCOqlIdVJOEc2s2PJWtzr568CyJXu+WclLq2uRC+G3k1JHw7qh8lZC6+MtaldT9XROY6+bywQTpYIQhO3hhiBw+317xBSIVvpSdeIi1Et7mT+Y
 6uRiHmuuZPqBzoBdzN7VxwmH95Fmuc74Sfw3hav8MP98WVSKNVK7uQ1plHOkyMxnRiIZfk33fVv2BqRkjWP8ulvs/kmPGjdlcGUCVWhgKz3AHxLnIYgZZJUl
 HNCkDXR0qFqfU5IE4PltRP90pqL9i6PL7C8nPckO2AAnWTCt7tT4fB5JYVEbDJIRa0on/iDTBzqUd4T8zQ0kp1ww7tThqfCF8Rx1BqrNCCahH0Q/jeKXTbxn
 JUQUhDQAGwze2kObKQBg3VlG4w8sCUDM4vAVqYDA5Bj2hsRPC/1UAtryYhUOwqiVQMGGCv0WxBGgEMAd3Ly8POmGfw+l8pQkudeOQo1QZYH7gh9H0gdzKQZR
 huN47fiv9kC3LLp8E/KEGY6hJ79X1ad2oj2rhlhYf9ehhJbbHM19LctO8uXKNU+a7O9KdSWSv65uXADjwM1bgJIHgMeHdIKVR7WVVDdBVDaCpUOlb7wDI5cl
 WBVDDeGJ6xRzxnguM+JB58+bq7+9iV+6IyUcIou1Cx69uoxVDmimINXbVVKzzqtfQqZS8+JJQePM8Q6p2c2sHRc0srUD66Qdtp5rEc/pj/Wsl6q1sCLuOi8f
 KtPWD77ZmpTSIoYcdRojmRk4vXAZlhDSKgKr+iuhpuvBWT7tXQiEWrYARzUC+GgDnTEKe4H53LlvW+4vB5JDX+pz8/GNHKHtMxIrQvwy+igR1LmJhRmhM1Z+
 nn65mkE3+NCIcngyccPvn7b2yQhY2a1bx2PI+eEYiTz5lK8CrWE64HCOgnjd5RZwhb8qU2DMnQYFlwPB+IHFtLnuAz9VEIC9sFxg39iyVDTbcDUk5NvBBL3D
 h1pBU6uvRdqJO4+60YeMb5HWwtT2qWnF4TvcPSfXw3RwxCLf9YKWO7y8j5hpjB4hyS5YqNyclkNhaktQigY6AjkVxbWi4QadBbbVfSDJsEOldTHkX2vq2g==
Subject: [Buildroot] [PATCH 033/102]
 board/friendlyarm/nanopi-m4/genimage.cfg: beautify file
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Theo Debrouwere <t.debrouwere@televic.com>,
 Nicholas Sielicki <sielicki@yandex.com>, Edgar Bonet <bonet@grenoble.cnrs.fr>,
 Alexey Brodkin <alexey.brodkin@synopsys.com>,
 Mike Harmony <mike.harmony@snapav.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Michel Stempin <michel.stempin@wanadoo.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Dagg Stompler <daggs@gmx.com>,
 Biagio Montaruli <biagio.hkr@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>,
 Jan Kraval <jan.kraval@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Peter Seiderer <ps.report@gmx.net>,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Filip Skoneczny <fskoneczny@gmail.com>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 David Lechner <david@lechnology.com>, Davide Viti <zinosat@gmail.com>,
 Nikolay Dimitrov <nikolay.dimitrov@retrohub.org>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>,
 Suniel Mahesh <sunil@amarulasolutions.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 ARC Maintainers <arc-buildroot@synopsys.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pierre Crokaert <pct@crookies.net>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Gerome Burlats <gerome.burlats@smile.fr>,
 Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 Lothar Felten <lothar.felten@gmail.com>, Luca Ceresoli <luca@lucaceresoli.net>,
 Romain Naour <romain.naour@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Beatify this genimage .cfg file to have consistency with all genimage .cfg
files in Buildroot.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/friendlyarm/nanopi-m4/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/friendlyarm/nanopi-m4/genimage.cfg b/board/friendlyarm/nanopi-m4/genimage.cfg
index f14d493a9b..03f39adfab 100644
--- a/board/friendlyarm/nanopi-m4/genimage.cfg
+++ b/board/friendlyarm/nanopi-m4/genimage.cfg
@@ -6,11 +6,11 @@ image boot.vfat {
 			"extlinux"
 		}
 	}
+
 	size = 64M
 }
 
 image sdcard.img {
-
 	hdimage {
 		gpt = true
 	}
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
