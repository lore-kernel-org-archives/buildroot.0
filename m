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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BB12C433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 08:04:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D74F560F26
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 08:04:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D74F560F26
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 812CE81516;
	Wed, 22 Sep 2021 08:04:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mrc0xY-LKBum; Wed, 22 Sep 2021 08:03:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DAE283F73;
	Wed, 22 Sep 2021 08:03:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3B40D1BF2B0
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 08:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 27672613B3
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 08:03:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LWcKAk2OiLYb for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 08:03:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4A61E6064A
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 08:03:51 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id p80so2196022iod.10
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 01:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DJ2fOy9/Pk/eeMXo9JaxZZw6HJ/PxfjpSGbCSolL7ug=;
 b=gsGgdvR/Kh9wo1DhnMjj4rMDzi+YmLWT28+ftGWr1Ond2xacsqzZDmxHZ/vomvCGYw
 VyrE9RfaKL0IrQlEYwpob94WTsAeiqQJYttq5IOvWAtaVm7pEXJ1sT3loEa1+ntYuZCM
 MKyQgViHPeHJKSVoHk8HulL2YIJ7tmcsTzPickSZVctw3dIjl0WWM7NdWUcgK78C83mU
 AXwJvWsIm7oh2D2Z+NCvfCXj8iuhKALLPzRqbHxO3UMOd3IpxRabeutByRhvaYosVabB
 4V2MUHmuuG+afOCjyaMxfZ18+f25Zw9UcKNMvyFLiCSBHhundcNwEYKr8IgYU0OTT0fs
 MudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DJ2fOy9/Pk/eeMXo9JaxZZw6HJ/PxfjpSGbCSolL7ug=;
 b=PRJtTv0Gaz+JZor4q1K3flq3CCBZtcZ/t1YYnHFv8UgVQr36JNSprvSy6ruqpGsHcF
 46KLcPwYVB0prG6uHByoTx1sxJINyInV/LzCxeUIQNMEyEcTQ9rGGaSd37yy1M35B5XR
 RIcrGaSs4IaQp2pFglT2vQRRtsT1asF1zNiMk81CVpROrsBrji/6z+Kqn6FwqogCWXQ0
 MW0q/oyJCfrx3F8iG7SSxeS36qsI3x99YRmLcEAANCD9cx2Tvcuw7M9OYmInAqp2f1Bn
 fNDwvb+ZjudGFKHiHSBPcJPKxcJrT5Gbw+sTAYb74teHyy2Eoe1TGmhN+IV/YovTFCPD
 LRog==
X-Gm-Message-State: AOAM532xZAnsyllw17NIZTx/EigrLf4lIzxYD3bG9iaP6h9LFyWeA7jK
 DScoygWCgaFJxUr1jHoFll03Dg6VNMc=
X-Google-Smtp-Source: ABdhPJwcKmmIy0XjIOBSihz4+dfC9m6hen6Er2lDqPuSajMC/Yqa18uCbUJ1JP6kL17CbYNB5hUBqw==
X-Received: by 2002:a05:6638:f12:: with SMTP id
 h18mr3654671jas.107.1632297830640; 
 Wed, 22 Sep 2021 01:03:50 -0700 (PDT)
Received: from james-x399.localdomain (71-33-146-72.hlrn.qwest.net.
 [71.33.146.72])
 by smtp.gmail.com with ESMTPSA id b3sm708687ile.37.2021.09.22.01.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 01:03:50 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Sep 2021 02:03:47 -0600
Message-Id: <20210922080347.150943-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/{python-}protobuf: bump to
 version 3.18.0
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

python-protobuf no longer supports python2, so depend on
BR2_PACKAGE_PYTHON3. Reverse dependencies already depend on
python3.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - depend on BR2_PACKAGE_PYTHON3
---
 package/protobuf/protobuf.hash               | 2 +-
 package/protobuf/protobuf.mk                 | 2 +-
 package/python-protobuf/Config.in            | 1 +
 package/python-protobuf/python-protobuf.hash | 2 +-
 4 files changed, 4 insertions(+), 3 deletions(-)

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
diff --git a/package/python-protobuf/Config.in b/package/python-protobuf/Config.in
index 1af82112b4..9b20881196 100644
--- a/package/python-protobuf/Config.in
+++ b/package/python-protobuf/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PYTHON_PROTOBUF
 	bool "python-protobuf"
 	# host-protobuf only builds on certain architectures
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  Python implementation of the Google Protocol Buffers.
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
