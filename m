Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B86C00140
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 05:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4A5C40B61;
	Wed, 10 Aug 2022 05:31:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4A5C40B61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id olksc_cF2aCi; Wed, 10 Aug 2022 05:31:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 230A8408A5;
	Wed, 10 Aug 2022 05:31:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 230A8408A5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B5C9F1BF4E7
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 05:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DFCD408A5
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 05:31:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DFCD408A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wKGoo5_T-UVA for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 05:31:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A73D740347
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A73D740347
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 05:31:10 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-10ea7d8fbf7so16584432fac.7
 for <buildroot@buildroot.org>; Tue, 09 Aug 2022 22:31:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=9i7YHbVYk0dktut5SfbgwfZalEe/I7+nT0t3MHosOL0=;
 b=SBHg4pw2GzseOOM6/3suij/8FBf5XbLyehii2bOr/0CKnHpjCyM0zyrbV2aFGWtkvo
 eOWK3K6b0yIBWCkiBYfq6HcQEl6wB8YtYQARg1l+m6uXBbctjUwwpINimn3JHg0WIHUt
 Zp0jQvijbE7c75eL/LBy4+sYO6Oa/yilWc8Ov5rYUGEMI/4ZNceelNKa1qqqTgt1ufeC
 3WxoTd4kGVv72abeg8QRdoKf7WlsZjCEFk11r+qiQ76BHswocq5afsLJAUxauno+9lK3
 LjY4P+z9s7xBd0gsfHzz4ZWOjZuNkPaXMtPUryvQq15tiyRW2Q8/dt9WAPKhwBHwARFp
 BiUg==
X-Gm-Message-State: ACgBeo3QVEPS18zSEf53s8KzAt9GoaDOTGlC7b/R9bPrjBL9iYnymDrJ
 p5ns3rzwXsbG0XC1DbvTCePR9qUgnxo=
X-Google-Smtp-Source: AA6agR647GRmXKVum4y9xXjCkWAlwq/Cr4hIE20nx7wpTTZ2iGTJ9A4uxRp0mnaaf+dE+GHAAH6muQ==
X-Received: by 2002:a05:6871:b06:b0:10f:d0c:cab8 with SMTP id
 fq6-20020a0568710b0600b0010f0d0ccab8mr750301oab.251.1660109468759; 
 Tue, 09 Aug 2022 22:31:08 -0700 (PDT)
Received: from james-x399.localdomain (71-33-138-207.hlrn.qwest.net.
 [71.33.138.207]) by smtp.gmail.com with ESMTPSA id
 y24-20020a9d4618000000b00636c81d4109sm527263ote.46.2022.08.09.22.31.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 22:31:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Aug 2022 23:31:01 -0600
Message-Id: <20220810053102.2625513-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220810053102.2625513-1-james.hilliard1@gmail.com>
References: <20220810053102.2625513-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=9i7YHbVYk0dktut5SfbgwfZalEe/I7+nT0t3MHosOL0=;
 b=D/3wrNCywAurvhEmCk1Voihv0DqlSOZZAh9uS4azcBnGV9WezKal9cL2CKp7c8Isfs
 /VV9fvjWq6hwCVeHs6yawia26O35RS5sxL730y3hC61ZGtXXuyRIIpGqBodbTPNsYXpV
 yYY11DTwXFcDqNszvxuyq/Pm+dG93j9eODQZgUfXJdXgRgvjzXu0biqkJs5tXh3Uj3bu
 Gp7vLErwBeSwLDEcvXSDIIysUOfJ043svumVIpaSthbwGitQvrCuwheumic+zT7yHPIC
 hiZqCm5umwbNRbSs8gkEU+Ixu1CTDBYsgASz/rEBLyf6qcxxBRbtL+kW0s0B9Wzfq8p6
 n7QQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=D/3wrNCy
Subject: [Buildroot] [PATCH 2/3] package/python-maturin: bump to version
 0.13.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Graeme Smecher <gsmecher@threespeedlogic.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-maturin/python-maturin.hash | 2 +-
 package/python-maturin/python-maturin.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
index 383dbf8737..2604dd40c4 100644
--- a/package/python-maturin/python-maturin.hash
+++ b/package/python-maturin/python-maturin.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  4ea4f6b02cabffc8b56c488956ad572abfabdce935128007dff48a6e95b553d2  maturin-0.12.20.tar.gz
+sha256  1c385169ef87ecc076c1471ccd9efdd60d151d1f5d566f1117ca73ea926f7698  maturin-0.13.1.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
 sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
index 9ac11f264b..b92738822e 100644
--- a/package/python-maturin/python-maturin.mk
+++ b/package/python-maturin/python-maturin.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MATURIN_VERSION = 0.12.20
+PYTHON_MATURIN_VERSION = 0.13.1
 PYTHON_MATURIN_SOURCE = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
-PYTHON_MATURIN_SITE = https://files.pythonhosted.org/packages/39/ba/fec598956393230341def42367c6ad0efbee6ddc899f8858e5b25a7f37a5
+PYTHON_MATURIN_SITE = https://files.pythonhosted.org/packages/9b/a2/9b8377c61a0ded0b9c832343ca4bc1069e07bbcf8f844be6faf4858c7a48
 PYTHON_MATURIN_SETUP_TYPE = setuptools
 PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
 PYTHON_MATURIN_LICENSE_FILES = license-apache license-mit
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
