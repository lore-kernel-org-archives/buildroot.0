Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECFFAC4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 19:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F50660B3B;
	Sat, 10 Dec 2022 19:46:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F50660B3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e7USx_Fvk32h; Sat, 10 Dec 2022 19:46:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3D0C60AE7;
	Sat, 10 Dec 2022 19:46:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3D0C60AE7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C350E1BF59C
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 19:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A833460AE7
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 19:46:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A833460AE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Oi7qp24OTXL5 for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 19:46:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE2F260AD1
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BE2F260AD1
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 19:46:49 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id z9so1530620ilu.10
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 11:46:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/6usiBWppoPbHNwkmpouZIRWCXY6O07L6AoRYNuVSR0=;
 b=PK6U8YUEMqAcij6g+W4tzLcDtJXjt1j3jXEhSZxs0gmRzR+rh9ie9IRFe3mCZX6sEa
 pQ2uIJ4OGqwKNACe/Y725xaJtNvhZ2Nvl1pRZW2tdJlAtJmL9Bm8wFxBoeKtJDvz4ulQ
 BGRjVd6KQN+ELKEow8KLe8LsuMYM6pwGLhpNuWBQc3/NOjvC/faRACpkAPpqolwR4WXR
 WiZAXVL2uecgYKcGTFrlg7wA2y4XYlEPLdhGix8HxpSDcdwlrA2yXZbFfzYhkGa6Prtl
 glrNQM0zTR2aILfTljZxG0X4q8LElr+Y5XfktqhUNbva9vWRx81cvjqmg3MFTP0wfGkW
 0Y0Q==
X-Gm-Message-State: ANoB5pk/xkxoxTE7cZT2WYc//5GbNHlZLHnmiwxccXIYzq+/DjJFiJNU
 L0yYeqmc9WTfc1ogbIlvz/h8yw1/L20Y82Hb
X-Google-Smtp-Source: AA0mqf4g/gjg14HVARL/7Jwpc4KItbQyBLF+uKcHW2HnOwK2jKZ0VyxFKLMJdhcOBMZRE+SM2mB5JQ==
X-Received: by 2002:a05:6e02:1a26:b0:303:5f4c:a8f8 with SMTP id
 g6-20020a056e021a2600b003035f4ca8f8mr8705527ile.29.1670701608673; 
 Sat, 10 Dec 2022 11:46:48 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 h2-20020a92c082000000b002f916f15625sm1597769ile.23.2022.12.10.11.46.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 11:46:48 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 12:46:46 -0700
Message-Id: <20221210194646.3215819-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/6usiBWppoPbHNwkmpouZIRWCXY6O07L6AoRYNuVSR0=;
 b=HkhRxzd0xEKI6q8R5uVAPHxRiU6lreOQ59mhGKUJ89dE8cu4r0un2GZmJCRSoXI2HN
 OLXZLuANiP2uxWycGAqsTrZ9p9639uzm5yG/HzCvA4D/Eaao7uNXrOft0/bgmtRdZuir
 pVQjuA0fVVj0QCB5OQee3s81NgGeLr803w571iJ/LsbttttFcyltTidTEu4tvLbcnnXb
 mm5btA9/VMzaG4V7IizYTVZU/w/3dmHNDKIvFZ/LSF6s4wNazTpCfjmbclKEGTcx3e1U
 qXsXNa89Um2Ils4kjaGCGuMdvzb11vv7GkNzNwQiheb+BxzcRoVR/SfzHKLOmdhN4qZk
 GYpQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=HkhRxzd0
Subject: [Buildroot] [PATCH 1/1] package/python-pycryptodomex: bump to
 version 3.16.0
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
 package/python-pycryptodomex/python-pycryptodomex.hash | 4 ++--
 package/python-pycryptodomex/python-pycryptodomex.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycryptodomex/python-pycryptodomex.hash b/package/python-pycryptodomex/python-pycryptodomex.hash
index 97c5e79024..eb011dddb8 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.hash
+++ b/package/python-pycryptodomex/python-pycryptodomex.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pycryptodomex/json
-md5  683580f8f464348397a41ebabb5511a9  pycryptodomex-3.15.0.tar.gz
-sha256  7341f1bb2dadb0d1a0047f34c3a58208a92423cdbd3244d998e4b28df5eac0ed  pycryptodomex-3.15.0.tar.gz
+md5  9d27f03c036c89afd3d66970bb49cd06  pycryptodomex-3.16.0.tar.gz
+sha256  e9ba9d8ed638733c9e95664470b71d624a6def149e2db6cc52c1aca5a6a2df1d  pycryptodomex-3.16.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4e04660d77c1c64e89d79537919fb8240fa21484a7e3db29f358b2c7f84ea073  LICENSE.rst
 sha256  8e563c767164faa0831a333b57d23d4311cf566eb1b15d93250f4606be4eb549  Doc/LEGAL/COPYRIGHT.pycrypto
diff --git a/package/python-pycryptodomex/python-pycryptodomex.mk b/package/python-pycryptodomex/python-pycryptodomex.mk
index 8f22bf3ef2..b566bdd066 100644
--- a/package/python-pycryptodomex/python-pycryptodomex.mk
+++ b/package/python-pycryptodomex/python-pycryptodomex.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCRYPTODOMEX_VERSION = 3.15.0
+PYTHON_PYCRYPTODOMEX_VERSION = 3.16.0
 PYTHON_PYCRYPTODOMEX_SOURCE = pycryptodomex-$(PYTHON_PYCRYPTODOMEX_VERSION).tar.gz
-PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/52/0d/6cc95a83f6961a1ca041798d222240890af79b381e97eda3b9b538dba16f
+PYTHON_PYCRYPTODOMEX_SITE = https://files.pythonhosted.org/packages/5d/22/575c7dd7c86843e07a791cfa2143e7292d6b380f5a7cce966a49b9d6c9f4
 PYTHON_PYCRYPTODOMEX_SETUP_TYPE = setuptools
 PYTHON_PYCRYPTODOMEX_LICENSE = \
 	BSD-2-Clause, \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
