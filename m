Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F255E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 16:17:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0276561185;
	Sat, 11 Jan 2025 16:17:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wuhVtLifQGgr; Sat, 11 Jan 2025 16:17:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 027AC61178
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 027AC61178;
	Sat, 11 Jan 2025 16:17:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BDDD2942
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:16:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E95A41380
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:16:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s8khcoeqUu2y for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 16:16:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5867241377
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5867241377
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5867241377
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 16:16:58 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-844de072603so246740539f.0
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 08:16:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736612217; x=1737217017;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BsIZBnfKgJMEg/RLSZMZGZ1L9dwYwBZUNOC9qGifDlw=;
 b=VCgYKMe1Ep3cAU0vTT2cz+WoVZ0YY2dTfuvWRSrVV8g6penx8WryDr1mudCQy29yVC
 IK10ZM9Ogx99tZc/gbpWPXifU+ouwW0n0xB1OEwrXJRwFWjf3i7+Jz9YouR5V/+MTetS
 CxqdyGAiCEbA9XjBLYbsnjxAlpQQ8OCmP6/aemLSbYLRwI2yow3RfywnMDKu92ibNzC5
 7ckOCzf1jJok74YkdnT79VEB019BhZeGMGaRDagh54lsaj/KMnMaBG5+1WzUy3uP+rbN
 evic0pIW6yTUwSyRNNlWwws+S+IvE3NBQFfeMjyMYZChxuozymbTgV5CyiHvAq2pf7Sl
 W9+g==
X-Gm-Message-State: AOJu0YwXfzFwO1aU2j+jV6EG8mWcmyx/XkyBUsZ2Iqg5Yeo49SCbAwfN
 KPBKzcs4YgqTuBzprT97F8ZmF9sCJ7tv05XKbRaFrH2nillhKm7rQ1woyejv3Qg=
X-Gm-Gg: ASbGncuVgxRrTE2swUXhjQsuYWyi0xoif504y3qpQtZ7E53RZ+5z2qwmcqanZPmw/8d
 cKkIeMK8jjCe0In/TUv1T3i61JHJ0QgtjTJPH5RRPApUsuuXJywbU7zYWmwnp3eUl4MW0lQcr6Y
 0Q+tYot9CVNmzQBWJQIUfHsA+88d/a/hPHT6cg2I3qB+ScHR75YZZoAXRjuLqLqloU17w0/XjF7
 JukikxJzsdBP7gL81Qb4Ja2Y4BBXz6GB+d1WxFIc6AtaocZOwaDtKe/2VpWH3BUaygpppj1Rt6t
 HXM9xOPHh7pkTdpygivTSg3/siSylQY=
X-Google-Smtp-Source: AGHT+IFoBq9u8mb/PPPV1cltZufSo6MlERorbMCKa+zWMZedlfLiH3BwP6P874j9IvtWQOmbaBWhLQ==
X-Received: by 2002:a05:6602:2c07:b0:84c:ea14:931f with SMTP id
 ca18e2360f4ac-84cea149937mr1035210839f.11.1736612216787; 
 Sat, 11 Jan 2025 08:16:56 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b74552dsm1609429173.115.2025.01.11.08.16.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 08:16:56 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 09:16:54 -0700
Message-Id: <20250111161654.2871290-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736612217; x=1737217017; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BsIZBnfKgJMEg/RLSZMZGZ1L9dwYwBZUNOC9qGifDlw=;
 b=ePkJxE6phsGjZjfDJUAmNblQvPtJpeJoYSwbCPscvdI3DCfoFwir3ZEHhuoWfjJbOH
 /Y8Txw/aNnZNv10TJQ/5sNwcgwhoCtPZvKA0g5aeUb7TgESa8Q1KQoin/HNEJ1WiMpzX
 OAe9tQuWR82FX2tmWwSnVnM2Rk+jGYBeUaI/7OjeiH21rrklLFQepaLPMAvcnRAHt7CS
 XOnRuqvdroP5/6c468rf/v8O6if3cvWOJkV0AnGy8ALM0+lVOHNjmZDR30F7h6ulH1gM
 uPfxKjridHR9CNAPEIiRW0cEcuCKW7hpwIWnXUE/7J2zu+KCnUXeY/5CSc6+jq9BxUKC
 nyPQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ePkJxE6p
Subject: [Buildroot] [PATCH 1/1] package/python-pyspnego: bump to version
 0.11.2
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
 package/python-pyspnego/python-pyspnego.hash | 4 ++--
 package/python-pyspnego/python-pyspnego.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyspnego/python-pyspnego.hash b/package/python-pyspnego/python-pyspnego.hash
index 59e5463096..dd8203088a 100644
--- a/package/python-pyspnego/python-pyspnego.hash
+++ b/package/python-pyspnego/python-pyspnego.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyspnego/json
-md5  f13229784747c05d880c25880872f856  pyspnego-0.11.1.tar.gz
-sha256  e92ed8b0a62765b9d6abbb86a48cf871228ddb97678598dc01c9c39a626823f6  pyspnego-0.11.1.tar.gz
+md5  8d138eeb84bba8ea48b3287dfb3b9ed1  pyspnego-0.11.2.tar.gz
+sha256  994388d308fb06e4498365ce78d222bf4f3570b6df4ec95738431f61510c971b  pyspnego-0.11.2.tar.gz
 # Locally computed sha256 checksums
 sha256  286517c93031c343f809f64b38563a783614b762e1367242af6cdd4107335471  LICENSE
diff --git a/package/python-pyspnego/python-pyspnego.mk b/package/python-pyspnego/python-pyspnego.mk
index 166e1ec85b..4dccc57fad 100644
--- a/package/python-pyspnego/python-pyspnego.mk
+++ b/package/python-pyspnego/python-pyspnego.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYSPNEGO_VERSION = 0.11.1
+PYTHON_PYSPNEGO_VERSION = 0.11.2
 PYTHON_PYSPNEGO_SOURCE = pyspnego-$(PYTHON_PYSPNEGO_VERSION).tar.gz
-PYTHON_PYSPNEGO_SITE = https://files.pythonhosted.org/packages/46/f5/1f938a781742d18475ac43a101ec8a9499e1655da0984e08b59e20012c04
+PYTHON_PYSPNEGO_SITE = https://files.pythonhosted.org/packages/6b/f8/53f1fc851dab776a183ffc9f29ebde244fbb467f5237f3ea809519fc4b2e
 PYTHON_PYSPNEGO_SETUP_TYPE = setuptools
 PYTHON_PYSPNEGO_LICENSE = MIT
 PYTHON_PYSPNEGO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
