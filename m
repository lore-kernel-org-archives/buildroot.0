Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56729C433FE
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 14:22:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5ACA610CE
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 14:22:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C5ACA610CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A7F082468;
	Mon, 20 Sep 2021 14:22:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kyTbVSiHgAc7; Mon, 20 Sep 2021 14:22:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1F0181CDB;
	Mon, 20 Sep 2021 14:22:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 665951BF289
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 14:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63414403F3
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 14:22:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Osz3HztGAXBK for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 14:22:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6F009403CC
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 14:22:32 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id q26so30198456wrc.7
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 07:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iaQCPNV0EmSVH82QdjQzow/f2qLw0E5Mr+E20BpLIH8=;
 b=SQdEcWPYqfzDVh0z6kDUPMwRY1TmMCWH3YDre1PoeRDhPDBg+50DwgMYCC/apqscrH
 HVyYr1ICObEtxjHEmFYjJCDaeXlETOh/6Uw3kTonvwbvN4xrXRXBaBvLUkcghy0mUNhd
 gnklSfW4TKFw0OcfspuNcNONYkn6rMPVI/h3++WkVnAYxkcrdaiCZpjNaWy/gVcIL7Rc
 +NytpJH0qHNUHT7lxhGaWS1B5g2xxq6M6s5H7gqxOebg3d4QFWV3dJFqviE7U7BncXez
 ZWNr00DmU5BewipXbFI3MT2Ubqia2+NTGTaEQvgDZiCpTv/YdppnhFQqUCDARpmeQ6Sc
 6cFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iaQCPNV0EmSVH82QdjQzow/f2qLw0E5Mr+E20BpLIH8=;
 b=skI1pRfJai5ijqCAY3rmSBgDUS+vqldYh4lQsNsAs9PpzeujLW3NVyIn8/MN6bAXAZ
 s9j0zRWY80EVq6dd7oNxxiWduXB/U8dTLOaUz6w3SHKujY8vH/3ueuDfzzBp44XTFE8E
 hfyJlDOqC54pqi+lRAuGtwZve26mVylADHf8HYZKikV5QYMDxdwlkVteVPR6Cv/Loolf
 wlLFNkVgRsKrWkE+6WaCsi17Gtv/cYZsOgF4HSnk+ZmiBTnSQbBCmCPZ2wKof5INOMaI
 AjPkR+e8jlhifjggs6oK8NK7DffafK/mo4CjgpPE5GKr3ihAeoe+olQU4cMo095jUoQn
 P3gA==
X-Gm-Message-State: AOAM533h7mT0Dq6Q2LkTP3TY3Hl8InxMSoHmQHwUUI9teOSfQjkRsWzn
 PzzuYxcoHulh8eyv6ePGkXBiC04b4X4=
X-Google-Smtp-Source: ABdhPJwv0lwyTxJ2II/DPaAXmij5fdxmAgSJ9ev1RK89tYKmDxnNxDJSy1WfrRF82A4iSAAyW02esw==
X-Received: by 2002:a7b:cc8d:: with SMTP id p13mr24633170wma.10.1632147750469; 
 Mon, 20 Sep 2021 07:22:30 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:ed43:881f:d7cd:d42d])
 by smtp.gmail.com with ESMTPSA id e2sm16295494wra.40.2021.09.20.07.22.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 07:22:30 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 Sep 2021 17:22:19 +0300
Message-Id: <20210920142221.299817-3-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210920142221.299817-1-asafka7@gmail.com>
References: <20210920142221.299817-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-webob: bump to version 1.8.7
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-webob/python-webob.hash | 4 ++--
 package/python-webob/python-webob.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-webob/python-webob.hash b/package/python-webob/python-webob.hash
index aab2f1d9e4..a46c1dbc94 100644
--- a/package/python-webob/python-webob.hash
+++ b/package/python-webob/python-webob.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/webob/json
-md5  dc3cc8c317d4acd03a6fd97cb0a9121a  WebOb-1.8.6.tar.gz
-sha256  aa3a917ed752ba3e0b242234b2a373f9c4e2a75d35291dcbe977649bd21fd108  WebOb-1.8.6.tar.gz
+md5  10191c69fa5a2c00f3b9abfb8937b415  WebOb-1.8.7.tar.gz
+sha256  b64ef5141be559cfade448f044fa45c2260351edcb6a8ef6b7e00c7dcef0c323  WebOb-1.8.7.tar.gz
 # Locally computed sha256 checksums
 sha256  27bc4919e7e9e6b6cda40644517ca74d32203e32fba89ef832aba1ed93e457b3  docs/license.txt
diff --git a/package/python-webob/python-webob.mk b/package/python-webob/python-webob.mk
index 051c117538..11ba104476 100644
--- a/package/python-webob/python-webob.mk
+++ b/package/python-webob/python-webob.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEBOB_VERSION = 1.8.6
+PYTHON_WEBOB_VERSION = 1.8.7
 PYTHON_WEBOB_SOURCE = WebOb-$(PYTHON_WEBOB_VERSION).tar.gz
-PYTHON_WEBOB_SITE = https://files.pythonhosted.org/packages/2a/32/5f3f43d0784bdd9392db0cb98434d7cd23a0d8a420c4d243ad4cb8517f2a
+PYTHON_WEBOB_SITE = https://files.pythonhosted.org/packages/c7/45/ee5f034fb4ebe3236fa49e5a4fcbc54444dd22ecf33079cf56f9606d479d
 PYTHON_WEBOB_SETUP_TYPE = setuptools
 PYTHON_WEBOB_LICENSE = MIT
 PYTHON_WEBOB_LICENSE_FILES = docs/license.txt
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
