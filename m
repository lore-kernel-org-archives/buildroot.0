Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B59DC433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Mar 2022 12:21:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB58F8194C;
	Sun, 13 Mar 2022 12:21:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zrlBXcLquSVY; Sun, 13 Mar 2022 12:21:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E8478190B;
	Sun, 13 Mar 2022 12:21:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C6D3F1BF45A
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 12:21:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B260E400E2
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 12:21:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SHzEd6QVFHeP for <buildroot@lists.busybox.net>;
 Sun, 13 Mar 2022 12:21:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 97E02400C4
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 12:21:21 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id d62so15137833iog.13
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 05:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p2nntwhFEVz+q8sA8UJLmwPGQjNIPmyF/X9B6OcAPIg=;
 b=ZjDJoRCNY3lTL/Fg8gktdvfwASupJ0ddt6vpgr2E6VoHn/P+vMzZeDIEBuiUrVEt9n
 UihI/SgqRoKzOz8xcgBYca7tFdEjpdbEYY939Q2V0VSR7AUj3o8dmYrGjPxaJV8L4Zm5
 NeaahfnNzvIqG65O2Tx1zzbwZ4s2xLz83yv2sBmFEOn0GeLk/Apwt7FvuW0NNd/0vogh
 vtfCF7VLjnpzBGp7PwMOv/CVlsY6xuvKCh0H33oesCy3aUARzy1EmyTx4hEucbTi7dKE
 I2emBpDUWR/FE3Wpvjlm0kbXhGXX7VZsDbOcajDVQ9COkUMl0XtJL8GKJerihRCwtnVZ
 bF3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p2nntwhFEVz+q8sA8UJLmwPGQjNIPmyF/X9B6OcAPIg=;
 b=hwCshdpmhPk7EwcY+nk0liZisG3ceplCTNFBLiJazkYzI12lYOAcgqwtSGgtWpWh8A
 i1Rg9+euVvehfk/Gz/rPlRx7x28St0XonyC7eNznVk8F6LVOuxpO4LpGALssnNWySgFO
 QA3UHkoBWQjLY9PUUS+Wg/zX9rPFmKxDaGgswKnlzL3NGzUIW2sxstYsoA+OrgaIwGcr
 PIAEBiq5jOsPHTNtwTOG6tMnUkRPpBFsR3nwAQTe01u8YQp8EYMO4LeQL7xLUksFpLb6
 zjkK0mJf5ZHwLoeF065Ap9dPo5hl9yi+H7/dsOnupGeEIdmbc/+rz2Bu0SIMAJCGBPKt
 kcfg==
X-Gm-Message-State: AOAM532WMeuSXhiBkgjJFtCGQAgYhUHp5XSDY0P9sjBKutrd7H6R6Oi1
 axNUZDVlXvHL+x93sOvwx37bKVMxGJg=
X-Google-Smtp-Source: ABdhPJwyogaCUnUVRtl9AIa0C59RQcRT4uFQRJp8Po5wlzcZBECLjJwaLygRDi2HSei+omV9W4skBA==
X-Received: by 2002:a05:6638:138b:b0:317:8f8f:dc53 with SMTP id
 w11-20020a056638138b00b003178f8fdc53mr16307088jad.291.1647174080562; 
 Sun, 13 Mar 2022 05:21:20 -0700 (PDT)
Received: from james-x399.localdomain (97-118-243-247.hlrn.qwest.net.
 [97.118.243.247]) by smtp.gmail.com with ESMTPSA id
 g7-20020a056e02198700b002c7887c006fsm2828964ilf.21.2022.03.13.05.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Mar 2022 05:21:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Mar 2022 06:21:12 -0600
Message-Id: <20220313122112.261290-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220313122112.261290-1-james.hilliard1@gmail.com>
References: <20220313122112.261290-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/python-tomli: bump to version 2.0.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-tomli/python-tomli.hash | 4 ++--
 package/python-tomli/python-tomli.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tomli/python-tomli.hash b/package/python-tomli/python-tomli.hash
index 1a274c8a40..8368f9ee13 100644
--- a/package/python-tomli/python-tomli.hash
+++ b/package/python-tomli/python-tomli.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tomli/json
-md5  2ecbc7a23b8c8dc2fe96f588f88463d9  tomli-1.2.0.tar.gz
-sha256  d60e681734099207a6add7a10326bc2ddd1fdc36c1b0f547d00ef73ac63739c2  tomli-1.2.0.tar.gz
+md5  d4341621d423a7ca6822e23d6d52bb9a  tomli-2.0.1.tar.gz
+sha256  de526c12914f0c550d15924c62d72abc48d6fe7364aa87328337a31007fe8a4f  tomli-2.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  b80816b0d530b8accb4c2211783790984a6e3b61922c2b5ee92f3372ab2742fe  LICENSE
diff --git a/package/python-tomli/python-tomli.mk b/package/python-tomli/python-tomli.mk
index 3539a505be..014e8db1f6 100644
--- a/package/python-tomli/python-tomli.mk
+++ b/package/python-tomli/python-tomli.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TOMLI_VERSION = 1.2.0
+PYTHON_TOMLI_VERSION = 2.0.1
 PYTHON_TOMLI_SOURCE = tomli-$(PYTHON_TOMLI_VERSION).tar.gz
-PYTHON_TOMLI_SITE = https://files.pythonhosted.org/packages/ec/38/8eccdc662c61aed187d5f5b168c18b1d2de3827976c3691e4da8be7375aa
+PYTHON_TOMLI_SITE = https://files.pythonhosted.org/packages/c0/3f/d7af728f075fb08564c5949a9c95e44352e23dee646869fa104a3b2060a3
 PYTHON_TOMLI_SETUP_TYPE = flit
 PYTHON_TOMLI_LICENSE = MIT
 PYTHON_TOMLI_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
