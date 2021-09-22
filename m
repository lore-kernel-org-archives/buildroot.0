Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,PDS_BTC_ID,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F192EC433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 06:44:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98A3061184
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 06:44:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 98A3061184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CB8A40704;
	Wed, 22 Sep 2021 06:44:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cs7CsrobK_c5; Wed, 22 Sep 2021 06:44:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A35F2406D5;
	Wed, 22 Sep 2021 06:44:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8EA741BF409
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 06:44:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DF61406D5
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 06:44:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RGQGLj6lbL4L for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 06:44:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B04534028B
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 06:44:09 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id q205so2015604iod.8
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 23:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AULzchIGfchgB0aMUFH0sfWxu35joh7ru+9rDLmjdck=;
 b=Xvf2WxasLFiIPdX2/Aw15/6bF4S38qeCQAhhgXGygvJhYzpU/LEMKuePaDEUH2bRuO
 cFDqPK51lmSyAVDiEeE5ph35UqDdz3Y+PqSTJBP2IsZm+3vaAzOdEolVTx/kJralmFKs
 rHr0SFhKP75/P/iBWincKnAUYs9dnU5CKIgbA6Qq3vtbZ3rvnk7UCLDu2gCab0oXQmXS
 vw+7HdMlOt4NAMifBd975XGUN0AhZNs+6z9Pmt+Bkr6CNIGfLKkDqpDVaZm/Vjv5Rz9j
 Sf70o+KR5hOSUg85EiELF2afXgV1kIn4rsfvcPsaHsfkEnwRR6nNOnsHeM7GMaysifS0
 XxOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AULzchIGfchgB0aMUFH0sfWxu35joh7ru+9rDLmjdck=;
 b=irt4VRBOH2UoZ8U3I6BPS0fnraTiv9ogMuMs9EtJd9q/NMEqnLPwc2o2RNS0y0Y3Sd
 Oeuwqtn4Q9o1uKW0a0UtPX5wFyCg3NHVbr4ilNL+OkLl+wfUcw+cQNc1xt0PsaXj/7PO
 U+DGDOoMs9OH616l9HgGghI6rTWJ7V2cJ31Ygcab7Rzrg7RoRXWpGbrX53Heysd1Ihco
 K6UkllBR4RPhMsJiMdjXFJezzhJXCF2/emLqZIEtkIvnoD+/QAcy6rGWqXv1xYO+zbFT
 LeFfCv+cGNbAyfAthmhdoBmPJaTehVLjRm3L3WCwjU7i55aP9khFZKecrrqW1o066UdK
 1j4g==
X-Gm-Message-State: AOAM530VqT+kgzYWEtxMcoS9jZPgmEWV5ptW8rq9AMnsKjuRL2sNvwMz
 wd6tzzcJ20MMKMQnEYBUaKTgWt33wCo=
X-Google-Smtp-Source: ABdhPJxQf2X66J2G+WSBLG0N2qLYZB6Sb/TAvQo8hfbDSqcf2u1yZGDnG31dOwVw8NXqKj0O5gVORQ==
X-Received: by 2002:a05:6638:4122:: with SMTP id
 ay34mr3435195jab.28.1632293048682; 
 Tue, 21 Sep 2021 23:44:08 -0700 (PDT)
Received: from james-x399.localdomain (71-33-146-72.hlrn.qwest.net.
 [71.33.146.72])
 by smtp.gmail.com with ESMTPSA id v17sm125801ilo.1.2021.09.21.23.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 23:44:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Sep 2021 00:44:07 -0600
Message-Id: <20210922064407.82333-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python3-mako: bump to version 1.1.5
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-mako/python-mako.hash | 4 ++--
 package/python-mako/python-mako.mk   | 4 ++--
 package/python3-mako/python3-mako.mk | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-mako/python-mako.hash b/package/python-mako/python-mako.hash
index 353799923f..f5b5daf06d 100644
--- a/package/python-mako/python-mako.hash
+++ b/package/python-mako/python-mako.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mako/json
-md5  184bb2ba4b937127e7c557b93db89377  Mako-1.1.3.tar.gz
-sha256  8195c8c1400ceb53496064314c6736719c6f25e7479cd24c77be3d9361cddc27  Mako-1.1.3.tar.gz
+md5  409bdc38e9ddda5eada61fb092cb12fd  Mako-1.1.5.tar.gz
+sha256  169fa52af22a91900d852e937400e79f535496191c63712e3b9fda5a9bed6fc3  Mako-1.1.5.tar.gz
 # Locally computed sha256 checksums
 sha256  47cd0d41b1092f9161cfb629ed15e5cea185144710ff4633a4281ef088ff5de7  LICENSE
diff --git a/package/python-mako/python-mako.mk b/package/python-mako/python-mako.mk
index d5d49f252d..6529d0d520 100644
--- a/package/python-mako/python-mako.mk
+++ b/package/python-mako/python-mako.mk
@@ -6,9 +6,9 @@
 
 # Please keep in sync with
 # package/python3-mako/python3-mako.mk
-PYTHON_MAKO_VERSION = 1.1.3
+PYTHON_MAKO_VERSION = 1.1.5
 PYTHON_MAKO_SOURCE = Mako-$(PYTHON_MAKO_VERSION).tar.gz
-PYTHON_MAKO_SITE = https://files.pythonhosted.org/packages/72/89/402d2b4589e120ca76a6aed8fee906a0f5ae204b50e455edd36eda6e778d
+PYTHON_MAKO_SITE = https://files.pythonhosted.org/packages/d1/42/ff293411e980debfc647be9306d89840c8b82ea24571b014f1a35b2ad80f
 PYTHON_MAKO_SETUP_TYPE = setuptools
 PYTHON_MAKO_LICENSE = MIT
 PYTHON_MAKO_LICENSE_FILES = LICENSE
diff --git a/package/python3-mako/python3-mako.mk b/package/python3-mako/python3-mako.mk
index fd6b2ed49c..dfe600a4e4 100644
--- a/package/python3-mako/python3-mako.mk
+++ b/package/python3-mako/python3-mako.mk
@@ -6,9 +6,9 @@
 
 # Please keep in sync with
 # package/python-mako/python-mako.mk
-PYTHON3_MAKO_VERSION = 1.1.3
+PYTHON3_MAKO_VERSION = 1.1.5
 PYTHON3_MAKO_SOURCE = Mako-$(PYTHON3_MAKO_VERSION).tar.gz
-PYTHON3_MAKO_SITE = https://files.pythonhosted.org/packages/42/64/fc7c506d14d8b6ed363e7798ffec2dfe4ba21e14dda4cfab99f4430cba3a
+PYTHON3_MAKO_SITE = https://files.pythonhosted.org/packages/d1/42/ff293411e980debfc647be9306d89840c8b82ea24571b014f1a35b2ad80f
 PYTHON3_MAKO_SETUP_TYPE = setuptools
 PYTHON3_MAKO_LICENSE = MIT
 PYTHON3_MAKO_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
