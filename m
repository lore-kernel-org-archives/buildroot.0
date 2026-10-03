Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C100CA5FE4
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 02:31:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C82346064C;
	Sat,  3 Oct 2026 02:31:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WGh6T2QGJqIr; Sat,  3 Oct 2026 02:31:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D6C7560648
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790994667;
	b=HzTdGREbHoGtLTwagJaN1EwGpxX6nycCOx/IMHB6Y9NlqooV5o/mzF5j3Z2oMdeXReK1
	 M99UAEf9u7bG+ZKuGvOrhnifAZAvHqaqE9lYp4NwogwTAhL+RpplI7aAGG91V/wCbfXab
	 gS2uTX1Kl0fF2e4ia8/1+1Qyrt4uFiWQlUt/StNFXwg41wQ4P1AhX1UJjcz/FQb+jrynV
	 i5/fE5SzH228Bth9RPsHbcVx12APuDMJa7fMg26pWDJa2fiiZFOzOy9Wbc5f1aOPDtuve
	 3O0YBJsWVhKl62Hjr/a6PhrQyqGy5UChUitcLVIkqUrsw+kr+3BkHqLQCfmtke8qduA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790994667;
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
	b=ckXS+MezHCvxh4sv12q+eRZsQbjkxdPzruut8XwUmtXzohoBEIE8FphROWQtL/zVce6c
	 6dr5d+9yBhgWyVs/R6Y5xbOwVJkr9U3p+EZSPcuObo3yXta1GFWH1my5YJs0K7fZYwLBw
	 nlDKf+ta14+N3ehdhi53fRzrDj6ZHJJbgXxYVDedq/pSRyQglYCmNEvODKtZSA5tGxLRu
	 VHnr+qTTgSBCFja1lAt2uiE8q3Dp3c/J3G6yWrY8Pr6hIGXsiax2uKl5byV/QI18fN+zM
	 K6ZKKroVgTCBYLb8w62NbP1bk2hGX7yyzNtxOGiYK2nGi0MGwCdjFHXyjZI6R/0FfRw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790994666;
	bh=QB1BwCyxNAJxisKbtk3ZttZWgXTN0QsliLaf8y41qd4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=rd0SN0SNZ5uGNGXbr8rusejuYGhFxGRcj/HNdLwKa9M4HrZ5gbITavYr+utVquvKW
	 gvChkBz5C43NDSKG6rF7HHvMMiCLaVQiPhIcwXpYKVF+GaBRa+FEPf1TUwmjqWNaZj
	 EEFEGi0ftu+iObwgoZyigVTeP+OD1+5arj3ZErREXQJprkjFBarR3nFsUjVVMwf0bS
	 S64XXPcdcltUb179KMKbR5YjTDjDM73CuQ5p1+EeDUnx9fFf/dxT4vcNiHcfArYGL/
	 9OAYUFRJH29nwNebma0aresF3NPZvGFVyseFuWGzweIZ5xOD2EtA9bvBmXfB8HhGBk
	 pAiNMYuTjaEYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6C7560648;
	Sat,  3 Oct 2026 02:31:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C96C1179
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 02:31:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AFA4640070
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 02:31:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2-Y6t3yptMV5 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 02:31:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org D4E0340059
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::329"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790994664;
 b=bJnX5XWCaRMW+jkPnwsEWLg3ZA4d7V34SdtpazkrpFfdrtljH0F8ZQI0e0jMh/68NzU7
 5wraYKJbREtP6D046YEu6CCFmBydHAa3odrvivZFpjiVs16cT0eAI/1TocmEMpj3sV5z+
 fKAso05R/gNsnWW44cGSC5Y0tI+i/CPKAVrcZjDQjWTY+y2wIQ0GL+5JBNMf/3EMzhW/U
 IPgpTJEGY1Xt1WPeZbhjL/TOeXww0YYbQ7w2343UK4PBWaWyttGZcfH1mFkV0aDQ81Juk
 QA9ohLbVDBf/aAiCJsRt/srlp/Y1sFLFvvoGd4wJryZ1PFICYVGutWXnxq4sDHT9usQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790994664;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=g+eHyVlfIdFr4PfXsAG5ACVFmxpgs3AQitcF1mfD2cs=;
 b=atG3d/sBNHOPLYay77CHWwP7Vdijtp6AYNE3+ogIesILl39GuMZTJvc59EfeEae/cD20
 mg990Px8hRldw5hPfaWXMA7nFoiquir10FhLMOBfps+QpXXSXwuTo7QJglvNMRKxhOR+M
 OcJlbIUzwcTLYgjMBHLM004EYHgTj57gBFBTglhNxjLJ3aIpivLeFwqarsFJCiD/GerAY
 HCkDfYAiBuRGC00J2oF4TJhhjJdQfmE4/kRtgICLqoIOczMlPIsFCg79GvQcTdUDsWp1c
 34t24+wWCHxS2LeEG3JQBpdPWoYMx/+Rz7LZDISJ7DY+559Bi5xRffaGBv7hMmZDrTA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=CZb5bJlE; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::329"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::329; helo=mail-ot1-x329.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=CZb5bJlE
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D4E0340059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 02:31:03 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-82478760557so19375a34.3
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 19:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790994662; x=1791599462; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=g+eHyVlfIdFr4PfXsAG5ACVFmxpgs3AQitcF1mfD2cs=;
 b=CZb5bJlETBPsddBLxPK52nJJFwo+hFG2LxlnMQFmUkiPbpUpYLC+0l6GFW5bEJQv6R
 o3xsZOG3DUHhCyIRrThSx1os7N+J8OoKpnUeaq4hKo0da79il1W/v9WVEUnUMnP7z87c
 vItUHQbrJJI8e0I8jP4wedW+nZ8434foNB7FTbfAlnIhEMSQjODf56coLK0tyMIH6JSx
 N2iKtBHxiVaLKjy8TWM3CbFlev0JCe+yCyaAxJ8ORU9ZYSG9sNhFO0bHyFgJ6YO1nDw2
 ZaAZlUwaJr/md1W5igBhM9HAxmmb0cl+la3gtJxD3FJ8qJ35VbVGn66wNW0SZE089nkp
 NDgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790994662; x=1791599462;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=g+eHyVlfIdFr4PfXsAG5ACVFmxpgs3AQitcF1mfD2cs=;
 b=OTbG0m9tYRRbCvulbNKNePRUhjiuKgqcv/TDnKnl+2G1BSS2OsXLOIoDfMExS9eS5n
 VN+/iETmA1u8tQCxpRTr46V2fj0tL0DEyCXRt27b9UsiXbT1vTFY8bFEk7T74DiDP3ls
 yysDGW/4rdbxUtxCYTiO+/5tVHmTa6QmRR2ys9eEo/O9ir3x5terEyeuu/yjPHLTJBW+
 7WBUsDZTkDFHJEIiokGkL279IkJogFnJ931YuezUyKzvAMPeChMsoqeR82MQVAM/fklA
 v1t6xqEAS65JZ6f05waz5osf5L8OT8FX+xsQB0iYz2NfwpnVKS+lB0s3Pw0pLaF9/COl
 Gsow==
X-Gm-Message-State: AFuF++m1MVXSV2pRK+L3pDo6DU3FumPAE5AkOYo1ygHaUy1soEz3HQOE
 3KN5pEKbDYy9E9DzSq01uYIN0rv1QpvuPHUWjY/1AK1VYa1SZt5WP+LBTsNQnw==
X-Gm-Gg: AYBFou0YyNal5QbIjDe6LaSornWWCcqHANaVCAOp8TpuxXK+uwSD7xmQOAFyt02Lt60
 0aRaLabr8t2Gs68cBKLj0g6ZBbgm7lKETi8oAfxSN2zdatcoA4s0JfkuhTf66n73VsSCVn9D/sm
 yfgrrneRbF1erdRTFnilYYWQbKNe+eCiDTMsZ2UZEGM0bGcal9QAy2dPaPMuMKjepVp/dBz/BfI
 PSZwokEyfAkbrStGNIqIigYvjzVEnybKdZ9au3l00pCOh+YoMx/s8aX9W/pQFtyD8biJ2Cm51Fp
 xAcek0JYf7loFMUGre6YqwO/SAxBJDOXdygoThEWjielKmI/V+Bv8QAPzNmoYBOik0e/bHYiiNk
 kJREZfsZ9W6Z5rzCd0RzJcZ2OV1qrnsu4ouLDDXM9mpe7Gti9IIECPOpp/6YyjWy4AS21wXQoaS
 WB1JR4+2RPJ32lQ8+S/hfN1USddynROT7BLKFU+y6s+DJbOX6LRwfOUuC5/J/LiFS+uCcoNDd9r
 K0Of2INBvCAte+mVx9bhkpGZCtZbMNkSMySaTMC7rYZzhXyIcxtopwKUzfUGk+JIZnpav26HmuB
 Y4RjYXvDrAv8uC0OiQzfyXRZODyGtEck5uXuqQb9ZK33gGCNZL3/SFXjYFPDTw7tiN+Cl9PCLBx
 vk72YdSXUJXyDpjuVm6iy/mGLt9ZfykLKJnFXvqkhLro=
X-Received: by 2002:a05:6830:82e4:b0:81e:1262:6536 with SMTP id
 46e09a7af769-823fcf1563dmr1425441a34.15.1790994662544; 
 Fri, 02 Oct 2026 19:31:02 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82279395f6csm4913620a34.7.2026.10.02.19.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 19:31:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 20:30:56 -0600
Message-ID: <20261003023057.452151-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261003023057.452151-1-james.hilliard1@gmail.com>
References: <20261003023057.452151-1-james.hilliard1@gmail.com>
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
