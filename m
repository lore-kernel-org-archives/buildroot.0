Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C799BC35FE7
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 04:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 89430400EF;
	Sun, 15 Sep 2024 04:55:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id utRTAsFM6rzd; Sun, 15 Sep 2024 04:55:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D5B8401A1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D5B8401A1;
	Sun, 15 Sep 2024 04:55:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D0CFB1BF383
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 04:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE8D3401A1
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 04:55:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LSLmBIUadXVs for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 04:55:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::132; helo=mail-il1-x132.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7BC19400EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BC19400EF
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7BC19400EF
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 04:55:36 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id
 e9e14a558f8ab-3a09dd37ceaso862035ab.1
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 21:55:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726376135; x=1726980935;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5SRo2qTeT1TbbmBazJEiw8WZpYRaU03nVikb767lFAU=;
 b=tVEZ6hUmu2drJmQ8tEIradu7HTX7HaxASolGIdhBYHk/aTBoZHFPpXBKy4QY4DqaVS
 DzdK28u/MzPCY0YJcwzMrFksGYWkhZcxXb3ls5E4lGUUJUAfYaiWfRfuKvWGIKEzvVrn
 tvsn73Wc3tCKF5IoZ+b+dKH6rw/ei0zKU7cZaBQ7v1j+f9goTu/Rs91DbizCqF43dIHJ
 fJ9mrbPzE1u4izc3+n1FpadjwYJKX3Usq6a/TRlYfmBIurdH5Fa9gujcoA1h1+YIAyLx
 0GI/SodXRTbQs8jixTeYkyCWsgnGX1qUnX1+9+vnChsuPKk/8uoBvui+OW9dAoZkwrXN
 w2JQ==
X-Gm-Message-State: AOJu0Yz/n2S+WgliWI4IuOd45a2Izc/i3d7YfRc/u+2zGG907JdflCZH
 a9vpTbG/BzkQw6nAJTpV/+rV4m3l4wfKOb7iS9eU1CTkLvVzE49kw9YXIw==
X-Google-Smtp-Source: AGHT+IGexzNfvmumJYa/ZFka5jKAFwu43w+gwpjB2EfHdt0Ev7WXBtRYJXUC+okCntSHUZ9/NzuljA==
X-Received: by 2002:a05:6e02:19cb:b0:39d:1ca5:3904 with SMTP id
 e9e14a558f8ab-3a0849119f0mr113889055ab.14.1726376134895; 
 Sat, 14 Sep 2024 21:55:34 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed571e1sm750973173.161.2024.09.14.21.55.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 21:55:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 22:55:30 -0600
Message-Id: <20240915045530.1405119-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726376135; x=1726980935; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5SRo2qTeT1TbbmBazJEiw8WZpYRaU03nVikb767lFAU=;
 b=CmNU7nepJIxN2SEPZ5qgYuUS7pFFeaVjbvEAwJP0E4JEaeNXCCgukjOH/t6N6gCzbu
 5z4BiNBudpxqAioGFC7BysiiAuoOhjtu5lqQn+lpy8Ld6pkagf/XIDdFRRN3uSII1dfr
 lz3jGGvxJ2b30aRR6tRiyz1XMd5jBdQOzRXbAKzPWQSIvqoVPZcDu4ezs1wEn5/EYDum
 Sl6Hlw47FrZ7MhiWQnGzpkvM5JKrqpmyb7ipwt7QDVSn4T1LdwvLIbJkMEGzErqtj04w
 PlCVSGam+U/QRc74giuFtp6n65IAUNsgZM7FJhkhMrhT2JVGobEumKPd89chkJzjmX8T
 grPw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CmNU7nep
Subject: [Buildroot] [PATCH 1/1] package/python-docutils: bump to version
 0.21.2
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

Python-2.0 license replaced with ZPL-2.1 license:
https://sourceforge.net/p/docutils/code/9398/

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-docutils/python-docutils.hash | 6 +++---
 package/python-docutils/python-docutils.mk   | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-docutils/python-docutils.hash b/package/python-docutils/python-docutils.hash
index 2386cc2891..f79d418efa 100644
--- a/package/python-docutils/python-docutils.hash
+++ b/package/python-docutils/python-docutils.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/docutils/json
-md5  93bcfe0065cf1d0b6a0bcabeca7a2335  docutils-0.20.1.tar.gz
-sha256  f08a4e276c3a1583a86dce3e34aba3fe04d02bba2dd51ed16106244e8a923e3b  docutils-0.20.1.tar.gz
+md5  c4064e1e0e3cd142951fd2b95b830874  docutils-0.21.2.tar.gz
+sha256  3a6b18732edf182daa3cd12775bbb338cf5691468f91eeeb109deff6ebfa986f  docutils-0.21.2.tar.gz
 # Locally computed sha256 checksums
-sha256  a0d7ee761e8d757c0b904518514f98233fd94f2398da3703130d15142ca47a77  COPYING.txt
+sha256  534edf7641abde69fc500f228c09751812c0589815eef0c082bc6ba317d646ac  COPYING.txt
diff --git a/package/python-docutils/python-docutils.mk b/package/python-docutils/python-docutils.mk
index 2b496f0d46..1f1e043c15 100644
--- a/package/python-docutils/python-docutils.mk
+++ b/package/python-docutils/python-docutils.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PYTHON_DOCUTILS_VERSION = 0.20.1
+PYTHON_DOCUTILS_VERSION = 0.21.2
 PYTHON_DOCUTILS_SOURCE = docutils-$(PYTHON_DOCUTILS_VERSION).tar.gz
-PYTHON_DOCUTILS_SITE = https://files.pythonhosted.org/packages/1f/53/a5da4f2c5739cf66290fac1431ee52aff6851c7c8ffd8264f13affd7bcdd
-PYTHON_DOCUTILS_LICENSE = Public Domain, BSD-2-Clause, BSD-3-Clause, Python-2.0, GPL-3.0+ (emacs mode)
+PYTHON_DOCUTILS_SITE = https://files.pythonhosted.org/packages/ae/ed/aefcc8cd0ba62a0560c3c18c33925362d46c6075480bfa4df87b28e169a9
+PYTHON_DOCUTILS_LICENSE = Public Domain, BSD-2-Clause, BSD-3-Clause, ZPL-2.1, GPL-3.0+ (emacs mode)
 PYTHON_DOCUTILS_LICENSE_FILES = COPYING.txt
-PYTHON_DOCUTILS_SETUP_TYPE = setuptools
+PYTHON_DOCUTILS_SETUP_TYPE = flit
 
 $(eval $(python-package))
 $(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
