Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 020AEE77188
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 02:32:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE7728518F;
	Thu, 19 Dec 2024 02:32:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IRO7b0xStpX4; Thu, 19 Dec 2024 02:32:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A924885194
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A924885194;
	Thu, 19 Dec 2024 02:32:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A199CC0
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 02:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F4E761AB4
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 02:31:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oTEf_juD3KGl for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 02:31:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::133; helo=mail-il1-x133.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A5789617B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5789617B3
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A5789617B3
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 02:31:58 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id
 e9e14a558f8ab-3a7e108b491so2235415ab.3
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 18:31:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734575517; x=1735180317;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N8A3u/i159gdfwEBDXs8TnADVTCBYuCfqUjbyFyisFQ=;
 b=Q28WyvVR9X20Ra3EC9PCt12zmiAAbiSFXvP+CFcttLfK5SQyrrDa+eFx3NA/wxShvN
 BRrmmxaBB2kSqmwfJMvWb2j1PcJfMkRgDpYwb5Gfe2IPREznDUIwj24GxF6gMaFgmvrH
 hWtHXhzmIlPW7VC6Z2UV/WswfdYFP2ba1CNtSb/4deLEIhevcOftbjsQiv5XFS31n+yR
 /eOprh5/uFY2JAcX4W51F7mms8ml+NwmkUIdzCZNLseK0gij9w9dzmqmChEKWKm7AFjf
 0AFtyoeeQ1WHrL/XMzCLoMGWn+3TLwGGbkvkaynjsyEnSgY/RbF+P9m1xoPWoxChtrl2
 WACw==
X-Gm-Message-State: AOJu0YwG4F0uRzLFzq4m5zLCiCaiVzwucAOr470cz56W3OG4okZe6kp0
 4V9yQcZ7th2eWciJWAU+2NyTZABKCHalDxjlAIO1dlHMCWeFlgtNsg/CuTSPRUc=
X-Gm-Gg: ASbGncvGSlTaYnpn6WYeGboRlnj9Jsctjv3KaAiE/HS/8MO7UPp7hpCkxWzeFcRVWxZ
 7sc8tqXZkK1/zpLrKZynq+B9EQnVkwodOVJwUs64RO5v23aOnnSs61eJX77QINwc5sRsx8gdcWb
 jBir6LuGnvcVioTRCH+mNAB/g/auOpQgA5miDthNwkfYt5IH0pMrIKxqa+JXR/dPIbrZmoSMfij
 eejyjo3oy+0dRWH1ficABkQMpsKtmzB5NSwkyv5SDH/wG20zFFAaYye+zqXz3p0KU4923eRek4S
 8dGC/8g/+XB20yr27SeE8lXLea0XZmuEPg==
X-Google-Smtp-Source: AGHT+IHj4RAOjVyfDqAp/15Ewx2A4EDLgFlAhh5CBOtpz224TRmjtwi+fGrgNKZJY/MebAorSwfKVg==
X-Received: by 2002:a05:6e02:20e5:b0:3a3:b5ba:bfba with SMTP id
 e9e14a558f8ab-3c013b0724dmr19498305ab.15.1734575517427; 
 Wed, 18 Dec 2024 18:31:57 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3c0deae6a1csm739455ab.23.2024.12.18.18.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 18:31:57 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 18 Dec 2024 19:31:55 -0700
Message-Id: <20241219023155.286991-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734575517; x=1735180317; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=N8A3u/i159gdfwEBDXs8TnADVTCBYuCfqUjbyFyisFQ=;
 b=MwNoFs2cDt2J35hBb/Eiy9g4u0atI65+6KHB6cjd9JI7Cg/5ZdJbpEvfOzCm5ZL/LJ
 wnfteevXQMaSbzjkMJNfWPnwXyirKAize+Yq0xyuiDvm1+foBPNUVuT2y+DOUbARXrsd
 JlYtfoNlE2s7IHB4ZHgvtbzfeCBYht+4OxqYQ4tNxlcHvCrwBX3/1W72USwegPPNQRMU
 u+2j5SfFxb2LtJ2Qkb5jlF4X9SFJhHkPPreTsxbt170J/ZImu+Wv3bcVc3riZ3HOobk4
 sECyS8+45slqYWEM7Yw+iz9XbiDr8FreZoFlXIUlF3QIJ8zz7emEf/iq+rxSI5/dveDK
 3r+w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MwNoFs2c
Subject: [Buildroot] [PATCH 1/1] package/python-sentry-sdk: bump to version
 2.19.2
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
index 6243632685..5d65087a6d 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.hash
+++ b/package/python-sentry-sdk/python-sentry-sdk.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sentry-sdk/json
-md5  d68e388f9a261c00515e0f758303240f  sentry_sdk-2.18.0.tar.gz
-sha256  0dc21febd1ab35c648391c664df96f5f79fb0d92d7d4225cd9832e53a617cafd  sentry_sdk-2.18.0.tar.gz
+md5  235bf9f6e317e809673bedf9dd5d5c4f  sentry_sdk-2.19.2.tar.gz
+sha256  467df6e126ba242d39952375dd816fbee0f217d119bf454a8ce74cf1e7909e8d  sentry_sdk-2.19.2.tar.gz
 # Locally computed sha256 checksums
 sha256  6d7ec62dc20e8b92cb88b89fb3b55ee8576505f3e1afa57952548f6eea5d008e  LICENSE
diff --git a/package/python-sentry-sdk/python-sentry-sdk.mk b/package/python-sentry-sdk/python-sentry-sdk.mk
index e2cbdcf405..0ccfd7ecd3 100644
--- a/package/python-sentry-sdk/python-sentry-sdk.mk
+++ b/package/python-sentry-sdk/python-sentry-sdk.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SENTRY_SDK_VERSION = 2.18.0
+PYTHON_SENTRY_SDK_VERSION = 2.19.2
 PYTHON_SENTRY_SDK_SOURCE = sentry_sdk-$(PYTHON_SENTRY_SDK_VERSION).tar.gz
-PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/24/cc/0d87cc8246f52d92228aa6718a24e1988a2893f4abe2f64ec5a8bcba4185
+PYTHON_SENTRY_SDK_SITE = https://files.pythonhosted.org/packages/36/4a/eccdcb8c2649d53440ae1902447b86e2e2ad1bc84207c80af9696fa07614
 PYTHON_SENTRY_SDK_SETUP_TYPE = setuptools
 PYTHON_SENTRY_SDK_LICENSE = MIT
 PYTHON_SENTRY_SDK_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
