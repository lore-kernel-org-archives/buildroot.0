Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F63E6FE41
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 19:11:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70F1F40151;
	Fri,  6 Sep 2024 19:11:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JDO-Y6WH_03U; Fri,  6 Sep 2024 19:11:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16CFD4018B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16CFD4018B;
	Fri,  6 Sep 2024 19:11:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B8FA1BF46A
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0678080A81
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:11:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qQRpk2f1mJ8z for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:11:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E514F80A78
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E514F80A78
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E514F80A78
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:11:26 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-82a151ac96eso99766339f.2
 for <buildroot@buildroot.org>; Fri, 06 Sep 2024 12:11:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725649885; x=1726254685;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=62ZbxvSlivmwWrNXyQ/YHGO1AKAsQKGGP0YZtfI+eRc=;
 b=Q2vqIHTnUwv4rupS7pql+eAs5+T6eQ0A2miLb7O1KFixkHzJi7y5M+B7ipDd9UTl2b
 pTBwfci8iW4uJMqooLNcL6dOhdnmvZ9rcSiFbAswq8KVZ0LIrYjHrUC3sZY9GHONKioA
 WnXMGioa4nyxYag7o4F2a1NM418ip9USW/eK7Jeesus41f5szfq1rHr9hEs3slHjktHK
 1Q2QlG5fRxbgxlpGp9vOVMEcw7eXZH1fAy9TiSAaWBUmUFavPI8mtvbKKFGVSAsgDJNu
 5s7BzQcsL8savQGywjl5BFirFXvFcJ8jBFJBLvJmzimaAQmV95+pXhCwLpSAAuOPEo8b
 LnoQ==
X-Gm-Message-State: AOJu0YxogGNM01VD87BZDfbVtxtypDUlTimDK85yAF2nDRtH6WxQ8n6P
 41Nhqbkc42TNKui/1DYgbRzwELRJku4P93/gUjAY9VndEDiJMT8Tps6U6w==
X-Google-Smtp-Source: AGHT+IGDNyDZOc4LbmmEERi4D1VAyTuifdmIr5g3Am/nq9p9BmcnYUvx7qNlwFZqdqZHMgx22WXlFQ==
X-Received: by 2002:a05:6e02:19cb:b0:3a0:4b2d:78d7 with SMTP id
 e9e14a558f8ab-3a05746c32fmr2987825ab.13.1725649885512; 
 Fri, 06 Sep 2024 12:11:25 -0700 (PDT)
Received: from james-x399.localdomain (97-118-128-240.hlrn.qwest.net.
 [97.118.128.240]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-39f3afc65b2sm48781455ab.47.2024.09.06.12.11.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 12:11:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Sep 2024 13:11:18 -0600
Message-Id: <20240906191118.1686694-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725649885; x=1726254685; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=62ZbxvSlivmwWrNXyQ/YHGO1AKAsQKGGP0YZtfI+eRc=;
 b=dvKodEqwZAgR2KNmrlILvCytgJqNnFZP/KOunFNLwpCFmQNSBw4ti6tDtkYQSTpOzD
 mS8dcU8KKDkbZuvu8fFI7L45Eirs+6uQgELSNZ1ZHjLf/hev63XSB5GE7hZey0yH50j0
 xKQrrOd38T3i/dblebMXXCnzgcEJnQdFENY0DcuYjJaKDOzpT2gOQA2mmVUv13InLasO
 cxZvNdm1Fi/m1+bZ7q7nHOYMXALjYmDyndNjr4k5V4CDaqGBhOqtpGt/B0NZ9HxnUdjK
 rXCIlsWaMdCfDz/b7gA5EtLJZeIS8EIOed+Ptql52ecQrwri68zVdOGbmvNKQg81VTLo
 K8BQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dvKodEqw
Subject: [Buildroot] [PATCH 1/1] package/python-urllib3: bump to version
 2.2.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-urllib3/python-urllib3.hash | 4 ++--
 package/python-urllib3/python-urllib3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-urllib3/python-urllib3.hash b/package/python-urllib3/python-urllib3.hash
index 209cfe277e..c6ff8bd249 100644
--- a/package/python-urllib3/python-urllib3.hash
+++ b/package/python-urllib3/python-urllib3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/urllib3/json
-md5  5a264ef3ae827e5842bbc80536a343dd  urllib3-2.0.7.tar.gz
-sha256  c97dfde1f7bd43a71c8d2a58e369e9b2bf692d1334ea9f9cae55add7d0dd0f84  urllib3-2.0.7.tar.gz
+md5  efb79cfdef7b811687afe02ccaf67433  urllib3-2.2.2.tar.gz
+sha256  dd505485549a7a552833da5e6063639d0d177c04f23bc3864e41e5dc5f612168  urllib3-2.2.2.tar.gz
 # Locally computed sha256 checksums
 sha256  130e3a64d5fdd5d096a752694634a7d9df284469de86e5732100268041e3d686  LICENSE.txt
diff --git a/package/python-urllib3/python-urllib3.mk b/package/python-urllib3/python-urllib3.mk
index ba041082db..55e2856545 100644
--- a/package/python-urllib3/python-urllib3.mk
+++ b/package/python-urllib3/python-urllib3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URLLIB3_VERSION = 2.0.7
+PYTHON_URLLIB3_VERSION = 2.2.2
 PYTHON_URLLIB3_SOURCE = urllib3-$(PYTHON_URLLIB3_VERSION).tar.gz
-PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/af/47/b215df9f71b4fdba1025fc05a77db2ad243fa0926755a52c5e71659f4e3c
+PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/43/6d/fa469ae21497ddc8bc93e5877702dca7cb8f911e337aca7452b5724f1bb6
 PYTHON_URLLIB3_LICENSE = MIT
 PYTHON_URLLIB3_LICENSE_FILES = LICENSE.txt
 PYTHON_URLLIB3_CPE_ID_VENDOR = python
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
