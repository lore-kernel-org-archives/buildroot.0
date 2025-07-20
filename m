Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD7EC83F1A
	for <buildroot@archiver.kernel.org>; Sun, 20 Jul 2025 19:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6207D60EC6;
	Sun, 20 Jul 2025 19:01:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jJZ4w9U0q4lX; Sun, 20 Jul 2025 19:01:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 912C660BAD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 912C660BAD;
	Sun, 20 Jul 2025 19:01:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BB9C1F7
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 19:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88E8C40F5A
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 19:01:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x5E6r5VA1QXr for <buildroot@buildroot.org>;
 Sun, 20 Jul 2025 19:01:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12f; helo=mail-il1-x12f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B619940F58
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B619940F58
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B619940F58
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 19:01:33 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-3e28be470f1so16839095ab.0
 for <buildroot@buildroot.org>; Sun, 20 Jul 2025 12:01:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753038092; x=1753642892;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hCMvj3naQZ5+95AfiJSPMREEPAJFZs3w3jcmkPNJ/QM=;
 b=QBZh5pM+/EJXXJsfM85B/K38qEWvkCXBMAPhJ1OVKLh5LSpYC9dGthM7bEIp2REGUR
 WDPNL7+ES1ox+FquFqUDKxDZ+PH4iSRZAq4LGqf6GhV/U0dy5lwQZQrkinelhh2fxHjI
 woAYx7nZRneHSTpDKI0himbx8IhQtJSNW/rm0JpDiVnWTmvaL1GWXfiHzcjydjkLRdVC
 ZfNE757JDPZvbhxROkQS5oOn+qVaIAky7BhlxdJMbLEvLAAYN/o6hDxj8/ABlwQV1Lsp
 dqrq8APDuN5pRr5hGBMhV8JhBlmFqSLS/L9xkhCla8jG30pkbzmGG0JMFzaRH2Gddm+a
 KwfA==
X-Gm-Message-State: AOJu0YxIAhnV47itrp+Kxj3mwF3aRwHgHu7Vxg5If19nMc9R1iYREXc9
 NyJVs1EsR96766czUzv4GX8enaE/+ejB6BWXVCjomJM3Pb12sOuggW9IzanA8f8m
X-Gm-Gg: ASbGncvJLY/QJ1mPHG/lb2Ey2+Rz2m9GKJxTvyL050+VryXutK/X/Iphqwv6NM7dfGO
 yPatky52gecnhCmsY46RF/ANoCRdtn2SHjSdAky8SLcQX6P+pwVuYNlDf3WLc3MsRDSSekSi0mb
 lQgiFBkp3i9X1+HI3p3EWqLaxCYVkzm7s/YqODhSGgbMtW2uxhfx/OjrmKBnhqberBVzdcptCP2
 OIRe5sdbjyDpIF7PBYY13Oa8i9fIuBNq2tnwNrrjwNbp5C/OUaPoAMtpgAUF6Y1FqXdLdAp7GfI
 5x+6kC/Kks5jLR5rnuU2m/Ar5nz2xpNKL7WjqxVyvNCh1FT5gQmLU0FbkVNCL2epbBESnAclLQH
 iGbORQJFG0uIM1QV1ULj4BSSBb7oWnw/dH+ujqBXjjVqV8H0VT5F2qyw1FCgWInFZ54NF6wTFlz
 bNLBDx4or6lUMmnIn3bA==
X-Google-Smtp-Source: AGHT+IHtAg197JWb3fFpOfCBKYJopx9wuhSSVDC0XY89fElbcmev7kmR0x75HpvbrI4L1L6ocsmCOw==
X-Received: by 2002:a05:6e02:188d:b0:3e2:9b05:d1e6 with SMTP id
 e9e14a558f8ab-3e29b05d40dmr75482355ab.8.1753038092411; 
 Sun, 20 Jul 2025 12:01:32 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3e29826ed66sm18568125ab.35.2025.07.20.12.01.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jul 2025 12:01:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 20 Jul 2025 13:01:27 -0600
Message-Id: <20250720190127.3211017-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753038092; x=1753642892; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hCMvj3naQZ5+95AfiJSPMREEPAJFZs3w3jcmkPNJ/QM=;
 b=kbKzsTU/k3i0lz4VH+wMk4i9HaCp3TFhBwB5jQhZ2myCdhCu0279CDP9nIHAWYqUM7
 6fPeuvvHMO74mQ/oUSZSoTrAYibwpDPndoPBTqDh9XPWXGXE1eUeNvxvJi03FJtooD91
 n9kogbIsjibaE1KxysT766IWkvj8AdfMxhkFDoWhV3IIF/00tAzAtEqcJx060aB2tLMX
 2Tfj66sTb6F+HSAeXsM+5ehsCI7Vxm69hvHHWui0Nc6Fos94nuDCF3x4KtJsXvRqXnwA
 mOALmbTJuHQnBlzT9wqbHsma37RnFLJGqh7TMpUdHXWB4sA94R5r0TNfCaKMEwf3CaGK
 DM/w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=kbKzsTU/
Subject: [Buildroot] [PATCH 1/1] package/python-aiocoap: bump to version
 0.4.14
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

License hash changed due to adding SPDX header:
https://github.com/chrysn/aiocoap/commit/e666dd6515479f44fda6b5610064025ada56e199

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiocoap/python-aiocoap.hash | 6 +++---
 package/python-aiocoap/python-aiocoap.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-aiocoap/python-aiocoap.hash b/package/python-aiocoap/python-aiocoap.hash
index 30e68a7582..dfe0d02c80 100644
--- a/package/python-aiocoap/python-aiocoap.hash
+++ b/package/python-aiocoap/python-aiocoap.hash
@@ -1,7 +1,7 @@
 # md5, sha256 from https://pypi.org/pypi/aiocoap/json
-md5  a79e7c7586cbb9056743683eb9bbaef9  aiocoap-0.4.12.tar.gz
-sha256  808e87068aa57dbf31486cfdfa9098b0a6f5ca444c6b8966f3e50a403628981e  aiocoap-0.4.12.tar.gz
+md5  028b0ce02cb94317a24d31adbb22150c  aiocoap-0.4.14.tar.gz
+sha256  01a34233b6f9a97df9a61f30bc64c0399bac498eaa160189a7f1f48f89d18717  aiocoap-0.4.14.tar.gz
 # Locally computed sha256 checksums
-sha256  c59b1339031e4495b336555be42b8b488eacfb037a23fadf2d5e2c8abd0e6366  doc/LICENSE.rst
+sha256  8baefb820ca33d8176df8d0430ce05d15764617cd07ec04238c56d641273f472  doc/LICENSE.rst
 sha256  51d56d9e6f9755df590a329e73ca58663605a182a8e80f0166fff65203a1185a  LICENSES/BSD-3-Clause.txt
 sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSES/MIT.txt
diff --git a/package/python-aiocoap/python-aiocoap.mk b/package/python-aiocoap/python-aiocoap.mk
index 357ac1da08..26909e7dd1 100644
--- a/package/python-aiocoap/python-aiocoap.mk
+++ b/package/python-aiocoap/python-aiocoap.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOCOAP_VERSION = 0.4.12
+PYTHON_AIOCOAP_VERSION = 0.4.14
 PYTHON_AIOCOAP_SOURCE = aiocoap-$(PYTHON_AIOCOAP_VERSION).tar.gz
-PYTHON_AIOCOAP_SITE = https://files.pythonhosted.org/packages/a2/16/a9167225339089b2c295cc37aa5a01f758d164c5cda591cc9d2976719196
+PYTHON_AIOCOAP_SITE = https://files.pythonhosted.org/packages/28/76/de52f7fa51ddbb5255f7b80d8965903bfa718420ac5d21b0852f5d81c1b1
 PYTHON_AIOCOAP_SETUP_TYPE = setuptools
 PYTHON_AIOCOAP_LICENSE = BSD-3-Clause, MIT
 PYTHON_AIOCOAP_LICENSE_FILES = doc/LICENSE.rst LICENSES/BSD-3-Clause.txt LICENSES/MIT.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
