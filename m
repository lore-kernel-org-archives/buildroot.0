Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81215CF3963
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 18:29:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32EC242A94;
	Thu, 19 Sep 2024 18:29:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G_zSs_99A4Hn; Thu, 19 Sep 2024 18:29:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB51F42AA4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB51F42AA4;
	Thu, 19 Sep 2024 18:29:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 510131BF31C
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 18:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F82040120
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 18:29:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WkfXGnHO05qb for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 18:29:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E40284045E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E40284045E
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E40284045E
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 18:29:16 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-82cec47242eso74988139f.0
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 11:29:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726770556; x=1727375356;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=poss5EOlHqy//Mm3BytvZvKL++CPyx6JfqbyaPjXiDI=;
 b=JzI+CXLzKUVxf8dGT+IyhUh4FqJYUkKuo2/FmKl072iy1ga7/+qG819Jr8Tuaa0cdK
 qAMmxT5UnTuadsSErlQkNt5PeL2T0sLPviYLNIlbBQo/WF38W0i/lhhIr8qkS5udw1P2
 yBt3qxDn5M6LG+yfg0ie0LuhxahjCoi/LwZXubFjThGOe977ZbB8oNloux5k0GjtXxCI
 BfvDk81/zNUMxa1voFxK93F3l1HCoKrFHBObCr2GJ9T9VxgyPzRD8zRblSnyZHtEoiaW
 5s46NYef2CYtCjonmpF6z9DTkY0CHiRXKoz/IGJFQ0dRcAWVyDdnq4QF7PPsFqKsv8QG
 cclg==
X-Gm-Message-State: AOJu0Yy10ZWqExDE0abwhHl6cM3GMB8FBI5s/bQHRsvuXIe+km/GEKDW
 YyipkH2Q2TJwcvKqffp2HZFAry7n6Bl7RRV/x6GLmP4H/nqtTWhvcTbcFA==
X-Google-Smtp-Source: AGHT+IFPvV0BHkGnaNU25wERWAU9uDy0kjS9oUi8Q9Da0Y34qb2n+OFmTAPpd30o6ZV2PJubM4I0Ow==
X-Received: by 2002:a05:6e02:1809:b0:3a0:9030:e70b with SMTP id
 e9e14a558f8ab-3a0bef528f7mr33737325ab.4.1726770555702; 
 Thu, 19 Sep 2024 11:29:15 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e8d268sm36036795ab.71.2024.09.19.11.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Sep 2024 11:29:15 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 12:29:11 -0600
Message-Id: <20240919182911.645041-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726770556; x=1727375356; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=poss5EOlHqy//Mm3BytvZvKL++CPyx6JfqbyaPjXiDI=;
 b=RNY0FQiIQG3nqAE4OTw7b2UYMiB0DAEaBfe6plzthS4V/mdyM3po5usu+LGG/ZaBrZ
 MFUS5LJNB4/ptpP6DnHo5e019X938TrNArkUEbrYeWy6t7UggyKObS0HVRvTjgeFGErp
 p3ZIMgauGbcaaWRZzI5bWtFGDvbAglM9dC+7szmOVu+5no0A4PypOXUJ//Ss/AFW2SGZ
 Osx+p6hYF8oK5V4uO2gbMCOL0FVt5ugENputS1blrk4t6PopieNhKAFSAbTZSPaIIBsd
 YkBG9eFck9zGY4pfpqpxHadPvf8I5f5tja/EAiM3FW6i7e5mxgHBRlELlYDvXehe83Vv
 Q3nw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RNY0FQiI
Subject: [Buildroot] [PATCH 1/1] package/python-requests-oauthlib: bump to
 version 2.0.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-requests-oauthlib/python-requests-oauthlib.hash    | 4 ++--
 package/python-requests-oauthlib/python-requests-oauthlib.mk  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-requests-oauthlib/python-requests-oauthlib.hash b/package/python-requests-oauthlib/python-requests-oauthlib.hash
index 08c19ab1f6..5d37e09f76 100644
--- a/package/python-requests-oauthlib/python-requests-oauthlib.hash
+++ b/package/python-requests-oauthlib/python-requests-oauthlib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/requests-oauthlib/json
-md5  c4f3b4ecdb72a56a13675e5a3302852a  requests-oauthlib-1.3.1.tar.gz
-sha256  75beac4a47881eeb94d5ea5d6ad31ef88856affe2332b9aafb52c6452ccf0d7a  requests-oauthlib-1.3.1.tar.gz
+md5  713dc7856f9ff625d75335c10d332a1b  requests-oauthlib-2.0.0.tar.gz
+sha256  b3dffaebd884d8cd778494369603a9e7b58d29111bf6b41bdc2dcd87203af4e9  requests-oauthlib-2.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  ae01846afad8a8291fe6a08966f3015af9a8ff675d84b981f9793c122f7876e8  LICENSE
diff --git a/package/python-requests-oauthlib/python-requests-oauthlib.mk b/package/python-requests-oauthlib/python-requests-oauthlib.mk
index cdd334fb9a..823b8140fb 100644
--- a/package/python-requests-oauthlib/python-requests-oauthlib.mk
+++ b/package/python-requests-oauthlib/python-requests-oauthlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REQUESTS_OAUTHLIB_VERSION = 1.3.1
+PYTHON_REQUESTS_OAUTHLIB_VERSION = 2.0.0
 PYTHON_REQUESTS_OAUTHLIB_SOURCE = requests-oauthlib-$(PYTHON_REQUESTS_OAUTHLIB_VERSION).tar.gz
-PYTHON_REQUESTS_OAUTHLIB_SITE = https://files.pythonhosted.org/packages/95/52/531ef197b426646f26b53815a7d2a67cb7a331ef098bb276db26a68ac49f
+PYTHON_REQUESTS_OAUTHLIB_SITE = https://files.pythonhosted.org/packages/42/f2/05f29bc3913aea15eb670be136045bf5c5bbf4b99ecb839da9b422bb2c85
 PYTHON_REQUESTS_OAUTHLIB_SETUP_TYPE = setuptools
 PYTHON_REQUESTS_OAUTHLIB_LICENSE = ISC
 PYTHON_REQUESTS_OAUTHLIB_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
