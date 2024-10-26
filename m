Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E79FD0C604
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 21:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70F4F40363;
	Sat, 26 Oct 2024 21:47:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Um4GwN0ekhW9; Sat, 26 Oct 2024 21:47:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19CC44035F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19CC44035F;
	Sat, 26 Oct 2024 21:47:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8249D5C24
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 703CE4010F
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:47:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S4YKmm3cBR66 for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 21:47:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12f; helo=mail-il1-x12f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3343740003
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3343740003
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3343740003
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 21:47:47 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-3a4e40a1d7eso7352415ab.1
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:47:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729979266; x=1730584066;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fsQ2O4ZupyNUVnYbgsBaOZ8N6/5TAx6BiorbeeroqbM=;
 b=N5jxf1WQZMxNWRzJCXc/9DiQwRiMc3JcTxkEFx/KQTZF9YI2iQq+1gZR2SALm0AQBP
 NehCi1dW/e/hWiT5cE2gWVNgF/TBN6mO3Ka9x5H1iI9iBgCRNeebefEnQ0B50wbn1z/0
 tC1/3w62+goVM5ialow9vfcSriHQSiE2s6EWzltViCkfdJDtICoP6/9tD5Rh1Lo0KkBY
 eMdHJtgGULEeEd6/8IhOyOU0/z4/ntFiywVax6Yv1LWaCwEZIFgxa6XoQhp5VdIN4zal
 PF0qa40Pz5sjI7MCXyJ6FISzpvMn1LwaDRNqNqDUoDrcSfKWMGs2g6DcrhymujwPw+Gh
 W/3A==
X-Gm-Message-State: AOJu0Yy5kmUlXey0DCM9d5rfQHR3ZDZAfJBNSkWqSJ4hoSXx0JYIImvk
 4CujAUFNJSV6akmuaQ0yJR6bmc/TauGnhJBywB+leHXkbXGMd0KvsYESMQ==
X-Google-Smtp-Source: AGHT+IHcc2MOKoVDA6CkYKdy8Xm3ABol5H/snsiUa/Vnj/BSP6WF+XxHFr9jjiKSD3XqBwrQ5QQw4w==
X-Received: by 2002:a05:6e02:16cf:b0:3a0:9cd5:931c with SMTP id
 e9e14a558f8ab-3a4ed33225bmr32303215ab.20.1729979265932; 
 Sat, 26 Oct 2024 14:47:45 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a4e6e022e2sm8914685ab.51.2024.10.26.14.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Oct 2024 14:47:45 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 15:47:41 -0600
Message-Id: <20241026214741.3735496-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241026214741.3735496-1-james.hilliard1@gmail.com>
References: <20241026214741.3735496-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729979266; x=1730584066; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fsQ2O4ZupyNUVnYbgsBaOZ8N6/5TAx6BiorbeeroqbM=;
 b=ETshD//VMIMJzxG+BdQgtLyfIdrx/B37M+0ZDjJANJdgq3EMAWKmPUtEpb+jbn7Luz
 384g7bD+aDICfQNGlc8wFqi48Tzi/lbT83vAge6t5e/GUd6fHFJ4WxKstWfhsC9XMh4Y
 dKbtiTFQEWYnrLa/822pM/ges08ovjQGE4pR65sFU0ELHF5uRY/VLASN1XEWIlwK6vs9
 MKG+4NxiVxyF9mikG0V2nKPPLDpsBeQOfbTzHylLqjijHLT7zbjhkvSQvRkdPd2xiwre
 R4gyPA8pkzWcF8PS7y4TAKawhZIHYijmJSh8uBczxJwd0EUCYRuRYoqqVj8uhxvgckt3
 mhFg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ETshD//V
Subject: [Buildroot] [PATCH v6 2/2] package/python-scipy: bump to version
 1.12.0
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
 Jagan Teki <jagan@amarulasolutions.com>, Asaf Kahlon <asafka7@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to date update:
https://github.com/scipy/scipy/commit/0ace7295322148d74932bee32b0647e29c38fc8a

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-scipy/python-scipy.hash | 6 +++---
 package/python-scipy/python-scipy.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-scipy/python-scipy.hash b/package/python-scipy/python-scipy.hash
index bee5d698a0..5b8cac8055 100644
--- a/package/python-scipy/python-scipy.hash
+++ b/package/python-scipy/python-scipy.hash
@@ -1,8 +1,8 @@
 # md5, sha256 from https://pypi.org/pypi/scipy/json
-md5  0e8eea0f7c4fe7d8102366230c96d66d  scipy-1.11.4.tar.gz
-sha256  90a2b78e7f5733b9de748f589f09225013685f9b218275257f8a8168ededaeaa  scipy-1.11.4.tar.gz
+md5  22683fcf9a411f0a5254b7509bea0a6b  scipy-1.12.0.tar.gz
+sha256  4bf5abab8a36d20193c698b0f1fc282c1d083c94723902c447e5d2f1780936a3  scipy-1.12.0.tar.gz
 # Locally computed sha256 checksums
-sha256  5517022426a56179540ee6eace15fd723ef8fdb83b2900fed2152dd2e2f972a2  LICENSE.txt
+sha256  c29fb8e5936f33237a8b15256b4c6e93037f05bbf58c3d7b5755aede4c200173  LICENSE.txt
 sha256  606209a000716c5f66e33e180ce08434b96ed17db4975ab9723c6b5fbcc89609  scipy/ndimage/LICENSE.txt
 sha256  3df9207af2fdb861af0ae3b22026f163b9bcfab4e525dc4943afe2ffa3f77624  scipy/optimize/tnc/LICENSE
 sha256  f0cedf52503b2d42b83411a0a16e6fefac346dfad8fddc66f50050150123470c  scipy/sparse/linalg/_dsolve/SuperLU/License.txt
diff --git a/package/python-scipy/python-scipy.mk b/package/python-scipy/python-scipy.mk
index 6626826e33..9110a5b847 100644
--- a/package/python-scipy/python-scipy.mk
+++ b/package/python-scipy/python-scipy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SCIPY_VERSION = 1.11.4
+PYTHON_SCIPY_VERSION = 1.12.0
 PYTHON_SCIPY_SOURCE = scipy-$(PYTHON_SCIPY_VERSION).tar.gz
-PYTHON_SCIPY_SITE = https://files.pythonhosted.org/packages/6e/1f/91144ba78dccea567a6466262922786ffc97be1e9b06ed9574ef0edc11e1
+PYTHON_SCIPY_SITE = https://files.pythonhosted.org/packages/30/85/cdbf2c3c460fe5aae812917866392068a88d02f07de0fe31ce738734c477
 PYTHON_SCIPY_LICENSE = \
 	BSD-3-Clause, \
 	BSD-2-Clause, \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
