Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69249C433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:06:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2803661529
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:06:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2803661529
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0095660670;
	Sun,  7 Nov 2021 02:06:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hYMt8o40sPtc; Sun,  7 Nov 2021 02:06:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 583DF6066C;
	Sun,  7 Nov 2021 02:06:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F29671BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE0004022F
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:05:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hyRNdAlt5828 for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:05:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0876.aruba.it (smtpcmd0876.aruba.it [62.149.156.76])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6BA6400DB
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:05:05 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jXYOmuSjdFf01jXYOmqLie; Sun, 07 Nov 2021 03:05:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636250705; bh=WiFQ75/nfZinnmGFVX/lN6QJqPeVqRnHv9Ud2ZgaXhU=;
 h=From:To:Subject:Date:MIME-Version;
 b=W6Q/DOdGmD/pPiyp8EgIAXefurGSkTMZUp9hur8HB29l+VpY2KF8GOYF2k8aDThJK
 GywZ3QhLHXjf5eaekmpG11aMQ0g/HyfpV2EPEXTDrpI1zTijxFt8b3PY1cvl1w3bQl
 AEaVE1335tu+Ngq2Kg4yuymuFUOsUF9fGW/JY4pR5w9gciTJoGJqP4FzSwsVW6S/i4
 GDcdrBRlVcFrFs61indbPJSGL/oAEBfQZ2a5IYPzOZyUne+g10T2TIEP3Lrw4YenbV
 mBMAnJZbd3qo8r9lOY7MfjCh/o/wH7QhE78fesowtPOmq5DYoi6xo6Czt+UmOuMeA+
 oe342AtcXExog==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:05:03 +0100
Message-Id: <20211107020503.3057346-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfGO1GNspFrcyFpKpD/hfLZtNGm3drOANT95JEa34CIP/dVzQfj/psbsKexs07gdVhBwL3+shsT+v5brTj7yNdZPeCT/eoqgilJW6DRsoVT79zEmOj5Ry
 gOFi8lCF8ZfGHIHoPwrt+bPAm5whWv08hCLhaVnm/EvVfbTfGUmKTak4Rhe38of1DId9BhVabe0+1+HJ6tYNB2dX2ELusDorVTyxiAJk17r6gstkkOzNIj2f
 6v5Nfyj/tsQvzQRxi21XqR7tV8LF2UMQYpfSRfoUhWeVZVQOQEL6QoQ5hDMu6UFb02SPYWB1IPv6HzQyGHeackh7yOIowxBMG/+n68l4t+BAUkozOqD23eQW
 8IMENs6Mr3s7RzQFE1jUfzUw1f6iZrmMbH1PHp//wGgO+ktiL4mDtg1HlazEZx4wcqq3BuWkIhtRGvEicoLCzxqxBx/tiJut099/euAaYACCuub3tv8F3OH4
 FCNDbiNP7v9KCkJA7d5Vq8MR7rBl3LoQnDWJjyangCEJjOtum5fC3WQri1y1N8q52sEVyYjHkuRyl/dQdNpUxmLZ1O8O8pGamIAJHVk61Yj+C5abj6AwRw46
 6wJ8uK9p3fuxfmixp3oo3puZcAYxWgLuGvRs8PA/xZCtah8QJ3gK0VM9fSNk3WK24hxOcIP5jCbv519oW8l7ATb3UxorQKbo/7j2HKzQnhKxBU2OzQWEwcKd
 63SKEyXXt0sYriPTuQ6tT8yCDrmQEajie1XAPmc4EMe4jM5Q2YeB2BtnDvKEAnaAtgUS1InwRnRp70R75e80flONlmsrfKV9vsE7z8MYp0n9u6QQ/kRQ13EJ
 LKQgHKVz35cwRCvTonQEr/6s9lbF6Az39kp1KewZN+k9IwBHJ7WuCJmLM5sKUB2oj4B6XnGT0G2SkrkaXvJxW63yB+STtiUbbO7qpUkvaojWXIarrK3rs4p9
 5yjoJzA4SGU8mn0Kv/MARfj2IuvTn68EU0+8MkDPcSs3urxvqfV4rDiXM7CKc5uKxaKGZR/B7l7QnYrOKVlA/2KvKEaqfjTtpi8Pjpl7ZwewvqQVq8ZMGaRA
 pC5ZSlCTbl9w2ffSAlQHqCZt8dyB2hOdiABq9gQEXO/vGDRQ3wMbRfYuqMHu4TKS6gASKIfpBltfL8oFe20DTo4ZnGLnJylJukkYeJxSnoS2WBJeSxHHvyxm
 Cjl91HQ/4YNMdSZgFtdxlQe64rvyaHJxgMft+SnVnAcfAJHSrVM/ALxB9EgPlDdOPcKuzCVB8HkM0tyOBYFgVwIQNZVL+oUoDxOYbwvQQPG0CUoDpLMW4gOI
 nKRCj08Kr89AioOoXsEBQOnoANrpkWIqnpAiwich5b2tD1N1yVvjk860sy6CIK6ZyhVcIdyQkg53LO+gpJb0wxkvFuB3Lh3kXKeE3gHwjsJwJysvc2h5gzDb
 YWDi8FHZeaq1IZuW6IoYD6B96fFyFKfdf+4/l0SKK5TAuzH+6h9D+J1ECXcFKh0HnfWOdjYTboPqOPf7TQoti5ad8ddVHAXMTVz4RE536700tKXVfrjIR5K+
 Jgdbn9FoyUvH3Ep8NmWsrJRYcp9Y1IYSoB0vGaW0utHbWJc/+RyGlYuE6gp8xlgxagcAdX4AhsIVptfyEzN9AS3V46G8rQXLgbjY34IsYF4ZJKPkGtw7l2eW
 qTXRED+VE2H8P6Ab3H3/z8xOTFtjK4tu6AFUTi0f3TeYMhUA+zXUGPS4TKafTvl/JA1GdEKRjZmXIvMQU0uzvN8Z8rXJLQ0yseztVKJrXeVIRYRx/weGVg==
Subject: [Buildroot] [PATCH 022/102] board/ci20/genimage.cfg: beautify file
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
 board/ci20/genimage.cfg | 44 ++++++++++++++++++++---------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/board/ci20/genimage.cfg b/board/ci20/genimage.cfg
index 5f8a16c610..2d4a18a99b 100644
--- a/board/ci20/genimage.cfg
+++ b/board/ci20/genimage.cfg
@@ -1,28 +1,28 @@
 image sdcard.img {
-    hdimage {
-    }
+	hdimage {
+	}
 
-    partition uboot-spl {
-        in-partition-table = "no"
-        image = "u-boot-spl.bin"
-        offset = 512
-    }
+	partition uboot-spl {
+		in-partition-table = "no"
+		image = "u-boot-spl.bin"
+		offset = 512
+	}
 
-    partition uboot {
-        in-partition-table = "no"
-        image = "u-boot.img"
-        offset = 14k
-    }
+	partition uboot {
+		in-partition-table = "no"
+		image = "u-boot.img"
+		offset = 14K
+	}
 
-    partition uboot-env {
-        in-partition-table = "no"
-        image = "uboot-env.bin"
-        offset = 526k
-    }
+	partition uboot-env {
+		in-partition-table = "no"
+		image = "uboot-env.bin"
+		offset = 526K
+	}
 
-    partition rootfs {
-        partition-type = 0x83
-        image = "rootfs.ext4"
-        offset = 2M
-    }
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		offset = 2M
+	}
 }
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
