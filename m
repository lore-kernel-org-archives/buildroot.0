Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CF7C87FCD
	for <buildroot@archiver.kernel.org>; Fri, 25 Jul 2025 09:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DE5060B07;
	Fri, 25 Jul 2025 09:48:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3XmW_g6EbI5M; Fri, 25 Jul 2025 09:48:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48C5960B39
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48C5960B39;
	Fri, 25 Jul 2025 09:48:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 78454909
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 09:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A0D541B63
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 09:48:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qaoEMXKlzWG5 for <buildroot@buildroot.org>;
 Fri, 25 Jul 2025 09:48:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B49D54124C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B49D54124C
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B49D54124C
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 09:48:12 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-acb5ec407b1so329503566b.1
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 02:48:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753436890; x=1754041690;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4TCa3wD1s6D5vUajyv6fvm44r9R70cwO/Af099jotkA=;
 b=OFYX2BnfYMyP7f2+XkFRiBOUDaEbWKpuFcs+w9d8KOPHoc25S5dIVT2WvTuMJ5g/KM
 aikT1GnHt7TgFsZWchqEshM+3EYUu0leSvUDk902OR4ZR9co9hsa0qT7dmOBajJeZgUm
 scfLNSpY8h7yVqV2a64O8b9Ttz+QKATpAOzSfIIXtl4lsWnzoK3F6fx0Y4abxhicRbDd
 FH2FK1WshCoqei5ZAPJd4DCWWkz+15qFfJBtFvaiPdt8ax3OzRg5kEHQt8wkGc07m5MR
 F3Ne+5NxPQGIEaG1UOGM64Dtz99KLbOFUE1bhPi1+lhACxoIE0+KFhMVRYszCzWTUX6S
 nVPA==
X-Gm-Message-State: AOJu0Yw0EU+J6s2znEV0Yzg1HWymLJtUZ03kUkvGUu2bqSeMfJpzQ/Jt
 xI+uWO7ox3sIvnie2xOaGSGOHG6RfvWeaHmbGzY7xWdi0ZJuWO1Vgn35D7xX+g==
X-Gm-Gg: ASbGncs1HytHZSEEUM7Zzf8SuJihQZKdUrc3JZ/EVOtZOwrR3A8Cws+bTXf9RcdNqeH
 7TxRPOUvD963lraSscKLBJ58iMdt/pBaxSq1bWe1jYbRgeYJ4E+n15hmzmxAtDuY5cJgBOmm5M9
 TMwPyy7LsEqA6NCaUvACGAa90BDSbEOBvs8+nGlV/BHy91KNaYhWyYq4+F90lFKxY0CJB6wo9e4
 XyxZSiWcpXbpCFqsGVlbekZ0UhQFmS9ehN120+oohP6IuQ/AzkIqvWuIgWO948myvt09gB0A6SO
 UJU9LpUGlX/EN94JF+jOqX1MiXQHXnFc+ByVaKMou3EgTxKfbtWFO2vaIab6QpcI0d3RKT6/3yz
 xXn1KOe6YDBnx6kmYhjK/S6qFc6Xphcf89/12e5VGPut5hGZdmeRjOJKNh8FYz4/bKknXBeJc85
 wd2pw=
X-Google-Smtp-Source: AGHT+IE+LnJqnvscd0sEb0ClqGT7uKHSbnMn2iK/fZJ3HsiVve9TKpUR7JhY93f14NR+TW/T9bh8sQ==
X-Received: by 2002:a17:907:da5:b0:ae3:75e5:ff7a with SMTP id
 a640c23a62f3a-af61b6dd540mr158053766b.19.1753436889989; 
 Fri, 25 Jul 2025 02:48:09 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af47f8611a8sm243993166b.106.2025.07.25.02.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jul 2025 02:48:08 -0700 (PDT)
From: yegorslists@googlemail.com
To: buildroot@buildroot.org
Date: Fri, 25 Jul 2025 11:48:02 +0200
Message-Id: <20250725094802.3695163-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1753436890; x=1754041690; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4TCa3wD1s6D5vUajyv6fvm44r9R70cwO/Af099jotkA=;
 b=N6hd4P94UzuPY9HUSZP23F39YEz0t0wEIzxyMBfoE2TzDPPp3OMm5Rkrpu1kvRup4f
 Gsqd1m1QTBIeBMrHV1RJ9aTLxnqSpIeYf9o9UlcE4W1ewp5VId6aIBl4wGSjUP4oAJIu
 YBCdKJokzNeOUxwZ0zdg0UKPl5mtli5tU96MAoKhFJKZHxnldLdZ4fnMOORFMLUSPWIw
 O9KiMVWm0QxWh5HTVN4aTGFERgmP2csPOUEUjbiBGP7W5Bjq4MAZzVOuManzkP4a3WHe
 5PlvoZYoCB7bJfhzZjkOCc0PwD00qnnjCPghz9gmzP/lzW5VNcnOHWyhLNGEGzBSin9l
 bOZg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=N6hd4P94
Subject: [Buildroot] [PATCH] DEVELOPERS: add Yegor Yefremov for
 package/libxmlrpc
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 32ed4acdc5..12a41597af 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3532,6 +3532,7 @@ F:	package/libsocketcan/
 F:	package/libubox/
 F:	package/libuci/
 F:	package/libxmlb/
+F:	package/libxmlrpc/
 F:	package/linux-firmware/
 F:	package/linux-serial-test/
 F:	package/lpac/
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
