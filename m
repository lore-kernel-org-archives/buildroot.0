Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27FE0C4707B
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 04:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC79082B84;
	Thu, 11 Jan 2024 04:11:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC79082B84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NqKIFlpZyUEk; Thu, 11 Jan 2024 04:11:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 226C283E45;
	Thu, 11 Jan 2024 04:11:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 226C283E45
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DDDFC1BF380
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 04:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0E0A83E45
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 04:11:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0E0A83E45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AEidAeSQtdhU for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 04:11:54 +0000 (UTC)
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DBC1282B84
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 04:11:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBC1282B84
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-7bef44df5c6so44067039f.0
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:11:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704946312; x=1705551112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zwvbA+smG6xuIrtQS8g9iqMth/z7HqEXqUyh6oe/i7A=;
 b=RJyM3sULFzfQ/gLr4dyqjAGqhgvXHEfdRrIm1ngqX+I66A7r8FYCzW8qTAAf6wGzoa
 enQfsbKWoG29FpLtFlULthG22lJ8Nit5Rjr9iDUVhMBqHqlUALib2H3MorZVoPxlQMFi
 iAOXf3UAq0qP3Pfg7yEFzHAYkkUx9upWfvDRKynqe/UOWpM/GYLijF4jpuCoPop5cUtg
 Nk5OseheinnYn+OMzFYMjid3h1aujW4ignsi98RJoskVmvv5P6WocYk6k3GawXz/aatM
 8hE6OmGQMgiZepF8H3tHAWagFjaW+hw/CYbc/Ref5KU3/5LJD5CovvtVmyBvFqW4TvUn
 MP3w==
X-Gm-Message-State: AOJu0Yyyxu411GIPeULOFFN3fOVHcBJtkdeswh6sz6w010WmLh17f6xt
 g6ObCnOqIQRkUzqYUGSiLTN4oihPbs/qXg==
X-Google-Smtp-Source: AGHT+IEUVBBPFRYGhY08fvHiAXGmqq/DQf1fbvefpN3B3xG56qGzIg2nnrOm0glO1JvBsPtig1Xa+w==
X-Received: by 2002:a05:6e02:b2b:b0:360:8c30:e6a with SMTP id
 e11-20020a056e020b2b00b003608c300e6amr112087ilu.33.1704946312457; 
 Wed, 10 Jan 2024 20:11:52 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 f5-20020a056638118500b0046b703f1cfasm83183jas.98.2024.01.10.20.11.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 20:11:52 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 21:11:50 -0700
Message-Id: <20240111041150.2704233-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704946312; x=1705551112; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zwvbA+smG6xuIrtQS8g9iqMth/z7HqEXqUyh6oe/i7A=;
 b=dQgUne/6OUx1q2E/OeD0ZkNAA5vkmfDjPROVegHLbqbSYX1qORRFeE0sX40CtYl0QA
 lUEHZ3x1kY2nju6Ql9M+tgynQHUvFkYnub2PQEKFBDDbddlsZFs6R6Op3tGglxvg/LK8
 sE46lb07+yH4I9yV47NsgGyppWhfWvOV2wJizpLPnXPV9vz/iv4/vewnhX3M4AKrgef7
 kaYft9qc/MEnNyojnNITzyS9dyEMlqm8WeqvyCtKi0eXW8a7+/1C7Gq6BWLPVi0IpGZW
 DWbAd/rDpDATjcVdJuR9TNL9hrXfyLZEusIDyWyoo6JOsoyT/k5Ey2MRgUbOIbIdp4+U
 8aFA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dQgUne/6
Subject: [Buildroot] [PATCH 1/1] package/python-pytz: bump to version
 2023.3.post1
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
 package/python-pytz/python-pytz.hash | 4 ++--
 package/python-pytz/python-pytz.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytz/python-pytz.hash b/package/python-pytz/python-pytz.hash
index 861f9d6f35..be6f0e976b 100644
--- a/package/python-pytz/python-pytz.hash
+++ b/package/python-pytz/python-pytz.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytz/json
-md5  fe54c8f8a1544b4e78b523b264ab071b  pytz-2023.3.tar.gz
-sha256  1d8ce29db189191fb55338ee6d0387d82ab59f3d00eac103412d64e0ebd0c588  pytz-2023.3.tar.gz
+md5  84e6569fcc917b096cca1063819c4ab0  pytz-2023.3.post1.tar.gz
+sha256  7b4fddbeb94a1eba4b557da24f19fdf9db575192544270a9101d8509f9f43d7b  pytz-2023.3.post1.tar.gz
 # Locally computed sha256 checksums
 sha256  be8b1a37ebe26c592a90f6c0eb33103a7f383ce2f4d7498c0af9a526990a07b8  LICENSE.txt
diff --git a/package/python-pytz/python-pytz.mk b/package/python-pytz/python-pytz.mk
index 4754efe41a..182d8156fc 100644
--- a/package/python-pytz/python-pytz.mk
+++ b/package/python-pytz/python-pytz.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTZ_VERSION = 2023.3
+PYTHON_PYTZ_VERSION = 2023.3.post1
 PYTHON_PYTZ_SOURCE = pytz-$(PYTHON_PYTZ_VERSION).tar.gz
-PYTHON_PYTZ_SITE = https://files.pythonhosted.org/packages/5e/32/12032aa8c673ee16707a9b6cdda2b09c0089131f35af55d443b6a9c69c1d
+PYTHON_PYTZ_SITE = https://files.pythonhosted.org/packages/69/4f/7bf883f12ad496ecc9514cd9e267b29a68b3e9629661a2bbc24f80eff168
 PYTHON_PYTZ_SETUP_TYPE = setuptools
 PYTHON_PYTZ_LICENSE = MIT
 PYTHON_PYTZ_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
