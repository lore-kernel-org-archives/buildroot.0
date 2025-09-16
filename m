Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F9B3CAC597
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 01:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2142A80659;
	Tue, 16 Sep 2025 01:14:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SJJH4PCSxUtp; Tue, 16 Sep 2025 01:14:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34F618002D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34F618002D;
	Tue, 16 Sep 2025 01:14:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 62DA5199
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 01:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 546E3814DD
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 01:14:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KLFf0he8YW4t for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 01:14:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::132; helo=mail-il1-x132.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6A21D814DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A21D814DB
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6A21D814DB
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 01:14:20 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-42403719c73so21261925ab.0
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 18:14:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757985259; x=1758590059;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0DGWfvAF1WfB75IE4aWrpNv9fPybtKcqOsYQvGPXqig=;
 b=Fa73pHYp6+KZIm2gzthFc6UtmVYHXtmmSngloLTslgJtgyaDlaFdJ2HF9xqhSGXWgb
 HRiBBs9CF/QM0jUtRoB8kAgn7dc6idzA2+YgBpw8E3+oxgqbZzlMa1dDQgdJHXIgsTpN
 UVENGmFC6rVJRl8CJuQC/JvctdiAC8Ec1y4dxatNJGqDzXWfkPfiZblKNJ7KS7tnGsyF
 c3KMk4nsoM++ndMTN7Uk/xCfhowLIZAjfrNHW+RZtz8rYKFAFSmCQSdNfQHP3S8yTJG4
 f8MhSUTRHAmmkIYBm0dAGbzr9V/puPIIztksWRD9/CU1uvTmTl0Q8BIEPGoNbpAGf4hw
 dPQg==
X-Gm-Message-State: AOJu0YwJE/JrY38C83ZJsjlDTKz6LbR8m6ZZ4iHMdhvZSAebnSA06Vz9
 8ik2G21Y2IJX0ItzlBhJNs0dwYi4KIJRjJV7W6Z6Lww9qHUDj0aMzzJ7/SVHLw==
X-Gm-Gg: ASbGncscuWLviZUWz47yUIU8q9So7yGQDUMhrThSvNgab3Wtw6iZCfwuRmnSjyHgR1/
 0GdSFwF2eZ9SotGLjBi03Uil1z7XasSBXI8+mz3GUlstybPp4UTlVrM5Y+K+UU5p5z9Lbd1oEsH
 JBaqZmCqlsSYr1KEGgg3abxkCveqCFuIBJqk66MCmHQMjeD/zDc2XPjCBEGbVorjB+kqfPSzOEy
 PWXHKAjqxQdrr7NXjfQjMosD5DO26hHGPrb0g20tIfBxqc04Fww3FiD+WydqI++1IF+Z8196yGT
 stnMySUd+dvQDZm1LVT2oRqqESngT8xc2CtFZd170C8Tw5Xns/oe1kFmqUttpTdsf4pXCIRJUZY
 W6DpEGlt8/2LrHRGwX2dopN6k1coKdmtJWMs0ax74LFA991+6/ANq4EpVC3edERHuh5W0/6vegn
 g5
X-Google-Smtp-Source: AGHT+IHjlpi6hQp0kyMfEKLfXUqA51VKC/o9o4p4a2HapuqWkVm6duD8XaPnTcQoFG9wJWQ8r7sLmQ==
X-Received: by 2002:a05:6e02:12c6:b0:3e9:eec4:9b59 with SMTP id
 e9e14a558f8ab-420a5f26edbmr160517925ab.32.1757985259139; 
 Mon, 15 Sep 2025 18:14:19 -0700 (PDT)
Received: from james-x399.localdomain (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-41f0ea1bdaasm60224165ab.39.2025.09.15.18.14.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 18:14:18 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Sep 2025 19:14:12 -0600
Message-ID: <20250916011412.2554838-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757985259; x=1758590059; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0DGWfvAF1WfB75IE4aWrpNv9fPybtKcqOsYQvGPXqig=;
 b=dlp7FkeavKizSuNggmH4XEDogfS1b/icyVpjyoN/LR1I1Dzx5aLqDA1SsH7UG1jSoe
 3+8g9Z6RJ97tTHRZ3qsj0NLD7WEmrX9aICe+RdWZZPghvGYUbULwmCfVfDnH4hIqU8Fe
 Twu1MUCVfbH3G3M4CVMl6HkEamue5ZtUAeo7Q3akMVnoIpMgktf9ZrWviJhdfjlqQH1L
 ba+2ORW5OS3uxCK3KXhyeDpSNMYR6jnaz0PNtZCWme48MF1JFUkq4AB2YL6RHvv8xwLm
 okboD3TJpy5zRMxyEuNdkCnP4Sg+sXlxqS+kQo/EfDq/wY1auEOMkfWavg2Betc9eXoX
 2HGw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dlp7Fkea
Subject: [Buildroot] [PATCH 1/1] package/python-cython: bump to version 3.1.3
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
 package/python-cython/python-cython.hash | 4 ++--
 package/python-cython/python-cython.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cython/python-cython.hash b/package/python-cython/python-cython.hash
index 25fa1d93ba..08972cd035 100644
--- a/package/python-cython/python-cython.hash
+++ b/package/python-cython/python-cython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/cython/json
-md5  6fb2dc869f4d00b4a13e130ec1197bfd  cython-3.1.2.tar.gz
-sha256  6bbf7a953fa6762dfecdec015e3b054ba51c0121a45ad851fa130f63f5331381  cython-3.1.2.tar.gz
+md5  f508595cc0951a77b70c07100df1b4ff  cython-3.1.3.tar.gz
+sha256  10ee785e42328924b78f75a74f66a813cb956b4a9bc91c44816d089d5934c089  cython-3.1.3.tar.gz
 # Locally computed sha256 checksums
 sha256  9568a2b155e66ac3e0ba1fd80b52b827b9460e6cf6f233125e7cbca8e206ddc3  LICENSE.txt
 sha256  e1eb1c49a8508e8173dac30157e4a6439a44ad8846194746c424fbc3fc2b95d7  COPYING.txt
diff --git a/package/python-cython/python-cython.mk b/package/python-cython/python-cython.mk
index cffd613787..50e2e6e1cc 100644
--- a/package/python-cython/python-cython.mk
+++ b/package/python-cython/python-cython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CYTHON_VERSION = 3.1.2
+PYTHON_CYTHON_VERSION = 3.1.3
 PYTHON_CYTHON_SOURCE = cython-$(PYTHON_CYTHON_VERSION).tar.gz
-PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/18/40/7b17cd866158238db704965da1b5849af261dbad393ea3ac966f934b2d39
+PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/18/ab/915337fb39ab4f4539a313df38fc69938df3bf14141b90d61dfd5c2919de
 PYTHON_CYTHON_SETUP_TYPE = setuptools
 PYTHON_CYTHON_LICENSE = Apache-2.0
 PYTHON_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
