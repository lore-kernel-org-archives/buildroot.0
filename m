Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77379C25B08
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 00:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A24F81BA8;
	Sun,  7 Aug 2022 00:39:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A24F81BA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JW9jvTr19lXx; Sun,  7 Aug 2022 00:39:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2022F81AD7;
	Sun,  7 Aug 2022 00:39:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2022F81AD7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8AF6C1BF3A1
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 00:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 733928139B
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 00:38:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 733928139B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qgfQ0SgIr9Qe for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 00:38:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 763A48138F
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 763A48138F
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 00:38:55 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id c185so6725042oia.7
 for <buildroot@buildroot.org>; Sat, 06 Aug 2022 17:38:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=cORskjcRsCKZiOW6wsLgvPF45HCNzNYOslPBHWKC0/Q=;
 b=CAV69LZ7NQOzxuclQ7EIqJsyj9x4HbUkPhtaGSq+ZfbvkpfUBed5JA0jgocY7gRXk7
 0t85YC9il/zvU/W637f9zdhTSQeGbwkro2wOq5/eu8rnWnfTfGkn9zFbkrPIya2hdgSk
 QgYv1OhsUeQ42Vi46Bm/bu4rRXDZOGUbePWBAzPsGtFCZLS/cuGIylZsPb5PL+nHcfSC
 SYi5k72plGn9/lVqE+2RjCRkj7ORqdeKIec9mclbh3ZsRKZCuioIELpVi2EU3/+Qx1SL
 pWPD2G1PtLZGvw8p5Cv651tWS6Ge2Pk+MENyH4tbLYIV5UKtr4uHEAOA3kEaQHiGWtyu
 ZCqQ==
X-Gm-Message-State: ACgBeo299z9sZuZVLu/99Vgyapvx93P2Iqym8uiqfdcFPItalpjKDw12
 rJqV8bYOrcdxxfpNwzfYWgW1Pa+bVjQ=
X-Google-Smtp-Source: AA6agR59I+ltmNz9K+z/r6vsA05USqBWGtfC+mmO88bgDQOjWlAQl+oOhJybBgqAVO9ni8rpsIhfgg==
X-Received: by 2002:a05:6808:1404:b0:342:a150:9c00 with SMTP id
 w4-20020a056808140400b00342a1509c00mr5454949oiv.266.1659832733880; 
 Sat, 06 Aug 2022 17:38:53 -0700 (PDT)
Received: from james-x399.localdomain (71-33-138-207.hlrn.qwest.net.
 [71.33.138.207]) by smtp.gmail.com with ESMTPSA id
 j8-20020a9d7f08000000b0061cac699458sm1469298otq.38.2022.08.06.17.38.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Aug 2022 17:38:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  6 Aug 2022 18:38:29 -0600
Message-Id: <20220807003832.1177015-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220807003832.1177015-1-james.hilliard1@gmail.com>
References: <20220807003832.1177015-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=cORskjcRsCKZiOW6wsLgvPF45HCNzNYOslPBHWKC0/Q=;
 b=IrGw/ZNLK6qQzzydnkdam+2tcum5y+r4F478OWpHmRY3rX2iDJXudpMeFd3CdGQe2h
 9zs+FpJazJmNIJiAdoGUoMnv5zF9C+MlCtIIQdfuKi3aHQTRCqXvPV6mwzcrS8QFD24p
 dxWBGvwbyE6KQJsA8uCuSzikAY/mA4IEcofRapFj9f3HGeopl4spp9BjbYq/YQQaSK1t
 Fdlzyevj/+E3tGNdAJbJgnKnNia2r95U68NwC+qHeKZldo9Yjk+Ax1+VWrS6LxpyUM2n
 66h6W6fV9Dswl2nIi5BgraUG/JLvY0219wh9X20CpDYvHNmF0YJVWYOrGEnZb7knOYTz
 X9hA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=IrGw/ZNL
Subject: [Buildroot] [PATCH v4 2/5] package/python-maturin: migrate to
 setuptools-rust infrastructure
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
 Graeme Smecher <gsmecher@threespeedlogic.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The python-maturin build backend while itself is a pep517 backend
uses setuptools-rust for bootstrapping purposes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-maturin/python-maturin.mk | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
index 9ac11f264b..f883243947 100644
--- a/package/python-maturin/python-maturin.mk
+++ b/package/python-maturin/python-maturin.mk
@@ -7,19 +7,9 @@
 PYTHON_MATURIN_VERSION = 0.12.20
 PYTHON_MATURIN_SOURCE = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
 PYTHON_MATURIN_SITE = https://files.pythonhosted.org/packages/39/ba/fec598956393230341def42367c6ad0efbee6ddc899f8858e5b25a7f37a5
-PYTHON_MATURIN_SETUP_TYPE = setuptools
+PYTHON_MATURIN_SETUP_TYPE = setuptools-rust
 PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
 PYTHON_MATURIN_LICENSE_FILES = license-apache license-mit
-HOST_PYTHON_MATURIN_DEPENDENCIES = \
-	host-python-setuptools-rust \
-	host-python-tomli \
-	host-rustc
-HOST_PYTHON_MATURIN_ENV = \
-	$(HOST_PKG_CARGO_ENV) \
-	PYO3_CROSS_LIB_DIR="$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)"
-# We need to vendor the Cargo crates at download time
-PYTHON_MATURIN_DOWNLOAD_POST_PROCESS = cargo
-PYTHON_MATURIN_DOWNLOAD_DEPENDENCIES = host-rustc
-HOST_PYTHON_MATURIN_DL_ENV = $(HOST_PKG_CARGO_ENV)
+HOST_PYTHON_MATURIN_DEPENDENCIES = host-python-tomli
 
 $(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
