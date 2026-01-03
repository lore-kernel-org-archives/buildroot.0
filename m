Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E7FFFC6182
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 19:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 450FF6086A;
	Sat,  3 Jan 2026 19:43:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w5ue67ZrmSPR; Sat,  3 Jan 2026 19:42:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA22D607DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767469378;
	bh=yUGzgtcyUMCsiMPzHvMuBPySA7yXB+JoPRnPqX8qoh0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=kCGNPNSSv1Zl9blOkLrP79FfzPi7mCWbllW1yfjg7giKt9RqPMEO8/ZaK/vi4gHYu
	 el4eXy8XD1kmH7f15BOoB43CIRSKF5CLsPCvwJmkbyjJU/RD89uqouKaJwBy1x31vM
	 jG99fyye+r7UtEYQH4lZY8gq2yOwXVJ/s2q4jH7NsAcCK8SmIwmBHoAl8pPkoVM+6A
	 t2q2uaV3gIbpj+jkt474fCi/VuO3R/gPXxHo7JQLks/ee8Hpaz5p3aQkcBARRdt/No
	 RbKYgqhG/U+0hdKeehkd8N+R7msmAOnnpON17ATSM2JWOmxbEZACC7kgHA2elrvkIG
	 coJujjcd4/0ng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA22D607DB;
	Sat,  3 Jan 2026 19:42:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 39F35351
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 19:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 207624058E
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 19:42:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9-G8X8K-juYB for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 19:42:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::230; helo=mail-oi1-x230.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3A6B84057D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A6B84057D
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A6B84057D
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 19:42:57 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-459ac606f0bso4031486b6e.0
 for <buildroot@buildroot.org>; Sat, 03 Jan 2026 11:42:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767469376; x=1768074176;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kLH4jxgjXftZ83tSSoMuHeE5ll8mn8LEhytJdDx2KBo=;
 b=pJi+y2igYnV1OeFRUVrXAomkG+Zqu479dXfNhpMlCnMHQ8gZx/WoL+Di6/pC7aOUhk
 bue/h3ntqq4bSBo026yW1rn8u94mr0ACLTeIF2LW0AUWbdxgPIvnSaFMRXvoWSlT3P2M
 ZIbMq1zFo/eEZlpD0lB78eqID57AeJaC5KQEDZOCHfqU+RPm7XKNrpGl+Rdc8pk9HZRm
 3T3UCV1t9YfJtpLkCbkawN4Lmci8Kgc2QfvfswDyECxS3ivod57bOB7+FkA2qmqj4qYc
 iaTH04Xby9yJ0/lC719dB8yyPfu/x74mepr4dy+MN/kG0tILEWI3M2ZNhDb0RjP8hZ52
 bdSQ==
X-Gm-Message-State: AOJu0YwgI/HJvnYjAHVUlgziDjr1eBjarT19NuzDdfKeY9YClIt+mt3T
 QiU38WyCskwaMlbiCYvB6RH0OQCE+9swq0IoTLjOx3qY0g41kPzIssmQfj6s4YIO
X-Gm-Gg: AY/fxX6K1X42yf5yF6Ofpc8M2iFjWhKO1gjY9cOplWs2DT42WllkpFM+4NUl0by+WvL
 bc0yOdZP+RTgyy3b9JXEP9aOLL10mdIq0YSeLmH9I+/gd7rfbUBVbkf0aU1bsFeoBZtzORZLmD+
 0yCYepMTgG43ArfltSoYubwLNfyfxUjE088SVmFMCLMcB3DhwotWCgBHSSpIO9jbsXwmEgrvgQo
 X9V5Vhirp5MoUFH7abO1i754JAS3wOfJb+jScdNDSdAugTUFVSjcpdOsjqv0JZDfFuNIM/0Hwg4
 nrkrTE66BoGXyCkTe36uK+7OgB+Z6cBXAsw222i/F3ex6QMUP3t/iMThvPXqZvPxvMs2lhz2IGx
 gfdEDIyAbBAOj7VLcDd0nwRsMstWNIvqEayVByIU5/Qivsn66T1IqziVCSRpCRS2TLjPm6e62D2
 gFH7xJvg+vxpEiIPuPHS/Al+PtOU61DGmjhvTdpoaVD6X9drohvC0f8m8xZ40NXrT/pPRjPXvQW
 GOK9LMNymLTI6cCzz0DxpyHLqNc7icynCKz9wePOb61N6JNMwUouj8=
X-Google-Smtp-Source: AGHT+IGyDWmUljXlRfye3IBj7BOmxgkUSDZR0yq+z09EBMUaLVmMULcEZKMcAWlNX2n0aiUukVaSvg==
X-Received: by 2002:a05:6808:1b10:b0:455:830b:14fe with SMTP id
 5614622812f47-457b2062ab1mr24108491b6e.13.1767469375600; 
 Sat, 03 Jan 2026 11:42:55 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-457b3be228asm20353433b6e.9.2026.01.03.11.42.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jan 2026 11:42:55 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Jan 2026 12:42:50 -0700
Message-ID: <20260103194250.2266963-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767469376; x=1768074176; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kLH4jxgjXftZ83tSSoMuHeE5ll8mn8LEhytJdDx2KBo=;
 b=YqNCRNml6HnTdc4wy9MuL21ekOYT2WfDiN8yYIgiAf8dc4Py78j0wAg8DxrCtJe8f6
 F1sNgZyBs1XDTTM+BxOY+FrieZDguUJyz9Gk57U03G2qSS7H9+ZXZwHbDaDdpM/uklrG
 ECD3ex38Jw5dTkTpMv8XwWzfc90WHY67GmVC0O7dsGt8mYGUH9hW+Hu0yduTMwC9ZfLL
 vLcXMYgb1w3gS1I7P4UnatIgmxEODV587mSOFxahU5N0/JSHvW1VHjZMuBF/v1rpxo/x
 wwbukJuNz5QT6ZKLbvMqYdnIjgxFk3Gxn8EwWyIwIUKHAOoFSFsYR6I29UTYVRCRDOvj
 kgIA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=YqNCRNml
Subject: [Buildroot] [PATCH 1/1] package/python-memray: bump to version
 1.19.1
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
 package/python-memray/python-memray.hash | 4 ++--
 package/python-memray/python-memray.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-memray/python-memray.hash b/package/python-memray/python-memray.hash
index bde66a24d9..b8e7a35b70 100644
--- a/package/python-memray/python-memray.hash
+++ b/package/python-memray/python-memray.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/memray/json
-md5  b48d378a5e5ca043a210781a2023dbe6  memray-1.17.2.tar.gz
-sha256  eb75c075874a6eccddf361513d9d4a9223dd940580c6370a6ba5339bae5d0ba2  memray-1.17.2.tar.gz
+md5  2142af623ddf0bd4b46944d9940d0dc7  memray-1.19.1.tar.gz
+sha256  7fcf306eae2c00144920b01913f42fa7f235af7a80fa3226ab124672a5cb1d8f  memray-1.19.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c973dd08e49022a4017ffd457116b046ebe07fc71a644fd760d64183869ca97f  LICENSE
 sha256  ef8a9b3247488f8901ca60de9b17b745d7bd67e5ec1e622f80d62364572200d8  src/vendor/libbacktrace/LICENSE
diff --git a/package/python-memray/python-memray.mk b/package/python-memray/python-memray.mk
index ee2605a9b0..85e16a4c95 100644
--- a/package/python-memray/python-memray.mk
+++ b/package/python-memray/python-memray.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MEMRAY_VERSION = 1.17.2
+PYTHON_MEMRAY_VERSION = 1.19.1
 PYTHON_MEMRAY_SOURCE = memray-$(PYTHON_MEMRAY_VERSION).tar.gz
-PYTHON_MEMRAY_SITE = https://files.pythonhosted.org/packages/df/40/66e6ae86c0a22b8b998779fa8d6c0ab9ee63f0943198adcf714934286cbf
+PYTHON_MEMRAY_SITE = https://files.pythonhosted.org/packages/36/18/5df5995a7b142e12ab194f4b2fd1473efd51f4f622dfe47f3c013c3c11f7
 PYTHON_MEMRAY_SETUP_TYPE = setuptools
 PYTHON_MEMRAY_LICENSE = Apache-2.0
 PYTHON_MEMRAY_LICENSE_FILES = LICENSE src/vendor/libbacktrace/LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
