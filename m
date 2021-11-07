Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE0B7C433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 01:59:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 426C4613D2
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 01:59:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 426C4613D2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12632402A6;
	Sun,  7 Nov 2021 01:59:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gCYIhe_BOE0F; Sun,  7 Nov 2021 01:59:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7479A4029E;
	Sun,  7 Nov 2021 01:59:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 032CA1BF286
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 01:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6AD160666
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 01:59:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YlgV277QbZsG for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 01:59:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14161.aruba.it (smtpcmd14161.aruba.it [62.149.156.161])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9D7460628
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 01:59:31 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jXSymqLUsrIRljXSzmQtvh; Sun, 07 Nov 2021 02:59:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636250370; bh=Wypwdo7MKBtSXHic+Jn2qnqo7eLwBkzUETeNiKZhrgk=;
 h=From:To:Subject:Date:MIME-Version;
 b=cPiEFKFwP+hOqjJhbYeM+Ig2DUNA3VUAyB0h8Z/c4L23qMccXd3ztsFpV1AnIN9C/
 qYhFmo28qnLZJz/iytwvbaQT4LPkseCm9D9BR9T6ojsjYV7H2aHVR6GM0nu91P6oHH
 2MQZlWkxeTvq/HrXbZmqZU5JDwa/i88UZ6dD3tUa4mqxPK55WfA3fvqgemcAfZwb8P
 XLOj0cylnelr3octENMQiYAw4eGqJUk6wFw6ZzgKJq/lfGxukzrArmXZZ6mLdO5tqT
 VSw+VgiR/esZ0RmgnVyxzjpxL0frcGiYV5L1ctzlSDfkdZRQaat54Q/+tkStZBvoUT
 Fo3TaC+GJCcfQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 02:59:15 +0100
Message-Id: <20211107015927.3056054-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfOHnMHYBvA3FQA2xO7D15l636IWnBVTorkSBqKqfBm6Q6FhHJsZU5buB668j9O1kX4gbYgFAIIDRZj6lXLlnAvUjB3JM7pgTY8/ej+0lUcllNzZfPpqJ
 MNZveCKGxKIr0Sfeh1JTVhhcum7vztq+DpO9U5L0Evw+MCrplSpt5AHCxXB+vP+53hxHsFnPNhHRJndQ5PdDfsIUPSplWp/KCOc1xjnYUXl3UBPFhgs/tdfp
 OCjrbZWR2JN28M5pDVK81GUpLE1ymg5VEmMMLj+73+k26UUecM4srqaEuTWmRoR/w364MxnVNdP/3mxZDMBcyPZisxQdyfRQemD71/T+ol6a+6k6MMlJpvZV
 QJQXFMDIwyZlpiHDfoquJH2lyXOP5uQLiGjxSSyR+Jdn7S503WYgBESVBSfV8p68U+sHIPg2Wjap5RxMAUtYnIPFtK6biUxHmJ0pJ/5Gwenk1OHpaJ7uVg6R
 TElxMKu+d4zMlZY44XY+eMULa0/C0vSDs0y8CzXSWnsCvRHZpshzBmYxccOkxaB908Ae1RtoEec92iBXeVQdPXKwAbCeim/sjr72D4CYqfMdR5DyX5Lg9MAx
 x+K0lrEtjXiJW0JhxAAZaG1LwJzCjpmsT8CUuJgpncqsN6wh1Q4yjvTRff47wA8IfXTMMcbzTrmp3zHGB8lwdFXfwWjex9GMZ8fr+M/zZh6Mx97I8VeiX5EM
 ttghAP2wvDW5isPfNrq0msT9LKN+vGypvpluouZLDxG3OPcyBfvUYXOHzr0TfugaMyGLZLw2IrCg0GRdp/jG8SJaWlhY3HydvsoonbBletf2uQ/UzThrMfxw
 oQa0EIXvCJujuw/cahleq4d4NIGUZ2DfbRozDltWtliAgGNE+I6wlMnw9i36l4rT6TmHa1QeEO3t5P7jDLHYn87OTlwxZxIo3RLrPE1a/LNiFC74cRyicMDU
 i3V+MsgK9/mSnkIxec0vzJALgcopBUJHfjfjB7ZEeKt7og0CUbzabBw2DgWyVjTP2oRaZ/Qv7WoNkbQF0atJJNW1QIbc5I/YOGgZ1DEAgXXr0GI3l9XELeJ5
 uF+5yHjS7pkIo5xPqIIsKxIpGxFWjuO6DY6wyhY90cYTZXCguDYnF0A98nBKd7gCy0xQ0zMVNehwgah6hwDqQj2CmqEjPymT9QA4Erl3AOb1NT18/IaD9nfu
 l7IbxgmDhvBzXeGvsGyBNLBxAtvuPihJeR1qu8PgB/S82cheFQuiqeQhIkDgYg8dAFUOyAZq/PfC7d4IRnHk2iVMO7McuQgE+pRb4sBWJwCrd5dPX7qGFwIh
 I8nJkBe4OBe9vDFcHWwMFSd95Y6M11INWRu/ZpAkfDp2FiYMN0Iqg7aK4gdN5dMaDqTqG1GbNXO6wv3FfIUn3e1r+dYw0D4/YdoFVYiJTAq7HZzR5d4o6Ojv
 MaNKEU/iCI5mMVMak/F81nGFK8DZ5oqf/67SoViRZKYD8TjF8xvHlX2OxnURNURvaVODyEtXZePnJQy2i9Ezf8kbf7qdJ7aFDWdRmW5JJNcsEFLy/nyvs6gF
 SB0Zxi8akh584KmXTZvIQhYo4sSVNO6EvKiYo3mKFq1MJFBSZmNMgO/R7qENjjI8IdRcjZxu+WPHZCfXYGDltCo9mR0JG3wjUMNPZRNvsILiz6/pRbkyVwZU
 EtsB+qZ3LDRlN7JcO92+BygM/qTJbwjfJIaiRR/KkDtCDwEYvJJE7hy5rqDjmM0WIeh1oHWu2A2fUMIEaXaXGwlYJw4grfSB91+ErLdXXn8y8LF3PJZU2A==
Subject: [Buildroot] [PATCH 002/102]
 board/acmesystems/acqua-a5/genimage.cfg: beautify file
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
 board/acmesystems/acqua-a5/genimage.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/acmesystems/acqua-a5/genimage.cfg b/board/acmesystems/acqua-a5/genimage.cfg
index 63b003f378..7fa0a69c4a 100644
--- a/board/acmesystems/acqua-a5/genimage.cfg
+++ b/board/acmesystems/acqua-a5/genimage.cfg
@@ -8,6 +8,7 @@ image boot.vfat {
 			"at91-sama5d3_acqua.dtb"
 		}
 	}
+
 	size = 16M
 }
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
