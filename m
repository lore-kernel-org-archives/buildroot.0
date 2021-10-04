Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19EC6C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 17:13:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5525E6139F
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 17:13:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5525E6139F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED43483B34;
	Mon,  4 Oct 2021 17:13:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zmXher_IfrDW; Mon,  4 Oct 2021 17:13:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 453B183B33;
	Mon,  4 Oct 2021 17:13:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B452D1BF308
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 17:13:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A264740018
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 17:13:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9VhmuLM4PueR for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 17:13:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 31D4440017
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 17:13:49 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id k7so31894728wrd.13
 for <buildroot@buildroot.org>; Mon, 04 Oct 2021 10:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KRBQ+KOfJiJBDUO9Qi0Q1N9KFz8SxfW4ofhQKquYyVw=;
 b=IPQEIiiKv/qQiWVPQpse0lL1AytGtYMIXAiNatnr8OdyZYzDGq6SLsmLbfpfyywWbL
 Or2uu417Bo6HPBnX8yZ8DhexxgR3JlGJpsReBnnUcxqywvKHRhg3+N+Bl05A/6StBz96
 Y1uxJ3NH/xW22cNiPXtXlk4Gsi9XAho2GP+SU4L7ccF7RzYEMb7FmKhduEoaR3LH1VKX
 6XxCndQ5N6h8pyE7PlxiHZtoB4gjX56qqEIRplipybBfbiXNUXOGZcG5v/B79Oim8TcM
 U+MVzq+gm0Taai2cnuBeuPaS/WuVFbLvqJ9bX8A6r1ZPqD4tG2z5BM7dZRHs6cwOc3UL
 bw+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KRBQ+KOfJiJBDUO9Qi0Q1N9KFz8SxfW4ofhQKquYyVw=;
 b=uZ8YWAriZxRbVJq1J3utcQqwcO8c9Dj5d8ntJGBPJDWvlHG/KrJbIBtwtbu9Njzka9
 TUfGK3Tn86aXOKTLVel1iNNrODqs75J0BMuFp7E9NzAM979MgNbyMyqb18zCIQSYzArX
 YDlc6rIQyXZrrLcyeD/HH9JDHfO3BW3wfJJUaKyxckOCPLV3UZn1zHfdOZWFeVivmoQM
 X5XxFMvq3ldycGSVPx0Bd6k3ANx99lXEFk3SIV0pQd8AMe28jLLXdwsZSU6j+5HDHDbn
 RCMjrQeR4JkBicv6/KQVipmdDFUrRS9gAvg/hsKLe9XMsVwDXlM/dEOJM/n2QMpn/B6d
 A2NA==
X-Gm-Message-State: AOAM533OtukApiKeUFA0N9bmb4togZMDz5/k9YLqQxd3faYmTc1Va8c6
 GJ6aOMbwE1mdSspUIR+n3PZHcS103ao=
X-Google-Smtp-Source: ABdhPJxO3sd12f0VMcI3z/XFZD5LOkbyvc0SCUVpfBBVxucKRqdmy2oIlVsPBrrLbppdQaf5hqvidg==
X-Received: by 2002:a5d:5250:: with SMTP id k16mr2996496wrc.82.1633367627214; 
 Mon, 04 Oct 2021 10:13:47 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:576:abe5:6aef:aec6])
 by smtp.gmail.com with ESMTPSA id i92sm14669053wri.28.2021.10.04.10.13.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 10:13:46 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  4 Oct 2021 20:13:38 +0300
Message-Id: <20211004171341.19564-1-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-filelock: bump to version
 3.3.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The package doesn't support python2 anymore.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-filelock/Config.in            | 1 +
 package/python-filelock/python-filelock.hash | 4 ++--
 package/python-filelock/python-filelock.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-filelock/Config.in b/package/python-filelock/Config.in
index 57ec039400..bda4582ac1 100644
--- a/package/python-filelock/Config.in
+++ b/package/python-filelock/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_FILELOCK
 	bool "python-filelock"
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  A platform independent file lock.
 
diff --git a/package/python-filelock/python-filelock.hash b/package/python-filelock/python-filelock.hash
index d50d2d561c..d7cc864668 100644
--- a/package/python-filelock/python-filelock.hash
+++ b/package/python-filelock/python-filelock.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/filelock/json
-md5  c1fe6d9a7433a7ca6ce4f36e273317d1  filelock-3.0.12.tar.gz
-sha256  18d82244ee114f543149c66a6e0c14e9c4f8a1044b5cdaadd0f82159d6a6ff59  filelock-3.0.12.tar.gz
+md5  f8458b5235a9e439fd512dc08947f6b2  filelock-3.3.0.tar.gz
+sha256  8c7eab13dc442dc249e95158bcc12dec724465919bdc9831fdbf0660f03d1785  filelock-3.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  88d9b4eb60579c191ec391ca04c16130572d7eedc4a86daa58bf28c6e14c9bcd  LICENSE
diff --git a/package/python-filelock/python-filelock.mk b/package/python-filelock/python-filelock.mk
index 35b3374d29..00c32b2caa 100644
--- a/package/python-filelock/python-filelock.mk
+++ b/package/python-filelock/python-filelock.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FILELOCK_VERSION = 3.0.12
+PYTHON_FILELOCK_VERSION = 3.3.0
 PYTHON_FILELOCK_SOURCE = filelock-$(PYTHON_FILELOCK_VERSION).tar.gz
-PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/14/ec/6ee2168387ce0154632f856d5cc5592328e9cf93127c5c9aeca92c8c16cb
+PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/fd/6e/665a6cb363bee26e40954ee812e4e733fd7cafd84c06e0c7c2357641abd6
 PYTHON_FILELOCK_SETUP_TYPE = setuptools
 PYTHON_FILELOCK_LICENSE = Public Domain
 PYTHON_FILELOCK_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
