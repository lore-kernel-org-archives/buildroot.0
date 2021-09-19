Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B41EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 08:53:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC649611C3
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 08:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AC649611C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E2F6606AF;
	Sun, 19 Sep 2021 08:53:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1MyDlCwwcSdk; Sun, 19 Sep 2021 08:53:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 921366067F;
	Sun, 19 Sep 2021 08:53:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0EF1C1BF842
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 08:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F1DA682FAE
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 08:53:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J2xxcyXKlNYJ for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 08:53:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7098482FA9
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 08:53:13 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 u19-20020a7bc053000000b002f8d045b2caso9896382wmc.1
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 01:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kL8550kovQ+/iiHhGv0XBMU80uGpJl3t3YMwQltuykQ=;
 b=XHwQXAVRMB5riTG47uCSDbp4t8iRtH3oJ/PR4+rNrXhHxhK7QL6TnWAUSlqNxslXrw
 PVVKKcLOcj5TLr1zkoKB/kUJc1RHbxFotqJwbq5CbSmXJl9yMKUOnqcTp3wtYSXo3jhY
 eA5eRg37/3XgptGlrpX1qXhY3ByMBuZ32uV68AGeqjGwuG5I3Bu1gUsrsqibCFXIOlvI
 aSAcH3b7QZt7I/u/DBkExpKJDyZOv9Hejz68ps97ST3FvEOWZKsCzvQAwHru9oLN2/zq
 kieZ2h69jQM1cX/+rKK+Vh5Obeqrmm5lkWD+pTYy+izhDPHEiFNL8wiuNab1xJGFDaFc
 rUuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kL8550kovQ+/iiHhGv0XBMU80uGpJl3t3YMwQltuykQ=;
 b=72fFOcAI78peqOJQ8yKjdHBZGX18T4mVpkX5DQwqoTviMuE0AiAWwpdSfS5OrDlnk8
 3KhFTYAoxOMBN6l6YPpOk14oyD7/pep7ZkFgu3KDygd089fsGO5EsdScPP8yX8E+cAMp
 AXY3xzy+ykVJCtcbiBVCF+2vWtSckGTmOSYqfYK2oT3U3TBMzlG4NckMQWJHjRxXcA2S
 jQzahmmsNc2fet6sApjtGSwewEQr4Sm0t62lL2DtY47FdX+erQ++hfCNfd6NxmAm3WSf
 ILuF1OaBGazROvprRarvetKcfy0sQAts14xGqx5/8cS/2hXSSwnEn6djNuIaWmF0S5d1
 dzBQ==
X-Gm-Message-State: AOAM530md4XiE8vLXE6umRBzkju/gC0Ar6L3mmIY4+8LVyvY5+5emOWP
 kyO3/kPGcO6Pu0yKZdxcQvJkUpp3cn0=
X-Google-Smtp-Source: ABdhPJxR1vsjdds3qmB827EgGAK3ZFOzWiP/+X6BhtNGuMB8FqwXaljKNPNgYjvCOZX6hTVoTduQig==
X-Received: by 2002:a05:600c:1c9e:: with SMTP id
 k30mr18376658wms.74.1632041591484; 
 Sun, 19 Sep 2021 01:53:11 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id l124sm16000489wml.8.2021.09.19.01.53.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 01:53:11 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Sep 2021 10:52:44 +0200
Message-Id: <20210919085244.1796002-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-rsa: add
 PYTHON_RSA_CPE_ID_VENDOR
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

cpe:2.3:a:python-rsa_project:python-rsa is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apython-rsa_project%3Apython-rsa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-rsa/python-rsa.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-rsa/python-rsa.mk b/package/python-rsa/python-rsa.mk
index eaa47e8037..a3d4bb8235 100644
--- a/package/python-rsa/python-rsa.mk
+++ b/package/python-rsa/python-rsa.mk
@@ -10,5 +10,6 @@ PYTHON_RSA_SITE = https://files.pythonhosted.org/packages/db/b5/475c45a58650b058
 PYTHON_RSA_SETUP_TYPE = setuptools
 PYTHON_RSA_LICENSE = Apache-2.0
 PYTHON_RSA_LICENSE_FILES = LICENSE
+PYTHON_RSA_CPE_ID_VENDOR = python-rsa_project
 
 $(eval $(python-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
