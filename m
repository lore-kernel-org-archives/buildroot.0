Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA087C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 19:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63B3F404A0;
	Sat, 10 Dec 2022 19:36:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63B3F404A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gEEzx46MBQUi; Sat, 10 Dec 2022 19:36:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F63640239;
	Sat, 10 Dec 2022 19:36:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F63640239
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 752CD1BF59C
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 19:36:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D7DC400B8
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 19:36:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D7DC400B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XiDesu9sGSHF for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 19:36:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7587640239
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7587640239
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 19:36:08 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id y4so2195240iof.0
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 11:36:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dfSuhPOGbMj2OWY/ULuf1ewQKTo+acn5ll9cSJAo1qc=;
 b=4mOGMIPR/T0ZT4HgruLDplEiT32n2UAPOesBpv9WXvdFcpaRB2r0uj38Xf0PcbRmqf
 QT+REVsNVME/2mGDP+d3nUoQRosvU3k1DlyywLETgbD5T6dVkcVfLjj1aHD1nRvOx5fz
 /1EiyLf13nJdewzle9OPMK3AFGxnDcSvmFoV02dXi4ywtkmMZxqygCBDfBWfIcq7Uz/a
 VhvjuR2Vq2zoOYBme1kyboaLr4M0PsG34xQpD68swNC7R84WrBBOtSLrowRZnOPUxIRm
 LHq5m9PeD5PXEI6ejhtIMwQw7nAKs/fXOc+/93I69SwklFRaU2ysZprwSk0PNzP0+pLU
 KikQ==
X-Gm-Message-State: ANoB5plI2DIxcnWH8Xw9wNRe0Mq3bmVyvok1h2yTIuRJcE+06gEVEIKZ
 2h3eb5S6tqGv/meFK7S8Tk6HIagbbUXfIMA+
X-Google-Smtp-Source: AA0mqf5uy3zOK9UvaggI/us5n/io4m+rX9sI+HCKeE5uEWr6IiftrtIo/sGO8Otj32nuvO1u9BPHeQ==
X-Received: by 2002:a5d:9f18:0:b0:6c9:81fc:6f78 with SMTP id
 q24-20020a5d9f18000000b006c981fc6f78mr6065449iot.6.1670700967390; 
 Sat, 10 Dec 2022 11:36:07 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 cb12-20020a0566381b0c00b003740de9fb65sm1665058jab.46.2022.12.10.11.36.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 11:36:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 12:36:05 -0700
Message-Id: <20221210193605.3146912-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dfSuhPOGbMj2OWY/ULuf1ewQKTo+acn5ll9cSJAo1qc=;
 b=hotSqLK4xuONskNTbMKp+CHFzvJS3b28wXRPfQXHZQKPjSGDZHzhiY/2Jl2Y+amNlj
 bsC4y9r4LP0+zmC2kL7840/7W68gNRZ7pZYX0iVfUUvgxofCN8CQqjW7cBE9brb4Un03
 EPwwhldhh2ljEgBNTXfC7Q+VclvuwOHIRqk+KX51xIuIVhAbXjxtYPoMGyy5/rJMlgS5
 twNobZEJzuKBU3vcb3t4gHmCvCAjaaWQO4q9Hcnp8ohNy6DQG0zQbM4g+O3zNk2R5xgi
 76Z5CAwn0jG5DTn8Mg2fFvDh8gt4SFm2sIbcpEAk/meWf7uE6HRZER2LOgXKPorqdfBA
 ufFA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=hotSqLK4
Subject: [Buildroot] [PATCH 1/1] package/python-pudb: bump to version
 2022.1.3
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
 package/python-pudb/python-pudb.hash | 4 ++--
 package/python-pudb/python-pudb.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pudb/python-pudb.hash b/package/python-pudb/python-pudb.hash
index d9943a3601..1ae15ad8a6 100644
--- a/package/python-pudb/python-pudb.hash
+++ b/package/python-pudb/python-pudb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pudb/json
-md5  c2b4275b76068f18d630f7bae889345b  pudb-2022.1.2.tar.gz
-sha256  6b83ab805bddb53710109690a2237e98bf83c0b3a00033c517cdf5f6a8fa470d  pudb-2022.1.2.tar.gz
+md5  cda1c28dc52318162e2b131280f09960  pudb-2022.1.3.tar.gz
+sha256  58e83ada9e19ffe92c1fdc78ae5458ef91aeb892a5b8f0e7379e6fa61e0e664a  pudb-2022.1.3.tar.gz
 # Locally computed sha256 checksums
 sha256  a95343fffff49cde3d9bf33cf6bb71cb3bf0ed83f47d98a7ba04b175d29c79ab  LICENSE
diff --git a/package/python-pudb/python-pudb.mk b/package/python-pudb/python-pudb.mk
index 7df38f0f02..a357c34c44 100644
--- a/package/python-pudb/python-pudb.mk
+++ b/package/python-pudb/python-pudb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PUDB_VERSION = 2022.1.2
+PYTHON_PUDB_VERSION = 2022.1.3
 PYTHON_PUDB_SOURCE = pudb-$(PYTHON_PUDB_VERSION).tar.gz
-PYTHON_PUDB_SITE = https://files.pythonhosted.org/packages/8b/ef/6dea7c63fdddd7753e2a2930e59799ef32247f2499c0d9bcd233439e7483
+PYTHON_PUDB_SITE = https://files.pythonhosted.org/packages/85/a5/f1fd378f56bd8168b5921fd09d4b84fd8101a90e81402a509796caea2094
 PYTHON_PUDB_SETUP_TYPE = setuptools
 PYTHON_PUDB_LICENSE = MIT
 PYTHON_PUDB_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
