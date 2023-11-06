Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B112C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 20:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1E1A408AD;
	Mon,  6 Nov 2023 20:15:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1E1A408AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HeXythe5zoZH; Mon,  6 Nov 2023 20:15:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07917401F0;
	Mon,  6 Nov 2023 20:15:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07917401F0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AF8831BF3A4
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 20:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E4AC401F0
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 20:15:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E4AC401F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lm1cC3axLghR for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 20:15:16 +0000 (UTC)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 59A3B4013A
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 20:15:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59A3B4013A
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-32da7ac5c4fso3019858f8f.1
 for <buildroot@buildroot.org>; Mon, 06 Nov 2023 12:15:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699301713; x=1699906513;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hGuMOAURrvZG+pXk0TujADnUBbc5HC5dfm+Q68PeSsQ=;
 b=hOpgWZHF+eNWjUVe1ffXCcSCg6y8IJthOq6Duj+UJ8rwJzycMgCql379HhJf/+BI9z
 lBRlgcIFErwkshkCbo5sOOJoE3j2YJMElZu20Ya/kiD3Y7aHI2FziP0MeJdlvq5Tzi4I
 ULoa5ZtZTImM5cVXvkgUDJmgbcDw0DXhDy28enWjSGFTf0RkI03zgWrJfPJGaqQRWJMk
 vdj0byAHYqum12OEmVT4QNXrjZGFVLZsWkrYBgEzaKrto7dXrm74n15rb+mfGnK20Ocl
 2MCnzlCupF4j1iv1y8hErpyEBAyN5G8LQR+oea2MYiQPbIxntKZBUG30ZU5gBlG2u1PM
 JSqw==
X-Gm-Message-State: AOJu0YzvXLXeTzAvk9rgA+giIOETNeuIzfysctsFuam8hkoK3V4nXo31
 FUvme0Lmm0M7AAS1m0TQQP6RtIVxD4w=
X-Google-Smtp-Source: AGHT+IFMmDw2xib8kjJ/MsxmKpgFEkVJHtvDBqBC3QxCtPC8UsidHXRFY3cWiue2qWQgjdER82/JZg==
X-Received: by 2002:a5d:4c91:0:b0:32d:aabf:1db3 with SMTP id
 z17-20020a5d4c91000000b0032daabf1db3mr21953372wrs.24.1699301713023; 
 Mon, 06 Nov 2023 12:15:13 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 y11-20020adff6cb000000b0032fc609c118sm444524wrp.66.2023.11.06.12.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 12:15:12 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Nov 2023 21:15:09 +0100
Message-ID: <20231106201509.8600-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699301713; x=1699906513; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hGuMOAURrvZG+pXk0TujADnUBbc5HC5dfm+Q68PeSsQ=;
 b=Z1unS+1jiwo/I1MFM6Rx52VqxfT/xZuDN1bylsfF1L+K1Owis5y5G37VVxv2rQnPQc
 2ilqZ6ZR+sdqt/g0gje8UtnUoDBwJscIv8AxSujH1S/QmxptMRmz96IYJ4X+Uy+Wf8D0
 Ptg81YIGBc1uTHXD1o/v309yhCv5OChuPUFPLDHocQKH8bIb2LCffsprtfQ6urpUmvZV
 l82MbraXltyjDR3Q2/Xxnr2b8XZLHqpL6IllZf7gZMSy13m7S5hkAqIaEPs0ypfoCPzD
 ExbRhec/DyVViN7CJ/6Mx/aKhyj/Y5t0aaJjnLZ0TiJrwf1FiBlAuehKYTm8y+i9WEW5
 HWCQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Z1unS+1j
Subject: [Buildroot] [PATCH 1/1] package/nodejs: fix legal info
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Daniel Price <daniel.price@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For an unknown reason, hash added by commit
c1d5eada4d4db9eeaa1c44dd1dea95a67c8a70ca is wrong:

>>> host-nodejs-src 20.9.0 Collecting legal info
ERROR: LICENSE has wrong sha256 hash:
ERROR: expected: a6871483905199033882d66453649675f0e88ffaa07f9f8acb257ce7504bc758
ERROR: got     : 93ac846282ce6c5255e00fada2fd2e7e292255239fe58d5502b0a554859e6a3e

Fixes:
 - http://autobuild.buildroot.org/results/a199f128bc1d59a311f3ae683dcc14a1d6f3bb7b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nodejs/nodejs.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index da027cc17a..2d60437a7c 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -5,4 +5,4 @@ sha256  3c6cea5d614cfbb95d92de43fbc2f8ecd66e431502fe5efc4f3c02637897bd45  node-v
 sha256  9033989810bf86220ae46b1381bdcdc6c83a0294869ba2ad39e1061f1e69217a  node-v20.9.0-linux-x64.tar.xz
 sha256  a23d96810abf0455426b349d47ce5310f33095b7bc0571b9cc510f481c3a4519  node-v20.9.0.tar.xz
 # Locally calculated
-sha256  a6871483905199033882d66453649675f0e88ffaa07f9f8acb257ce7504bc758  LICENSE
+sha256  93ac846282ce6c5255e00fada2fd2e7e292255239fe58d5502b0a554859e6a3e  LICENSE
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
