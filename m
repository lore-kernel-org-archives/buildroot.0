Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1811C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 14:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 298BA404AF;
	Thu,  3 Nov 2022 14:28:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 298BA404AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pGirS3_u-ilx; Thu,  3 Nov 2022 14:28:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3ED4840B6D;
	Thu,  3 Nov 2022 14:28:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3ED4840B6D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C34911BF38A
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 14:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9B534177A
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 14:28:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9B534177A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a5Hn9a19Vxk3 for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 14:28:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B41940901
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8B41940901
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 14:28:22 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id m15so1128468ilq.2
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 07:28:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n+3C5Lf+ofkOgj+GbW/Ccy565u1QZcqGTXMdRJcoSAM=;
 b=RG1R1XEHP+K6S+TRN4U3l4i8eYwoY/mWGYfQ3p9t8P/FUVemHVAyCifwcVZtJJVEIj
 6ugmSMSzI8gO5gyrPTQ2slEtVh+AzKmu/U0BmZ4A7fy7+N2qXooS9mUpF1q5/B+GPeYn
 Rvmnn0TLsTWBt0iLmytMTXzmtZMIrmKBOoJhXTA9zGQrtgzxWuWsU2rrWmQiYfVcGr4K
 fLjJIa8uO9KTOlcTDwbUrPMOPOGlZIOneUkptI8llAMg4mPM+h3+BrYfR7GRlv6K01tn
 LEYOLLo96iIAFYkruwPK6rLBRYBJ/eXthtm2mCiPRngPAsELHVC/NhrpRv9nPeTwAKYl
 EM2g==
X-Gm-Message-State: ACrzQf1s2vFi61k1aMBgW6HDdBRbrYJl54cJk0HWhILRNozZQfLo8PfY
 Smd5UE9d+v2FzkrV36YJeDvUkRu+tPQfN/QD
X-Google-Smtp-Source: AMsMyM7DH12MnStGMuN9xIAYn+COlxh3WfrNyMn+tNpNV6ZkYqE7ul3/z/VFJQtRezu2QPearNvCNg==
X-Received: by 2002:a05:6e02:1102:b0:300:8fb7:1ecd with SMTP id
 u2-20020a056e02110200b003008fb71ecdmr17085990ilk.211.1667485701267; 
 Thu, 03 Nov 2022 07:28:21 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 z8-20020a92d6c8000000b002f9537986f3sm377842ilp.24.2022.11.03.07.28.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 07:28:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 08:28:19 -0600
Message-Id: <20221103142819.1485494-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=n+3C5Lf+ofkOgj+GbW/Ccy565u1QZcqGTXMdRJcoSAM=;
 b=mCk3gYmvxuRXLJnfWT8pMuX4Lf5JJFsUWJbmSuiLIenN13UNRAtaW9GThoigJ2N9Wr
 /T6KXWZ5Iq3wXPMEObx/WjbwluMhB9OfyU/2C3jAEEqybkbJNQc4RJgE+kFTjL5BNEGx
 Z/TSoq3WlmY+QFesT1WqCwfU5UTuiI/CdMuSH4fvCIvQsnKP1w0pbRxBMzQeCLrWTyq7
 tSsHrSCUWuYv1lH/NWPGh0Sn8K6aYJ0LGOFp0F46hqrWJ0u2zSE2zy4Bmmxha4MH5Xl9
 SFASHir+h2DX3+GUfi2czfBGFpBr0y4ztFpx9xYSjO8/tzBnplPlC00yh2xC/6V4ZQP1
 9fDw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mCk3gYmv
Subject: [Buildroot] [PATCH 1/1] package/python-pyjwt: bump to version 2.6.0
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
 Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyjwt/python-pyjwt.hash | 4 ++--
 package/python-pyjwt/python-pyjwt.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyjwt/python-pyjwt.hash b/package/python-pyjwt/python-pyjwt.hash
index d51df02be1..cc64be6cca 100644
--- a/package/python-pyjwt/python-pyjwt.hash
+++ b/package/python-pyjwt/python-pyjwt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/PyJWT/json
-md5  665f444d7805e36826bb09ce6434e73a  PyJWT-2.4.0.tar.gz
-sha256  d42908208c699b3b973cbeb01a969ba6a96c821eefb1c5bfe4c390c01d67abba  PyJWT-2.4.0.tar.gz
+md5  aeed6d3a581ae383b2288a2079fa562d  PyJWT-2.6.0.tar.gz
+sha256  69285c7e31fc44f68a1feb309e948e0df53259d579295e6cfe2b1792329f05fd  PyJWT-2.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  797a7a20231d4c433e9f1911db1731d06b5828b98f499819a034f7c0f56f5ce5  LICENSE
diff --git a/package/python-pyjwt/python-pyjwt.mk b/package/python-pyjwt/python-pyjwt.mk
index 53cc50b650..fe4eeff38a 100644
--- a/package/python-pyjwt/python-pyjwt.mk
+++ b/package/python-pyjwt/python-pyjwt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYJWT_VERSION = 2.4.0
+PYTHON_PYJWT_VERSION = 2.6.0
 PYTHON_PYJWT_SOURCE = PyJWT-$(PYTHON_PYJWT_VERSION).tar.gz
-PYTHON_PYJWT_SITE = https://files.pythonhosted.org/packages/d8/6b/6287745054dbcccf75903630346be77d4715c594402cec7c2518032416c2
+PYTHON_PYJWT_SITE = https://files.pythonhosted.org/packages/75/65/db64904a7f23e12dbf0565b53de01db04d848a497c6c9b87e102f74c9304
 PYTHON_PYJWT_SETUP_TYPE = setuptools
 PYTHON_PYJWT_LICENSE = MIT
 PYTHON_PYJWT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
