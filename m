Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67747CA5FE4
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 23:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32E2B40704;
	Sat,  3 Oct 2026 23:33:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ApiIvkm7X1Dd; Sat,  3 Oct 2026 23:33:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4CC9C40718
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791070419;
	b=iptcdUmd4eWeQAwXQvnbFuAD47SZ5k/W6XVP7UA9i6oG49d9sbt4B4ImOVqS9/GjVyts
	 vg+RPfGzzLrhspuSOFwtfTr10rdMJ7UHdz4EkdARBUb2WY30yE6Hi1ol4VRU3btxQvRNR
	 ZEmG2CSNdjknEzrmMRfdfzloPtQRYIDMTE2sIaQIs0e0FkagoyWXelKDS5+yvebbGE+Gj
	 NaVbrA7Uiq3qiUabaZGnGrteKViCBa31T8cS4jvHDrgAWIpz5o/x9vCjY5gBLS3R0iVwd
	 gbqJDt9/bRDhlTwP6qBk0EV73dHcoMcrucue/Csw51dFYGYn4lyqgcyZ8y2cBvCJTAQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791070419;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=HopwAVbHaY9qkMgBLu1VyFsmG7eE6JucKPtOYqN2008=;
	b=Zf80TVz8yFbY1Jrp4X91rGNy/e5PWvu7WF31ce8kEfhiMCuuwWonAYQIYcSwjjeqlrib
	 RUqQjUCQlisI5Un3ldB1QvMNYKFZCATEx8eHn+OqQj646KPrc1hSuCUxequw8EP5tyTIk
	 I16jEAQ5OJnSzB2hRuSIinSaQmrvbuZjM2Z5jiKuvapB4Bup9tHJ2m7gBiuHk3z0MfsGi
	 6gGsVbVed13UM9YWHc8+gO4Ef5vFZ4cfPk2wCh2goomwLAVXVrf3L9DakkVI/xlprXjqd
	 Y/zJa1VGEh6JdIbdLTkM5/ijrWF01tLrK3z9dtCPY9M8XSmO+smwem4//ZYVli19GJg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JKxJS1xM;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791070419;
	bh=HopwAVbHaY9qkMgBLu1VyFsmG7eE6JucKPtOYqN2008=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=COhC2d70B5uKg1krhJoQtEy4TdMTyu4/Ut5MSpayPtFm5tXdePhcEY6ulvktRv8xT
	 FkTFTiCYO88kt4Ht4SGt69CqfymxSNAhCj/MsYrzLOsYkTwHoqK93GCk5uUA12PXVO
	 egu20wmIdlDf/93R4F53r++/QwamBgAzInPgryC5S9BkM6sKuIW6eJ3U8pa6er9NtV
	 NUaJqtFE8EM22fUqtko9CjhogHOWkxP/WAVQ3XXJnroVTmfcS1BT8whvTXhDWRtRW2
	 19uuqGQJDoZUDA9Qd4MH1Uee1c5TMQwGzFVSghmRnf1WcPZZE0V8gSPG0wixfWmRC7
	 /iEfL5IXIszFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CC9C40718;
	Sat,  3 Oct 2026 23:33:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E5E2435
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 23:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1EC5540718
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 23:33:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p80hDB2mWtbb for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 23:33:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2BDEF40704
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::329"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791070417;
 b=fk6HAAKocC4kqxB1Ob0Itn4UK5sxVju+cYk9ZIKFnBugmPZBHlZMwX5tjRuigRDYmqRC
 LMY3Qv+WVfN/OtLHWzcr5SVf/XxIYQohW6x2bbrEq7n9sJgSLTb814mGiUriudnR/V/gt
 GP8zIlRbk+tIr4OorPhyGrYQ4dYe7FiNBWRKoa4k9YEMR2MeVitcAHIcxzsYcAsmXjLhA
 U8DzG4NwVDmXRi7o3btV3aYNwrMgd/uZuw9sGBRehR0gKaz+ppD7O3JU7eGw//DYQLtgM
 S4yKVWtmk3Qbm0oIXBSHqXkIMX32eGzRTcCeXY0Xw5Du2Z3kdv6KFLV2yqop1hvvpkA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791070417;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=SwOi+jimMsN8a/DZlhMMK781oxWaEvIoPj0uS0rdzKU=;
 b=icmX/Lv6O8kMGKx4wgi6R/Z6ZzAL2BV7tlcUADZCZCTUwin8iNenTv0sffC6iqCNH8uW
 Q+F6qnJtbeD8K0iI9l4WlPtLdm3WQs4JiJU8fyEa9RPq4I5tiFChv8vdHU+1WEe8+RZ0e
 XKB8Z5BNvNVFfJN/d0OIzEtYIIonSm07MM1d0PdcSwvQWlGFJrD5coyYy6C8Uu6bkPXY4
 3c7lhToqcFIASQUR4+5kEzzp8yVWgTIbigilbRhrx1RCJwI1f1YiG6de5fPwrQyVX+2i+
 /ouTzL2BAu4fNCzfjaQAripsmvFhmRYgzVc4pRN+Gvv6bu0ZrS2yS5e+WDW6givzoyg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=JKxJS1xM; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::329"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::329; helo=mail-ot1-x329.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=JKxJS1xM
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2BDEF40704
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 23:33:36 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-7f48c750afcso612631a34.0
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 16:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791070416; x=1791675216; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=SwOi+jimMsN8a/DZlhMMK781oxWaEvIoPj0uS0rdzKU=;
 b=JKxJS1xMb+lSgjV0anPX95erpzwgWR72WkjQDv3IIBhcKvfdEmcXDTTE9eE22/vXLn
 jIv/Hehoy823CjzX4QRvBERirGewZnC7W82TbYzDFXumW7BEQlj+XrvjRdFPNdHHyS4L
 higKBsPVNgqcqhY3tgPLUmQwo1WOHPh8jEs1Qq5FRrJsMbxwfkSTV3a3kvIaJ3qR2A0v
 s9LBdcisQrHLPSOo1cl9iT9oqZQ3oLug6hMSBz/G3N3Y8iw7kHSlXG+0/M+01wpveHVs
 pkkY4VBxTvcmeEcHeqSSADwLHKPJC/7tcPK+j1ZBZ43MKoBzDduL8PVVU1MUlG6kr3CY
 td7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791070416; x=1791675216;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=SwOi+jimMsN8a/DZlhMMK781oxWaEvIoPj0uS0rdzKU=;
 b=bxQ+jTHKleJG8FgVyw2vqGKsmdlCI093ps3e3vzH08tm956PGBKf2+Hk4f3krdmvTB
 0wabxXp/TRnKECMuFdfnGxFBzsFnleAkHjmbE6Zn5sEW4y9RP/7MQyEGAQNxMVGYB073
 Nw3ynRdzo3MSbhloQ5kc7PHumzmT8YxWAKAR1Rlaj0plPtMG6kK2mfBOlH5xWmkkj0iy
 UmbxcEkSx/fBMqBh45W7IpwwTInfE+R8RrGK8z0ULkD9ZRL4oGJscTj4p31pspCTBTWl
 lo7cNBfaDbpiwAlFlyxg19MthrLBStyLqn1wLG5Gahu0UPPwRVG3A8CW8tuHRck5FHw4
 YY6w==
X-Gm-Message-State: AFuF++kvTEwoc6vxdpUzzCwPj2BHm7GYA+ZhynU7YQuHBb3AZLZzrBim
 hbi6bMBRIkyb8LLcale9lV6t6iCdgDFG6XRSkuVpJvls9Rz7XRmFVidLN8EiDA==
X-Gm-Gg: AYBFou0Ix30vX3f014OfW2w6JXPo9NBv0Ik3A/6qv7WhlwBZhOktJt4uYWjNGaspIDK
 ak0b0RCQ7FybZ/p+EXJ4WKOuGJ5oOKPXDWqzLJgWG2RA9admAebt/gyqEYB8J1gOrz9Lz947C9T
 UwSloQtGkRtPTsZFF2aLfObKFG/9TxI8OPTwRkqCySVxyPmK8SpPj+cIRpOzhDB8yCtq9q6eowu
 to5cij68trc6l1VfPfjmabipVuyQJj4N7sw0uxENxomN7W57HRdBrv4aWb5XTMxoacZlyqSHK0F
 zRdF2hdmYPkA18hk/i45uHnufFSM7gw9IJKF1tb2wEZwHRV6Id5fc7X4YBbNplpSb3Thk2m2oQg
 r69XrFdIlY75Nt+IEcmwJDBN48XM8aj0ukn4shlBJa2nJRH8g40FtCpzFAKU34whF5l2L+S3d1G
 ONGvzznw4fnau7PUTQNxd9wsVcog9EBdnMNuaB2WrpThYGvxpNtNxbBP8rv5y8vD6IPV8nJ6us6
 Dx++/AQ3JYo7UPtnUnkZ8POIFs6qOxWftALAKgo7++yoXV2BF0UJMD7Xc8KICoDlIwAUiGJ1uOv
 59MnKQuwO6eVz+5gnPc2aeac9cASaZiHogH1/hd/u98zfcNmg7t1Uoe0FyxMzf/jfrMrxjhAG1O
 58ENKmBPNzP2Zhj/1uwCO2Ov6gGSz5QwuAzWqCFuiPZwCkW42sKgi
X-Received: by 2002:a05:6808:c227:b0:4e7:8e25:37e5 with SMTP id
 5614622812f47-4f679fe5026mr4102962b6e.17.1791070415762; 
 Sat, 03 Oct 2026 16:33:35 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-4f5258e8f20sm6254317b6e.18.2026.10.03.16.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 16:33:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 17:33:32 -0600
Message-ID: <20261003233333.754602-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/python-engineio: bump to version
 4.14.0
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
 package/python-engineio/python-engineio.hash | 4 ++--
 package/python-engineio/python-engineio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-engineio/python-engineio.hash b/package/python-engineio/python-engineio.hash
index 05e222dc4f..9057981efc 100644
--- a/package/python-engineio/python-engineio.hash
+++ b/package/python-engineio/python-engineio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-engineio/json
-md5  724a0e786c6eb7ba9c1a03fd58b719ec  python_engineio-4.13.0.tar.gz
-sha256  f9c51a8754d2742ba832c24b46ed425fdd3064356914edd5a1e8ffde76ab7709  python_engineio-4.13.0.tar.gz
+md5  0fd780d7f07b5007be10e3687ff8d7b4  python_engineio-4.14.0.tar.gz
+sha256  eaa1e386baf9c2c7959eef7f9d9165c5ea910c5b392f5316e78d29ed073cb43d  python_engineio-4.14.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c9e97d3dbc1fbbcdb4f7808b282cd646db887aff4f5313fe6bbe8d4c31405a9c  LICENSE
diff --git a/package/python-engineio/python-engineio.mk b/package/python-engineio/python-engineio.mk
index 76ae166970..68604bff45 100644
--- a/package/python-engineio/python-engineio.mk
+++ b/package/python-engineio/python-engineio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ENGINEIO_VERSION = 4.13.0
+PYTHON_ENGINEIO_VERSION = 4.14.0
 PYTHON_ENGINEIO_SOURCE = python_engineio-$(PYTHON_ENGINEIO_VERSION).tar.gz
-PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/42/5a/349caac055e03ef9e56ed29fa304846063b1771ee54ab8132bf98b29491e
+PYTHON_ENGINEIO_SITE = https://files.pythonhosted.org/packages/fc/65/f8bae11b228647e2e2f45b63dec7448efaddb7cb51f529de1fdba69e63b5
 PYTHON_ENGINEIO_SETUP_TYPE = setuptools
 PYTHON_ENGINEIO_LICENSE = MIT
 PYTHON_ENGINEIO_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
