Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68968C19F2D
	for <buildroot@archiver.kernel.org>; Sat,  6 Aug 2022 22:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4EBA81761;
	Sat,  6 Aug 2022 22:06:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4EBA81761
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JmmAOHUK6Y9a; Sat,  6 Aug 2022 22:06:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 200E48174F;
	Sat,  6 Aug 2022 22:06:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 200E48174F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0B7991BF307
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 22:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA4FC4013A
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 22:05:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA4FC4013A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 40FKChMOZMWn for <buildroot@lists.busybox.net>;
 Sat,  6 Aug 2022 22:05:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD36240117
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD36240117
 for <buildroot@buildroot.org>; Sat,  6 Aug 2022 22:05:56 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id q30so6848168wra.11
 for <buildroot@buildroot.org>; Sat, 06 Aug 2022 15:05:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=mEAD6jpz5Uh0mQYN1EFbYUzChUmjFpb2AxUxcjaM9Xc=;
 b=DAzEiMUWohdqR0p7DLd8/JlJsa6jR/AgXvTV5ol5ZhVQA7CemIhrbSoVv5WBRops+b
 34OwsoVIKkbh6V/TSp/h3b3+p6pVE7QYtWbB7KoSqaGMRAgZmRChnGf+pcPpkOMYONE6
 eQgHfUokI0Jpl2bnvNv1TvvUSDVJDS0WN3ddEJVATFSM7GXOeEMlQi1Ssl2TN2rw3csi
 jvth/78T3+rjI7s0IJ8c6SBuRrnzGqc9xNUYRJlJAZgVELTYQCdXcnCtJBibNXKQ7gaD
 jRqZ/XNKwbQwUK48Y/AugvdBxfAq2UW1zyGRdFZhMwJ6DMGa30x/+o8mLqZmOv5zjFdp
 1AQA==
X-Gm-Message-State: ACgBeo3ULvOtU2pz54A81FhYBlCk1WeqUyQ3+Wfte6FfS7Ro6bEJtHAS
 oWnsQHOXNy6yQBhqcvSf76s40LlGYS0=
X-Google-Smtp-Source: AA6agR4OJHoaM7XQ0LtNjuLtV0+YRdzMEmi77Xy8+MY/MiwShVoviFp6NOqXjMOEb9d0s2CacKsWLw==
X-Received: by 2002:a5d:4906:0:b0:21f:dc9:8c86 with SMTP id
 x6-20020a5d4906000000b0021f0dc98c86mr7425815wrq.285.1659823554675; 
 Sat, 06 Aug 2022 15:05:54 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 t17-20020adff051000000b002217e3f41f1sm3516915wro.106.2022.08.06.15.05.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Aug 2022 15:05:54 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Aug 2022 02:05:37 +0200
Message-Id: <20220807000537.182514-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=mEAD6jpz5Uh0mQYN1EFbYUzChUmjFpb2AxUxcjaM9Xc=;
 b=IUFjaOzZFUhD7xdb419i8bC37EI7dsHsMl45ZINN2Nzx/SAc0kh6ndZ9OQcYxs7Eht
 twlgJxCkhKthuAwML25rf6qY20hKruVHQoyCx6FxOm2Skl44v3wVJk0WivfnemiOtmeg
 dhRixB9lmgzzQR/ALM58EwsFTyr03vkKOyfuYwJ435//cgq14bvfjcVJioLP0FXm5U/U
 2TiucPJDHj+rJEWrro112ZHHcJ4zFwgy8PcxqANJVOKhUC6Sk67h1qHhXP/ZfexRLW2z
 gI1NmGjlGHUnTZLnWwF95lLVRJqQ8mTxeyTVlSChm5AQoDDyOH1UCrhTFKJzj2/qflAd
 0QDA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=IUFjaOzZ
Subject: [Buildroot] [PATCH 1/1] package/python-scipy: add CPE variables
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
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:scipy:scipy is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ascipy%3Ascipy

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-scipy/python-scipy.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-scipy/python-scipy.mk b/package/python-scipy/python-scipy.mk
index b5006a2e15..a8c23c6c88 100644
--- a/package/python-scipy/python-scipy.mk
+++ b/package/python-scipy/python-scipy.mk
@@ -22,6 +22,8 @@ PYTHON_SCIPY_LICENSE_FILES = \
 	scipy/sparse/linalg/_dsolve/SuperLU/License.txt \
 	scipy/sparse/linalg/_eigen/arpack/ARPACK/COPYING \
 	scipy/spatial/qhull_src/COPYING.txt
+PYTHON_SCIPY_CPE_ID_VENDOR = scipy
+PYTHON_SCIPY_CPE_ID_PRODUCT = scipy
 PYTHON_SCIPY_DEPENDENCIES += \
 	host-python-numpy \
 	host-python-pythran \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
