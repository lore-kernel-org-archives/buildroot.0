Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B94AEC02181
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 20:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63BF760822;
	Fri, 24 Jan 2025 20:55:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dFGznzhGoMv9; Fri, 24 Jan 2025 20:55:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60FC660868
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60FC660868;
	Fri, 24 Jan 2025 20:55:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F445941
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 20:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F3BA4012F
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 20:55:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eLvahxlxKE6H for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 20:55:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7EED340154
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7EED340154
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7EED340154
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 20:55:23 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-844e6d1283aso98959439f.1
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 12:55:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737752122; x=1738356922;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e9rReL3m/M8WuOC7mLSCSo3TMdVaJv/5OBqLTtl8SOk=;
 b=wzCM7B96FUZi1TONFPRPyhaPLt6QRuPWwjbWvWWT3FtSa9WdIi5S9cWBltK8cEAo62
 Hn94V96J7ffnHsv1NkCf5/CVXrwgRWjFgAtzhQ6tZLql7vw436eQzkAp4A7njiRplrNR
 qjMw6ueLzvGJNuEvfoXUpd4lxq9isHyuZPTz7p4ueR6NURuTi4xX9KnqVS+pGuhqgLyo
 HAUWMuFRP6I7esoYLAi4NU2OMM4RU4PJGBptIJRcbW0pxSZHSdPf52ilEEHQoZXaiVJz
 7VfG5fEywdAXzyY1DZzsF3P5jvnHaWhWrcinAl3u+t1/EGNjyw+S+CdFSSHsPE5hoTS3
 plfw==
X-Gm-Message-State: AOJu0Yw5sAqBIWbGqvKO1JegZvxtEYS+HFruSLwWUv9xz34SwazJTC3V
 /b2pCT5g+CUADSjhXAMAXveLUPYUaAdVWeDstnhGvbG+RAxGqq52OwVGEX89
X-Gm-Gg: ASbGncvPOXxKs1WPEa3RweDRKzwobcg/atrXktTHYJUMO4ZTRFauFLaMoV6EO9Sc33F
 ig8zc/4bXPIaq+JxJ/mh4SCHSJN/Ll/D+ctcRdbfoYRV81YddNt7wTvv848ZsCWhCzEJmVJog9M
 6yFy5xKCUawEkxFOEB3u2j4/5WWIF10iuVI0G06HgyAs9DzlkBYaU0oN67BCt9oU4JjarbBV00f
 sFGky3J/r6KpO8aj8Vd8ARhUsWigArzgAkrY24fmPLUnYBWNThl74EEOdd8w7V73ecJtV2aGDri
 cIrJfZ/shxgi0ECs9auGcOJA6cFVnXCl+r+5PGnR+E0TxDbJGsmBEQ0=
X-Google-Smtp-Source: AGHT+IGFgpQ+tMkqSlF9McdptucL4DuBRBNhmT9dXwUhhkStyB2TjsYvaK2WscgiSPr46PnHIm9UoA==
X-Received: by 2002:a05:6e02:3a86:b0:3ce:3541:d80f with SMTP id
 e9e14a558f8ab-3cfc787fbb5mr43725485ab.0.1737752122297; 
 Fri, 24 Jan 2025 12:55:22 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ec1db6c434sm833570173.93.2025.01.24.12.55.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 12:55:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Jan 2025 13:55:20 -0700
Message-Id: <20250124205520.3860825-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737752122; x=1738356922; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=e9rReL3m/M8WuOC7mLSCSo3TMdVaJv/5OBqLTtl8SOk=;
 b=OYknvli2EPMO/c2hWN7S1kgAEVCSYCc44Jhf0+flk/4vhTtre7AX7/3URPioQ/Knjg
 cTFIulLBjEABhCl/AGaHOk9elFKYQxIgcm/3NlNU2truBbRQfoFF1SeIPmo9lBmy585y
 oh+euv0AUjcaAPqGYK+/LyugB13u9mua8GBu+pWReFZYH5Cag/qH7/wym3xZjf++Pcat
 +u6lNX3HfrW8qBbh0IpEsfNkz6/ajxXQQCyDADsw5CjjLeE9Fr+eCl1HE1qH8rPfEFka
 /REGE2yKR2pMX5+wAsqDjU6Vjt1kBIJcPIXpp7M4FzmOZvKvFovm+91aKcu09uwpFWV8
 HS3g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=OYknvli2
Subject: [Buildroot] [PATCH 1/1] package/python-sentry-sdk: bump to version
 2.20.0
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-sentry-sdk/python-sentry-sdk.hash | 4 ++--
 package/python-sentry-sdk/python-sentry-sdk.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sentry-sdk/python-sentry-sdk.hash b/package/python-sentry-sdk/python-sentry-sdk.hash
index 5d65087a6d..0bf0392c77 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.hash
+++ b/package/python-sentry-sdk/python-sentry-sdk.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sentry-sdk/json
-md5  235bf9f6e317e809673bedf9dd5d5c4f  sentry_sdk-2.19.2.tar.gz
-sha256  467df6e126ba242d39952375dd816fbee0f217d119bf454a8ce74cf1e7909e8d  sentry_sdk-2.19.2.tar.gz
+md5  1ee9b58ddcc2227b8534c7ab9c5b8da7  sentry_sdk-2.20.0.tar.gz
+sha256  afa82713a92facf847df3c6f63cec71eb488d826a50965def3d7722aa6f0fdab  sentry_sdk-2.20.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6d7ec62dc20e8b92cb88b89fb3b55ee8576505f3e1afa57952548f6eea5d008e  LICENSE
diff --git a/package/python-sentry-sdk/python-sentry-sdk.mk b/package/python-sentry-sdk/python-sentry-sdk.mk
index 0ccfd7ecd3..a404bcda15 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.mk
+++ b/package/python-sentry-sdk/python-sentry-sdk.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SENTRY_SDK_VERSION = 2.19.2
+PYTHON_SENTRY_SDK_VERSION = 2.20.0
 PYTHON_SENTRY_SDK_SOURCE = sentry_sdk-$(PYTHON_SENTRY_SDK_VERSION).tar.gz
-PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/36/4a/eccdcb8c2649d53440ae1902447b86e2e2ad1bc84207c80af9696fa07614
+PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/68/e8/6a366c0cd5e129dda6ecb20ff097f70b18182c248d4c27e813c21f98992a
 PYTHON_SENTRY_SDK_SETUP_TYPE = setuptools
 PYTHON_SENTRY_SDK_LICENSE = MIT
 PYTHON_SENTRY_SDK_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
