Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A03DC433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 06:46:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0F1C61184
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 06:46:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D0F1C61184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96D734020A;
	Wed, 22 Sep 2021 06:46:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X5DKOkmcyD_5; Wed, 22 Sep 2021 06:46:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 89921400F5;
	Wed, 22 Sep 2021 06:46:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 11A6F1BF409
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 06:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E89081C26
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 06:46:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hz_8ErxOvzfe for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 06:46:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8BBDE81BE3
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 06:46:23 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id r75so2031354iod.7
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 23:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=REgWyReQMfS0CO82WE/96Bf9V1GO6a6RiUYTJ7wChZU=;
 b=E6mw0LGZkWkHSVDrz5Kidr9oJ61L5oWd1gCRm4xKO6YDorNfwGiPrGFJ/MOif3bHUa
 LFYFQvjxU6HSa2cwFwcwkBKofcRURCUVfNmU5LWmK4ZNFp1zlKKIHN02L8Evjm96neTh
 a/9cFlzgbPruOJ6k3DVtfwfphFnuUzNuIFqqtejzgwuzNIrM3VYn/3cLcD0wlyeQLlpJ
 efQb4+/3uzj/DRBLCNrjZcoMfhNRXSnH2jeYdpZazWUOqHbluc5pL9679jlI2ExZI4Eg
 jT/k1aUnmwEJQjyrbOabyEoYgz2nx88Y4td0uHt+C+JHe1CBTBbbc7/EybBqIH5dQgXa
 3Iwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=REgWyReQMfS0CO82WE/96Bf9V1GO6a6RiUYTJ7wChZU=;
 b=0qMUgqsi8azM5q+ztoQOUkdAwY1E7vcskZoPYdE5/W87Bah0Tc+AQqdoVYUZljyZOT
 3yHu+4s4PgDleTpts1NImgor/uYHlt1Vg0aGI1zQ6CPQYTEOLl1FVUySv6gmi/p+Galx
 uD0CQvplQ/L9Lc+ynTdsvv7PQQ0MTROorauvQr/jKCAq3C585wgYlwr8H0R0puk0kwZ8
 0w8Ht6MhiKeNooste490Ct/wIgVNm1Q6YWP4XuFhDGUknRHPWfaGoEkPspeBIFB3LaT0
 TBNFfmASedu3ZvR07o9kB3/UwdUkhrTD2tQDsNOoQ5pFrzbqfkVY11NHWVg3H8fDvrI+
 5IBA==
X-Gm-Message-State: AOAM530cZArMjCiDOAYTVrPhD9/4Z2ToHTGI87RjMmiVJpra5euM7K9x
 P2IvnSDx+nA9EeiGAmkmxjuomLqLA7A=
X-Google-Smtp-Source: ABdhPJyNhZ/Vd3bF3qSJ7X2VldJVJnERdsRyd3NNOVKqp8YpnjvVd0o/kot0DJSzkegvBkyqNlr45A==
X-Received: by 2002:a05:6602:2cc5:: with SMTP id
 j5mr3144572iow.156.1632293182337; 
 Tue, 21 Sep 2021 23:46:22 -0700 (PDT)
Received: from james-x399.localdomain (71-33-146-72.hlrn.qwest.net.
 [71.33.146.72])
 by smtp.gmail.com with ESMTPSA id r13sm634544ilh.80.2021.09.21.23.46.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 23:46:22 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Sep 2021 00:46:20 -0600
Message-Id: <20210922064620.132726-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-msgpack: bump to version
 1.0.2
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
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-msgpack/python-msgpack.hash | 4 ++--
 package/python-msgpack/python-msgpack.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-msgpack/python-msgpack.hash b/package/python-msgpack/python-msgpack.hash
index e34ea118ed..8e192e3717 100644
--- a/package/python-msgpack/python-msgpack.hash
+++ b/package/python-msgpack/python-msgpack.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/msgpack/json
-md5  c35ee8f991dad3969884e9585e56ebba  msgpack-1.0.0.tar.gz
-sha256  9534d5cc480d4aff720233411a1f765be90885750b07df772380b34c10ecb5c0  msgpack-1.0.0.tar.gz
+md5  68d5804254642905ba87ede509e68970  msgpack-1.0.2.tar.gz
+sha256  fae04496f5bc150eefad4e9571d1a76c55d021325dcd484ce45065ebbdd00984  msgpack-1.0.2.tar.gz
 # Locally computed sha256 checksums
 sha256  492dedba85da5872f78e6091bcd1fea474d660d35acb4dee964b8aab3f007427  COPYING
diff --git a/package/python-msgpack/python-msgpack.mk b/package/python-msgpack/python-msgpack.mk
index 18d5a998ff..dcb525ed1f 100644
--- a/package/python-msgpack/python-msgpack.mk
+++ b/package/python-msgpack/python-msgpack.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MSGPACK_VERSION = 1.0.0
+PYTHON_MSGPACK_VERSION = 1.0.2
 PYTHON_MSGPACK_SOURCE = msgpack-$(PYTHON_MSGPACK_VERSION).tar.gz
-PYTHON_MSGPACK_SITE = https://files.pythonhosted.org/packages/e4/4f/057549afbd12fdd5d9aae9df19a6773a3d91988afe7be45b277e8cee2f4d
+PYTHON_MSGPACK_SITE = https://files.pythonhosted.org/packages/59/04/87fc6708659c2ed3b0b6d4954f270b6e931def707b227c4554f99bd5401e
 PYTHON_MSGPACK_LICENSE = Apache-2.0
 PYTHON_MSGPACK_LICENSE_FILES = COPYING
 PYTHON_MSGPACK_SETUP_TYPE = setuptools
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
