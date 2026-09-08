Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E4CC79FA1
	for <buildroot@archiver.kernel.org>; Tue,  8 Sep 2026 08:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6788606B6;
	Tue,  8 Sep 2026 08:59:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fMskVnTGrgwo; Tue,  8 Sep 2026 08:59:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 737F860640
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788857954;
	b=VZr08gLFhJlXveArteQRhayhJkxqYRZsawBZxCne63o0SDMy/Cqpm84ZgHzSlZ8/xgh6
	 +hyqlRAirWmA6P2shr/nNdQKuP9JpKrygt+cbfha+r74Obq9rgV9PWbYaHZ9p4wIrmahl
	 SJIjrKQ6/cdQYUTO5AzVxrq3r/mYz81qY2/n77ozdB8H2BEBNeb4DE+y5a+DbXlinoOyo
	 p4WxjmgeMTPCM6axTvezF55FG5/MZkHgcIyLKSwPHgBkkiGvkNUDg7pcjDZ9m5lYc39fL
	 4KdVVDqcPFvLcCec5mu35uDGHjjtetABOiOYK8lq7LPjWfe1k7BDGHPyxhJyG4f3pWA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788857954;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Date:Message-ID:X-Mailer:MIME-Version:
	 X-C2ProcessedOrg:X-CrossPremisesHeadersFilteredBySendConnector:
	 X-OrganizationHeadersPreserved:X-Df-Sender:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=zNwBqgByDz+XNB1SJSRgRAlwRtak34WzZMECqxmkYH0=;
	b=dstowWDphPwKvqUDGuZKf62gYVkwjI/3Sr9inVmomb5UYKDodtapOyrJIJgZ8NWSknLf
	 OsrtH71VaiVXenOn0ORnIJiI5qdWms38opv9DxOJMFid9bsccIW4XrIYFPI6rSrv4owmm
	 41ECByM7fBEP30wqOV+/BXxAeutc3kZhDvJjTT5AMqZ/M0ugZhH4xyOKTM2ohsR5ElBgm
	 NWmETCDroBaXk3jPhRIOuXjZSJZvVimbfpW5xgvk+RJ+yXnYj6Y1En8ygnf4MYWXHsnL3
	 l3M73kHb434gskUIlV5tzA/R+GD+UyCQksxF0Z3ZBLTfxQGV22iCzffdhFNrC45A+sg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=none header.from=go-sys.de;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788857954;
	bh=zNwBqgByDz+XNB1SJSRgRAlwRtak34WzZMECqxmkYH0=;
	h=From:To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZiT3d6ENlztIjPJBrn6HBjxBSGqovTV0sn17AUjdmlZWb0/c6Ux5gRxk7SUrdOFFk
	 EH9EuhbhxR0a90VwQQxPS6yCuEL1u2Hf6qhzPl0hCLsxXL0jD7LAQ8QLio8+SSCeWR
	 cPZ+6+G0SVf4YNx4XqXcQW5o6UuGBsOOUltY9mBHgXTN3q9ZVCnUDDcSB0tvRfTIcs
	 sRCProDN9+9zpdUGFPoW2gg5PtXiTFBBWwIdUQ9/Y4jhrKJ40UDD9oISDmUslFydxq
	 PdCfmm27PxW5b3Kn1X69QXcGv7JUtgWDWlO36PuJqTnCSfsGPhL9rCoJysQJ7zhGsW
	 +hybVzQHyRNIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 737F860640;
	Tue,  8 Sep 2026 08:59:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1486E72C
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 08:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05DD160640
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 08:59:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xj6vsoMg4yvQ for <buildroot@buildroot.org>;
 Tue,  8 Sep 2026 08:59:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A16D6605AD
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=80.67.31.30
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788857951;
 b=po3G/sW/H/wgu3lUGC5lBGl7QmKz42uPbe6LHLDrXH1+4DX2ps8F2UwZSaHBlrxdZSxs
 SuM1utzA877K4Eyw8WWJJB3qkp2NB1mqTL2VvXlRnOI/FKkOlWI73UVWTBrs4P18rhIvQ
 AlhV8xRTMFxL2XE10Lm31og0dJzALM1cZQ/CRVvO97pQG/fE3e4kChG3IRzawyPDXGYGT
 gp84lQijNXjEi1tUnUdVe6n/SqCgHm1Sp40cQIq5RQBp6mwFXjAALr8cjnQxD9z+zIlnB
 52AHApJ/9V35TP3obUwtm9mae+OJxLKAK/NPthzUi4ozvei5UuNd5nojG/t/67R+WIA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788857951;
 h=Received-SPF:Received:Received:Received:From:To:CC:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 Content-Type:X-C2ProcessedOrg:
 X-CrossPremisesHeadersFilteredBySendConnector:
 X-OrganizationHeadersPreserved:X-Df-Sender;
 bh=hLzHaWPtKd96AfEIiuLiZlqgrYnJjQJAwPl+c4nVuPE=;
 b=nl1+IwST6Ff2+iHtUqoYUU6GmCx+jv1KALsWQHPeS1A5xttIp8iOwFH5oArpL/we7COR
 iW0Rvo2Ht0EVDCyK9ZIlPjiBD2w9AqTnyCabp4xQx11sD5KNeu21VXvcNlkmzPpakHyc+
 2k0TEJlDMmA5mvZqBdbglhyRtTjVmGek/pEZOzQj+aFkDYMD7oXo4xVPdnb4TJkBdhItd
 sb2jBY6R3gXfoBi/lgsFcf/I49btuYZB8vs8i7gRXEL9RCCw0BEX5G7XpbtWEKbp1lucH
 nU88XAoNVc2OZpNfo+0sLewxYYXssHtOr5/dVQ8NPSk1ttIde1Yl4xaGCcMEAjWZAdg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=none header.from=go-sys.de; 
 arc=none smtp.remote-ip=80.67.31.30
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.67.31.30;
 helo=smtprelay03.ispgateway.de; envelope-from=mf@go-sys.de;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=go-sys.de
Received: from smtprelay03.ispgateway.de (smtprelay03.ispgateway.de
 [80.67.31.30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A16D6605AD
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 08:59:09 +0000 (UTC)
Received: from [80.128.11.17] (helo=mail.go-sys.de)
 by smtprelay03.ispgateway.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.99.1)
 (envelope-from <mf@go-sys.de>) id 1x3rf0-000000002C8-0jzO
 for buildroot@buildroot.org; Tue, 08 Sep 2026 10:58:34 +0200
Received: from mail.go-sys.de (192.168.1.9) by mail.go-sys.de (192.168.1.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Tue, 8 Sep
 2026 10:59:06 +0200
Received: from go-sys.de (192.168.1.122) by mail.go-sys.de (192.168.1.9) with
 Microsoft SMTP Server id 15.1.2507.61 via Frontend Transport;
 Tue, 8 Sep 2026 10:59:06 +0200
From: Michael Fischer <mf@go-sys.de>
To: <buildroot@buildroot.org>
CC: Michael Fischer <mf@go-sys.de>
Date: Tue, 8 Sep 2026 10:59:05 +0200
Message-ID: <20260908085905.83870-1-mf@go-sys.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-C2ProcessedOrg: 5fa85167-cd6f-46be-bafe-19070fe3dac3
X-CrossPremisesHeadersFilteredBySendConnector: mail.go-sys.de
X-OrganizationHeadersPreserved: mail.go-sys.de
X-Df-Sender: c21hcnRob3N0QGdvLXN5cy5kZQ==
Subject: [Buildroot] [PATCH] package/sdl3: bump to version 3.4.16
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

Stable bugfix release:
https://github.com/libsdl-org/SDL/releases/tag/release-3.4.16

Signed-off-by: Michael Fischer <mf@go-sys.de>
---
 package/sdl3/sdl3.hash | 4 ++--
 package/sdl3/sdl3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sdl3/sdl3.hash b/package/sdl3/sdl3.hash
index 7340628dc7..e7a5eb38c3 100644
--- a/package/sdl3/sdl3.hash
+++ b/package/sdl3/sdl3.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking
-# https://www.libsdl.org/release/SDL3-3.4.12.tar.gz.sig
-sha256  f07b958a9ac5020fb7a44cadb957f658b2149c3c8abb4f63145fac9303249db7  SDL3-3.4.12.tar.gz
+# https://www.libsdl.org/release/SDL3-3.4.16.tar.gz.sig
+sha256  7322236cd12090c3eb40b9728be4d49c76f66ad17d04369584d4ecad5cf77c68  SDL3-3.4.16.tar.gz
 # Locally calculated
 sha256  1c040b8271b37e5076359f8fd54240e371114112924d2df81ef87c7d6a1dfdfd  LICENSE.txt
diff --git a/package/sdl3/sdl3.mk b/package/sdl3/sdl3.mk
index ecbcbf4bc2..8c2cb8f629 100644
--- a/package/sdl3/sdl3.mk
+++ b/package/sdl3/sdl3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL3_VERSION = 3.4.12
+SDL3_VERSION = 3.4.16
 SDL3_SOURCE = SDL3-$(SDL3_VERSION).tar.gz
 SDL3_SITE = http://www.libsdl.org/release
 SDL3_LICENSE = Zlib
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
