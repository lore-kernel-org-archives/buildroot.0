Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27423C4707B
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 07:14:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A374B40549;
	Thu, 11 Jan 2024 07:14:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A374B40549
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E-L1B_5_1dfS; Thu, 11 Jan 2024 07:14:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9113040164;
	Thu, 11 Jan 2024 07:14:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9113040164
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B4DFB1BF3CB
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 07:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89AF342142
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 07:13:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89AF342142
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4rpghwPFeHhj for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 07:13:57 +0000 (UTC)
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6581741E56
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 07:13:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6581741E56
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-7bee3761bb4so105557239f.0
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 23:13:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704957236; x=1705562036;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uIHNqWB3IUbFPvDliMgegX6hGPYT0w1ahLwH054oT/o=;
 b=eHnTj7TaTIdaDHZzA+Bt3Xo2tUi0oBkAsEzv2HHRcZjpebNfXxg3YB40RDk2Bu4QV+
 bBnmit8gYv0S3rt2Kb7zPXImT+e4WwnYzy7kVRNf0dcp+GCkl0StQ/l5OI/fh9CShIdf
 pGS6r9tTlXzb2O/n6swLkDW2TcFfSRCM+aJ4j2D3Muivrmwv97xMVWUcqhw7blzr9zbp
 Na1hB6kBDCWBJcauajqjXhvuVdtHWG9cYeeG2ESzic5AftEWb8Y5u83dBSuV4tdbgvqi
 28xJkR+n72sJhy1OaR4FnfZI6Gpcu7L/HnUTHVMlF/IvwVcr9ZTx8HF/vYV3oNd2QfQW
 n9xQ==
X-Gm-Message-State: AOJu0YzyUw6ate3/+JUsB3EX/4KeVB2RAFiG6uosjevHXgINflaijMfc
 AYA+I5e4sN0ePLeGMyEYxCg8f/E4Q2fC/w==
X-Google-Smtp-Source: AGHT+IEADmm2+OlKBYP8Tou4ocCF9zfEba3fOFCKlUlXQRO8b7vpIkQuBi6hQhbrgXwngUUz5wbiTw==
X-Received: by 2002:a5d:91c4:0:b0:7b4:28f8:519 with SMTP id
 k4-20020a5d91c4000000b007b428f80519mr924389ior.25.1704957236046; 
 Wed, 10 Jan 2024 23:13:56 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 bi4-20020a05663819c400b0046e349fcc08sm160423jab.10.2024.01.10.23.13.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 23:13:55 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 11 Jan 2024 00:13:54 -0700
Message-Id: <20240111071354.3071382-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704957236; x=1705562036; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uIHNqWB3IUbFPvDliMgegX6hGPYT0w1ahLwH054oT/o=;
 b=j3zaQaHheMsWveq1zE0ytLgvOrxAPmm701CswdJ4HDI3mANHtYgTQwKmEQvsi6O8Ja
 nB1lPc4V8VCtszeBqbWfmWK1r43ZTJ0rToaBLorlugjcq2KUZfHVoz0rT8TqGto1O8Pn
 uWOuoRp8p4te8ECioj2zimaM5C84Uu8me8vDkcH44JsxPAHZWhxk2/BnZFvryUG/7Ybm
 bzCOPhKR72xVJi13thFZbKvTtiVmZc41cU9j5XwG1+nqiIyjVUYSpfs78lTXbHO0pAmC
 45uKwoV2SFDxKo+89pkm7cdujq8yrC3GbGOSmNgqd0Y+W2TfTvhs4sZQzwwsBz+p+E8/
 N7HQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=j3zaQaHh
Subject: [Buildroot] [PATCH 1/1] package/python-soupsieve: bump to version
 2.5
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

License hash changed due to year update:
https://github.com/facelessuser/soupsieve/commit/1615584814d597ce87d4b4d675250cbe20e3fa30

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-soupsieve/python-soupsieve.hash | 6 +++---
 package/python-soupsieve/python-soupsieve.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-soupsieve/python-soupsieve.hash b/package/python-soupsieve/python-soupsieve.hash
index cf348d441f..278c7d1b0c 100644
--- a/package/python-soupsieve/python-soupsieve.hash
+++ b/package/python-soupsieve/python-soupsieve.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/soupsieve/json
-md5  4c824620563604cbf783de149c8b8889  soupsieve-2.3.2.post1.tar.gz
-sha256  fc53893b3da2c33de295667a0e19f078c14bf86544af307354de5fcf12a3f30d  soupsieve-2.3.2.post1.tar.gz
+md5  88ae72bd970b425692235d17224204e6  soupsieve-2.5.tar.gz
+sha256  5663d5a7b3bfaeee0bc4372e7fc48f9cff4940b3eec54a6451cc5299f1097690  soupsieve-2.5.tar.gz
 # Locally computed sha256 checksums
-sha256  bc66234cadd3f6e7aaf7160faf165f3f869ffc8a11b6b0d6c44a2e2a83314dd0  LICENSE.md
+sha256  ceb7b9053b88addffa3102a457302bd840d123925ee9ed9c2ac90cf6548b33bf  LICENSE.md
diff --git a/package/python-soupsieve/python-soupsieve.mk b/package/python-soupsieve/python-soupsieve.mk
index ebf2ada7ac..581df7e787 100644
--- a/package/python-soupsieve/python-soupsieve.mk
+++ b/package/python-soupsieve/python-soupsieve.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SOUPSIEVE_VERSION = 2.3.2.post1
+PYTHON_SOUPSIEVE_VERSION = 2.5
 PYTHON_SOUPSIEVE_SOURCE = soupsieve-$(PYTHON_SOUPSIEVE_VERSION).tar.gz
-PYTHON_SOUPSIEVE_SITE = https://files.pythonhosted.org/packages/f3/03/bac179d539362319b4779a00764e95f7542f4920084163db6b0fd4742d38
+PYTHON_SOUPSIEVE_SITE = https://files.pythonhosted.org/packages/ce/21/952a240de1c196c7e3fbcd4e559681f0419b1280c617db21157a0390717b
 PYTHON_SOUPSIEVE_SETUP_TYPE = pep517
 PYTHON_SOUPSIEVE_LICENSE = MIT
 PYTHON_SOUPSIEVE_LICENSE_FILES = LICENSE.md
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
