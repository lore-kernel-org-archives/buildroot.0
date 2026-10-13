Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A65CC6B19
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8981A40634;
	Tue, 13 Oct 2026 17:51:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CrJqEf2Mg5u6; Tue, 13 Oct 2026 17:51:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8D24B40656
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791913911;
	b=RP0pD3BZUzKFSBDqvwSgh//SROZIP785ggn8uLyO6jmsmKY4L1XRQs0hkJHDb2DvzUt6
	 NI11ZulCDLfHRoHT8M/xSgDMKc4c7+iCG0HDLIR3DMlSPSWVPwTL8ISqjUiI/7n9XWKAL
	 JWVhNeYWP9c4h+XJ5T2xyREvuNLraU/6yzHsjWRWFO1GX8Z5pc1jDG4Fu73glWXH/qNUF
	 1A4RL6HPvq4C/KsKcxLCODWLiK+mzbp7IrfMcorGLd4l9fCCKBWXsyDu2GaBl4T5si5W+
	 ofzAQVnxtSbFsql4ZaUJYPVWWqU0ZQ/mz2zAI7G83neF3s04spLM1rWlfo8HR5jpPgQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791913911;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=wZhNQUbS2DKJd8TwL//Z7pjCvWtl05kwSKypwW+czZM=;
	b=Pf1RxATxhtp7UuTDFngNCgcTnsARZapRHUxGDcE7oJlMobhudj19712gGOAOeQStBUv2
	 W9gndO1VO/XP5CpFpELQdiEpsnZxO2S0WPABTtLscwXYxXTx16TZAEvWDJCEjzu3q4Ek2
	 nfVhMFxTU+Pb1ts/zQcGUqQ1rIHzneh8g6ZldKdzitz/E9TDZ8nwclQeUpWcWLrBxbMOn
	 GE+Uz81wDFJJw9av5meqH4GYNxPQBNmm8XFn/0cKG3+lMJtb3ubIzjZ3aOLKYkPSP9wUH
	 /W6OTgaDxepkDVDDp2tB3vxxsmsbEPuNEvIpP6vFDZgRfR0l/8qYrwAaZa89Pjf5+QA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791913911;
	bh=wZhNQUbS2DKJd8TwL//Z7pjCvWtl05kwSKypwW+czZM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=qfSeSSqXc7PkUIT4YrJ0q8jNYGZLhLwsrmRVKR2o4xIHB0mPDbKcziFN9+IY95CPq
	 C8hF6kejo6FdQ9zXUVm6ZqVcR+VRlU2ZQ8TfEEs+o+9mS1mGB18DICvfdltOKZskrN
	 JFeyZUYzh9XtpJ0yOK+GhH+H45+tKX+LtXNX0aWsWI4VDQcH+jRRT1odJ2EZp87s60
	 rF8C1SjPdoiZYE96SvRvGi0l//T/zITnGTAa7C+r4GnOekWUwmB37XcwPJplTlzwxV
	 OhLhn7w7CAFo8U1y2hIFAvgWxkDtb/ulZqHt/+eOSIv6sVmpzpfFM7/lkv/XX/6y18
	 QUngR2BD0iS2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D24B40656;
	Tue, 13 Oct 2026 17:51:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BF5D82AC
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2D1280AA3
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:51:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YzmOAjHGTnXq for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:51:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CDCAC80A86
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::229"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791913907;
 b=eEx+VafU0laafNj1N00xKhjXVIIOB9DjGT2Rdn9DnIq1tw7TOawMc4bEp8l2ssAGGMC8
 sh1UcoIcdRmPQGxVFVgnazxIGah7COvQBNW3A/px8txy4LYoNy3l+tvQQUdjh6/KPyAME
 DO8z3z663SQVLD0xc3L1UT2yhj/iekEAlYZSEzRC97Yd8vhmDCWgCLTuHcBxoI0aQ/DT/
 bfUb5p2hIAOwsH62xPN+swxKrwcccCgQiSRab1UcZoxwR93oJmcIidlgWLXF6tGqfZscq
 /GwNO3yAhBGlKuB5rSNEX8xMNEHNxZkBEnqCnOoPE3pLdMzryHIQznoATFamYvIp6rg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791913907;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=lOMYgeV0OYg8lZ/OVgQht0MjrPz7rPwmysLBfJrpFxg=;
 b=KscDdrCEZ+vQA4xe/OIsD82/l9yKoEw8LeOHhlzGklpEu2Tf/OICUZT5SzoFg1aO4afX
 4j2ShjeUE3tCn69xyOLlqakc9OsPb695P5ORXQ0gapwzsakATtf9va3cmTkCXhTdDRsGT
 4rFdOnZ1zNlj1BtpsWdxnitRHFCkSxe2EjP0I7d9+JLH6+7/MQfcqGVsAqs7seZp4tmb3
 qHffcKZfVA01cbtUudX7WhlvRFGCRA7D0iikE08Y9PbHKiOv2eSEoQm1FQuMIEp+2fmP3
 b9mPWeuNKENaawlzklnC5I2M0UQmxXVgy4zeU+XrqXgIxU42Q05HZN4atM5egpSEcew==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Is3YNPLC; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::229"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::229; helo=mail-oi1-x229.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Is3YNPLC
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CDCAC80A86
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:51:46 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-4f5e6517982so1128881b6e.2
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 10:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791913906; x=1792518706; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=lOMYgeV0OYg8lZ/OVgQht0MjrPz7rPwmysLBfJrpFxg=;
 b=Is3YNPLC9rTVNF9CPXM2bMoISFoCgTGdV0CHFjZGv6eSa0XWIGGKfR0t5lbXVDWYi9
 6z0zmCpURExtRtb7z+A/2ON2Xc37WgXhBfm0J7doKobk30j+XJEcEFyQmE8cssH9yJuq
 5OlSv0pq1WbEICmYcJgBSGQTMFROT0xpmbBMDJKvM8KL89nxjLCIXOtU/PL4A/BCgy2A
 9trC0CEwzGh10hziPxszXKIX7cHNmKgm6qO1/Lo163rpE+P3qcrkKZ1lsVp7Zp9JQL83
 Gu9zw9U6G7FX8CRfVerHUn54s2G6Wa/tA+mhH+2OBgr8X9bBTF8fDyEO/T5DP7aX0zAv
 kwWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791913906; x=1792518706;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=lOMYgeV0OYg8lZ/OVgQht0MjrPz7rPwmysLBfJrpFxg=;
 b=sD5zbvDeWmb65KxI8X0gGwS+QBClmf6AJ3Ya/5txm6yXdkfg46wZgMdn3ssXvjK8hu
 UkEUWHFvK4H5FqlgC+zCGPtqLqpqYD/51X9Bsm9iz95J6sFto5UFv4WrKv6PXMcNZKwN
 UNKtHA0GMZYY5EHRc63mEr+z1symCxYpsnOG8FWnGvjUSQVIR0k4IFryJrTHMKBcXXEq
 BffB9PTPn0aG3kS6EkrwX9XTD8lLisaUzgGMxJS6DxXZSt4sfU1YVTVkv87Zn8Qh63cf
 M5xfqulPXs2cXkWohYzZ2z0l5iaftZGa0gJODUv4cfdDwZ5P9oFev3/0JOt9CcdM5u3n
 AzUQ==
X-Gm-Message-State: AFq9FYK9FDWzgi/N1HhPs8ezgh76G/xe8DvCVpFBqDk04MrUZbcOsMf0
 AhhNeHQn8ufInA0GZ1XxBpqNxKluwxHOj8cjSrH44bYT5KXxrPCH4NtolxJ8QKIM
X-Gm-Gg: AYBFou3NwJx9LcBbBxOkZNO32+WivNv5ghG7p8x902W5UI+Qol23aZMlNdgEy8IXpyA
 Fpkkj/a0WcIHbbZar3bOVGQrlZmI70WhadEJGCjJFUipM2yik5SWHD3JhMZFEtQv9Qjxu3Jjaxm
 oVSbgsEY+d0sn5VP/sUVKQVoFRwqHa/sapfMgMJEvt09KxV84Dfc97eAJN8zFanmLferUND+1IM
 /IcB2iOL5KRqEsymnwxoAyeFTS/H1Tz4R/SJAkO9rqPFck/+zPE4hjy9o7bzMlXYycz+iyqs1XH
 TEVR7drEJmYh0Nx2ynpdo2NgAYSo5P+DBeuHOxTA1QtPblbV63N5ayaP64miXoJUwWeY5KUxxDr
 likCRP+qd21nYD5nI/8au7FlXCvq//Xwj4w3GxrqRsy6i8s+772YLNfAlMSwBDyrT0vbql3qI5L
 oqKy1wXV02aKBlJuW+isPhBoBl30oThu+9JYGPXAnUNn2LjNevvIzR4hhhy2H0+8lGMldPcC9MQ
 Aawh/XqaN3auatmaTm0NWSP2DMLyI+VUU6UDZRckVZhNYv6KMSpbwv4obB/6LzL9EC75NY5cZ/K
 4dvnNTdHrimyORkqWAoVSt+hw3mYOi4MTyUFojlZJyH1NC/KWLV/WiLmI4cx2gElZZdh5OYb9qO
 2yDiI4J+rYZ6sGCFsAoxkei6QMNseQOeBPnnnZKYgEZ4=
X-Received: by 2002:a05:6808:1a1a:b0:4f8:65de:7293 with SMTP id
 5614622812f47-50c4ed420bdmr13658273b6e.15.1791913905619; 
 Tue, 13 Oct 2026 10:51:45 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-50c1c120686sm15424624b6e.16.2026.10.13.10.51.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 10:51:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 11:51:18 -0600
Message-ID: <20261013175130.1822395-9-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-starlette: bump to version 1.8.0
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
 package/python-starlette/python-starlette.hash | 4 ++--
 package/python-starlette/python-starlette.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-starlette/python-starlette.hash b/package/python-starlette/python-starlette.hash
index 840e0330f4..b6b013ad17 100644
--- a/package/python-starlette/python-starlette.hash
+++ b/package/python-starlette/python-starlette.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/starlette/json
-md5  09363df3ca97cae1eab654fd0d2e8bd4  starlette-1.7.0.tar.gz
-sha256  c79f74ea63cff761804fbbfb182f1e0b440c2d07b164d24700c5a1bab5d6ff5d  starlette-1.7.0.tar.gz
+md5  ed1e744017cf7bcd9097e0cf7c0f7578  starlette-1.8.0.tar.gz
+sha256  1565dc0b35d5737a271ed1e0e04e949f4e81198799f216d2667b0a0fb9cf9522  starlette-1.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  dcb95677a02240243187e964f941847d19b17821cf99e5afae684fab328c19bf  LICENSE.md
diff --git a/package/python-starlette/python-starlette.mk b/package/python-starlette/python-starlette.mk
index 732085a132..4c94f1853a 100644
--- a/package/python-starlette/python-starlette.mk
+++ b/package/python-starlette/python-starlette.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_STARLETTE_VERSION = 1.7.0
+PYTHON_STARLETTE_VERSION = 1.8.0
 PYTHON_STARLETTE_SOURCE = starlette-$(PYTHON_STARLETTE_VERSION).tar.gz
-PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/7b/2b/3850dc6bf7ef71b088962eba31dafc6cffd2f96e577ebb0bb316df96da3e
+PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/e9/0c/6efb252d091ecccd7d62048ae11f0ea35cd75a4fbaeea5e30f9c3bf91d10
 PYTHON_STARLETTE_SETUP_TYPE = hatch
 PYTHON_STARLETTE_LICENSE = BSD-3-Clause
 PYTHON_STARLETTE_LICENSE_FILES = LICENSE.md
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
