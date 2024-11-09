Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0284D5E379
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 19:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A79BF6059E;
	Sat,  9 Nov 2024 19:05:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bvE0R_mkLcss; Sat,  9 Nov 2024 19:05:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABA4F60657
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABA4F60657;
	Sat,  9 Nov 2024 19:05:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 673FFD8F
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 19:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 526F440167
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 19:05:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ecbp4MghFGbK for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 19:05:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2FCC04013B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2FCC04013B
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2FCC04013B
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 19:05:40 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-3a4e5401636so12579485ab.3
 for <buildroot@buildroot.org>; Sat, 09 Nov 2024 11:05:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731179140; x=1731783940;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bbgh/cwuuew7vykG7rc/DXIoVdeDdB/GO+AjNUhOPt8=;
 b=G4/fEfnAVoaGUqH4TxtDYsOFYwAVIx+tA+9EKSRyNOyYDdd2mpZm4JTOnJjZrAjd9C
 8l7gtTMlngKCa2fk1gC0q7u8Hi8qiVd+ufVnKaShwyNmYIF3ju7OUNzOGDGfl0siuHVK
 Ekn8Wn02LrIIHaR8BPW4CWBCqPU/XXsyQgEB7yXO0HzhpEsj62R8HpuJUeuGAhl7+i2C
 W5X3o2Y/G3d5Tyjc5hDVQFGt94pZiBG3DO1hexUlDxxtoY/bB5slbwgh6RTs+bYlTrK4
 ruuhASmp/v4Y5YdhbtStxb/KyxugS/rK49q6PiW3FEkSZFDr906VmZdmiaxq5tXddLqh
 0b/w==
X-Gm-Message-State: AOJu0YxMOK7/cOOlTs2LGeHtuF/nLn3aF+r7Ss1XgwfSe/BpQIdJV7WW
 dgCiRPQ62c74yfnZ1f1C6Gu9i7sc5BX1Lt7DQLmEAuBH9mvZOurdAL39lQ==
X-Google-Smtp-Source: AGHT+IFWRgUYIJ/zQRNWzheC9O7XIvSgcrL03ZyUKMJckvaNUSzy1fGPeYUP42dd5oZakd7uJbdmew==
X-Received: by 2002:a05:6e02:1545:b0:3a0:8c5f:90c0 with SMTP id
 e9e14a558f8ab-3a6f19f3ff0mr83873285ab.10.1731179139897; 
 Sat, 09 Nov 2024 11:05:39 -0800 (PST)
Received: from james-x399.localdomain (71-33-148-91.hlrn.qwest.net.
 [71.33.148.91]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a6f984384bsm4746595ab.40.2024.11.09.11.05.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2024 11:05:39 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Nov 2024 12:05:37 -0700
Message-Id: <20241109190537.778163-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731179140; x=1731783940; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bbgh/cwuuew7vykG7rc/DXIoVdeDdB/GO+AjNUhOPt8=;
 b=WnY0ce5joDL8Es404j/YWNY2jhbRCycdbh51ojlMSRMHPaCDtf6smGY6dpecUKCVXK
 aME73P32oeJhALXLyhPzJs4H1dngxFRqPm+OrKyCRdtJj1EFCSD5IWaiswH6QnaCClFj
 vSVpxAI2eaUoHfcmZhtMhd/kblW6FrOERem6LdPUklwnbOctIB8nuLmmyLc430BRIWNM
 EYdeylaeNE163jy9jUWg14DbnjxK8+qk4dHMBWmVljURDkI0z8V7jdhptNW53wIpZmpF
 UpNZN7Q7GUrWchOS8zsaktlqpMkpniabS+ZZwpa2UH5NQzy1YTuUYIjsMqRSYhsSExso
 q9Cw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WnY0ce5j
Subject: [Buildroot] [PATCH 1/1] package/python-regex: bump to version
 2024.11.6
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-regex/python-regex.hash | 4 ++--
 package/python-regex/python-regex.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-regex/python-regex.hash b/package/python-regex/python-regex.hash
index 054e5937e9..1eb8936d5f 100644
--- a/package/python-regex/python-regex.hash
+++ b/package/python-regex/python-regex.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/regex/json
-md5  a544771359e2c977578297506de829eb  regex-2024.9.11.tar.gz
-sha256  6c188c307e8433bcb63dc1915022deb553b4203a70722fc542c363bf120a01fd  regex-2024.9.11.tar.gz
+md5  02b86394591ba39d34bc35d11e9e7d96  regex-2024.11.6.tar.gz
+sha256  7ab159b063c52a0333c884e4679f8d7a85112ee3078fe3d9004b2dd875585519  regex-2024.11.6.tar.gz
 # Locally computed sha256 checksums
 sha256  bff55ef4cdcc8c14ce259f8e8ab60e264418440d6335f4dc138273fbd506144d  LICENSE.txt
diff --git a/package/python-regex/python-regex.mk b/package/python-regex/python-regex.mk
index fab4cf8365..ef8c1f198c 100644
--- a/package/python-regex/python-regex.mk
+++ b/package/python-regex/python-regex.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REGEX_VERSION = 2024.9.11
+PYTHON_REGEX_VERSION = 2024.11.6
 PYTHON_REGEX_SOURCE = regex-$(PYTHON_REGEX_VERSION).tar.gz
-PYTHON_REGEX_SITE = https://files.pythonhosted.org/packages/f9/38/148df33b4dbca3bd069b963acab5e0fa1a9dbd6820f8c322d0dd6faeff96
+PYTHON_REGEX_SITE = https://files.pythonhosted.org/packages/8e/5f/bd69653fbfb76cf8604468d3b4ec4c403197144c7bfe0e6a5fc9e02a07cb
 PYTHON_REGEX_SETUP_TYPE = setuptools
 PYTHON_REGEX_LICENSE = Apache-2.0
 PYTHON_REGEX_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
