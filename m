Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0D0C4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 19:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 30B18403A9;
	Wed,  2 Nov 2022 19:24:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30B18403A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QCRfD7dzHnVa; Wed,  2 Nov 2022 19:24:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 62DF94014E;
	Wed,  2 Nov 2022 19:24:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62DF94014E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 142F51BF3E1
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 19:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0013409A5
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 19:24:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0013409A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qIh8XJOgkHZs for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 19:24:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D663940977
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D663940977
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 19:24:29 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id e189so5066808iof.1
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 12:24:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sfhBlak4TSaVu3tAOrtxCTmWLBk/mH9jR9dQxUCCfY0=;
 b=cR0w7CabsaAkVAL5g3g984NR8IKb37HosRbxCdIqNYLcKS0Y4To1idP/7xIaP1CKGV
 lzlBQbaJTn7qlvGQJDbpHiw1kU1QQXmHPBV6KCiAgeIFvEXP7twlAmv6j+D4F3rNiYJa
 2cqE16KQWyfrnfmUYeN8vhNbtFIQSWd3eKP8YckNo+BJK3GX0QdTyfjzsQz6lTjvsRxJ
 RhjvqRXWsBbfpDfygqyOPN0GJw3tB/dYYZBhE0QmgwVSiMfk3bU4PNlHsgUyVvf08HJs
 xUFnzRwddGmvJh9EQm3133RBFxURQF7ZF/Y7EMlBlWeUqUhS94SZ3xC3g+1jYsQliG6X
 pyQw==
X-Gm-Message-State: ACrzQf3I1yO1AOpgEMwzyls5nCsayM05UEG/iU/LjiSf3mLb+Lxe93qG
 tksZLra98EaignhLnfEVzMDM7rv5YUrTGQ==
X-Google-Smtp-Source: AMsMyM7w1nDbhXftio7hKIGC3vArBILZGnZZOkOXru6UKSYnvj8XD6JqHFQnzeq4clw2j4LelV1HPw==
X-Received: by 2002:a02:cbcb:0:b0:375:60dd:79a5 with SMTP id
 u11-20020a02cbcb000000b0037560dd79a5mr11053817jaq.150.1667417068445; 
 Wed, 02 Nov 2022 12:24:28 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 m2-20020a02a142000000b0036cc14af7adsm5157659jah.149.2022.11.02.12.24.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 12:24:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 13:24:25 -0600
Message-Id: <20221102192425.3919394-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sfhBlak4TSaVu3tAOrtxCTmWLBk/mH9jR9dQxUCCfY0=;
 b=myaZDx+2CVeCplscbQcpNrWzjGRaOoBOFKjgIr1tkP8oGg+9R8NG0Gz0PB//Xgvsx5
 XKubjkzaufb9rDp8XQSLx8b0OuI81gv26saJagYufMpkEzuq9GM1pKENBHvTudCd8oaT
 bi+rlU17dnJWcC2ZOHNWk/X+wco4uqXKKWbUqWI31Hn8DCAm4t5v0cHmRdpdeqAiVqmV
 dx8K1ax36CwfMcXxRmzF3PQcYhb99QCfrB5G+XIhx6rH8p95NmHyHGsEM/00LTfQ0MZg
 FlTaWy5CJmlc0koMVXvZMevL29tmsHsXge9kYGc5W2hhD7fk2V2ZeI3KQB/xgMjAbkSC
 EbSg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=myaZDx+2
Subject: [Buildroot] [PATCH 1/1] package/python-colorama: bump to version
 0.4.6
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Matt Weber <matthew.weber@collins.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Migrate to hatchling pep517 build backend.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-colorama/python-colorama.hash | 4 ++--
 package/python-colorama/python-colorama.mk   | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-colorama/python-colorama.hash b/package/python-colorama/python-colorama.hash
index e975a66363..aba1be3eba 100644
--- a/package/python-colorama/python-colorama.hash
+++ b/package/python-colorama/python-colorama.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/colorama/json
-md5  57b22f2597f63df051b69906fbf310cc  colorama-0.4.4.tar.gz
-sha256  5941b2b48a20143d2267e95b1c2a7603ce057ee39fd88e7329b0c292aa16869b  colorama-0.4.4.tar.gz
+md5  11fe1cbf8299798551ac88f824ea11c4  colorama-0.4.6.tar.gz
+sha256  08695f5cb7ed6e0531a20572697297273c47b8cae5a63ffc6d6ed5c201be6e44  colorama-0.4.6.tar.gz
 # Locally computed sha256 checksums
 sha256  cac35c02686e5d04a5a7140bfb3b36e73aed496656e891102e428886d7930318  LICENSE.txt
diff --git a/package/python-colorama/python-colorama.mk b/package/python-colorama/python-colorama.mk
index d3d29a63e9..d633e00602 100644
--- a/package/python-colorama/python-colorama.mk
+++ b/package/python-colorama/python-colorama.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_COLORAMA_VERSION = 0.4.4
+PYTHON_COLORAMA_VERSION = 0.4.6
 PYTHON_COLORAMA_SOURCE = colorama-$(PYTHON_COLORAMA_VERSION).tar.gz
-PYTHON_COLORAMA_SITE = https://files.pythonhosted.org/packages/1f/bb/5d3246097ab77fa083a61bd8d3d527b7ae063c7d8e8671b1cf8c4ec10cbe
-PYTHON_COLORAMA_SETUP_TYPE = setuptools
+PYTHON_COLORAMA_SITE = https://files.pythonhosted.org/packages/d8/53/6f443c9a4a8358a93a6792e2acffb9d9d5cb0a5cfd8802644b7b1c9a02e4
+PYTHON_COLORAMA_SETUP_TYPE = pep517
 PYTHON_COLORAMA_LICENSE = BSD-3-Clause
 PYTHON_COLORAMA_LICENSE_FILES = LICENSE.txt
+PYTHON_COLORAMA_DEPENDENCIES = host-python-hatchling
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
