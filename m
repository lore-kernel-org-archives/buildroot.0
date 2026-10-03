Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F0ACCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 08:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D907681248;
	Sat,  3 Oct 2026 08:45:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1eHf_2sK-ZGV; Sat,  3 Oct 2026 08:45:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E7917811CE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791017120;
	b=MRH6uRnyNGM3p7SUPQ7rKm7qwbfT925WauMafXqHX49NrA8aNzLx+vHMZSn9lOfgnhp0
	 62+KiPnbNMqxM/N0uMrTMaUH+FA71A8yJjMVRdWHDTS7lBIBCF7it/G6FokDxHIOc2gzh
	 8fOjEhqq2skhakYSgDgznO0MEwNf8pE7XtMFLA46sImzk6u5dABR1t5NitMhfpI1r5hJa
	 KjuR++uvwSC3oTmNh8lposEw8b976xwpVB7qxp73ypTVP5UWHDKNx9zn6RgS9Jf4YmJjJ
	 EBVBEy52GbWOrHY1OOrLsRah67RTVVeG60YT7YXSLvapG/U2VTuU5jxmekDGVFK5NMg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791017120;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=2VrMdlKxNMMKCVrVz+Nwu2h+3H0M3r9v830TtBxBHP4=;
	b=nv/VAOBvVci/k1h24z4hr8cra7BKsFNqm2bTQS1C42/S/68eXesS9i9ns5kcwnDQMKWg
	 /kHkbZEpwxr6RGYvtaYdBNiQMb4qLyvNEOhrUlHKxacRW4npNjMblc5FWosSMhmdh/Nzb
	 aAAk4vs8rmu6aHQuF0Nk50osmwiCsSTjau5YjASdcaWybxWCb6a+g9J0wr/l5bHN4J2C0
	 hpzA/gN7UTVw6N6ZViOKZpnRU+OFzebNpEMi2VtO9neK/U8tk2hQFvWKianJEgq/TCYbx
	 6rthiHwk+zcvHGhE0WIDwGHn4GDAI9S35joyxcacaNCB4HMObprHcXBSt90rGYvUnBA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791017120;
	bh=2VrMdlKxNMMKCVrVz+Nwu2h+3H0M3r9v830TtBxBHP4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=IXWBRW/LxKRjIHvhjlCzMYueQ1FKCfBfh2c6JWsIpf+2qMIo9DDWfBO6s4DmT+Hy8
	 Ok9JqV8Z0QFfCjjS1p9joPvOpJcvodri3qIC6+3noxdqpLLLrdvnUgdoz8bUUip3H/
	 mfapIVERibM+QACkvdCrR4q6R9s4IGKkgmJ9dBukik60wNTsegpqD461LjeQdNC5gP
	 sDVPCyhppVLrpanj3bdvVbUNf/I8DIjvdZxgE0f7PmhroSx6OQYyR0SqbPijCgcrHu
	 NOeVkg9rR70TsTlHTJU+5hdkPE6WNW7Go2OnIFBML0IBjzzt7lk1YDehi3xjcvUPc0
	 vRlxm10JbRYTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7917811CE;
	Sat,  3 Oct 2026 08:45:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E6AB2E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1345840FCE
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k4WLeECFaxOL for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 08:45:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1F7F940F50
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791017117;
 b=bPCuvQOAW7HRbm4RI/mK3kHA4vqav0ZN45jSd1E8+1QxdWnQ9imMxSPa7fn5hNn+7XOV
 JpMVchZ7NJZKse26VqP3wwUdgkpz799rFYffgWDjPWOmMJd1NX00bA5TJJ6O7ks4NjYPW
 IGMGlZ0+EunGBwCNR0P3HX78p5Fgc1XtaZvoPOyWTXlOdvYnCfRRPRQFlAakSQL5g00zF
 C8oT1KFI0cmP/xXJlDbAL5XHPM4BYtVC7y+YxkSREs7ydI644uwtCrFeF0jtvYmm/FBUV
 tsN0LiiVKhAMV0LKpB8/RlHQPIPtCmaonvIluVxJWwMT1IgQIOzw34z1K37NrvYYz8g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791017117;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=Y7WQ4Gcvx+OxCQJctGogpV2cNzEtO/UMNf7ePoXHUrE=;
 b=gMpv9rZ0QRYcxcGEwrbVqIwNoK769gjb2OwkAowXSdt/LtghcbDjBGLKOkDDhKsVddTh
 D2v67iTR1XFFeAimt5by+l2QsuYhGKU6ivU7OOg3r8sOyqvyY3y4Lp+cQ8WqvIrFU2xmH
 1VV57r/BcweK1T9LJL+GlBAowiHaik8NmIkMiWPpxcbZtAthRata3EsrsosN25eCoKPZ8
 K+ciXujwAaBzC/Qyjg/39Jgj+M91vW/xxq59iw0DiUv4P1GNvti2De8qqHHFrfAhZ5Js+
 4KDNcBDOB3hdBiUCzeLtHq8S2ve+pJD5mrZaQzDH5w6Fts3EhI3aaU4cjhnkRJccmSw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=OCN7wOtm; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::2b; helo=mail-oo2-x2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=OCN7wOtm
Received: from mail-oo2-x2b.google.com (mail-oo2-x2b.google.com
 [IPv6:2607:f8b0:4864:31::2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1F7F940F50
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:16 +0000 (UTC)
Received: by mail-oo2-x2b.google.com with SMTP id
 46e09a7af769-823d139c181so487327a34.2
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 01:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791017116; x=1791621916; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Y7WQ4Gcvx+OxCQJctGogpV2cNzEtO/UMNf7ePoXHUrE=;
 b=OCN7wOtmBS06ZsN1HUGxVTbz2oLtu1J7IhIJsZelHycql3ULzIPOBB/kFE6E0Mj6mW
 6Qrkh60dPxfHo5qLjUeIan3Og0wwH+id6gU2NFzb6IotlGdWhQ1S+XDhnNps1OF9FJTd
 1vIJi/gvLNG6m9CswaJ/Y7rszUiA9rYyKk7lPIj5xDVB4TyfkhUxbw2O2xHuZl2mleP7
 eZ/lAYkd2ha3XvvpmxNfDC0iKmWuNFufjdHu0yPX8WbO2IlNRU8Dhy12sarrwMW+UH0x
 lyR2ut8x/f0+gdJpOw8QPB5o110j34uOs1apJeS6bY8lhwwuUxV8MKyBuzp6QMzdIrCV
 K1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791017116; x=1791621916;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Y7WQ4Gcvx+OxCQJctGogpV2cNzEtO/UMNf7ePoXHUrE=;
 b=BbyBRlj0ydz4/a2q4T1l+wrxp/Du3ZFCvyXCN1PzKD/3KGoVmW3EN13fu4Jev4rZDE
 Qtcoza7PcQWV4ZpMy0ifFHalJ67v/l4MBExbVw+7Hf/4V3dlTEpcfzdyMDG6oCXHfIGP
 aai9USHOmCQQtO7PvZL89EjMDpURZRgzRx2r4KJM/uS5fGa3KUzL0H5d5MiCvRTws5Pk
 V9eCCiPYW3sr14r8cOi0D7jDUOFDGrH8GkDv5dMi5qjaTG62pNRCujFI8MBoyRavHYbt
 acHEKQI4A8/XOBmVta1JN4eUKXGZVSQe1VNDf5ZCpx9aGKRevHJgI1QAvGPSIBajxYMS
 kI7w==
X-Gm-Message-State: AFuF++ngLna2O5TTKRD2Bv9JM5WIYIzcDkTTv8BaiLajwOVjV9SGfcyU
 QgruqZZb4moFXSoSaTCAWQIBetdCIobBIC9jGD/WJDCGLWkJ01reViKIMHSjtA==
X-Gm-Gg: AYBFou2yFHWR+e7+ODHmGTe5KRVDpsOWBZ7jyonp9slUoe1YSqlBGGj7fC705n0/7O1
 o30Wk/s7hI8z1OcUDkERCQnkuhYPSwyRz2Xgge8tRU2IvC1mthV6/oPOpLGO9wHHvx96OExXL6G
 Q1PGpaPTbmia1kRzh/SqFwtb9aDF7HryMZE24Bbbki6pHfx+UkQdH80YTndkoj19oIBjCaHq/Pr
 d5uz9n1SdVfL/BmjDfpPgVRTB5N8q6MS2xzTdZLAkzqooxvqVyDt9o8cUUwGMjVADrn02zve5cN
 XKbb3Z7GTZh6iwMPOpjJ5Vo/3s1VltNBBK+Ve1O0JRPrJc3k+lOAogQ4YtwqpAnund9iTiNz+jI
 MO7LUDvfyCLzFli4k7viu+WtcSf4c2ZrRf0zx8S4qfyijmyMe9z5KoySVQn87xHoEHX8A20bHyD
 QVtYiPTkJVsqLtmoZYjhPrhnrwTR6WV4KyHRoGNtJKIj50NgW8f9sZCRF+KqT3rOJ19UY6K34o8
 v5rFDunnVV9F/0S05PWPn6WBYhlbJrA+WlMHwcnMem8YwcKIsTXwDvmV4ifp0+1o/5+NpQYZ3C+
 k3aw/KbefdOv9Rh7bK9zqdOJ+6MbEtUpu5V/SzW0r1wctKMurXNmLDpmGhTdtG9mj+8t8zNqwZ8
 zMq32iuLiXOmrHpSzY5BVIxH3NKTZOsqxUhJ7X4JCf2bjvK/kEJVP
X-Received: by 2002:a05:6820:3393:10b0:6de:5b91:42c9 with SMTP id
 006d021491bc7-6df3428e6e2mr3389605eaf.54.1791017115713; 
 Sat, 03 Oct 2026 01:45:15 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82273e27adesm5208385a34.0.2026.10.03.01.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 01:45:15 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 02:43:56 -0600
Message-ID: <20261003084453.545653-11-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-gpiozero: bump to version
 2.0.1.post3
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
 package/python-gpiozero/python-gpiozero.hash | 4 ++--
 package/python-gpiozero/python-gpiozero.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-gpiozero/python-gpiozero.hash b/package/python-gpiozero/python-gpiozero.hash
index e9266886f0..f6bceb9376 100644
--- a/package/python-gpiozero/python-gpiozero.hash
+++ b/package/python-gpiozero/python-gpiozero.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/gpiozero/json
-md5  ed36bee070df2a8788c2038d585146db  gpiozero-2.0.1.tar.gz
-sha256  d4ea1952689ec7e331f9d4ebc9adb15f1d01c2c9dcfabb72e752c9869ab7e97e  gpiozero-2.0.1.tar.gz
+md5  34e34fcfd092693308490b1cfe56b6dd  gpiozero-2.0.1.post3.tar.gz
+sha256  745feab6df463ac2e9de10c67e2dd9f396e668ba4e281e92381d6c460100a8f7  gpiozero-2.0.1.post3.tar.gz
 # Locally computed sha256 checksums
 sha256  b6fdd587f3dc3a9b8cc5adae00918e3ffa909b1092bd4decf7e8b1b08fa5d0fb  LICENSE.rst
diff --git a/package/python-gpiozero/python-gpiozero.mk b/package/python-gpiozero/python-gpiozero.mk
index cc06abc118..d8c71f9a1b 100644
--- a/package/python-gpiozero/python-gpiozero.mk
+++ b/package/python-gpiozero/python-gpiozero.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GPIOZERO_VERSION = 2.0.1
+PYTHON_GPIOZERO_VERSION = 2.0.1.post3
 PYTHON_GPIOZERO_SOURCE = gpiozero-$(PYTHON_GPIOZERO_VERSION).tar.gz
-PYTHON_GPIOZERO_SITE = https://files.pythonhosted.org/packages/e4/47/334b8db8a981eca9a0fb1e7e48e1997a5eaa8f40bb31c504299dcca0e6ff
+PYTHON_GPIOZERO_SITE = https://files.pythonhosted.org/packages/67/63/864a3c36842cf7b05808aadf906763a024a1b13f2a4c8144e3163de91255
 PYTHON_GPIOZERO_LICENSE = BSD-3-Clause
 PYTHON_GPIOZERO_LICENSE_FILES = LICENSE.rst
 PYTHON_GPIOZERO_SETUP_TYPE = setuptools
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
