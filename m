Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE6FFC47258
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 20:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DB7960A80;
	Sat, 20 Jan 2024 20:38:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DB7960A80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Udm-zNyPH8c; Sat, 20 Jan 2024 20:38:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C148460F25;
	Sat, 20 Jan 2024 20:38:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C148460F25
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AC8AD1BF31E
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 20:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8525A4013F
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 20:38:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8525A4013F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Uyi4vRBXs55 for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 20:38:11 +0000 (UTC)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 42E2C40012
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 20:38:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42E2C40012
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-339208f5105so1533817f8f.1
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 12:38:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705783088; x=1706387888;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HwkDS2afuYWuGGezqaIVm1lbxzVD81oFUbwFiWJy09M=;
 b=Cic6j/ku3atMqycOzEcDa1Q8j1z4CrOBU8oqFs20k04m5etJ3GHI0wXvD/e4Sz0G9H
 YIR21c5t7Tm3g9/jX2x8/XWpQ5lHJ6BO7FTqsoS6Nk2sgpvWrmoo5uM+LPPKMLBmbYvu
 LXzrP4BCr8Ie7+4hL8KhVIr6lndh1qGBGiSsfeY0v50IwrcjAuBZmmYePjq9+utEooj3
 64md5cuH5dzUAZqelNMDwqibQ/J/dUNG25yeLWHtpLhs9MHW+4CXB7OzYy0HtD5hbv2w
 c+qVGSpvSrvBp0lRYCKPpjH6ubKm/E711an8r7X0k/4ewwc/cyCFstivQm+ciYvhlblT
 uBcg==
X-Gm-Message-State: AOJu0Yw8AWr6D2Z2DINjBNmGctSg7nNzuC7WjMR2pK1p1282Nf9l14WD
 AxUmzwO83NmuOr2gyj7fMIAvd554ZJgsc+yZ0n45tcmDDM/1YSHZArESEMLz
X-Google-Smtp-Source: AGHT+IFAR+z7+d+afGlZcT/YaKeqtXddIZlkwOieSw0YjCYH3fSrbjceQM6vU8hALG1Yro7WyIC8WQ==
X-Received: by 2002:adf:ef89:0:b0:336:d9cc:3050 with SMTP id
 d9-20020adfef89000000b00336d9cc3050mr676783wro.126.1705783088221; 
 Sat, 20 Jan 2024 12:38:08 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 l20-20020a5d5274000000b00337d1c832basm7033257wrc.113.2024.01.20.12.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jan 2024 12:38:07 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 20 Jan 2024 21:38:05 +0100
Message-ID: <20240120203805.64729-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705783088; x=1706387888; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HwkDS2afuYWuGGezqaIVm1lbxzVD81oFUbwFiWJy09M=;
 b=HzEAMPRyOblCY/W6oxADdJEDVyE/Vpv6AXpG5Gsfh3zBNMKBApbpZvQeR8yA11uU0N
 tgiTWKIjUUvdAldObBeK7Gty5UDaBnSCrkeJZmzO1QF4kfJstbjss8AJ0CmdFS6nD9vg
 2t+5XoEIiyZA2LwVtcCU4aFCfVdCZtWWsXoy5/dsw+m5UTsdgKilNiDFWf89KRW1z+Ug
 lay3zLCqiTZ55K6ZVw423gYIPXvWmN4iG2aNI+idBPvUQzcMuz2aqlR9iWEirRDH1bSk
 mADtpUzaKhWR1eGYGd4VwYGqRDVPQZIpJFKXyhkwi8iRuRtLDY9WjIAZA9yWq2Xyk4zv
 kgfQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HzEAMPRy
Subject: [Buildroot] [PATCH 1/1] package/python-numpy: add CPE variables
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:numpy:numpy is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/C19878E8-7FFC-4BB4-B1A8-F396CB169DF2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-numpy/python-numpy.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index b52e0da17d..383135f9fe 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -14,6 +14,8 @@ PYTHON_NUMPY_LICENSE_FILES = \
 	numpy/core/include/numpy/libdivide/LICENSE.txt \
 	numpy/linalg/lapack_lite/LICENSE.txt \
 	tools/npy_tempita/license.txt
+PYTHON_NUMPY_CPE_ID_VENDOR = numpy
+PYTHON_NUMPY_CPE_ID_PRODUCT = numpy
 
 PYTHON_NUMPY_DEPENDENCIES = host-python-cython python3
 HOST_PYTHON_NUMPY_DEPENDENCIES = host-python-cython
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
