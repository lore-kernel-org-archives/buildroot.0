Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37684CCA464
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 21:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E49E860ABC;
	Thu, 15 Oct 2026 21:52:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oWbe5pvQN_XN; Thu, 15 Oct 2026 21:52:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org F2A8160AC6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792101142;
	b=jI73VDw4koBhQszLY/dZ83lC5/laOBv6L9xdFD0SXU3NbjaVKePgQ95iBFWtIdmn6h1/
	 S3yrkX/7gK35xo9ZhFx8HnvcrJL99fUzPgTD9ExGO7yIlhXAG3sqxBFquhaHDxTpMyk8R
	 OHuv0o4GfJYp+BjeMNXytLNxkqQsJSOfSBznb7FhMWtX6fmWthOmYMVNGNVZyERi3Dord
	 N9Fc1GOxyTq7rBTFCSNfQ8L7TJ+zEmWbjBoG5G799Xy0InRI8O9jEmSXC+UWTlCvZ2icF
	 lfb7mjS0fcuXUWaTb7KfnI6+R9bSH0E92wRJSjVEhttAbtqIQATb18fnHPobPhm2pGQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792101142;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=PPiBA0toi7rBhyFcOv2alHTCfVbo2MPP0/MYhj/mCvI=;
	b=klQZmWNFaZ8lsl2ySJaBtmHMqLX1SaVBfdIdwrCd/qg7LW7A6Eoc2QyGPFeAVnb8Owhy
	 KCn/4nfizFF6HgvRaYWFTA/fLHM/KgSom40u94xVNpfMnZM8uXnGXyTl54WECsr74co8d
	 mGXfGT9d0rVSUhMOQAbgP59+ZxxATuRCQ0Dov8WGpw131pAPmHERAOMCsXLH8JUDWo2SE
	 B2TceeD48cnLw2R0szJW1B1zgvDmVUIYcohjh02qg2CbSH1XRKDChvqsOUFA0Ob02ZSCG
	 uommxu/Gt7wYds/MAStzywrf7XjVCRXQjp1OcFaVyg441IuC5kM7JrR9ccoU8k2A7UA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792101142;
	bh=PPiBA0toi7rBhyFcOv2alHTCfVbo2MPP0/MYhj/mCvI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=odwttPptXyWojWFOzofaawwgx0KxMk45J7PrMV8SWz/DdNadilI/N3TpaefjXCyec
	 7EpgoqQ4pFd9dRT0IE/MID6dSSLdF39C3RUzJxcCTCGWZ7DdRhULYWHqqTqOz9qbPf
	 CjkBPf9Q9RzW97LgqclGoZFvGAzJnWSPEXfs7+4Ye4rSwd6w3HRC20gnYhMPnQOBBB
	 cyPX2g8THh9xzoTs0XUhsQmlUsFvHABoZXNfoG6puBEUsoiBx0Uo07/IbRYnFOvF+T
	 i25PtQuSdOljTAJ4dLojlCrjsFEPbScDv8J068rNPJS4950PG7ILvNCHjTDOqy5gv8
	 0RNtEuIrLqNZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2A8160AC6;
	Thu, 15 Oct 2026 21:52:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AEA00362
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93E59406E0
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4J290xxdmwXM for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 21:52:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B27B04068C
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::234"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792101139;
 b=GhDfaikwiCiQ742wuXQevXaB89/5xy9y6FdH2/u3kFj57mrkpRVu+NdrsZ2QRQTa++xZ
 +8Ny11aKBgfrULaKKcI6gsSWncQiq0c6MuBcDzBlET243B7VyHM7nrkNP7TOSFCg7gmVG
 0VxMnIqHRUXPmos1EU5M5XVfaYG238xbBx8ULXYaozTaSXVN7/OJa+xur+4xmkZzPVeV/
 segPnum1piM6e0BPggQpg4SfOMtQHEXf+J2xoB2m2469xeDzw/p2+uz8DE1a1MUD6/jzJ
 qMYUa+7xNFrXKDQLqgHEK+NimZb8Tr30B8mregQT6oVxQSIEqHKH/JAZXalT+hKqmIw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792101139;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=HCV42aG3P6xBxBPS5GADZqKm1Vb8ssi9TN4hu2Vlob0=;
 b=Ds3ybJv4RLEpVngqZ7AW5kF6/o4pq2nTZizdEpSRiMZfl8K3v1FcptZIxtPBuH6EKbV7
 o8kIoGqiaNiC3y27YyQxG/m1moj2f+qqGPoN+pviXRvHXY82OccVRskzZob0i18YyJ5LX
 myIa/GNf6/IhjuD46kcyJxmjZfPbAmvOvNAEV9nQy9kJPFfev5FiDukr25OD0VNWYnCc6
 hmEtez1WlET632OL2q009ugQj+M6IouAYzFX28k61BLZYcZlbNQaWGK2apSbSvNZj/Nkz
 txOa0mMaT0hbAeSyeW2/AEczLbkCUdsi+QoNdW3MqpKlZ/5zhXh5AZzUB4cIxypZDQA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=PeNz0BDU; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::234"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::234; helo=mail-oi1-x234.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=PeNz0BDU
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B27B04068C
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:19 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-4a451915d8aso1013736b6e.2
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 14:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792101138; x=1792705938; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=HCV42aG3P6xBxBPS5GADZqKm1Vb8ssi9TN4hu2Vlob0=;
 b=PeNz0BDUDYRfr/yQGw+ozzsSx/pB33g2u47ICn4sT0857yviw0gTGY7AHl9ICtsCcb
 vhykg8zix5zoSalBEQYvuvY2IgAauLYYrW7vgKJ9rodu0YQFtrouuKsnFBxnvh6XstsE
 GtelbsnsrB4rrgXUiZXLveSHqGjRI75lhomT2cztI6JiJzh8OP03kFKgujQxW/t1gT80
 enSvFAxZcBUzsgrf/wug2ynMedOliwft6FP61cWpvGx6yVliTHuep8xsSD4nSggR9GDn
 mr6SBJtObqZ6weusJp1DWmGfQyNn1l5E60UDbqV3NHITyo07yKdZZueHSxtG92EkWf44
 BDEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792101138; x=1792705938;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=HCV42aG3P6xBxBPS5GADZqKm1Vb8ssi9TN4hu2Vlob0=;
 b=RFmVPCIp4ffMe/1PU2CF/7nF7eUflQXnyCF3ET9I9VUGaK5h+dLUHQJ013YvyO9J9H
 o37uwudbByf9/56GYh/nOYDASCD2fAbKRT9Fh2uYvdCfEKHwWTLvrdg8sz7j2YbOFW2W
 HDacEy3TbORX49clgUNlBu3oRBoEOPodVMK7HH/znFDxQEBWOsqz0ccKfouJK6UAvmdK
 xyTgu6Ki2vwSsU/4QLhI5qBh2pR124CqUHIr9JpMfNTlbJm81liobhfaYxqksSzJpN6s
 NPgLd1zucJ0jmqEvi7t5wAFS33l4v9JAnvLwXfkfk0IJE4LsA1pA3L9DmKlOYGTzifCN
 1Zww==
X-Gm-Message-State: AFq9FYJ/S+PvSfSL5yb6KG9hMGotv1i7PyjvXUcGX2ZteGedtkyVUMay
 Uy6bkDIDrGT0nlDETKdCWUmixbQrzv3r5yGF8HZW612vaL0MkhRz2L9Ka7BqnA==
X-Gm-Gg: AYBFou23ncBDWYmOAIPQk5ozXGiKzkM4reuF3Dq5A6bW7BAn/xF6uV/oZ+cTeKAG7aE
 UjvEn+HNcTs/7G9okeqbidTN/QUy9Teg3/ZzwssdSP1XpNQvQfm+O88bRrpsnCaz8Tr+NGs9EQy
 Ayn11V3wSguK3etZyW5n1wWrH7teqBAJQ8C5S1FE9w70tFlxCpHf6SxGWOqPluKICjLI0MLarp0
 WfgcJflJ5QougBZ0JRP0ULS6DTCg+OO2N2MX61EtxBoUuUKkdSs2zsp3AAtV0akzH0m46CxvFT/
 TGwmw2+mosI5xVry+OQKAIFq4rwfwxxO9oqc0krGRGzt5ouu9MSp0Rw9hFHQBXcg9gHfkxgh/Xl
 t3C+Xh04MQC4uVXD9f8XwPy+cA/cEfCeESKA12fnt09aSMnaceNoDbOxJ/BthmRfRlkp/M66/R3
 bzb13OjAYFLJMaUPq6MvbZGaNnnk+1QNRtnkXxIrcGHO1iKyQIxnGnlT0GNLA8r8UnoYDbY6Cgw
 qTmurZagP2RrDqVjJNKg617BXxBGe5Ztdo8qyFnkgfeDM5rRPeGDBQEeME69+JvOgnpYDzqxrt/
 3vQSJLzYBqDlDeCvDCyeJT1Az65ZClYXQyOL0CIg2bPC4jZU3SnZh8NgrVwx7qX52M4nWY5n//B
 UDlOrU6NjR97eJiQ0OdqvO/ZBVt09l6iCLo32ZvFqAFY=
X-Received: by 2002:a05:6808:159e:b0:4f3:890b:5fed with SMTP id
 5614622812f47-50c45c674f6mr23032184b6e.2.1792101138187; 
 Thu, 15 Oct 2026 14:52:18 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-53874e0e65bsm145114b6e.0.2026.10.15.14.52.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 14:52:17 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:51:40 -0600
Message-ID: <20261015215210.3426895-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-fastapi: bump to version 0.143.2
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
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index c59c623df0..97346560ab 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  1bb72b474ca0981a837e4237a0ab402d  fastapi-0.143.0.tar.gz
-sha256  1acffe48206a80917cf7dac21992b5c44b25384e8902bf745c1fd9dabcf6c51f  fastapi-0.143.0.tar.gz
+md5  de01fa672d0af011a4d534e5dfbe3240  fastapi-0.143.2.tar.gz
+sha256  e9e6d97018dcfd748da7d9e7c61cedefbe9eb91b1a3288e45b13fbae76df2d54  fastapi-0.143.2.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index 7bda802199..1b373acdfb 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.143.0
+PYTHON_FASTAPI_VERSION = 0.143.2
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/0b/d7/6a8753ab6c1d432dc53703c3e1b92974a94531b7d047c32bbaae461ea844
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/19/f5/4bbb2df9bb6f365151f2c02795ca3f17f78d08e670a394df963f3d8881ce
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
