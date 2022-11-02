Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 854B8C4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 19:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12690408D1;
	Wed,  2 Nov 2022 19:52:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12690408D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fm_8apNCp_cu; Wed,  2 Nov 2022 19:52:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35F3340194;
	Wed,  2 Nov 2022 19:52:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35F3340194
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AB4C81BF3E1
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 19:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82168416CC
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 19:52:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82168416CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OGFYCsU-3Y_D for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 19:52:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59451416C7
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 59451416C7
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 19:52:06 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id h206so12460245iof.10
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 12:52:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kRJH2oerF/mEpfqbTRpj6NQO3XMv9px6iMX6k4noTWo=;
 b=j09EDRoCvOd+Nlq39kHJObGjlZyu/4ccKtCP6NZ1IC2Ii2XuiAnjMy/xjRQ7sl4fIs
 +iOiBIYlcrdomPon1r5IWUPGGeq8gjie9piCjcTEj9Jltxa2adhecgaRqTUDUQ8Rllgo
 r2pNChy6qyQSHEzpJ1uA4XnCG6KI0E7taaqFq9gyZmQn1eaAdRDJVUtZ+JuLlJwUQ+dm
 yvjoOXHBLr1ZSOPuZxNYKyWNBSBXHaF8d62nTytAlSrj7rfajWIrJ2bava9psGZItYbX
 Vwxg3ANHva39TA7MH4LXIGdgusifdhQh7Q3fZM1AnJjCEkXXXKtDaXox0jwEW5zZq1O0
 KX8g==
X-Gm-Message-State: ACrzQf1NfT0ssEoASCpqtYdnN28uEk43PYeY096FaR6hrj4fEnHAi2Ia
 wKfPfUlWoIeJsmh84i+BYmWAx2AvALZNKQ==
X-Google-Smtp-Source: AMsMyM7K+eFsl3Q8KDHJcs9bYyBPgiW2ZGGVtrkGF8SpexgttsK7+JB3aGxH9i+twWhYxuVhhaV0lw==
X-Received: by 2002:a6b:7e0b:0:b0:6d1:1d92:90e4 with SMTP id
 i11-20020a6b7e0b000000b006d11d9290e4mr11788521iom.79.1667418725044; 
 Wed, 02 Nov 2022 12:52:05 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 s1-20020a92cc01000000b002ffcac9d1cbsm1107936ilp.3.2022.11.02.12.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 12:52:04 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 13:52:02 -0600
Message-Id: <20221102195202.874941-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kRJH2oerF/mEpfqbTRpj6NQO3XMv9px6iMX6k4noTWo=;
 b=gh3tDa5gAoso5D9OvhxQv9ssf6FjkMvGN71r0z1osC2bxepANrNMlsHGra1eeF7rq1
 wdNfkix4w5er9O7m/gOFlxcPQ15wqDj913a1JmJmUzp2vqRjCDyryNZHtXgM2QR3z4xx
 HyPKmVjhV8PUho85mr6G2j1L0CDO58S+ApLFowghQJfa57AJ8Bo1Ov78wI1CRv4q7XKN
 nzs71sodnAJ1CJkHvf+MhE48AuuQLC/kPzCqHCxg6D19UV01Zd7eLKYlO3RCwQ0gYwjv
 9fnq6DsigfHkFEFw6i333IQQM2cMVtErk9y/4wUpFZBTgT9Waz1bGLQqYEc+WcVyQpNU
 IN8Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gh3tDa5g
Subject: [Buildroot] [PATCH 1/1] package/python-dialog3: bump to version
 3.5.3
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
 package/python-dialog3/python-dialog3.hash | 8 ++++----
 package/python-dialog3/python-dialog3.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-dialog3/python-dialog3.hash b/package/python-dialog3/python-dialog3.hash
index 4c43d4bf5e..d66f328638 100644
--- a/package/python-dialog3/python-dialog3.hash
+++ b/package/python-dialog3/python-dialog3.hash
@@ -1,5 +1,5 @@
-# md5 from https://pypi.python.org/pypi/pythondialog/json
-md5  07e257d91099b804e040c6ea5ec56041  pythondialog-3.5.1.tar.gz
-# Locally computed
-sha256  34a0687290571f37d7d297514cc36bd4cd044a3a4355271549f91490d3e7ece8  pythondialog-3.5.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/pythondialog/json
+md5  94a9236e427de783fa3ee8288834f7f1  pythondialog-3.5.3.tar.gz
+sha256  b2a34a8af0a6625ccbdf45cd343b854fc6c1a85231dadc80b8805db836756323  pythondialog-3.5.3.tar.gz
+# Locally computed sha256 checksums
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
diff --git a/package/python-dialog3/python-dialog3.mk b/package/python-dialog3/python-dialog3.mk
index 6051985640..e936de5811 100644
--- a/package/python-dialog3/python-dialog3.mk
+++ b/package/python-dialog3/python-dialog3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DIALOG3_VERSION = 3.5.1
+PYTHON_DIALOG3_VERSION = 3.5.3
 PYTHON_DIALOG3_SOURCE = pythondialog-$(PYTHON_DIALOG3_VERSION).tar.gz
-PYTHON_DIALOG3_SITE = https://files.pythonhosted.org/packages/72/3c/26ed0db035f97196704d0197d8b2254b8a6ca93a2d132430b0b0d597aa79
+PYTHON_DIALOG3_SITE = https://files.pythonhosted.org/packages/4e/40/5c84d79f7d536ca2c3722af521eff4faafe54a93797f08c72eb72e68fb68
 PYTHON_DIALOG3_LICENSE = LGPL-2.1+
 PYTHON_DIALOG3_LICENSE_FILES = COPYING
 PYTHON_DIALOG3_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
