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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3053FC433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 05:49:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D051611B0
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 05:49:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9D051611B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48EA0828D1;
	Wed, 22 Sep 2021 05:49:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PS0dbMo84DUL; Wed, 22 Sep 2021 05:49:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9724882897;
	Wed, 22 Sep 2021 05:49:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B966B1BF40E
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 05:49:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DCAB40197
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 05:49:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MKmuErT0AQ3s for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 05:49:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9135A400F5
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 05:49:33 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id o66so2771375oib.11
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 22:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1XPa2Cn5qGgpgZzjcDVuTLMj9bDoUlbV4XkFt8SWILo=;
 b=DK7edVRS4RCnAzX06L4yBcorTik9KfzFuXpylDueHf5fBgrVc4FYhyJfABJGMwToY9
 o6NEkoAg5g4Vn0EU9ACe6Yns0xGKiNjS351KtaXft/0hcFn/pr26tYjbxENTT2ffuBad
 NkAHsfe4MawEHSoqwhZx8w/RxcBwSrMv7EvyAbb/qKG+AHKy7jXhf9ykKRg2isHLWWqJ
 e/nEDo1aRzFC3j99fNPb8xAfDWuV0caS++tHaZ1LIjB9iu2E7v8s3zCKtNul2z+NuxJE
 9fSbo+GRO6C3HfjZKrKphS1xrskkB8rHIbpl09JznU70/EmzdInnv+a1zg13WQaSy8GV
 v+gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1XPa2Cn5qGgpgZzjcDVuTLMj9bDoUlbV4XkFt8SWILo=;
 b=JsUw7utn9AmOuLN3ECGgO/jMbEuQc9ocJSpWizE+l/ZZGtG5KtC8lFXyVPjk1nJOYE
 zFIy39ERq9/t6wD9W2haugtVQG/rGs6YxtEg2K6vJHRXVHJX12SJwOfhYe1wb4+CLOtH
 Yptw0M57IY0AuELk8cES9ZX6V89yU+w9rt8LQGPoF2G3Xo0A18k/6nM8AR1i2gy6hyol
 YVbnXoP/zYQv+Ip8HQ3oZJQw5VGUWviGAJhMzZQc4tDrgZMH6zfNuan5Q0bej24bjvqD
 RNDnpWUgkeDUFI9Wqjr4ajQFCFNPS3jFy+0w9q0du+MJYcgi3EbJ+/EoSV5T8Ia997cE
 C3zA==
X-Gm-Message-State: AOAM5325ii29eHLkoO+IdcFAE64t2ENvse/58imPlYb1mlDi3PfulUTp
 il8ix4weZpoXkqE+Ka8O+SH9UwZ6szQ=
X-Google-Smtp-Source: ABdhPJwu62YIP+UxJS8FzQyKWXLDpyplBFFMDtTYcAPIJSuJ1s/I7boej3nfxgv7xLWffF3rOnm3Lg==
X-Received: by 2002:aca:dfd5:: with SMTP id w204mr6689559oig.161.1632289772449; 
 Tue, 21 Sep 2021 22:49:32 -0700 (PDT)
Received: from james-x399.localdomain (71-33-146-72.hlrn.qwest.net.
 [71.33.146.72])
 by smtp.gmail.com with ESMTPSA id k1sm299765otr.43.2021.09.21.22.49.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 22:49:32 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Sep 2021 23:49:29 -0600
Message-Id: <20210922054929.2333365-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-cbor2: bump to version 5.4.1
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
 James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cbor2/python-cbor2.hash | 4 ++--
 package/python-cbor2/python-cbor2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cbor2/python-cbor2.hash b/package/python-cbor2/python-cbor2.hash
index cacaf7b76c..879463c2ce 100644
--- a/package/python-cbor2/python-cbor2.hash
+++ b/package/python-cbor2/python-cbor2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cbor2/json
-md5  0b4ac06208304fd8251e50d55a7692ca  cbor2-5.4.0.tar.gz
-sha256  a7926f7244b08c413f1a4fa71a81aa256771c75bdf1a4fd77308547a2d63dd48  cbor2-5.4.0.tar.gz
+md5  87b3ad8a9dd8875fa46c6ec06e3fb0ba  cbor2-5.4.1.tar.gz
+sha256  a8bf432f6cb595f50aeb8fed2a4aa3b3f7caa7f135fb57e4378eaa39242feac9  cbor2-5.4.1.tar.gz
 # Locally computed sha256 checksums
 sha256  a6afd126d8f545a15166a22f25fadff4b9fb4978bbdd17e97d97d950b66d2fef  LICENSE.txt
diff --git a/package/python-cbor2/python-cbor2.mk b/package/python-cbor2/python-cbor2.mk
index 325f20faf7..af42d0344a 100644
--- a/package/python-cbor2/python-cbor2.mk
+++ b/package/python-cbor2/python-cbor2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CBOR2_VERSION = 5.4.0
+PYTHON_CBOR2_VERSION = 5.4.1
 PYTHON_CBOR2_SOURCE = cbor2-$(PYTHON_CBOR2_VERSION).tar.gz
-PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/dd/cf/154810bb8698a583fd30faec5a34d84d8a01cc700e34c1e41b90616d7d63
+PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/9e/25/9dd432c051010faea6a702cb85d0b53dc9d5414513866b6a73b3ac954092
 PYTHON_CBOR2_SETUP_TYPE = setuptools
 PYTHON_CBOR2_LICENSE = MIT
 PYTHON_CBOR2_LICENSE_FILES = LICENSE.txt
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
