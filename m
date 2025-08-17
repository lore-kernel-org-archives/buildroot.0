Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F99DCA0EE4
	for <buildroot@archiver.kernel.org>; Sun, 17 Aug 2025 09:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B60948440F;
	Sun, 17 Aug 2025 09:31:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nrd61UQ8YN6h; Sun, 17 Aug 2025 09:31:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B17018440C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B17018440C;
	Sun, 17 Aug 2025 09:31:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A432375
 for <buildroot@buildroot.org>; Sun, 17 Aug 2025 09:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9608E41155
 for <buildroot@buildroot.org>; Sun, 17 Aug 2025 09:31:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qyX34JQ7LVV7 for <buildroot@buildroot.org>;
 Sun, 17 Aug 2025 09:31:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 23B6141154
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23B6141154
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 23B6141154
 for <buildroot@buildroot.org>; Sun, 17 Aug 2025 09:31:21 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-afcb78f5df4so535951166b.1
 for <buildroot@buildroot.org>; Sun, 17 Aug 2025 02:31:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755423079; x=1756027879;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6e9328WS6kLSK5mOKJvmBb/DaZuOd3ATlT6WCwhSLBU=;
 b=NxuHyl/Rclwwjw2Us21A0otgdtl37PyHc0ahHyMzlGLTNah6lQS8bBE7V114YUR7AZ
 QkP538vixXohvIg3m/P/eJuUaYtg3/dUNFIfxqBSJJgCPTVu4xOZ2VugHdsuFQ/1rE3S
 ZnDepQoj0QJX1Jg54TDfhXNYtrF1r/C/FS78Bl37UH48ZG9b0YhnDgWvOLZtPJuff2an
 FjTKGL07wxa8QHxzY5fqyTbyzsZ+kUhaNLFpjpdzSBPGWhZpqY+hDRVjbyh4tKPcu3pG
 RNI/N2HsukxMoFRyqappCSXLzNyYNQ4AKV+8m1G4n1Z/abmjCX/wylYaYimmCioWi97m
 QiTg==
X-Gm-Message-State: AOJu0YyPdRpcsNvdvy+rJmRgr8bDBZ3+1m5p6etF+pHxISod+SEvB+Hr
 yFeCJUekZRsHVaL2j56RjVJ9izGF2ZCLgQln0KmGQG0NsCEeQMvOoIHYZkN0GGYBH+xDgPyhqYv
 6TxKfRMg=
X-Gm-Gg: ASbGncunL/v03B7wsF8nnotOF0fAo2u4wimwncX1ml4E7RDJi/miOXlS4EiaUafq6WB
 51gktTZhyV+GrVygS2/eauGj8VY40ycMljfypSIRsh7HZNjcbK8xb/4B1fSPt3qtPf0nRgye+de
 sHSP3hDHW4qc8MdpjiI5V9bcWhYuM9ApTxTiLa1zMqcjnAeTuxB1f//uucbQjg4x//Aoi7g5Jfy
 xJUp9HaeRZNSuLdbJBelrKehp2gnV8ugwXQd8z8Bx+w9/CV4JMHhjZ1GgFYfKSSAVGBSqDlJ9q5
 DsIBpe02nhyVm/nfdfgJHqUIb0tk2/yWSqQtS+cPhqhJ2OzPZjrH8Ko11kn2dB0iBd2wpVOtFvp
 5xL8C3EtNpbFoyg==
X-Google-Smtp-Source: AGHT+IGP6RpZ3RhsCq2y1jtErguVhZKxB455rucMSk4PMA7P7F9FMofgA6ou8Z4KI/NLFHy90iLMNw==
X-Received: by 2002:a17:907:e989:b0:af2:42e8:ad9f with SMTP id
 a640c23a62f3a-afcdc2d9735mr660003066b.39.1755423079008; 
 Sun, 17 Aug 2025 02:31:19 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdce72dbdsm578025866b.43.2025.08.17.02.31.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Aug 2025 02:31:18 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 17 Aug 2025 11:31:18 +0200
Message-ID: <20250817093118.3455688-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755423079; x=1756027879; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6e9328WS6kLSK5mOKJvmBb/DaZuOd3ATlT6WCwhSLBU=;
 b=YNCh8eOjEYVJUPssNaEMwvhYP+A2DNc7BSCftQTHLw81FR0g2ohvgyAbJOW97MkXNr
 Ragv4ef52BZFEMFgqXy++HJStX2nLdszriYrEQp94LmIbXYmQaWvq7cGx+IM449eV04c
 V1YDJ7UHgdxg32xvV5jRMXc9nPqjpEvCdZ6r5E8tWVxzGDewNPdLLfcxRu50KHjwMo+h
 Bjn1yJZjuOvt+I65mYDZTewijPe5ex0eJa3/J9IQqnNzzY7ptb2YCpbBJhU6qSt2B4pC
 W6oTSAWJXc4+XAhVTeu7PExu/J89UhpJCAX7mhb0URm66hzZaYdqVqItmDwI1PcRH0G9
 005Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=YNCh8eOj
Subject: [Buildroot] [PATCH v2] python-yarl: bump to v1.20.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the python-cython bump to v3.1.2 (see [1]), python-yarl has been
failing on the autobuilder with the following error message:

```
ERROR Missing dependencies:
	Cython~=3.0.0; python_version >= "3.12"
make: *** [package/pkg-generic.mk:273: /home/buildroot/instance-0/output-1/build/python-yarl-1.18.3/.stamp_built] Error 1
```

The cython dependency has been addressed in python-yarl v1.20.1, for
more information see the github issue [2].

For more information on the release, see:

  - https://github.com/aio-libs/yarl/releases/tag/v1.19.0
  - https://github.com/aio-libs/yarl/releases/tag/v1.20.0
  - https://github.com/aio-libs/yarl/releases/tag/v1.20.1

[1] b536caaec0 package/python-cython: bump to version 3.1.2
[2] https://github.com/aio-libs/yarl/pull/1514

Fixes: https://autobuild.buildroot.org/results/d36/d367b69b85a65fa94e923ecff3ba03723b2a6e88
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-yarl/python-yarl.hash | 4 ++--
 package/python-yarl/python-yarl.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-yarl/python-yarl.hash b/package/python-yarl/python-yarl.hash
index ca2d42bf58..43ba31f81f 100644
--- a/package/python-yarl/python-yarl.hash
+++ b/package/python-yarl/python-yarl.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/yarl/json
-md5  80b89d2b28be7345a38f099b2f839d7d  yarl-1.18.3.tar.gz
-sha256  ac1801c45cbf77b6c99242eeff4fffb5e4e73a800b5c4ad4fc0be5def634d2e1  yarl-1.18.3.tar.gz
+md5  23352fbc2b165825d4a33682c91788bc  yarl-1.20.1.tar.gz
+sha256  d017a4997ee50c91fd5466cef416231bb82177b93b029906cefc542ce14c35ac  yarl-1.20.1.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-yarl/python-yarl.mk b/package/python-yarl/python-yarl.mk
index 160dec8a1b..4f25394c8b 100644
--- a/package/python-yarl/python-yarl.mk
+++ b/package/python-yarl/python-yarl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_YARL_VERSION = 1.18.3
+PYTHON_YARL_VERSION = 1.20.1
 PYTHON_YARL_SOURCE = yarl-$(PYTHON_YARL_VERSION).tar.gz
-PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/b7/9d/4b94a8e6d2b51b599516a5cb88e5bc99b4d8d4583e468057eaa29d5f0918
+PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/3c/fb/efaa23fa4e45537b827620f04cf8f3cd658b76642205162e072703a5b963
 PYTHON_YARL_LICENSE = Apache-2.0
 PYTHON_YARL_LICENSE_FILES = LICENSE
 PYTHON_YARL_SETUP_TYPE = setuptools
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
