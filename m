Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 536CEC4332F
	for <buildroot@archiver.kernel.org>; Wed, 19 Oct 2022 21:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB8B241C56;
	Wed, 19 Oct 2022 21:54:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB8B241C56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pHYugsJHY1C5; Wed, 19 Oct 2022 21:54:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6E3341C61;
	Wed, 19 Oct 2022 21:54:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6E3341C61
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DAAC81BF41B
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 21:53:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B6AF7815CA
 for <buildroot@lists.busybox.net>; Wed, 19 Oct 2022 21:53:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6AF7815CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wdxxEjbtN-ek for <buildroot@lists.busybox.net>;
 Wed, 19 Oct 2022 21:53:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AAD681308
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4AAD681308
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 21:53:56 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id o13so9919293ilc.7
 for <buildroot@buildroot.org>; Wed, 19 Oct 2022 14:53:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vsx6K+of8NEV4EYjp+6uYlovhsXy+11wiofcz+qIB7E=;
 b=7HhAJY2R4i7buDq72S1HgEQbXfk6CpBZSpb3ZoQ7RxcsgpmKqjUlu6m6GUCpLpj8xw
 YAxb3JjSWS1aNVs/tJTuM5etBG1f8I6K2cVysISZMtFqRvd3PyrzQr+kgsExLFF4SQRU
 Zlg6mtMWW5dyUWISD0OrdS3NHVCygcbJ/agwmrgd5vADqtaH6RnflHQh3yZ/Ru01GRPL
 gwixgRWtswqxDI6r/1z1Pq8jCWRD2gdUGVn4tiFEOigGVhx5peUm2zjGF2cCwMu18FrM
 BLczITTipETASzFL5t6bZmIrz9Tnp1JvBxWdiDtpVAAGnpdIwwLpbvWbdxPuNQ4WA+po
 XgZw==
X-Gm-Message-State: ACrzQf0X33ZBCKMsMI7NDTvAO5bpwgjnLo1a2sLdY5cirrXNrWmDZdy+
 Gf8EDPCLuSdg2JBJbrwoXh7Brurb0nbQhA==
X-Google-Smtp-Source: AMsMyM7sgG4jFcuISRDp1wyFw1GY6N9pFQ7khrzVNBsCulK7zt+te5XjVGu26fcPzfRIumsJdMN32Q==
X-Received: by 2002:a05:6e02:16c8:b0:2fa:f950:9708 with SMTP id
 8-20020a056e0216c800b002faf9509708mr7699648ilx.141.1666216435690; 
 Wed, 19 Oct 2022 14:53:55 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 v3-20020a056602058300b006bc69b0fa07sm2645358iox.12.2022.10.19.14.53.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Oct 2022 14:53:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 19 Oct 2022 15:53:46 -0600
Message-Id: <20221019215348.3262192-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221019215348.3262192-1-james.hilliard1@gmail.com>
References: <20221019215348.3262192-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vsx6K+of8NEV4EYjp+6uYlovhsXy+11wiofcz+qIB7E=;
 b=LlTgk9dB4v5s/kEs1TtAgDm+KqgEb01ZRU0acOEn4oCrpEXjhdaKqspsom5cWojq0w
 6MGsXo4QcS58mfYv/0nmpahdwz9ykX64f958yEtOlx4Boz6RCzgFT0WV51rJfCN4Ra+Z
 MKXVxvVq8hyRWYvU1bnwZIqyrkWk/KAFtycDaJHhTZnFY023+UPiGkJluTNGwTO3l8RM
 nGp01vcnYf2y2V2TUa/mWTRZZbkz8PcOBlJN8E+Nc+hBChz1YeMpuLUMnWxjx24N+mTm
 0rgANeKMU+XjJ6pfCvq5B58dZAoKxWM55S+8tW70fiC2Z/59AW9LgqaRSOWxIIoVARKq
 HSOQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LlTgk9dB
Subject: [Buildroot] [PATCH 5/7] package/python-hatch-fancy-pypi-readme: new
 package
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
 Marcin Niestroj <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS                                        |  1 +
 .../python-hatch-fancy-pypi-readme.hash           |  5 +++++
 .../python-hatch-fancy-pypi-readme.mk             | 15 +++++++++++++++
 3 files changed, 21 insertions(+)
 create mode 100644 package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.hash
 create mode 100644 package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9e2e7a2b87..df61582cd4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1384,6 +1384,7 @@ F:	package/python-fonttools/
 F:	package/python-frozenlist/
 F:	package/python-greenlet/
 F:	package/python-hatchling/
+F:	package/python-hatch-fancy-pypi-readme/
 F:	package/python-installer/
 F:	package/python-janus/
 F:	package/python-logstash/
diff --git a/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.hash b/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.hash
new file mode 100644
index 0000000000..1b287072b7
--- /dev/null
+++ b/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/hatch_fancy_pypi_readme/json
+md5  588776ea8e3608714d4cbba16dffa92b  hatch_fancy_pypi_readme-22.8.0.tar.gz
+sha256  da91282ca09601c18aded8e378daf8b578c70214866f0971156ee9bb9ce6c26a  hatch_fancy_pypi_readme-22.8.0.tar.gz
+# Locally computed sha256 checksums
+sha256  e69ea57f96e599e617f61af3e85bf326b87e833994709fb5e5908a81197730a2  LICENSE.txt
diff --git a/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.mk b/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.mk
new file mode 100644
index 0000000000..f28721181a
--- /dev/null
+++ b/package/python-hatch-fancy-pypi-readme/python-hatch-fancy-pypi-readme.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-hatch-fancy-pypi-readme
+#
+################################################################################
+
+PYTHON_HATCH_FANCY_PYPI_README_VERSION = 22.8.0
+PYTHON_HATCH_FANCY_PYPI_README_SOURCE = hatch_fancy_pypi_readme-$(PYTHON_HATCH_FANCY_PYPI_README_VERSION).tar.gz
+PYTHON_HATCH_FANCY_PYPI_README_SITE = https://files.pythonhosted.org/packages/4e/ab/9b48589d6e3a2f72cc1e8f5221c28ff28fcdf116dbbd6e9beb946054212d
+PYTHON_HATCH_FANCY_PYPI_README_LICENSE = MIT
+PYTHON_HATCH_FANCY_PYPI_README_LICENSE_FILES = LICENSE.txt
+PYTHON_HATCH_FANCY_PYPI_README_SETUP_TYPE = pep517
+HOST_PYTHON_HATCH_FANCY_PYPI_README_DEPENDENCIES = host-python-hatchling
+
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
