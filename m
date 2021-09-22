Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57535C433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 06:57:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15B1F61184
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 06:57:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 15B1F61184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B05964071A;
	Wed, 22 Sep 2021 06:57:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VhEePR7AiIHe; Wed, 22 Sep 2021 06:57:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1F3940722;
	Wed, 22 Sep 2021 06:57:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 95ADE1BF409
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 06:57:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 806F1613AB
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 06:57:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z6QX0ob2sBOc for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 06:57:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B0B05613A8
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 06:57:10 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id x2so1616647ila.11
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 23:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pYOeDqLRLqlDgHXf3/eW2/+2kOKfcAEuTiVnsokQu4c=;
 b=Idq3rikuy3ysuUvEZ7q3qxu0aUfhnynySNOC7+7iTAE4wVjzH48gathHRTJ169pHp5
 1r3AIXt1N+NOMLsAgzpIN5XxelzBJ5u/xsz07iPBb3YhuInHtuEhj5v8arxMstoq1KeW
 1XT5lWoqsuNHp57wpXdNI1Qv8zwpjGt96BcMjmb8rgM4Fl3ZbpE2P9d5g3Jz0QaO5y5y
 9CbhluUIlilcRJkPIp5In1apswh+Q1Go3xECyDCkAEKLdS1oXzaMLvoB6ydT40mSyS7p
 4fX060K7MOrYshiF8FY7BWeFx4lgDhuRdJmqc/+OLCSDka7GDEwucd18jHtKt6POju5u
 RDfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pYOeDqLRLqlDgHXf3/eW2/+2kOKfcAEuTiVnsokQu4c=;
 b=Q+uvo/SurcU4Hi1cwLPA2IV2gJhFVF11uiUE9GBn/S3EmsE6c+kVjQQ+2yDnI0LcJ/
 5rfExa6uvySeeD4464Caju4w8QCKiF+vYhh4Ch24UhvFXTC50kGC8wAExcBUJY9BS+xa
 d+Bq1xkAitvZzCtc3vZR1ZEGptHjHXnJgy7XuQ0AULSrfS6rqTeNH0QObacFNIoEA01g
 9M2nSYnxIr4vedOfELsfjNc0MbAo0MUIaF46pPCCVft8imvKuaXjsRzfWzx9KNCbrH5S
 s7dSyJc4UiJI5bzy6kQDKtDZmuDxe7xMdVgDBXmbSr0BdzndKYu4oe8lGaVpnYXO0Qvv
 /cwA==
X-Gm-Message-State: AOAM532maYlLYRjBxfISaasnsTp8gEKoK8T9AdwQfJAeCAWSWXtiY3pW
 bqr4bdD4rpya0WzRfmuDj02i2XlrHVs=
X-Google-Smtp-Source: ABdhPJznxUp/d8KFDahJoFcbg4LMq5DcONkuLR7doMTdGbX5C3bZvY9LOsN2KVNOSn/xblC3nN4Hfw==
X-Received: by 2002:a05:6e02:13ef:: with SMTP id
 w15mr24295942ilj.255.1632293829537; 
 Tue, 21 Sep 2021 23:57:09 -0700 (PDT)
Received: from james-x399.localdomain (71-33-146-72.hlrn.qwest.net.
 [71.33.146.72])
 by smtp.gmail.com with ESMTPSA id l6sm635699ilt.31.2021.09.21.23.57.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 23:57:09 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Sep 2021 00:57:07 -0600
Message-Id: <20210922065707.440894-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/{python-}protobuf: bump to version
 3.18.0
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Michael Nosthoff <buildroot@heine.tech>, Asaf Kahlon <asafka7@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/protobuf/protobuf.hash               | 2 +-
 package/protobuf/protobuf.mk                 | 2 +-
 package/python-protobuf/python-protobuf.hash | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
index 2a65156cb3..777f19d6b9 100644
--- a/package/protobuf/protobuf.hash
+++ b/package/protobuf/protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
-sha256  51cec99f108b83422b7af1170afd7aeb2dd77d2bcbb7b6bad1f92509e9ccf8cb  protobuf-cpp-3.17.3.tar.gz
+sha256  7308590dbb95e77066b99c5674eed855c8257e70658d2af586f4a81ff0eea2b1  protobuf-cpp-3.18.0.tar.gz
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index fa8ea890e2..bb9c6bf37c 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -7,7 +7,7 @@
 # When bumping this package, make sure to also verify if the
 # python-protobuf package still works and to update its hash,
 # as they share the same version/site variables.
-PROTOBUF_VERSION = 3.17.3
+PROTOBUF_VERSION = 3.18.0
 PROTOBUF_SOURCE = protobuf-cpp-$(PROTOBUF_VERSION).tar.gz
 PROTOBUF_SITE = https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF_VERSION)
 PROTOBUF_LICENSE = BSD-3-Clause
diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
index 8eca476884..e9a5ac4904 100644
--- a/package/python-protobuf/python-protobuf.hash
+++ b/package/python-protobuf/python-protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3253c6d17ec0bb6f6382e555cf5ca0a9ffab8d81b691f100f96ce9f5e753018e  protobuf-python-3.17.3.tar.gz
+sha256  4f792034070915819065c162a310142d66835333824e2e0a2ca26ed54b013408  protobuf-python-3.18.0.tar.gz
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
