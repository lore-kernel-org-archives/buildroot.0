Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 839A1CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 22:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E40F60D6A;
	Sat,  3 Oct 2026 22:45:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1XJi3ek9XO4y; Sat,  3 Oct 2026 22:45:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E667060688
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791067506;
	b=KCQSG0QZZmhzPXeTCt/6BTVIHXLc5MU967qWCH6PVzRbMpl2VQ3PbsgS1nBF7PhJjO+C
	 N7BVVzC/JnXfsDGblE8BF/webHchb3xHE2KZBKgj9ktGPzZNsZexO7W1wF0c3r7BuSzNN
	 eaQCKVA9zP/yFbIE/Uj8PKVX0v1Zen68YTPymci/kzHNNTSFTpWM2N6SobOlI3+u7YIlV
	 4KB9qeLQd/9AJvs7iZEA6YnBFy3SGC/xrSqs+YXX2gCpBh4iDlqYpyYFREeV/iSzqdNm3
	 fgmVvgyl4Unb55mz/xHMfWivfmVbE/QCcqZogUJR7OM1+5Tmc/u4hAiuNyek8jCeYsA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791067506;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=FMjkwiEa2gVye8Cg7470mzyWrD+Dyc8uzcC2iP1GaIg=;
	b=WcGMKuErSwNDbdYOLyPomyOUQvdxuljjn2wt3R24544fc+yTViSnfhocPxat/G1tyRKm
	 lIrJXiWWTE6DpAyjCBlqZNuQAxtQI30cM4ByNz0PMB2kiMKl4NIMDRfAvjS9vsPfAWrVA
	 BBgHLMqoAk5ly1IgWuSqOKxbEbPnvgCN/X9lPi9RNn+1KJARxOPHrFfP9+NB3etA+lKS6
	 0cDpCS8Xue7+nO/1yY6u5NzcPsKqLz8geuAchDNaZKwRukGuqFa/JvNIbl+MSt50sONjR
	 qjjjBwwKnksJmx8SoHYv4XOtm4nMrNWzRWrdxZYicmOjWnxibkLG9jl5MGpoooXBrBg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791067506;
	bh=FMjkwiEa2gVye8Cg7470mzyWrD+Dyc8uzcC2iP1GaIg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=G6Ff7tuAHaPgXFHk+wstaWh/IL9SczwfZKranXvMJSZoNfz/cgaoFMB4DFsL9EpIn
	 skj5hvYQubAwY5NPsbJOGIJvcpcwJKkgVpqCalIuy+QZE1UbNdAO2pfosWSaG0wXPA
	 r5x2BDxFQGN3meQHVUPHlqknkcpmniv+QjZJ1+ErQSAt5dThO+7HopUSTSGs20NNmH
	 AFt5rW10TzkaYPIA99arDQWooEx8bgl8FdUIJ2nMWaHjur2g9rGbGU8e6QyAomRZel
	 B+DenuruxrOaSlW07T8DsjxySnPF87e1nUlcRj4zg3AQIQVQMLfWK6NoxWFLYLvDxc
	 2Stv8rnN5dK4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E667060688;
	Sat,  3 Oct 2026 22:45:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EF46E282
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 22:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D55B680FB0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 22:45:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TVzehKPyb9ne for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 22:45:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D61A280F4F
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::29"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791067503;
 b=Bs9+jWUcwytkr0m7Ti5Yz+80wC8y/nE/9w25/KKvYWpnfJ7SNI9/TMTRHro6Wpb1O5PW
 2YC03hHE1mzADO56dPHyC9/nwOkiHZCZGox4fDr7nn1qMDnEFa1ZKCOlJyPokYvRfLCNe
 y+GcCqusFVUHvC5mQLtPoNVuwezP8rCdoCCf83/TIyv5XLf2bBWBzw2UbKnnC3f4tr+E7
 5jYtV16/KLXD41H8ERcVXfE249uDu3r/49Lb2p9IavaL2AjVy+rdgYMB490B+ViXhQkkx
 hcho/Y8KpFfnkrqlb0Ln7frHNHA8kdxu1sx9Zga3b4oB4Iea2O0cg6bHlPXw9UZzMrg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791067503;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=Mr/Q2cND3BngP/06o3P3Kjs9KcHhtk2pFD5UwbcfnhQ=;
 b=AkMz/uFtktQOo378wiU56kGZ6C/+86QxgJhSmY/yPu2ljfwSu1MVgLAWkgs06Ju5eo9q
 aHa2grt8w37DEPFV0YXF23Losdg4v8izXLJiNqmuw8jrWE0/KAZWW8Y/PJ3boAk4qaJ4o
 Vk3kb8+KA/sFhSR9y/9StgCp43eG3QwdlL/NW4h89QWD20gNszXwyR5Mg+dwvD8kOp6zI
 IgtRoEEPfINQqoqtD9oUMJO/lvojo2MPcPq/aCidQcZcgjuXZDQuvlLTnHL9s+GBoaeUC
 zt4i+QD0MSOOx8pp6kz34J6aWzAQnbMSXEfzs7CMj6wfhv+vlF6H+aQRCVYD5adQRnQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Fzw1iKb1; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::29"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::29; helo=mail-oo2-x29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Fzw1iKb1
Received: from mail-oo2-x29.google.com (mail-oo2-x29.google.com
 [IPv6:2607:f8b0:4864:31::29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D61A280F4F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 22:45:02 +0000 (UTC)
Received: by mail-oo2-x29.google.com with SMTP id
 46e09a7af769-7fcb425fc2bso716976a34.3
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 15:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791067501; x=1791672301; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Mr/Q2cND3BngP/06o3P3Kjs9KcHhtk2pFD5UwbcfnhQ=;
 b=Fzw1iKb1zrO4eIGTvuBwmWY54D19BHxrAyauSLXGNGK5cOE8+QJJm3FVc5s0a+Qi8f
 16xqBcSQ0tgfbJRTRmwz1HsqaTWk4MMjnQjt04yzneKIDgtwyr9vKlmsN/Zczy96wYyJ
 ygwIKg2JaEagVjVDbVbfyDMIP59oS62UrHc66OTGhhHZy1GTc7CZH2kPF7uVSyGyxoRo
 Htx03MxCzSZURQHOnW1OMTjIXSbQK5TukM9Y1VFmD526Jgiy2bYl4Y83YhJVtO911C02
 SVWdKi2fS30DoHjFQy+4DpleH2ObPqN+pvZQyeMmZPfgTu5bbYnRRk+gOw4Yfls/zSxM
 Ex7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791067501; x=1791672301;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Mr/Q2cND3BngP/06o3P3Kjs9KcHhtk2pFD5UwbcfnhQ=;
 b=sRHEh04f/LdSRWZo6BxCmTkhOIk35B5H/Cp4mzkz6SsEeWpXLUsfjAKJGHMJbGcvTv
 5ijYRGD33YrNnHQEDg1O03RJlM9GnzWy/22HsGv9u93HKvC/Egl24USVvPiDeH04a8lz
 NASAIb3SAgBtmpA8VgJNXjRJy1F+3apDW7ywFH/sTAcLeGNDvRwmK6zsKpxwMoNKUCia
 hqPGe8TJhpWF77fldxeWQot38sT4un9/BC77dpTy0VSK3NCjiKAT32+5i3jkwFiL1Azk
 OJxZSCCW6SaTlM5NnvxN2L54HpF9RJLVZJrPX+gNkuEyo8T8wOJyTS5X74XDIe+jnSfa
 Ck1g==
X-Gm-Message-State: AFuF++lnaFABLewP4sHYnWJx2xdpJDCRDABUSov5E57GJndolOkOQI70
 Paz85Eg9uzAlaIREHrRTMUArY9FgvN/2A96T8rXPbfapaxU5hVrDzylE+dTJEA==
X-Gm-Gg: AYBFou0Hv5ZLr6B9AR2I11nXtbztGith/22OC6DfGcRAf4uW9wxRfWMeFeKC5dIf++i
 CH6Y6nj3fwizRAeq95mgtKmYh8IRsFFWtBhvlN5IJotgmfBSLmpY0rONngNnPNNC3QdbOc+jBUU
 N/t+JixQa1oQFs/Qhqxzu14mc4bVwXufcnyqE+XzIieSQU0cJ5uhx7tfzHEJCtkqZKGzSy9nCDo
 TvjxsOPoRVPKArHo1TVQ8EBnrCiLWhXib7zPpQWnzdqDmhnL/MgGtATSpYYdPfA3sf0DlR8KQcD
 gcymNpdoTSXF/UOq/jIp9FKv8aA7E+zbHVXv+E04TeHnsZhueMiD/VQL9mIvjT10IIU1hcWvNjY
 M1NVokOoTIBVNxakzNvm1XkO/LzKEI6jzMOBOTypxlLVnJ46aPCUcS3n6MrzXHH7krDcMeaNlGZ
 iQLOiMbcpZgEjASJF5kPbSCcPoi9jawxi8b+HJjWrAjMVfAkzgvdcM36VqXeIsYdsX9cskW9qNo
 iALh8n/A70iEofd82CkMyAlR/ldfujXkfbl0Bs/hTdl8xniikDwPvsZmMbZTnnhrBVjE2a99939
 omOC1nkYyGVq2YPMhmaW+PUACH5IGo3F9MzOcApaWnxjVtdZmfeCFOIziVpqNDizZl4t/2lyqAB
 KlDzrXuqViCbmy1UQdJYbx1BERODLZeIWNQBsW99pSg==
X-Received: by 2002:a05:6820:1f05:b0:6d4:433c:db8c with SMTP id
 006d021491bc7-6df3399a1demr5352916eaf.44.1791067501117; 
 Sat, 03 Oct 2026 15:45:01 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a36943bsm7262522a34.19.2026.10.03.15.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 15:45:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 16:44:31 -0600
Message-ID: <20261003224447.744966-7-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pylibftdi: bump to version
 0.24.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Christian Kellermann <christian.kellermann@solectrix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch to the setuptools build backend.

Update license hash due to the copyright year and license URL update:
https://github.com/codedstructure/pylibftdi/commit/88f84ed8ad4aa65dbbc4abeaa67652ccd947a26d

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pylibftdi/python-pylibftdi.hash | 6 +++---
 package/python-pylibftdi/python-pylibftdi.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-pylibftdi/python-pylibftdi.hash b/package/python-pylibftdi/python-pylibftdi.hash
index fd7d9f17b0..10dea3f7dd 100644
--- a/package/python-pylibftdi/python-pylibftdi.hash
+++ b/package/python-pylibftdi/python-pylibftdi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pylibftdi/json
-md5  c3f06a398c7e7e2bc9d6ff8476378d5e  pylibftdi-0.23.0.tar.gz
-sha256  bf5b4c6ba73d79a6f6df849c345b00ba763d023201bed9ba51d876a4397b16d8  pylibftdi-0.23.0.tar.gz
+md5  6243ede1ed3c210846084d0c204f0a96  pylibftdi-0.24.0.tar.gz
+sha256  e2229bc10d077f018cbe7b2b490227b2b538643fa6f7bff132cde15549ca129b  pylibftdi-0.24.0.tar.gz
 # Locally computed sha256 checksums
-sha256  d42da8dcd174be0b5a20366aa3427b6c7570528a1992d50df9c6597cb3ecb898  LICENSE.txt
+sha256  a85d0bd07d1efe2c7b24be985d3d9bfd4e9492f5e003e366acd4f99fe95128f7  LICENSE.txt
diff --git a/package/python-pylibftdi/python-pylibftdi.mk b/package/python-pylibftdi/python-pylibftdi.mk
index e6c138bbf1..58c1c82c86 100644
--- a/package/python-pylibftdi/python-pylibftdi.mk
+++ b/package/python-pylibftdi/python-pylibftdi.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PYTHON_PYLIBFTDI_VERSION = 0.23.0
+PYTHON_PYLIBFTDI_VERSION = 0.24.0
 PYTHON_PYLIBFTDI_SOURCE = pylibftdi-$(PYTHON_PYLIBFTDI_VERSION).tar.gz
-PYTHON_PYLIBFTDI_SITE = https://files.pythonhosted.org/packages/9d/f0/551ccbd8e989e898707e0e0859344fcf538c2310521847a1035ad3e9b164
+PYTHON_PYLIBFTDI_SITE = https://files.pythonhosted.org/packages/19/5f/f0e03128161fff27d4f92d57b7fab20fa64e9bcd53627442d2ef43b8882c
 PYTHON_PYLIBFTDI_LICENSE = MIT
 PYTHON_PYLIBFTDI_LICENSE_FILES = LICENSE.txt
-PYTHON_PYLIBFTDI_SETUP_TYPE = poetry
+PYTHON_PYLIBFTDI_SETUP_TYPE = setuptools
 PYTHON_PYLIBFTDI_DEPENDENCIES = libftdi
 
 $(eval $(python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
