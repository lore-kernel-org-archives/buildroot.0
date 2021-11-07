Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 122ABC433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:10:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA5F2615E4
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:10:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA5F2615E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 995724022C;
	Sun,  7 Nov 2021 02:10:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 89l3-uUjQvJw; Sun,  7 Nov 2021 02:10:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B84C040230;
	Sun,  7 Nov 2021 02:10:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 48AC61BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 44E9560666
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:07:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lmKNkdq8oKLD for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:07:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14166.aruba.it (smtpcmd14166.aruba.it [62.149.156.166])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A06160628
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:07:20 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jXaYmqSIwrIRljXaZmQxRG; Sun, 07 Nov 2021 03:07:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636250840; bh=770rrgmO6f3WltUVAtxHsh6qtOvuh/53cGFay7ZxSew=;
 h=From:To:Subject:Date:MIME-Version;
 b=UfptbARY/qJhcjCGOE5kEo6n6T4YtoGfB9oCQqofAHmgL6LLZ5/Dv+nARXSL0CYuq
 oxPAdm/Ud2sLzZ6qZspXD8/c6eYB3etz1LxDCkKqH+9dMorZx7/BH8/ZdyFEGn0Jv+
 ZgJUR96NMkhTpI5A0lkHGdWqN0o45U3llliOfDNyEhujXYsPOlrN7XAChnwMmTk7bn
 yvDic7WJzpVQqMaJgz/6y6aYl7WhGRqE6L4BVO5T9k8fUt2B93kq0/0nT3Wmq80UK0
 dBNg2ZWK5NO+VprAlS6NC7VYe558zAwIKowVTV4nF0ZlD1wnALlSiEDKm2b7m3Qv4B
 Wji0EzNXekE7w==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:07:18 +0100
Message-Id: <20211107020718.3058086-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfL4PxxZDwMESsUoSXYEWszCsEPyqneXCqSOPbacGQU3Mh44FKSYUfcvp1Uo1QbPsJYlb0kunfD7OszApa1ADVEhxZsiEA0w/m9gaJvCuu8bfE1X99qiy
 Py/5jAGK9W+PiCMNYqpxRTD0WQbRMReACbyN1uEcqJjXx7fHf8OcLtnDd3bNhNNCQ7x8yFeoNgo3Pg/gTvgP/6NW/RuK0UldmduSRKFwQJeG7e+5ATi76s1G
 FS0Y3P+iaXnO0Z27o4Wi8eZuxwEq0NCBBaaDcyMqOPJSygadsGw/aTgtGQ/K7RsQKdElOP2Ynbav4zNHPur7s0Rnvmg9huvRlq3QWNGHNsll/LWa14ZQTRU9
 O+lRaM8ZYGBDMowrG1fjvVrDGQq/eOeiMxEBepap4S598PmjbsFrKP0l9HSs9W0COynpgdkxpdCBZDK2Cvj916dqZsyKr8y5tH6bQQpnasCGXm9fuegqo43/
 I85okESCHAmSXW71UcHjBCjrOuSumfl0lpgRibm3p3ksSfmY0iRRhzaqYEZdVJuckQf19CB1awPKwGb1beUmpvQV5+ZqZosaRFu6yLoxD8fUcXAIZw9cm0Zk
 bYPKQJOjbk8ItZbRUp19cZbkNq2gXv0VzKwyvSeQT7w4rHuPxzmG/Jpmvvt6RHCcs/fOploYXnR6mC/pAtAXa0J2fGBopf2FH8dmCRGjMCwtLPrxb56pnAXh
 ctXkVf0LIBieUHXhRHlg3UA61rUVXZpQWuZVQUZW8DwWFvRR+xod/qBwbdcmVKJNofXww31+rIx0S+fqLbOJo8jLSetq0rOEjmGKUM5LGRIWNDeGO8YVYSOw
 aQ3a0Fzs4liNWfa0mpezDTPlPxKVBawpBqUL20upKkDI2nlSTeQlPED36vMAoNMWMAsm6Apq8A1NAcL7EAw66jgbyRkcPALTep4BDQ8kmFd4xYBWQM5e5B3e
 dlaCQFa3G5kGmx953OTS4zNRI74grFMOAxFaffsNY8nR1wCos6wK+MVfUW64w4Kd4x1oqs6kSOgHIvV2XhUXRN9tpwydW+5xmzdAQwWRrt25vhYswi36YzS1
 xbhTu1pll2XPpgnv2EbBuPEwwcEsv1tDNQKvXlQiFdyre3u1b07uSGyZ14QmYlFwEMy5ZPnDE/Rc2+ToJq/gZ1NcpBXWG7jydwMB5a5ZvqlM11soaRb90U7S
 yXTzxIKz8YEiamdXmlWVSqwKd9643psI1bLohhso2EZiYhnxxD/1BZmF7NuEY1jdf/WPl0u/5TDrMj8B/rAcj+5ac9l/8iAcC5uYckkkvRukvnIj8B+V9S3O
 xdrCCuYONXa+fmYEc2ihtmmnGmQhvFz60GcvwuvL3Sy197LN2zk0bNb4i1c24A8gsY7V90Q0oUHb1cJblhdMI67wNs7ODu2oxla8o7XDnRjN64mONokj92ut
 knsxqPNcO1ASnpWsIPnInTrBR1ZirWX3lbaBROI9lYkpirUi4qAUS9QduzQ/I0eczksMdoQ32Pk/Wn4atbYxOhl9xxwuthSUdZp0Fq74IaIH8CuRG3ChVjWM
 yZXtYv/E3Sms3gJwuCKWsfkIFKb8JVcXaRA9Z5+o1XUHEhGsCQwV7WE093K6sT3KFWDQPHpeM8Q95ISnbdqsuMONdwra6r9zCNOBXHhKqr0pQ4BBhtBFI0/+
 b19SF+ZPKxO22RhzHefT1ouwDFJz3DlW9cKIpW0vsG401RcuS+al1Np7/FYZkiVBvldXI5nJ2gpXEvderujPLKAWJWBjhAdA7jkE/6qsGBV9GIcVfRPdXw==
Subject: [Buildroot] [PATCH 034/102]
 board/friendlyarm/nanopi-neo-plus2/genimage.cfg: beautify file
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
 board/friendlyarm/nanopi-neo-plus2/genimage.cfg | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/friendlyarm/nanopi-neo-plus2/genimage.cfg b/board/friendlyarm/nanopi-neo-plus2/genimage.cfg
index fb871abd43..1c755c2736 100644
--- a/board/friendlyarm/nanopi-neo-plus2/genimage.cfg
+++ b/board/friendlyarm/nanopi-neo-plus2/genimage.cfg
@@ -6,6 +6,7 @@ image boot.vfat {
 			"extlinux"
 		}
 	}
+
 	size = 64M
 }
 
@@ -16,14 +17,14 @@ image sdcard.img {
 	partition spl {
 		in-partition-table = "no"
 		image = "sunxi-spl.bin"
-		offset = 8192
+		offset = 8K
 	}
 
 	partition u-boot {
 		in-partition-table = "no"
 		image = "u-boot.itb"
 		offset = 40K
-		size = 1M # 1MB - 40K
+		size = 984K # 1MB - 40KB
 	}
 
 	partition boot {
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
