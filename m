Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F93C02181
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 20:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D773B81EB3;
	Fri, 24 Jan 2025 20:18:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id shgDRFUnBIU3; Fri, 24 Jan 2025 20:18:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D137D81EAA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D137D81EAA;
	Fri, 24 Jan 2025 20:18:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 39138944
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 20:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26E7841650
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 20:18:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ialr2i-VyPG for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 20:18:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E048F409A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E048F409A2
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E048F409A2
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 20:17:59 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-3ce6b289e43so21800745ab.3
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 12:17:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737749878; x=1738354678;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2iWXeZHeym44Eg6PcXIAIcyE6KDlcvfg0t4VKbDkcAU=;
 b=Mlk4WySECumx902zUt6QJOCtjpcbPlCM5yFIAGn0cIHzMGUvOlY5u1P2TtvLEePoYX
 etfys7QlTqUvAIf5EZdEztG+SYtHIo/yKDvUH44roXdppW6SvYp8dhACIg90mXFdyMEv
 QilpiEmy9sn2FH3uKhWzX6T3j9aB1klbUj44oQP5DRKv/Jz0Br0/oYx+nJJwy9wRL4ae
 RF6bSX3LG65/jySGGfwjZA1JSy3gFHIWdFvrpxopat2zhNuuIN0qFuIMLb5rA9MIXTi3
 iHalSV7uUnHTWj9Z1Ozz1nRnPN+w9q4HEs2MytKL48Epi00V6gDqS9qvLViAIRUQQe07
 Yh3A==
X-Gm-Message-State: AOJu0YwaqcIM+Uq9hvo15RsllHctgQe/fhxzQi+Fw6r5F/mjpBzGlxFi
 cYChM2o1lbVw4XmRJ1oQwCveXSzTvg/fZ8I+r+hxcEx80hFo+5vqJ01ZyV2g
X-Gm-Gg: ASbGncsIXy+oqU3WWlCMyG3XpKi5NzUUbsmKAPTE0TeNrpUcKeH4v5RzLReUnvXO4Hv
 Oo3tfha6Bab3V+lkaIIEU45KVsqajjCN8YDnWsti8zH70Wrt46J8SBmDKSKLBpT5ZKDSJcJ236V
 /pW5m+DF9fY2hP+v9McW0oqbK86gXom5Z36nmTp59OshnyPNFsKsdTQtgVdwmvbFkjQKANtc085
 pRG2pIHBvHifaM3aediCsetYdzS74IlwKjSD/kLCxZv0PY4LZk0nnDyp55iZ2Yx/TCO7y78qdci
 OPZTCretiw5gfB+fY4fb6zlgC//6NlnduuKisY8dLAAOnu31m26tyuE=
X-Google-Smtp-Source: AGHT+IEf6wZ4xJhqJw3A+qeDGBO2mDjOTF/RWfaaz60AO8UrCNW1+5CGPccTNcChNQKvjdTG2NKk5g==
X-Received: by 2002:a05:6e02:1a03:b0:3ce:8b0e:8a58 with SMTP id
 e9e14a558f8ab-3cf743f75ddmr270552885ab.6.1737749878708; 
 Fri, 24 Jan 2025 12:17:58 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3cfc74e93f9sm8705205ab.52.2025.01.24.12.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 12:17:56 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Jan 2025 13:17:54 -0700
Message-Id: <20250124201754.3848443-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737749878; x=1738354678; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2iWXeZHeym44Eg6PcXIAIcyE6KDlcvfg0t4VKbDkcAU=;
 b=giKcDGzduTfGVW/0QrsWgyTyUGkXuhgxh7CDhLborXqfqpxdGKfuxW+ZFwKBvx9UBy
 wcRNiXu+L3Syzcatzovqp27njFVrCx6L6GQtFMCEbukMBMrJkBHlwsjtYgYCUeZAAS7p
 b2xdUnPiZwPrPRzwyAy70eqx0tSuwMGKJ1fl5t6FQCk8uiSm/rosT+y3Lb8S7ZrEknJ2
 ib1llp3fGJjCqP4JYvcBVC9s67e2Vfm/XnzX8MX9NdTtjzlT8Uct9McpC7OlRX16WjMt
 Oq0WWXo4TaVW73B4fMu9fkv8DVMXndvtd/9qOxeaE0OpiqzXr1srlM0rtLgQMQOUDU5m
 gpmA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=giKcDGzd
Subject: [Buildroot] [PATCH 1/1] package/python-pysnmp: bump to version
 7.1.16
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
 package/python-pysnmp/python-pysnmp.hash | 4 ++--
 package/python-pysnmp/python-pysnmp.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pysnmp/python-pysnmp.hash b/package/python-pysnmp/python-pysnmp.hash
index 52d8b171d6..cae02270b3 100644
--- a/package/python-pysnmp/python-pysnmp.hash
+++ b/package/python-pysnmp/python-pysnmp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pysnmp/json
-md5  e8b4dedcbe56d8cfe323bcbbe88adba1  pysnmp-7.1.15.tar.gz
-sha256  f624f2fab9503431f6514ad388b32aa657b36da59d2bc9b6059786db7d9f6257  pysnmp-7.1.15.tar.gz
+md5  a6c2189839202b7ab76144743d7824b8  pysnmp-7.1.16.tar.gz
+sha256  51581c70e410e456eb3faa24c42a094c82acfa961d16ad659b57c5818379dfcb  pysnmp-7.1.16.tar.gz
 # Locally computed sha256 checksums
 sha256  4954453957449b5e6f797d070f4d91024dceb3e056c99d72350795b71db0fc70  LICENSE.rst
diff --git a/package/python-pysnmp/python-pysnmp.mk b/package/python-pysnmp/python-pysnmp.mk
index 32abd1fb15..a04c3e4be7 100644
--- a/package/python-pysnmp/python-pysnmp.mk
+++ b/package/python-pysnmp/python-pysnmp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYSNMP_VERSION = 7.1.15
+PYTHON_PYSNMP_VERSION = 7.1.16
 PYTHON_PYSNMP_SOURCE = pysnmp-$(PYTHON_PYSNMP_VERSION).tar.gz
-PYTHON_PYSNMP_SITE = https://files.pythonhosted.org/packages/c7/ec/beb6b7587249050f5100cadc183dabc3da7e1c321f44ca879c71b47f9306
+PYTHON_PYSNMP_SITE = https://files.pythonhosted.org/packages/a2/b1/c94dac49a002eed96e2cb7aeb1d148b1c98826e5cd1f6e8eebb4a20f8d49
 PYTHON_PYSNMP_SETUP_TYPE = poetry
 PYTHON_PYSNMP_LICENSE = BSD-2-Clause
 PYTHON_PYSNMP_LICENSE_FILES = LICENSE.rst
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
