Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F86AC38A02
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 03:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2645381444;
	Sat, 29 Oct 2022 03:13:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2645381444
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2_OTdOUJp3ff; Sat, 29 Oct 2022 03:13:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47BB381432;
	Sat, 29 Oct 2022 03:13:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47BB381432
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B710E1BF982
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 03:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92ACE40104
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 03:13:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92ACE40104
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zXWFkx9hdpe6 for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 03:13:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EFA1400F8
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9EFA1400F8
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 03:13:47 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id 17so2052089pfv.4
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 20:13:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CH+mOG8/RO45c8wwhIqMEkM4z8mwkFMQ3ApzsdkNYa0=;
 b=nDROc9IRHq66aTrU0/QzZmKM/oD5qLtU1jyTG3Dq8VSa9zN+4GpFJUy7kuWNiBP1tM
 /56YI4DHF7Q2AWCvTkeOkxWaJlkwfi4wQSuTVl/glxEvchbQC731e/66UfRWxlLQc0RI
 c7GdQ10Cf4wSxemqOEO4d1HnuyS/u09C4LlZKHip0G9YSY3o8MpbCvNIGE92FEVODHmx
 /29ikM/M/V5PxfrTCUvFuch1M8RYs459SD/+Kd607e68S2DYT4t3NkWCfEWVVU8bzoNO
 rX4s3sayMcj6wbAk16WCJ+pYx1U8ls8BkEaWr+9eKezANvPWMci57QFj82Z1QC1KyPpd
 Sbhw==
X-Gm-Message-State: ACrzQf3YW2FjDpsLkTEXhxlm3Cmj1RBi2nL/W8poDAbujAUxQipqgSj3
 GVPOMgNU4DguYXbOO5yYqJxAvPTqhEcM2g==
X-Google-Smtp-Source: AMsMyM41h3Zs0cDJXKYdy+8KFolcr72h2+Aj0szgNpObuAvFfpVbvvVzitVdCCuhtcO2FoRf3FacAw==
X-Received: by 2002:a05:6e02:1c47:b0:2fc:2672:d9c6 with SMTP id
 d7-20020a056e021c4700b002fc2672d9c6mr1048381ilg.35.1667006604045; 
 Fri, 28 Oct 2022 18:23:24 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 i12-20020a056e02054c00b002f4e385252asm88704ils.39.2022.10.28.18.23.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 18:23:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Oct 2022 19:23:21 -0600
Message-Id: <20221029012321.1398031-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CH+mOG8/RO45c8wwhIqMEkM4z8mwkFMQ3ApzsdkNYa0=;
 b=cchFf2opXd6vvrgHmXXgFNeORFChthcq+TCPD9yterrx8v9V9oC1J4ctrlbQZiY9Mc
 SO2uttCgN4lqSvvWbn7R1RobtCKpsEUQ0IMuq2GjBr+LE8jauXBY3wyIFOvkE5gZ0ytR
 BfaxKO02/tTUdmwbb2x9Ciux3ik1evPVwRrj7iVGGim728O/cCDdIvds51CSkesiirHn
 Vb7oD+s229ybktEvb9NCa4WEMXuWMWXoJ43rTA51PdEGaT3IdIBHMaT8Ng3Fdd04NPaq
 2uxjXQJ1x6zEflcRUSQhFUreVaQndIbMD2rQ+ZPBA4NmY5yvXX/bfOEqojDkpn6QwETo
 aO9A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cchFf2op
Subject: [Buildroot] [PATCH 1/1] package/python-certifi: bump to version
 2022.9.24
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
 package/python-certifi/python-certifi.hash | 4 ++--
 package/python-certifi/python-certifi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-certifi/python-certifi.hash b/package/python-certifi/python-certifi.hash
index ac3d0a909b..0557a5c97c 100644
--- a/package/python-certifi/python-certifi.hash
+++ b/package/python-certifi/python-certifi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/certifi/json
-md5  f919a230b999ebae1969088ca68e8367  certifi-2022.9.14.tar.gz
-sha256  36973885b9542e6bd01dea287b2b4b3b21236307c56324fcc3f1160f2d655ed5  certifi-2022.9.14.tar.gz
+md5  ff9c8d5c7e7fb083de6b874609c5ca68  certifi-2022.9.24.tar.gz
+sha256  0d9c601124e5a6ba9712dbc60d9c53c21e34f5f641fe83002317394311bdce14  certifi-2022.9.24.tar.gz
 # Locally computed sha256 checksums
 sha256  a02f6c638f9fb84d06f7764c3ab085d8af7eda5b93c166da54312479077c6fb0  LICENSE
diff --git a/package/python-certifi/python-certifi.mk b/package/python-certifi/python-certifi.mk
index 2053d5e820..8e2435199f 100644
--- a/package/python-certifi/python-certifi.mk
+++ b/package/python-certifi/python-certifi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CERTIFI_VERSION = 2022.9.14
+PYTHON_CERTIFI_VERSION = 2022.9.24
 PYTHON_CERTIFI_SOURCE = certifi-$(PYTHON_CERTIFI_VERSION).tar.gz
-PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/ca/48/88ec470f8b68319b6782ca3a0570789886ad5ca24c1af2f3771699135baa
+PYTHON_CERTIFI_SITE = https://files.pythonhosted.org/packages/cb/a4/7de7cd59e429bd0ee6521ba58a75adaec136d32f91a761b28a11d8088d44
 PYTHON_CERTIFI_SETUP_TYPE = setuptools
 PYTHON_CERTIFI_LICENSE = ISC (Python code), MPL-2.0 (cacert.pem)
 PYTHON_CERTIFI_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
