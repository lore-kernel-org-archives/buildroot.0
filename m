Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 555A6C433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 23:06:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06D87619BB
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 23:06:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 06D87619BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2D3760862;
	Mon,  8 Nov 2021 23:06:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bRdTsvxOS6yf; Mon,  8 Nov 2021 23:06:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C2A560667;
	Mon,  8 Nov 2021 23:06:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 967321BF97E
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 23:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8284C401E9
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 23:05:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2hyJm3gzBkkV for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 23:05:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C1B0402D5
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 23:05:26 +0000 (UTC)
Received: from localhost.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id kDhZmJJDJNGRPkDhcmjCC8; Tue, 09 Nov 2021 00:05:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636412725; bh=h3/3S1f9y9sSb9d0uj0k5p4QyK34ijT2ZIhhvizAlqM=;
 h=From:To:Subject:Date:MIME-Version;
 b=ip8/rIXOYr5sExnRms71gWGc3x++rKeK9OFk507FCnBJamCEsBx75KqLI7opiLTJ3
 tIiZJ3hrE2Q0CCzd6XdwK7f0zxfLIolIeM2f7f1B6y54n4L5ii/pFhSjSeAA7N1YXb
 DdYoIEO8M3qvWKRHsbomT+kuRczkSLE/2QTBn/EoaLxUfRtet/FP1ESNZ7f634WEdY
 83vVEj02xe5jTRc4FLFBmBUn2tWXkgsY6lb/qqvIh/Pp1RTEnUDkXctFohgI4feVQm
 bU6m5zFNVi8RNv+rEn0DDXqaEDm17zfbM7+m3lWmijxlaTilNUs+J7lxzVAV8yGnXr
 TEVMxvTkpaNDw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue,  9 Nov 2021 00:05:16 +0100
Message-Id: <20211108230520.4007148-4-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211108230520.4007148-1-giulio.benetti@benettiengineering.com>
References: <20211108230520.4007148-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfORXEBI2FHjt8JzBXkCtt3HpzCAw4OC9OedMowSWQC+Q+2iX7VYlBk1xs5rLKzI05GZ00XiNoovyjeVGCIlflDv2n7sf834F4gdpWYr4YIUsVMWU9YYt
 lyTmnds7LKQ4bs/A6tcK/T9ykUeMWcM0m1+l1ohGMmllq60o4ZgF+Ek61QOIwpNpxwPHY3rj3MKH4cSRtP58ekOpRE4OYEFIr1s2JQ1z+mIHXJhOAKKTUMvp
 ylohtGdkMXpz8ZBcXsaijWxbQI0GwF5mQinabYI6WYfp1CpAmA7ePnGqQE5patbLSA+g5Ve+s/LJ6o5QTYgVvRxFFLblRW8gOtvc8KNcaZMZ7d6vNp/ED9av
 /B4CDTz7CpmFyf7vtm0Yn+7WEe/G+10UuHMOvBlMc3Cpo2w+KUUooMuqoQTpDCoEgK1PWjOZmXi6V3/+8wgMSGoaPAgemKh+e85MsR5JMNgTdCBw4tRxONlc
 VgN7vaPCCgxkTtFjqxLViw0V7LI5XC53MilJ0Mti5D0bRu3bdJAv6OEGTsUsjr0g9nVkCj4AA99NK6ubiP9HfXtH9JqzGHMUe2Z3EA==
Subject: [Buildroot] [PATCH 3/7] board/friendlyarm/nanopi-neo2/genimage.cfg:
 fix comment
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Michael Walle <michael@walle.cc>, Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>,
 Luca Ceresoli <luca@lucaceresoli.net>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For consistency comment '# 1MB - 40K' must be '# 1MB - 40KB'.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/friendlyarm/nanopi-neo2/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/friendlyarm/nanopi-neo2/genimage.cfg b/board/friendlyarm/nanopi-neo2/genimage.cfg
index 45d081e197..3163a06592 100644
--- a/board/friendlyarm/nanopi-neo2/genimage.cfg
+++ b/board/friendlyarm/nanopi-neo2/genimage.cfg
@@ -24,7 +24,7 @@ image sdcard.img {
 		in-partition-table = "no"
 		image = "u-boot.itb"
 		offset = 40K
-		size = 1M # 1MB - 40K
+		size = 1M # 1MB - 40KB
 	}
 
 	partition boot {
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
