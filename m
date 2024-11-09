Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 752E8D5E37C
	for <buildroot@archiver.kernel.org>; Sat,  9 Nov 2024 19:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39DAB80AD3;
	Sat,  9 Nov 2024 19:20:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cB4-gpNmPkow; Sat,  9 Nov 2024 19:20:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B44280F4C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B44280F4C;
	Sat,  9 Nov 2024 19:20:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 06550D92
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 19:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7EF440284
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 19:20:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kTPoXC9Axnpz for <buildroot@buildroot.org>;
 Sat,  9 Nov 2024 19:20:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::136; helo=mail-il1-x136.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D5E4D401F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5E4D401F6
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D5E4D401F6
 for <buildroot@buildroot.org>; Sat,  9 Nov 2024 19:20:48 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-3a3a5cd2a3bso13825165ab.3
 for <buildroot@buildroot.org>; Sat, 09 Nov 2024 11:20:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731180047; x=1731784847;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MQ1a56jsNRZZ34mkw1P7GRvaqHjFoK7Tx1gl5vrcCu0=;
 b=tbreTbRwk1lCqwOxYN4SCkY9ni+26SqSEFl4Ob/fQApQYN0ZB6pevJSrWZzgMP9kjB
 MZ5qF4UQgjWQWYU9laYk3L7QyHJgQu2J3bnf7KK3l3NHmdWhE5KA+ZCQufU/Tn1QthxT
 zuzv1YumWK3i4QIUja44uNoE1AMuaD0N9W+Y722xOBSuA3JkuvsYwvwGDwDnppbVOxYo
 uG4/KphpBVqW7JtUs4rBPjmrHeKoi6X439uTn/XgD1kRG5+c3TEC/4L3h0u5QSppDCSW
 4N0Of/8wPeKM6pMWRu+bCWjkmyvPWlybLTT3ehghNUG7WmOavONtYpw+pLRcdNNc8pRM
 ifuw==
X-Gm-Message-State: AOJu0YwbHP9TqgESCtoK0iCCvIFsKWxT3U60HhvZL0iGfGJMQZLPnSAf
 CqgH9IgT2Lj4vIqrJvR9k1gk0MW4HM8BpAA079MbvRuQXt7dYMSCJg8GmQ==
X-Google-Smtp-Source: AGHT+IH9xyRJIjrRe687hcDHvg0ddam4LL7VdZcFEC3c3S2hB2RpyCK0ByH+IvmmVTGuuu46E/G04A==
X-Received: by 2002:a05:6e02:1a28:b0:3a6:b258:fcf with SMTP id
 e9e14a558f8ab-3a6f19a0126mr94351205ab.2.1731180047672; 
 Sat, 09 Nov 2024 11:20:47 -0800 (PST)
Received: from james-x399.localdomain (71-33-148-91.hlrn.qwest.net.
 [71.33.148.91]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a6f9820fa2sm4639285ab.13.2024.11.09.11.20.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2024 11:20:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Nov 2024 12:20:45 -0700
Message-Id: <20241109192045.796501-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731180047; x=1731784847; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MQ1a56jsNRZZ34mkw1P7GRvaqHjFoK7Tx1gl5vrcCu0=;
 b=CAk8feSadrOs/FlioSC/WYehDjlZX/54DrQw8N/pxRtx57RX0PEpPT5Bzr5wiIWJhC
 Z7ta78qw7ToYdNRBZJAX51/azQ0dwh1MBtxBRUz5jxcE/GD2xP73tqP0YK56VbZrT+6t
 d+jPXg/5+y+6wMoVdKcVnXrvaKOygowGMgYgy9bW1plXnLectbGbpG1oCxVQD/2TGsli
 rbF2WD6fRf800CUF0EcJyBNkXjd3Q5wOzkBpo4ilRrxN7aMzhhCZ0F+VbnOePDUZIfOP
 V0vI/yoDoVKj/O4BWG0zhl/IE1c/Olm/ntgrNZEQn+r1jRkBnytOvoWxRcdWbKXl/Yva
 APWw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CAk8feSa
Subject: [Buildroot] [PATCH 1/1] package/python-tqdm: bump to version 4.67.0
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-tqdm/python-tqdm.hash | 4 ++--
 package/python-tqdm/python-tqdm.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tqdm/python-tqdm.hash b/package/python-tqdm/python-tqdm.hash
index 25f0677c22..7bbb37e5ba 100644
--- a/package/python-tqdm/python-tqdm.hash
+++ b/package/python-tqdm/python-tqdm.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tqdm/json
-md5  642c75fe82c8b8eb5b608156c154664b  tqdm-4.66.6.tar.gz
-sha256  4bdd694238bef1485ce839d67967ab50af8f9272aab687c0d7702a01da0be090  tqdm-4.66.6.tar.gz
+md5  3495f2a40a26a4f1caea279630f13521  tqdm-4.67.0.tar.gz
+sha256  fe5a6f95e6fe0b9755e9469b77b9c3cf850048224ecaa8293d7d2d31f97d869a  tqdm-4.67.0.tar.gz
 # Locally computed sha256 checksums
 sha256  dc33252e829015e3b150086fb9b3a40f6ad6fb32c2f4610ce812fa677d35986a  LICENCE
diff --git a/package/python-tqdm/python-tqdm.mk b/package/python-tqdm/python-tqdm.mk
index 5898d3aa13..4c2db7f249 100644
--- a/package/python-tqdm/python-tqdm.mk
+++ b/package/python-tqdm/python-tqdm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TQDM_VERSION = 4.66.6
+PYTHON_TQDM_VERSION = 4.67.0
 PYTHON_TQDM_SOURCE = tqdm-$(PYTHON_TQDM_VERSION).tar.gz
-PYTHON_TQDM_SITE =  https://files.pythonhosted.org/packages/e9/34/bef135b27fe1864993a5284ad001157ee9b5538e859ac90f5b0e8cc8c9ec
+PYTHON_TQDM_SITE = https://files.pythonhosted.org/packages/e8/4f/0153c21dc5779a49a0598c445b1978126b1344bab9ee71e53e44877e14e0
 PYTHON_TQDM_SETUP_TYPE = setuptools
 PYTHON_TQDM_LICENSE = MPL-2.0, MIT
 PYTHON_TQDM_LICENSE_FILES = LICENCE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
