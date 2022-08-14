Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56EA1C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 23:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06A7660C1A;
	Sun, 14 Aug 2022 23:42:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06A7660C1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4u8WKQuTZ_OZ; Sun, 14 Aug 2022 23:42:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D74F60C09;
	Sun, 14 Aug 2022 23:42:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D74F60C09
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3BD871BF2E3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 169D160C12
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 23:39:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 169D160C12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TY0eLGLfDJhc for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 23:39:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DD8660C1A
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com
 [IPv6:2607:f8b0:4864:20::929])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0DD8660C1A
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 23:39:54 +0000 (UTC)
Received: by mail-ua1-x929.google.com with SMTP id c19so2337643uat.6
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 16:39:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=mErodxolRQDmsUgHkaW/uT0GPEcjICJ22x9AA9m5myk=;
 b=wVdWiZv9JbLyDi7vCi5YebgtbSt6HWLbsdtyhrNPrUOaP6zEKqi07FqV4TuR6xN28A
 K+j3+nGU4AqMeGyZcdQeq5gG5DWWCk7cdmNJ8aISAXJjZRryyaJuhLD0oCg1m7ZVsj1/
 2is9KKPeKYOr34J7kB8OaCne/r2QssJOCQDTUyp6Cs0KIfmp0sFqfbV2Sv90mY7D8WRm
 r+VuUjY2rENtctzu9C0ogmRfRPFvof7/HSRI1Vh23Vr6uKm0+mTHkmA71PbB0b8Bky0L
 t+uPnfuStFxOA04/JDxwWL6XLYxiZEv2NwaFoSOVDm/6jF1oXF4JfzsYIWcBtL6c1QLp
 eliw==
X-Gm-Message-State: ACgBeo26ihLHojoEWdWzHDx2LdM0pywa6OQhJJ3QO/0Y9kJvXay3ecxX
 pmY/yWYewpFXS4Z22hOtcZUqGNAc8rQ=
X-Google-Smtp-Source: AA6agR4TJm+gc/xwFLFz79jZpb7pZIiqgcXF1vDmWbntDHtRO058zKO861x7ApDVFcPJAp1J0g0lQA==
X-Received: by 2002:ab0:2415:0:b0:387:771b:4a02 with SMTP id
 f21-20020ab02415000000b00387771b4a02mr5419521uan.28.1660520393137; 
 Sun, 14 Aug 2022 16:39:53 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 z15-20020ab020cf000000b0038342b58f6csm4037769ual.17.2022.08.14.16.39.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 16:39:52 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 20:38:26 -0300
Message-Id: <20220814233845.2247022-15-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
References: <20220814233845.2247022-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=mErodxolRQDmsUgHkaW/uT0GPEcjICJ22x9AA9m5myk=;
 b=crhX5yrK4YDzyvra/xhdbZPE0oSt/c6EjzX9D417lTqc20BOjY+2FPesQlNtoePIwn
 P5rMivv8y7uB/T/Ql9jeQmI2m3YB2V25O1nAjg6kgH1Xcdbo0CYp9XLzGNtm7Mzxdv9C
 zlHgGbRdFOVcft8EwgdhUymBhRwpM6XhMcLbsvZ/6n6uF7oAC7mFmZgZvTE32GuloKPV
 PSdXPJBTxjVWZ1FySZ6NkL0ghKeWg+V6g7cgmgiyohTXVLX9JTf5rANSBEWApfX0tb9k
 /0lm1pAecOMpBidRUgVMinUN6AR3RP8OJ44gncDIUkdIpkfBXkwcb4tAy6zFVeqEyObf
 DfTA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=crhX5yrK
Subject: [Buildroot] [PATCH 14/33] package/tesseract-ocr: fix typo on
 BR2_PACKAGE_TESSERACT_OCR_LANG_GER
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
Cc: Gilles Talis <gilles.talis@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The typo was added in 2017 by commit
'd1103eeab3 tesseract-ocr: new package'

Cc: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/tesseract-ocr/tesseract-ocr.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tesseract-ocr/tesseract-ocr.mk b/package/tesseract-ocr/tesseract-ocr.mk
index a7498931fb..5e9da0c648 100644
--- a/package/tesseract-ocr/tesseract-ocr.mk
+++ b/package/tesseract-ocr/tesseract-ocr.mk
@@ -39,7 +39,7 @@ ifeq ($(BR2_PACKAGE_TESSERACT_OCR_LANG_FRA),y)
 TESSERACT_OCR_DATA_FILES += fra.traineddata
 endif
 
-ifeq ($(BR2_PACKAGE_TESSERACT_OCR_LANG_DEU),y)
+ifeq ($(BR2_PACKAGE_TESSERACT_OCR_LANG_GER),y)
 TESSERACT_OCR_DATA_FILES += deu.traineddata
 endif
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
