Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E871FCA5FE6
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 20:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA9EE60702;
	Sun,  4 Oct 2026 20:25:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MsaYHUklD3IQ; Sun,  4 Oct 2026 20:25:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9457460614
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791145508;
	b=D3YNAe5s418Ag5h0/SdNJ27s1Py/1GP4qquRioDJ2hltNy8TSSvORMwHKH8GDa4coN3o
	 +J8dDcGrcWjj5AS+B6ue/eV0mRRhBDH7U/6unE2EwnDkEwtIsXEynYyX6XgguMVEl9Gbq
	 sLMwlGo+ooSqAmoYEUDDCOvxAPIcjP1ZDwDie9/n4X4h5GNW07046QIiz5GKICzdMga8f
	 EwB+j7qHubcqMe5AUo2us2pQXz+BMwCSKYF5P3V0m8iiWIg31R3hsqchLYm52pLybXTb7
	 J45e61H7OBxcKxpMoycByT99WOya1vrhE4/BL1G0LzH2SErtOUx2aeB+RP1jU+TSzZw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791145508;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=QB1BwCyxNAJxisKbtk3ZttZWgXTN0QsliLaf8y41qd4=;
	b=hRDiP15sWjtsTJ9Jbr3UIgVPOh2y1rH4QWNqeiuvBCNW5UQa/huHEkozWW3UiZtR1Y6w
	 SiKaITFHhHdtsN8H5c1uw2kN0pLX+CgvzJ10tP0wApQ1TH20xGDuZqOtVcBoHnh3lELjy
	 HRAsk0QEoEP8lsYzsgYqZC/As3Fx8o4DVmcAy73dFMz0Y5DEeR3X3XlmVHe5uNDMExRq2
	 D5y7BFIpAvbTwy2dAdfpo0SvfMAehE5aGnihBXUEzV84s5X2zfnjLOibR/L0i+b6pNy6M
	 9piSJ5dtw684LhvSWwTCa3WFKIlgQ0JjOIRsqxurS/wb21Kqwg/jARQjGtrWmG4wEiA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791145508;
	bh=QB1BwCyxNAJxisKbtk3ZttZWgXTN0QsliLaf8y41qd4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=e7nKCKB7/UE6b2LsyrfGHS2sq+rqIekO9QWG9DlKuLr/iHDwSaORLHZ6CdS8vTu1h
	 nt8WPGpLnmwaDzz+Xu/72UxHNf5ZWrYkDdwr8lwZV8WkWTKlwYEvhPohmx7kCF9Kcv
	 lJ+y7mXP98gSBWIAX1E8LfHmMdHUaOxmFLiHMOgkDFm30lgZcUwPrguqV8C1NuLBSG
	 7XdzSTHcD6hzIV1qvrilofRqjMDUt7f67HkMvsGXY/E8CU29RoGRCaUrO1BzPP/D28
	 wjFNO0nGJjayL96kLZxUO5EIsAnUmMSrUQ/FVPiB6pFYjTKr2DRDNFYlFmRgiqReJ5
	 ENzQFstUL4DaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9457460614;
	Sun,  4 Oct 2026 20:25:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 73950335
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 20:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59DED80D3C
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 20:25:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s6bJFdoNabUw for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 20:25:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5343780D23
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:30::11"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791145506;
 b=GidyzgpHRVDUG5JtBR4y4nPsPWwRI6Jw1PmRKg4Y4vqrOjnQYqHRUv/C9aoF40vTGCNu
 mD258plAykhi7JD2lUNLgDR2XsrzEedMx+pze3gLwJBr0c9rCff3HGi4tgjVElH1IJ2u7
 OLW9MrGvg+FbYjNO8cJ9ug+p6Aq0kEAt9ZROGZakznjk7WroGO2/7blNQMqv+SNPbTs2+
 Uq8yvWuviSKbZ5Q5sEnXdLog43npkiQyi9CYhmtJTY38fkGK43blDZFFX7+CiY9OAc7B2
 TE0E82DvNUpwXa/8oDiSB/uqEBAieZ/qpuNdKhwgyZIu10Wb9hnVhzXfSlW9sYIfbJA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791145506;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=g+eHyVlfIdFr4PfXsAG5ACVFmxpgs3AQitcF1mfD2cs=;
 b=K64YopSuNddZiHwFQFeqPqT0TDVPsMtM6/wxGoBrzZKxQH7N6K8iRo2xDlwkIFWu5xrz
 cUUBf6pBNbPQ/lVUsymHb91wW1BhLVYn7HlEFf4H33FBm3RRyxREVNfTNoNRDuBqelL2E
 WEx2UqWvfW6F0BI3zOF6uji+PdfPoBYPECOOcW/eFtjgMykZStG24+dmar05JMGJPUlVL
 07Myjz9lJSAgmPNQRSncQ67clfTniJ4FgM35T8kFqPT/e+VRW2CIhpO9g8tRJkd+FYLxv
 YZGcEyiML2XINqlyTS/OpNj4I6G9kLOZs9mC/6SeFONxp2eEMNj1JYMT59yfWwXKW1w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=UIPkVQeB; 
 arc=none smtp.remote-ip="2607:f8b0:4864:30::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:30::11; helo=mail-oa2-x11.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=UIPkVQeB
Received: from mail-oa2-x11.google.com (mail-oa2-x11.google.com
 [IPv6:2607:f8b0:4864:30::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5343780D23
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 20:25:05 +0000 (UTC)
Received: by mail-oa2-x11.google.com with SMTP id
 586e51a60fabf-46ac6e5d8f7so638666fac.1
 for <buildroot@buildroot.org>; Sun, 04 Oct 2026 13:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791145505; x=1791750305; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=g+eHyVlfIdFr4PfXsAG5ACVFmxpgs3AQitcF1mfD2cs=;
 b=UIPkVQeB0NGTV4koC6DrC9xL5zi2CikduCe4sejPTNA4K1EkJtup9J+aJXEsPk5Wca
 QiVQ/KsRdX6JYqmFZJznI9LJDsdp/D6VkKfk+KCABEg7Al+JUUVf4ecxyAWZhZUUPpFn
 YFe97891uED6fN+cbO35gqpD8JNvlKxPb5JYR/F0mrm8C4ZBWRnSo3QYU8Kywv9pTQ1I
 Wsmm0eiJq0xOvtY7lSUfa/i3/r+Md8bql1jSx8hhraRBi/tSgN5Yd5skuY1SZuZQcEA0
 Vf6wlpdyFPa+ss/9NIujeZ1nxbzW40dNrJKf4jgiC2LmfI9NMVVhN2dOssw0wHV934xX
 Y4EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791145505; x=1791750305;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=g+eHyVlfIdFr4PfXsAG5ACVFmxpgs3AQitcF1mfD2cs=;
 b=GNpsd+RWIEl48VWxH52GHOWi48m1k6C+bYT5W0bTyT+DMMfb1WyLylBrOWtpCAStLp
 C8aPHqOcbn5EZox81J10naDeMYtHPBDKPwW01RKpKLQMAkDwcg5Dnrsxnx7s+WzHwYzQ
 mvntHYSX/zjxmcg1ANW1Tv5lgS7/RLe0NlmMh4x5xLG9nTVnFGnGGDJdbNVzGz0chvhp
 iVRXKTS+BDvYMwgeh9HVRKZh1QDO0ilCSAtrQz0aABhbkkdkCA8+dU9r1bnhItX/M5Fh
 GMB3luRms1iwYz3fMkNOQ6nCromSb3RyBmiVmP6Q3KeRJgDA+BfLQAGu6Uu0lm8is7BH
 sfeg==
X-Gm-Message-State: AFuF++m5GokagXAfXN+4OcsRc4yxKHVnG4AKl6Oe8MH0qMB7o95L3Btu
 16vaS4CzfDDTpRaMN2LBqcGu1Rkg2xRX/0X5nu6shBG97x1ADMy5IsFvKiFtOw==
X-Gm-Gg: AYBFou1z779HB5PxF/l2W1cvTdb3uLz5aoQnQeE+entYcgc1HUu9/1J13BRQEH9VTPK
 Uv675/R3MJuoFcgZjC21N7A3rLUf2V995YknGyWXll+cLcnuoYX6ETzl5VhbkYN8l9i3CtrKNB8
 vuP6/3g5OaYrxlft4/xdbStpTVpeQ/tDFaA1N1VS+m51PFl4gl9N+xPGkC2kd+YjNlWXNgP0OLp
 Hk+g+RGbW+y+f6xhxAOzE9qbdKyPuKA4wS5/UzD4gt0hbfjaaGbkthnRi1tLAL9N5M7baOXf/Sg
 kNUKY2m/rvuAfRMLfWWrZda7zUmLQI+aCT74uUYKA6ljHWmFC/gbuAo1Kjb5vtVN/zUzRULDkXZ
 z8VCJX8do0k7LWfLWPNZrFSpXz06FFeybLuOwAPD0+RAusZSOv+LUy+rFkIY37XhV3gcYr4s9pI
 vtJSv4brGRrC8+3Nrc+QlLd9oSoK1EXB6nlk375tmB5nx3CCyiW09G9wQvNooEIhO7pzJovQMS/
 C/X1cWFpevAMjfVVEANeieKOdZPF4JBuxTK7ZJkJ0bt9UGEsdCT83sdbwALwKR/Fi5/AR2+rOVt
 6o9iejQ/DIcG/CS2BtCtFkRt90euSYQrVYf8oiQPKwT0CKCSG7cPcP2P+6kqfSKJHi9/nPBKh7p
 httQeHe4tGFK4Gwww0k5JWayPzTqkTQYyTYBic+GS+A==
X-Received: by 2002:a05:6808:1793:b0:496:34a:d7e3 with SMTP id
 5614622812f47-4f529a18fecmr7378693b6e.17.1791145504838; 
 Sun, 04 Oct 2026 13:25:04 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-4f5251e3956sm7900555b6e.15.2026.10.04.13.25.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2026 13:25:04 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Oct 2026 14:25:00 -0600
Message-ID: <20261004202501.932522-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004202501.932522-1-james.hilliard1@gmail.com>
References: <20261004202501.932522-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/python-cryptography: bump to
 version 50.0.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cryptography/python-cryptography.hash | 2 +-
 package/python-cryptography/python-cryptography.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-cryptography/python-cryptography.hash b/package/python-cryptography/python-cryptography.hash
index 02d199ac3b..ae9444e290 100644
--- a/package/python-cryptography/python-cryptography.hash
+++ b/package/python-cryptography/python-cryptography.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  f4d6d4b4671ebaf2c86f2fa5ec4beac9056f30129fea17338c35c87eb25daf1b  python-cryptography-48.0.0-cargo6.tar.gz
+sha256  3ec3cc6a6ae288ab6ac455e1ef7f124a6858b0482c0db4e161889268f8c1bc20  python-cryptography-50.0.2-cargo6.tar.gz
 # Locally computed sha256 checksums
 sha256  3e0c7c091a948b82533ba98fd7cbb40432d6f1a9acbf85f5922d2f99a93ae6bb  LICENSE
 sha256  aac73b3148f6d1d7111dbca32099f68d26c644c6813ae1e4f05f6579aa2663fe  LICENSE.APACHE
diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
index bb4a5084cc..a8cdb6c2c8 100644
--- a/package/python-cryptography/python-cryptography.mk
+++ b/package/python-cryptography/python-cryptography.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CRYPTOGRAPHY_VERSION = 48.0.0
+PYTHON_CRYPTOGRAPHY_VERSION = 50.0.2
 PYTHON_CRYPTOGRAPHY_SOURCE_PYPI = cryptography-$(PYTHON_CRYPTOGRAPHY_VERSION).tar.gz
-PYTHON_CRYPTOGRAPHY_SITE_PYPI = https://files.pythonhosted.org/packages/9f/a9/db8f313fdcd85d767d4973515e1db101f9c71f95fced83233de224673757
+PYTHON_CRYPTOGRAPHY_SITE_PYPI = https://files.pythonhosted.org/packages/9d/af/182eb91b0df3fe75c4d9f26fe70684569566745f6ba7e5c9c73a862c5252
 PYTHON_CRYPTOGRAPHY_SITE = $(PYTHON_CRYPTOGRAPHY_SITE_PYPI)/$(PYTHON_CRYPTOGRAPHY_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_CRYPTOGRAPHY_SETUP_TYPE = maturin
 PYTHON_CRYPTOGRAPHY_LICENSE = Apache-2.0 or BSD-3-Clause
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
