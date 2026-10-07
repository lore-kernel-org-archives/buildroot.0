Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA0ECA6004
	for <buildroot@archiver.kernel.org>; Wed,  7 Oct 2026 21:17:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DC4F40A51;
	Wed,  7 Oct 2026 21:17:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fz9rKc0sKmLC; Wed,  7 Oct 2026 21:17:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 52CEE40A10
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791407855;
	b=UVSSUL+uW1C1YfBvrwndjnCH+WqGNB4AtbCjIhnhK6DdbZUkH2PO35MREvlMPhaaJdaJ
	 xm2MGKaetgTRp7DQWxBZxXK1s8YC7R+z4hRhZv2o4dZavl5xPQzuHEKcNcy8hDFCPdkYz
	 dNbbdEa8hyyeV6+ValFuwYUlhygXQFQrQfrKptdDnsNlPyZhmu4pIeOI66LWO0hZNSkJ5
	 hIFEGlpmRwEvueGqyTncMbySaZykgs721C+5tL7AefQGHTjGs03slzY2yARXr1pGRw+xt
	 oVzuyn2+bjRBqRJ6TIN71vV3SlY84u+nHSyYJQHf/CEbfykgVeWCSgKnWuZrp4GpAsg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791407855;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=6p+5RZjga8MXcw9XF8bDvo/j1Zy92NCXlCBUGR/fq2s=;
	b=A5foFmI19JJBJ4u765D+nAA2ipfNRxBoGuz8eJ63hMuUTvQIqYkkuFIbs+a+OZwGzpvg
	 3BvOhXP6bys9GvuHMAEL7KyctfANVGk1di3BME1EMuHgUxAAucD3YVxVkBVqmm1ex1hHU
	 yjTbAXlyQeOH7gy4gKvfLuBWHVyl6oUOTl9tWNpl69x6hd5utO7HkGmkTk44oTmOCMvcW
	 dko9VmjSj1p3f/W40SYDQMP1GVsLbxxBRKlIGCsgd/TT0eK1bz6P/Hw2Hm4mwGsCX1hLv
	 VQd25VnslrModOemDoqQwGxufTIWrB+Ve9dyRmqXRtc0UdT3OX+U1VKLkHafz+YHTYQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791407855;
	bh=6p+5RZjga8MXcw9XF8bDvo/j1Zy92NCXlCBUGR/fq2s=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jWhQRb30DQERxhpL3/1wUu6o98TWaXswHt4n6B5J42Uy3oHfHGxUZqSzfatPRQyqr
	 2othhJubMzkA+Nuerq9FrL0IJjDL624STv/Xdr8xPuqdZWUfJz39Ey2eL4eOu932PV
	 Te2OEurYMii3NqYoSPo1eakaSbfYw7V2sbgL18qzUvcQCJd95ZIljskuuO0Q6qxJpJ
	 HM5P+kvR6M2raO2joN2AZR1o3KhmkN8PhdlfZlXloRMzPwQn7UYiLci5Aa/sHpkjsj
	 nH2dEz4kVlkzu4x97eqyY2jVaX7B+jcj+TQao9I/L62IEoDSKwUzmQRYiqRQBhM3fo
	 l/K4napMMCc9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52CEE40A10;
	Wed,  7 Oct 2026 21:17:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B5F8D22B
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 20:01:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BB09814B8
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 20:01:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mmOyfloy2UUf for <buildroot@buildroot.org>;
 Wed,  7 Oct 2026 20:01:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B7FCB81421
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::62c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791403285;
 b=IJCxWygZSJRRHkNH2RV728HRWCILJVvlGi6gRmRWks53iKokO+7cHly5bpL7B9ijcoXN
 tDUX/zyKpXO/d+KtMy+0xzIGOHIM2PsDbJs99OIIg88XrvfiYsN9oRrJmA1hYlzwSkc3p
 zOtTMunCinOcVyWcfLmHwyYN793LmkRORGqoOa8gxfQpxcBBnYofJ0YZT4iR3b7Q9sfy4
 qd0ISs/pjfnB4EDOow7Gzu39RBQMfDShi1o/c9ObG+oKnHpHsmUkdyumDzl57reTCWvB9
 GPJ4fPrh2LrlnZBPHe/Ou+ffE4/1xKYuHuuEEzDvLhigCdX1ZrRJlv4TFUQRU/+nFVg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791403285;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=2Ip2MvHS5hOhj+0fewaGTMRNtfmtuJYByWCTJmroAT4=;
 b=ihNcS0Jd23k0Lq2gOS3aWbMEuP0HLscFk1Pu8795YhM5DdiAu81Fiv3uq885AnjhO26w
 i83w2/IyBfsJ3oR1DyAoZuYpAJzrdCIfQckFYM1me17hZuYrftXbRNZCSeGS+McV5HRnr
 3mWhysPYfhVtvKzNLxITUb8TSwDk/lwGUwXGi0pMAGdcsqmMTQuDFl8rmo/3n7Ta+U25K
 pkljenOBKBy/iUJgZZR+SeBlUY/KBFOwilIiI8skqoyNkFI2aeZoPWbIMBRkG1UODOU8C
 4ZZCuSlmAEh+eBr8HrF8PkPWNFGDSWP3oBUvR6TUmKlpnjr2IjwJWSXW0WnVE1rO0aw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=bTFdINcT; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::62c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=mr.zoltan.gyarmati@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=bTFdINcT
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B7FCB81421
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 20:01:24 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-c2acc1e170cso362774666b.1
 for <buildroot@buildroot.org>; Wed, 07 Oct 2026 13:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791403282; x=1792008082; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=2Ip2MvHS5hOhj+0fewaGTMRNtfmtuJYByWCTJmroAT4=;
 b=bTFdINcTWi0HelHPhIWqem4DfoyOVsZ9C4ZYko4JJKwSIoxRnXQSBvcp5dhsOgFUnV
 vV4lbi7Rf459zPuM7BWMJxntDWnwf+eVj/pQptoNflyivRAsNDBMtalD5WF8GtL/n5DU
 ZS4t3Ihr3mGbRShDiEYsxcanq+IczRQCGQr6QbCKLmwhGfY0bNHlBcav7yS0WHApeLH6
 mnjtuWl1LYi758EsCFoqyppy/FS7wH2toLJhkyh1UgwMTOop7JM8RuE2X5eHQWaiqbVc
 Vp2S0M6DzYjBEUJpyb0wO++oQZ2ag9eo2BXfbbHhRYJN+pZ/hZheTRC8oJP+RjSp0XHs
 Vvxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791403282; x=1792008082;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2Ip2MvHS5hOhj+0fewaGTMRNtfmtuJYByWCTJmroAT4=;
 b=ER+qmnny0Wp8PHacV2v+IOR19RTdGAANWfKOq38yh9f61q42IuOIqU6bGPyLJXXxkj
 wvSPHNFJBsSEFpnxbxHTr3ZCGMCA3Xhd8gQtZGtlernDvDv7MaLSIWgeKYbLc2+KbVpQ
 fJGbINOWGonIO6Dk7ICuwBTkhJIaOfmdslm0dCmH+U6390zRbC87otKnOo5gQ/D03bBa
 o6nQjBL4A5+YsmQpBMBbuHGz8QTuQinp7TgIIYrAHBsMfL6oAU8gg85/I1o7NKGLnNP8
 kqsxMyQJhXvXPCazObcD3tEpGZiIQPgL31M1CFqfpjn67be5NossFbXmPx+jSNlDCphh
 FTEA==
X-Gm-Message-State: AFuF++nOHmgNnyl2h5t11jkP1AwGo7Zlumos4XabttPm77tkpkHRizu4
 Y2Pw/rNbPpNLaBoY0ZmGDddkM/N7yfWVMQGR5XsaF9ysSNxqJWBz4KqbADq3LQ==
X-Gm-Gg: AYBFou2ABx9Qe4wtSRKHxcUvgZ0pj02xChSRq9w6tfWgPybC8D8JKssPsPfwRe/mWUU
 u28t7y1ioO1RmAQHJujMAKpkjaeZ67vQ++lkQm3ptEd/7EfDi4kQcojwQnb7sey5T03zU5AIIOj
 D0nM6GSkZ9oqwnehqhlaeZksUv5ik+DRUPRoLksJmE05+MmsplVSkTQYyw9xmI94Gyf8Ax6ZLQT
 SW5Lwfv2j3fG+GtT97N6giBd2RKIoY0DRxXUpCcSQYHqmpHfTtu/CtjZW8L8MnO7uv2PRdD7wj8
 X4vI+7o/PW4Py92wGh7idvk1plLOLMyWyeChQOo3soiNdB+Y/qbrx9maoqKb4FxgOzVpJGlwjXj
 pjtZh+WHKxMqGCARadIkjIJGMjJHfqJf7PScNnJjIlrWTVb35ItAusOXcm29NfGdNlum2whpk7w
 mLyTK+TvDJQKS+r6HGENCv08wc8w/Ncy+AfkuLyn2dxJu8bvi9IueBq13AgXTPAfIEZ2DxJZ/CW
 uveBMTKy51sffGnQpGWkUIbI4Tv25DkBl6J902IOsK88jL/uQ==
X-Received: by 2002:a17:907:7f8d:b0:c26:3107:71bb with SMTP id
 a640c23a62f3a-c317be34e66mr336036566b.24.1791403282157; 
 Wed, 07 Oct 2026 13:01:22 -0700 (PDT)
Received: from PECS-93BMLD4.foss.net (254C24EB.nat.pool.telekom.hu.
 [37.76.36.235]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c317c36535asm143782566b.81.2026.10.07.13.01.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2026 13:01:20 -0700 (PDT)
From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
To: buildroot@buildroot.org
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Wed,  7 Oct 2026 22:01:14 +0200
Message-ID: <20261007200115.516421-1-mr.zoltan.gyarmati@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/quazip: bump to 1.7.2
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

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
---
 package/quazip/quazip.hash | 2 +-
 package/quazip/quazip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/quazip/quazip.hash b/package/quazip/quazip.hash
index 46346d0124..84aa243da3 100644
--- a/package/quazip/quazip.hash
+++ b/package/quazip/quazip.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  405b72b6e76c8987ff41a762523b8f64876ba406d8a831d268ee0b63f1369582  quazip-1.5.tar.gz
+sha256  5240f4a3475648773ba10af8b0ebe549cbfc5d6de00470a517330a80068a4f78  quazip-1.7.2.tar.gz
 sha256  b455b21b0d31d6e51993f1fb7e0694c75fa0eb0519a9ea62e4815fcf48b140b0  COPYING
diff --git a/package/quazip/quazip.mk b/package/quazip/quazip.mk
index 0ab6e2db04..be370f4ccc 100644
--- a/package/quazip/quazip.mk
+++ b/package/quazip/quazip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QUAZIP_VERSION = 1.5
+QUAZIP_VERSION = 1.7.2
 QUAZIP_SITE = $(call github,stachenov,quazip,v$(QUAZIP_VERSION))
 QUAZIP_INSTALL_STAGING = YES
 QUAZIP_DEPENDENCIES = zlib
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
