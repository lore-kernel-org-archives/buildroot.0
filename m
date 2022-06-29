Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4145FC43334
	for <buildroot@archiver.kernel.org>; Wed, 29 Jun 2022 12:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6617612DB;
	Wed, 29 Jun 2022 12:37:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6617612DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EeHMeN47NASV; Wed, 29 Jun 2022 12:37:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D450612DE;
	Wed, 29 Jun 2022 12:37:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D450612DE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4E6601BF407
 for <buildroot@lists.busybox.net>; Wed, 29 Jun 2022 12:37:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3654B41760
 for <buildroot@lists.busybox.net>; Wed, 29 Jun 2022 12:37:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3654B41760
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HVp7aYqXkhHl for <buildroot@lists.busybox.net>;
 Wed, 29 Jun 2022 12:37:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03381408EA
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 03381408EA
 for <buildroot@buildroot.org>; Wed, 29 Jun 2022 12:37:31 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id i17so10141737ils.12
 for <buildroot@buildroot.org>; Wed, 29 Jun 2022 05:37:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lRqg+Tdv1jvYehFc3ulGH3YnK9Mmt2sAveIpUxoFZ2I=;
 b=jKUl6ZZLICtZ3BpfGBeeBBzkGl3y36+6vEAtzxhsTzfmmhRYWNvTlXIYUEBlpOsJi/
 IuFwGrC9iYedorqksHV4hcTQf9Qpf5Xk5BuT5t8viaq8ZUX2BB4sQkj25wNnLHwmmk9e
 j7Ff8hdcyFWhIYaYV70LQE+2HfB7Z7QE0Jb5By2y5SBg1Z6JV2GJsvmfzQkRasIOA7m1
 XIBBISznyheKW0pw/9+VQ3ZcSNJhRH1IAv5EyYBTyAFY9Hl3iCCZ2jPXlyA4XtBhhrkC
 jul050pbIpYtUnaFymgYAhdeLtn52D3XCOXPodszwQ9CTP+Pdnr1yTv2j5kFU20JaKxs
 jKzg==
X-Gm-Message-State: AJIora/MKgLZgVvPe4HfoxddGCAQosh8uCA+Y6vYC1Twhqm9MqFQZXRY
 r4Oq+zx9pBoWNaL9zrHFqs3iZswvq4k=
X-Google-Smtp-Source: AGRyM1uR0J3bV9ujNVesuEA/a9F23ixukir9Z2+B8R23F5kRCU5658LAbZRK3/b/ClsBzbTbTKXNSQ==
X-Received: by 2002:a92:ca45:0:b0:2da:823a:5f17 with SMTP id
 q5-20020a92ca45000000b002da823a5f17mr1811436ilo.155.1656506250949; 
 Wed, 29 Jun 2022 05:37:30 -0700 (PDT)
Received: from james-x399.localdomain (71-218-105-112.hlrn.qwest.net.
 [71.218.105.112]) by smtp.gmail.com with ESMTPSA id
 s12-20020a92d90c000000b002d92c91da91sm6921697iln.77.2022.06.29.05.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 05:37:30 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 29 Jun 2022 06:37:26 -0600
Message-Id: <20220629123726.2418018-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lRqg+Tdv1jvYehFc3ulGH3YnK9Mmt2sAveIpUxoFZ2I=;
 b=l1CJ6SbqfKcxmRvLqa/7R1ENXPtlv44n4mXhyL3CvjWVPcRazAzCViceJKVTPvfeAN
 2bPC2rumb1BPPbM6Fs4rQQESJ2swTzCA9B5/fhufuWx2PkEECey5hwp3OTfaFa9lCa17
 z0QiN0fak6ZSRkUG2bsMRC+db495dFsuG2GrARQhESM8HZJ71jQcX6TXbTEEwoCpyEBE
 PSZGvAyOrUCRv25ocV1O8I15FJ8ZDWbDnUGBawCm5u1oQw/c+4vgIvog3ndeQyFS5Fvv
 k587OXjfsO2MdgmbgkOfNT4uKVrKueAL+6dotvPUjJwnESSjI2rkV+XIifesP05+hsl4
 Yl/w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=l1CJ6Sbq
Subject: [Buildroot] [PATCH 1/1] package/python-setuptools-scm: bump to
 version 7.0.3
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
 package/python-setuptools-scm/python-setuptools-scm.hash | 4 ++--
 package/python-setuptools-scm/python-setuptools-scm.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools-scm/python-setuptools-scm.hash b/package/python-setuptools-scm/python-setuptools-scm.hash
index 934c505442..d8ec915862 100644
--- a/package/python-setuptools-scm/python-setuptools-scm.hash
+++ b/package/python-setuptools-scm/python-setuptools-scm.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools-scm/json
-md5  b4e02bf8e62ed49142ea7b42a68671d7  setuptools_scm-6.4.2.tar.gz
-sha256  6833ac65c6ed9711a4d5d2266f8024cfa07c533a0e55f4c12f6eff280a5a9e30  setuptools_scm-6.4.2.tar.gz
+md5  86fe71422781939dd492cd73c93cebac  setuptools_scm-7.0.3.tar.gz
+sha256  cf8ab8e235bed840cd4559b658af0d8e8a70896a191bbc510ee914ec5325332d  setuptools_scm-7.0.3.tar.gz
 # sha256 locally computed
 sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSE
diff --git a/package/python-setuptools-scm/python-setuptools-scm.mk b/package/python-setuptools-scm/python-setuptools-scm.mk
index 132eb398aa..890ee0c9c1 100644
--- a/package/python-setuptools-scm/python-setuptools-scm.mk
+++ b/package/python-setuptools-scm/python-setuptools-scm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_SCM_VERSION = 6.4.2
+PYTHON_SETUPTOOLS_SCM_VERSION = 7.0.3
 PYTHON_SETUPTOOLS_SCM_SOURCE = setuptools_scm-$(PYTHON_SETUPTOOLS_SCM_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SCM_SITE = https://files.pythonhosted.org/packages/4a/18/477d3d9eb2f88230ff2a41de9d8ffa3554b706352787d289f57f76bfba0b
+PYTHON_SETUPTOOLS_SCM_SITE = https://files.pythonhosted.org/packages/bc/e6/ac8b0c5076321b9b3e4318c32a8911a260d019be6584556a0b83a47dab4b
 PYTHON_SETUPTOOLS_SCM_LICENSE = MIT
 PYTHON_SETUPTOOLS_SCM_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_SCM_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
