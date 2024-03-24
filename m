Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04415C47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 21:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA4BB400D7;
	Sun, 24 Mar 2024 21:36:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WoOHOGa4YFIU; Sun, 24 Mar 2024 21:36:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2486403A5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2486403A5;
	Sun, 24 Mar 2024 21:36:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 000D41BF4E5
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 21:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD1C0817AA
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 21:36:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sFUKqZEFIwNi for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 21:36:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8610081774
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8610081774
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8610081774
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 21:36:12 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-341b9f6fb2eso1517359f8f.2
 for <buildroot@buildroot.org>; Sun, 24 Mar 2024 14:36:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711316169; x=1711920969;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z58EUC4IujRF/GRdvyxSjcHqMlhkJKDgXPP/k8PEzVM=;
 b=fl4R3JzrGVeHVRpjAK/7fR5I27+uBk766XPSD0iXpiYo/iFnOeRnqz/zSIdNBeVhtJ
 /FA0KnO6DvZXZt2LKFy6CvFasjLL+7bA0LSlxrJPA42tfCaYWXftJuVKxHVCN4kB1Bfu
 cZ2MpZvsApQv9vroq2TLqAOrwqjSN5bp/5yBa6IluvhuhR5Olbj/7BQGiQvTLj2t+iQl
 TPSm6Q+6x3qHOhHSoMOoeQ7j0FLseEGBvSPwhqlAxzFqX1tvd05ScBC+QRohvn8iB4no
 qcVDbBhQ4WB5VoaXbHD0QFZ/BkDsoMQjw0PyiGnnFcAqMnDD+t9Z0c5H+v89Iek4smaS
 MKJA==
X-Gm-Message-State: AOJu0YyEtCHz+UgHUZ2Ye4kTQxUkZKBMpZBOwpS77juk1BiPXAlw7+tJ
 F37FmWzLKMrQlmGtMGaEvetJrbiRp1EyEA0LfEgTomn3y3EnSMAEUSXI8/Hd
X-Google-Smtp-Source: AGHT+IGYiA0OWSEnQl5teG8VmRmRO2LLcn+sj0/9GNZsKe6CLf0qHBaK0mfRUxwmuea6si3CzKnHIA==
X-Received: by 2002:adf:e90c:0:b0:33e:3555:bb57 with SMTP id
 f12-20020adfe90c000000b0033e3555bb57mr3842604wrm.42.1711316169201; 
 Sun, 24 Mar 2024 14:36:09 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 h9-20020a05600016c900b00341b7d5054bsm6951881wrf.72.2024.03.24.14.36.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Mar 2024 14:36:08 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Mar 2024 22:36:05 +0100
Message-ID: <20240324213605.769238-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711316169; x=1711920969; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Z58EUC4IujRF/GRdvyxSjcHqMlhkJKDgXPP/k8PEzVM=;
 b=UG1MvlIM/KWxqaQIcOv5/J2MTTNhtR7vhzsuBqrgfuGGjz0AbiWZjrEtbmEWKfb1Hy
 ogB8NrxlFBIrHp9hkLhVvOKNw1k9UFPFOF/hYynvY/UJWYG/2IBBH05OzYfh8GIVFoE+
 2Jjr+CAc4bpJI6akV6F9jWKvg557l6ukrIEjpafXSTqm0vJltcZMBBHe90LZrX9x1Np6
 VvcBnahfEiaCQonkpQxkC1XGHWCYdhfwzvqg0hEBfbwWRy3klyCOZovw3RefXGti7Uqj
 zUuZain504g7Ktfb+nIW9R8wO6tgs/xLsaJVay7uIqX+nQ+ifK76qXY3G7DciV6dz2/R
 sP5A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UG1MvlIM
Subject: [Buildroot] [PATCH 1/1] package/dash: bump to version 0.5.12
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://git.kernel.org/pub/scm/utils/dash/dash.git/tree/ChangeLog?h=v0.5.12

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dash/dash.hash | 4 ++--
 package/dash/dash.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dash/dash.hash b/package/dash/dash.hash
index 1803bcdb2c..8ae8a77177 100644
--- a/package/dash/dash.hash
+++ b/package/dash/dash.hash
@@ -1,4 +1,4 @@
-# From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.11.5.tar.gz.sha512sum
-sha512  5387e213820eeb44d812bb4697543023fd4662b51a9ffd52a702810fed8b28d23fbe35a7f371e6686107de9f81902eff109458964b4622f4c5412d60190a66bf  dash-0.5.11.5.tar.gz
+# From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.12.tar.gz.sha512sum
+sha512  13bd262be0089260cbd13530a9cf34690c0abeb2f1920eb5e61be7951b716f9f335b86279d425dbfae56cbd49231a8fdffdff70601a5177da3d543be6fc5eb17  dash-0.5.12.tar.gz
 # Locally calculated
 sha256  254a7894923ff62e69184a991dcbccae97edee58a1105e8efbe78caf10595d72  COPYING
diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index aebfd28be8..f030e4ec91 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DASH_VERSION = 0.5.11.5
+DASH_VERSION = 0.5.12
 DASH_SITE = http://gondor.apana.org.au/~herbert/dash/files
 DASH_LICENSE = BSD-3-Clause, GPL-2.0+ (mksignames.c)
 DASH_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
