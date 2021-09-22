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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67050C433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 04:43:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBC8D6109F
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 04:43:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EBC8D6109F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE63140245;
	Wed, 22 Sep 2021 04:43:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zWi-Z0MmCVu5; Wed, 22 Sep 2021 04:43:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DAB00400F5;
	Wed, 22 Sep 2021 04:43:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D573C1BF41E
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 04:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2098401B1
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 04:43:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z29TPYpHSevU for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 04:43:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 07E28401A3
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 04:43:31 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id i13so1371376ilm.4
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 21:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uf4h5xnJjYM0eaxDj6IbG6GDRNWLxlygWvcv7nEdR4E=;
 b=Sb2F/lhGaV9EtKsvcNMlVKeS5+pInxTpZ9Ob5mnDWKWCSphjFMtVun/JYeUZW3Yhz0
 SOOW8NYHxgelq8+sa7HIca1LODHtqNCykLvEuMeCyQOnPD+STyz13oVx4PUns6jf4A8W
 po/1d5jTzj5pknZPquFx96ZqI3gMv2+YtLHJuC6TtOiDvLY+6qEFMpKKleVrKpiBX2VV
 8+I6VeFnx5HkHvPB+RHw6c9FMumvar4sBG3uYBsebinQf85r8+VyaaeAMr3Ge+pBvsTO
 1ML++BZNC4z/BcFiy/yx0RPNXG6yEJChqyZFQTahU0qly5n53hFJUycQ9X7SV36MqNSP
 LKHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uf4h5xnJjYM0eaxDj6IbG6GDRNWLxlygWvcv7nEdR4E=;
 b=ywJu71qnIbYkjhF98mzxfRxhaoEBOwjqir0hTM2LWaC4B3NT6ElozGGl+WHGDzLqo0
 FG+yi0upGrwxXslkB5o1HIONCqfr1WR38pbLWDKSkwBdktAffMhViFU0CNS+G4/BSOdR
 KvUd7Nit0TwBvhTexIczuStP5TGwNNJc23XNwI/sFJhOOw9bsdQedhliTRK9fKG8Dkrh
 CMGzIFfSkGpCQrWz5uEx9T5SOLvpc6zqvpfh4wB/8dHZNZ/8QtIZ8M58q0UwRXXIy+MB
 whOfI/IEkqR24B7RdJzrmidjrw0IbZTrnZhfSFBjr4H7zpnIQq0iJZzgBvkXqOq/l9Mp
 jVlA==
X-Gm-Message-State: AOAM531wu/X1ohwlJoMggcdxw5NaOBhhdrs94/tbBHbKatme0dzu+T8A
 uT4Ae/XEq3ye4y0LgrrIual8hhZvAbE=
X-Google-Smtp-Source: ABdhPJzHZxho9nvyGkJD2+MRytyezxHB3W1phcxSUhizLFJLX1GMn0UYieibwMYvzgKk0al1IAvL+A==
X-Received: by 2002:a05:6e02:921:: with SMTP id
 o1mr22503303ilt.289.1632285811013; 
 Tue, 21 Sep 2021 21:43:31 -0700 (PDT)
Received: from james-x399.localdomain (71-33-146-72.hlrn.qwest.net.
 [71.33.146.72])
 by smtp.gmail.com with ESMTPSA id n17sm487058ilj.57.2021.09.21.21.43.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 21:43:30 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Sep 2021 22:43:28 -0600
Message-Id: <20210922044328.206882-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-argon2-cffi: bump to version
 21.1.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-argon2-cffi/python-argon2-cffi.hash | 6 +++---
 package/python-argon2-cffi/python-argon2-cffi.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-argon2-cffi/python-argon2-cffi.hash b/package/python-argon2-cffi/python-argon2-cffi.hash
index 730a9b6c44..6c416ffd88 100644
--- a/package/python-argon2-cffi/python-argon2-cffi.hash
+++ b/package/python-argon2-cffi/python-argon2-cffi.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/argon2_cffi/json
-md5  e49ccb29351387fd853f31bf19b67f59  argon2-cffi-20.1.0.tar.gz
-sha256  d8029b2d3e4b4cea770e9e5a0104dd8fa185c1724a0f01528ae4826a6d25f97d  argon2-cffi-20.1.0.tar.gz
+# md5, sha256 from https://pypi.org/pypi/argon2-cffi/json
+md5  f33bc18f2c2438f685ba1f0bbd2b86a4  argon2-cffi-21.1.0.tar.gz
+sha256  f710b61103d1a1f692ca3ecbd1373e28aa5e545ac625ba067ff2feca1b2bb870  argon2-cffi-21.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  bf659a28b49240602f56bbdf490cbe2ec509b15b98f99d7b19a52c740e327863  LICENSE
diff --git a/package/python-argon2-cffi/python-argon2-cffi.mk b/package/python-argon2-cffi/python-argon2-cffi.mk
index 674e089eb7..f01c940589 100644
--- a/package/python-argon2-cffi/python-argon2-cffi.mk
+++ b/package/python-argon2-cffi/python-argon2-cffi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ARGON2_CFFI_VERSION = 20.1.0
+PYTHON_ARGON2_CFFI_VERSION = 21.1.0
 PYTHON_ARGON2_CFFI_SOURCE = argon2-cffi-$(PYTHON_ARGON2_CFFI_VERSION).tar.gz
-PYTHON_ARGON2_CFFI_SITE = https://files.pythonhosted.org/packages/74/fd/d78e003a79c453e8454197092fce9d1c6099445b7e7da0b04eb4fe1dbab7
+PYTHON_ARGON2_CFFI_SITE = https://files.pythonhosted.org/packages/7b/39/a26aaef5c3f0c6cfd67c80599b5b40a794fdab46f4ee3be925d71e2f9596
 PYTHON_ARGON2_CFFI_SETUP_TYPE = setuptools
 PYTHON_ARGON2_CFFI_LICENSE = MIT
 PYTHON_ARGON2_CFFI_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
