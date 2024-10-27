Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B644D1358B
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 23:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B92C681746;
	Sun, 27 Oct 2024 23:03:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MnHHSEAiA3rO; Sun, 27 Oct 2024 23:03:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDADB81747
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDADB81747;
	Sun, 27 Oct 2024 23:03:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B7EF971
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 23:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 25CF74091F
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 23:03:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nWIcweL8MPz3 for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 23:03:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 07CF7408E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07CF7408E9
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 07CF7408E9
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 23:03:14 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-83aba237c03so125564139f.3
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 16:03:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730070194; x=1730674994;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oLPRWekI1eG9kXy+ROVTl9K7/fuMS3G3Zcq7Rz6wIU0=;
 b=nGD7d3Igw+Hf/RieOmCKlsZg0FbhT3p1rUKuaNmUz0tjdRrqcioZzOFAnAP1WEIC7Z
 I1RwPWIxEzwUmT1M/OjVSVRsBLvoNuFmuzy9jiOH3Q7Jewks7ZpijbiQKOmIjls76eGM
 N3Y7k0cT0D7eenpFYrUUubT9Ngxkc5hvBWWGJYze9rpbexT4AakbA7fD3IdQ0RF+Z/8U
 m8ZFNStuFkZdNCk1oEZFy2WB0ZH5tCOENnR3Fy8Nyz46dQpC9q25zd5FT0pqZPNREr/a
 clCfus95e+EGn3RDPi96EXTpAdAXTItpl67ybIICJwiA0XGWDNRD5xlobt/EVTW1XYU5
 3xzg==
X-Gm-Message-State: AOJu0YyclxdxANyMQpxbTSYNoH88UKrUi/Yf7VzJJHCImi7f6jVpXNgn
 EW1l9NskLP02EGzPxWjpJhdnoUAvtl01Eko38jLv54Db6sOellF+QoIn9w==
X-Google-Smtp-Source: AGHT+IGsmm5Foz6GTsSnSPlKftg0VmJxzZavsbKBi90qYIpoC++91/+vrwWLKYL9fFfNCMdz2e6IFg==
X-Received: by 2002:a05:6602:15c3:b0:832:40d0:902a with SMTP id
 ca18e2360f4ac-83b1c3f2468mr496466439f.6.1730070193644; 
 Sun, 27 Oct 2024 16:03:13 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-83b137f486dsm120433439f.24.2024.10.27.16.03.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 16:03:13 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Oct 2024 17:03:11 -0600
Message-Id: <20241027230311.3872657-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730070194; x=1730674994; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oLPRWekI1eG9kXy+ROVTl9K7/fuMS3G3Zcq7Rz6wIU0=;
 b=Ue7WJTz8c2kfnnddoKSxicq0sjwbyzUF7gtNLExR69IQFIclH4IEk56swyH946jy5m
 n39aK33xt0C1UEGmiSOcMKolP1RoEwO/vWzdDRw7zAD+THpwemBGbexBxmZx/i1xNCO0
 Fvw9gQw4iUaRmbtjVxpQpZIGi3XEzbnt91BHGEHjtWQFnW+/fd1q4SrOEE65MrTM8S3R
 JHcYD6lon26JT7qiD3j75o2ILnLbkcNf8mZJ05eM8r2VmlabHzznnZRRX590OTvZN3ve
 i1v1+bzl4fcy13JcUocf7m2CO/c08QWoKffSLmOrSrTBhLccDy9v9UEougiat+K6A5U9
 hTng==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Ue7WJTz8
Subject: [Buildroot] [PATCH 1/1] package/python-pyparsing: bump to verison
 3.2.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyparsing/python-pyparsing.hash | 4 ++--
 package/python-pyparsing/python-pyparsing.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyparsing/python-pyparsing.hash b/package/python-pyparsing/python-pyparsing.hash
index d58c0b27fa..458da62888 100644
--- a/package/python-pyparsing/python-pyparsing.hash
+++ b/package/python-pyparsing/python-pyparsing.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyparsing/json
-md5  92160532cc2c2f289e5f35d87ce0ed0d  pyparsing-3.1.4.tar.gz
-sha256  f86ec8d1a83f11977c9a6ea7598e8c27fc5cddfa5b07ea2241edbbde1d7bc032  pyparsing-3.1.4.tar.gz
+md5  c9fb29820d6bf6e83651a0bd7411f02c  pyparsing-3.2.0.tar.gz
+sha256  cbf74e27246d595d9a74b186b810f6fbb86726dbf3b9532efb343f6d7294fe9c  pyparsing-3.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  10d5120a16805804ffda8b688c220bfb4e8f39741b57320604d455a309e01972  LICENSE
diff --git a/package/python-pyparsing/python-pyparsing.mk b/package/python-pyparsing/python-pyparsing.mk
index 7b85a346d3..20faa35d38 100644
--- a/package/python-pyparsing/python-pyparsing.mk
+++ b/package/python-pyparsing/python-pyparsing.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPARSING_VERSION = 3.1.4
+PYTHON_PYPARSING_VERSION = 3.2.0
 PYTHON_PYPARSING_SOURCE = pyparsing-$(PYTHON_PYPARSING_VERSION).tar.gz
-PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/83/08/13f3bce01b2061f2bbd582c9df82723de943784cf719a35ac886c652043a
+PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/8c/d5/e5aeee5387091148a19e1145f63606619cb5f20b83fccb63efae6474e7b2
 PYTHON_PYPARSING_LICENSE = MIT
 PYTHON_PYPARSING_LICENSE_FILES = LICENSE
 PYTHON_PYPARSING_SETUP_TYPE = flit
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
