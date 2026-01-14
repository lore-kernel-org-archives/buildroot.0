Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3982D37E59
	for <buildroot@archiver.kernel.org>; Wed, 14 Jan 2026 16:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DB2D4EC28;
	Wed, 14 Jan 2026 16:00:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hGTwr1TAzFjy; Wed, 14 Jan 2026 16:00:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E55D54EC22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768406423;
	bh=CJBz1oOOCaWOSLAaC1Ef3QB/ZvFl3bUWKgiz5bZHi78=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b4KZuoz/1WnuEhtsPyXhthZ+i/SeF9OtYOmIkJsCiM+ywhHkZvDrKdcXw6s+VFOXG
	 xqBWHKEkCzlDOIJJt/xfapVnCkFdKupxfcaUw07RBaHX/+gZBoaKlqFvvom9+M60Pl
	 oscGhx0pgcxiW+Y2cnYLEU+0qxeddZl9NesxkMfso7E+bGY+OIcwtLcRsqJ4LAWAVf
	 sTHEL18/3HoXhiVsFwq/+3mTtMpT1yoFDwogSYv8LLRMIH9NL5LJXlq8CJNzAIbyf3
	 iGcEcx2iw1tYyz32FaVzQKHBRltoh9o6zv4qIrrTAskZhFMmIspB2H7bH7eRzdCvL0
	 8BBqdmqlQl2Bg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E55D54EC22;
	Wed, 14 Jan 2026 16:00:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 50B931CC
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 16:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3319660067
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 16:00:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rdGnQ1sKHyLX for <buildroot@buildroot.org>;
 Wed, 14 Jan 2026 16:00:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::e33; helo=mail-vs1-xe33.google.com;
 envelope-from=gilles.talis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3D94160595
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D94160595
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [IPv6:2607:f8b0:4864:20::e33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3D94160595
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 16:00:18 +0000 (UTC)
Received: by mail-vs1-xe33.google.com with SMTP id
 ada2fe7eead31-5ec96028b32so5480345137.2
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 08:00:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768406416; x=1769011216;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zGDDocStEkKbQvfXqrv0wdOU988+Q0q0nWSTRr/LXqw=;
 b=fwqKuoWJam6U+onhQVwf/ee52G9/ViTfeLllfIoXpbSFy4l/Hk4jTBRptBKm2GZVWv
 rK0qkqT+E4+i8xU/8R3lVDOlDe0+Su2lPpMz7JIUeI9uxu9rZhi4jjzVEE384qIqrl7I
 jYMTvuFTytxzqzmoVfXRmdtTi1bpO4dJPEg9GNMwYkOgXnuxWVOdUOFjR4Nln64zIBJK
 r0DhXU3KSjHk4UVJeKwI8SdTmGADbqPKjdMzP7WFor0l8KWQ8BtIHOZl0F6Z2gUcsXGh
 hMUmfZd0oGdBFjJ9UK2ir0TKwjQdzFw/L9BMGyD1HrE/KnulefIFy9sNMgGU2+nOk3Kb
 wnmg==
X-Gm-Message-State: AOJu0YzZPTpa9Xgn2ZmDw1ifOhKa+QHBICG67FMAmwQTMDyB26bnfAgZ
 +B93iXHOg/88FwoY6wcwSQpkYp+Wyko1gdc7SrzjuvDcoBHAgko7rVjghxp4bDNJ
X-Gm-Gg: AY/fxX6YuMBMba8fetzD3xI1WGrdHBqfs8hlRdoQWK1GY58Bk07jiPChfgXr3MGjLdi
 RT0S0ne1dB6pWCueXrDOVHbDgYNeI1hJQ/p284wI/ax426jgn03iK6JPvClQIfMYzGB8mziORmC
 3ON1BDTQShcxW7mOM/LihU/gDHu2+1ugclMqA/FgdTdF5Ysgnd4sKPjseZeJvLEBJwJiDlBVm5s
 xvYkzs/2NZBRdERaIxyeLKCnQTDvWTsHGQeuyB9Q4LNPDD9ezKa5e4yEfHJfCsqVUIjNqSMT47+
 wrfUSSDm8W6NxM9gUcPEZ/XsbTcdgthwLXW7tFSsSIZmP8v0Te/4XfEnCKh7FfERpc9DQ/8y8ti
 tNhYX6o4Dn+vB30cFn2uTnfXSifdn5h/TNcPoqCwMKPSrkwIo9t4WoHHk+5Gl1u/irKugYzI+gC
 EpYntL2nNWieHlcxrzp18GpYFYIV+WRSM=
X-Received: by 2002:a05:6102:3754:b0:5f1:6c5d:9b28 with SMTP id
 ada2fe7eead31-5f17f44450dmr1398613137.15.1768406415948; 
 Wed, 14 Jan 2026 08:00:15 -0800 (PST)
Received: from localhost.localdomain
 ([2605:59c0:1498:1d08:895e:f475:13ca:a6cc])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-5ef15be79c6sm16622411137.12.2026.01.14.08.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 08:00:15 -0800 (PST)
From: Gilles Talis <gilles.talis@gmail.com>
To: buildroot@buildroot.org
Cc: Gilles Talis <gilles.talis@gmail.com>
Date: Wed, 14 Jan 2026 11:59:45 -0400
Message-ID: <20260114155946.70930-2-gilles.talis@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260114155946.70930-1-gilles.talis@gmail.com>
References: <20260114155946.70930-1-gilles.talis@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768406416; x=1769011216; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zGDDocStEkKbQvfXqrv0wdOU988+Q0q0nWSTRr/LXqw=;
 b=mkvUKQ2Ms9ca0uHJcplkp5VhzDWoE5XwOBLyJi1E+Ai1rAsPo9gnSOTkpg5TwLFtuT
 MP/oLEaMVMOvcR6bmHkKsY6M71Ucku7MEGTGQJuZgT+HzlKMGWHcO12ODegbr7f1G3yP
 DGAaoAuaR4xlsBROvH+GSsRkIv36CKnvIiyBGslOwGxON985L3qFPdhxVCkooRG5ajG1
 gDqoE8m0FlWgG65/+wk0w/gbOivwBPVcPUWmSet7VcK0e4xqvuDNl71WRmL7m2lps8b8
 KTObQaDeO99MEv+D3qxREhQRtgNvBCpI0yXHUJWJO147aplfLExRXap4M3KfnrBxvJHz
 uBRQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mkvUKQ2M
Subject: [Buildroot] [PATCH] package/tesseract-ocr: bump to version 5.5.2
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

Change log:
https://github.com/tesseract-ocr/tesseract/blob/main/ChangeLog

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/tesseract-ocr/tesseract-ocr.hash | 2 +-
 package/tesseract-ocr/tesseract-ocr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tesseract-ocr/tesseract-ocr.hash b/package/tesseract-ocr/tesseract-ocr.hash
index b45e892966..fbc209b892 100644
--- a/package/tesseract-ocr/tesseract-ocr.hash
+++ b/package/tesseract-ocr/tesseract-ocr.hash
@@ -1,5 +1,5 @@
 # locally computed
-sha256  f2fb34ca035b6d087a42875a35a7a5c4155fa9979c6132365b1e5a28ebc3fc11  tesseract-ocr-5.5.0.tar.gz
+sha256  6235ea0dae45ea137f59c09320406f5888383741924d98855bd2ce0d16b54f21  tesseract-ocr-5.5.2.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
 sha256  daa0c97d651c19fba3b25e81317cd697e9908c8208090c94c3905381c23fc047  eng.traineddata
 sha256  eac01c1d72540d6090facb7b2f42dd0a2ee8fc57c5be1b20548ae668e2761913  fra.traineddata
diff --git a/package/tesseract-ocr/tesseract-ocr.mk b/package/tesseract-ocr/tesseract-ocr.mk
index 81a1e8097c..4f5be993dc 100644
--- a/package/tesseract-ocr/tesseract-ocr.mk
+++ b/package/tesseract-ocr/tesseract-ocr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TESSERACT_OCR_VERSION = 5.5.0
+TESSERACT_OCR_VERSION = 5.5.2
 TESSERACT_OCR_DATA_VERSION = 4.1.0
 TESSERACT_OCR_SITE = $(call github,tesseract-ocr,tesseract,$(TESSERACT_OCR_VERSION))
 TESSERACT_OCR_LICENSE = Apache-2.0
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
