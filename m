Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA5EE7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 15:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 010AB60744;
	Sat, 11 Jan 2025 15:36:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YjlmsmHTojGA; Sat, 11 Jan 2025 15:36:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DB6C6075D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DB6C6075D;
	Sat, 11 Jan 2025 15:36:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 17928942
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC2D380B12
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:36:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l6Qv14LPIwM3 for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 15:36:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::133; helo=mail-il1-x133.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 07BC180B0B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07BC180B0B
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 07BC180B0B
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:36:24 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-3a9cb8460f7so19498825ab.2
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 07:36:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736609784; x=1737214584;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MkNKkwo1AxirxQKyHGqoLryfvmsolm8UUAkdUup3+jg=;
 b=DdjndGX36FLzzsbVRv0fu9KByzeQPa5YOo3Sc1C1icYD6JsZzgAzGNarUJGJWtPreP
 LyK5f75jmRCtu9I2T1h+VtQxsup3jUKduZvm+3tq9kUnsX9f5hQumU0+GqvpRYjvctVP
 ugcJ6nS/OdZLegGcm8tRfQJEoxEvtbJgSaaIToGzYq4MfB0XLe8DB2R2SuRzKvYbuGdl
 rv3HwLhmAkibg3BIXpGV7kdPfC4vUN8bzNpxVkf7NPwn1w2Lbay8KFlbu3XQzEF+alZE
 mxFILlKQIql0zwlvqZ6UychdbVPVvpRZZv/gW4US4+/PY/CZzVm9maYy15Rxu+pFzMye
 0/rA==
X-Gm-Message-State: AOJu0YxQak8xFyPwqwbS4m6zl+TC1WD+rmbhZzO0w3PZVkHq7IcpFJzG
 eF4p7z+oessawiqQouTalrT+Elyfb61zzXw08M0Y3/GGB/pD64ocZha9Wv4/h7Q=
X-Gm-Gg: ASbGncvFxv+y2vUo/Thr4ldDvoWyeSzOWbWydeZlcdcy/ZaOGj0XPAbt+dAYyiMTPVn
 xxPQ6iRs1OHpQz8UFDMWOeC4XLPmzMY0Bqq61jVrTGGHZfS5G0CeV0LGafLCyzMh1xXfUWC3dxx
 XlpHfpVKEiVL4271Q++GU+o7RL7ZiWwRMkGsdqaOh5LshTBIzV4OlBeli63Y6RYmkosPRz7IW8y
 4DjW2zCyW21e0V0WncazVTJKv+6+AAMN6RuLZJso6WU1xZrys8delgIwsD2+r+VE5+SyRt6fn4W
 H9DjmxJDzm2nZTkt6ZPpwpj9+jtfZss=
X-Google-Smtp-Source: AGHT+IHnUxZq/1ojHfN3EuFwE1sZuylAv8F7D2t/Hewb+T2911pAVRsjJjGYis+Tt7N9P2LRhPeWHg==
X-Received: by 2002:a92:cda6:0:b0:3a7:dee4:c41a with SMTP id
 e9e14a558f8ab-3ce3a877efamr120775745ab.8.1736609783779; 
 Sat, 11 Jan 2025 07:36:23 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b7463f6sm1564904173.136.2025.01.11.07.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 07:36:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 08:36:21 -0700
Message-Id: <20250111153621.2848039-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736609784; x=1737214584; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MkNKkwo1AxirxQKyHGqoLryfvmsolm8UUAkdUup3+jg=;
 b=M5MLRopOqA4XxnsjhSKP+8pPC3RoLGJrbSgarcmlZGS3ceYUHNOzYql2gFBHKqex6K
 BEVtolp4ZRBryTT1p2QHAXIOf1vtep+JOAJwRS1apUqusVvdsA5nWHsoh1FByAojfE/E
 vobW3gE87a91ZQVzmBjdkyNaxZIMPNAg+VmUYOa3onACK8FWrRVu8O4O43f5lNgBUaGg
 FrNstFQ9geC1OaktRSiDH5QZMR8RYAI+qOZB2f0YNFLX2JpRjA5vz9NYnz52jDviKPVI
 oTtN3bbuw+zBat4KGtb3UIly4eytpzY1jaYDHoD2SLvDy7ifN3fW6qlJcrf9DyiaYW9z
 uqeQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=M5MLRopO
Subject: [Buildroot] [PATCH 1/1] package/python-pydal: bump to version
 20241204.1
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pydal/python-pydal.hash | 4 ++--
 package/python-pydal/python-pydal.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydal/python-pydal.hash b/package/python-pydal/python-pydal.hash
index ae4e1bab2f..2e51472313 100644
--- a/package/python-pydal/python-pydal.hash
+++ b/package/python-pydal/python-pydal.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydal/json
-md5  7e6e1e955750752715f0f135a9f5cd4f  pydal-20241027.1.tar.gz
-sha256  8f7e9eeb5806d4433dcebda53efca1954eafd5c776fa19ee91e3efad1b9ff414  pydal-20241027.1.tar.gz
+md5  3afe3f02b2b9ddeb366be400740003f5  pydal-20241204.1.tar.gz
+sha256  1ba1f9e528b985e234f5b3acfd9d549998b44f7ed7ae747b9e8d4ad3047bf511  pydal-20241204.1.tar.gz
 # Locally computed sha256 checksums
 sha256  1f711e93f1e0c2eec576e2e60597dc2ed6f0a661e4749c6b8a39f0d4a72be468  LICENSE.txt
diff --git a/package/python-pydal/python-pydal.mk b/package/python-pydal/python-pydal.mk
index 4eff89b0d7..2764314496 100644
--- a/package/python-pydal/python-pydal.mk
+++ b/package/python-pydal/python-pydal.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDAL_VERSION = 20241027.1
+PYTHON_PYDAL_VERSION = 20241204.1
 PYTHON_PYDAL_SOURCE = pydal-$(PYTHON_PYDAL_VERSION).tar.gz
-PYTHON_PYDAL_SITE = https://files.pythonhosted.org/packages/31/7c/aa20d1d25f22d575e180181feeae4a077ff36414e0547060434c398d159a
+PYTHON_PYDAL_SITE = https://files.pythonhosted.org/packages/e8/78/7ddf9aacea5cd2e63423d278d26465c63ecdae87cf1c503d8fc1f7dfcfa5
 PYTHON_PYDAL_LICENSE = BSD-3-Clause
 PYTHON_PYDAL_LICENSE_FILES = LICENSE.txt
 PYTHON_PYDAL_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
