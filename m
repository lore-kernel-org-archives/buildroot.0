Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9708AC5479D
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 04:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28A8760B28;
	Mon,  9 Jan 2023 04:26:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28A8760B28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P6TZUhhgyJf0; Mon,  9 Jan 2023 04:26:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6451060AFB;
	Mon,  9 Jan 2023 04:26:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6451060AFB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E6C3B1BF357
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 04:26:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1CAA40142
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 04:26:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1CAA40142
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I6MYrFTiMKSQ for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 04:26:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93A3B400FE
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 93A3B400FE
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 04:26:51 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id y4so4097796iof.0
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 20:26:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=neDFJqcaKz9FlI/IU6WSjcVlZgOkxB+tkWtcWTvNf0Y=;
 b=fazHv6ZvNUQ2p8SM75xPvjkamqwvPflaE+3i9MUOPDT7iFBALv7M2vtOuZNuwzDrnR
 KmcwdxhWn0wUCml5LQxIKN94QMCGBAgXu0lrFmZxJLCKRbqu+WiGlKmINAzgutEytTJw
 7fdNAu7pf3aDBogiCSkjQp19glQCecf7Q67iwJyjN4U46jBBUUh+AKDpszBwexOMoqNA
 KPQo8lMALcJ9HNOyg6s8XEosNIwi9AsHXocINXmTVGQVylVES2puKAlYJRYjtcyqNoQ8
 KOCEnOBABEksg3Hktha0uiCX8DtAUSf98QehqzIrTJaAH5OIL5cqr3YDgZnhtVhDUPpU
 uOgg==
X-Gm-Message-State: AFqh2kp4XQUo3xAJsF3aR/7oB7+O1GjhALOMPBkHncSKKrs74Oq2Z9d0
 IHAcro49hjYclIaCIMITxi+qwMs8qdb8VPcV
X-Google-Smtp-Source: AMrXdXtrlw+G/mWiKvrs+gw0dCywVsnMN8tNP0RlrZ0KoduzPOFe1FuvAPDibpM4fVHqbj7l3aHNXA==
X-Received: by 2002:a5e:dd08:0:b0:6e2:cfcf:f2cf with SMTP id
 t8-20020a5edd08000000b006e2cfcff2cfmr42244877iop.16.1673238410418; 
 Sun, 08 Jan 2023 20:26:50 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 k5-20020a0566022a4500b006df19c8671fsm2847426iov.27.2023.01.08.20.26.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 20:26:50 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 21:26:48 -0700
Message-Id: <20230109042648.2342444-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=neDFJqcaKz9FlI/IU6WSjcVlZgOkxB+tkWtcWTvNf0Y=;
 b=fvZ1pkHXaAUt1RbFHiF1Nv1a13bS/gunxm4LK3nZNTZpqdfDp7mvp+E02OZcnDCB0Q
 qBWhPjnKY56hHI787tQFA9rmzYKgQZSKDjtVJt7nLuYsFLGD53aw46+xS9Y30wZUuBVB
 aD6hLPYtPYDxuQsqT1e0aOQf2Ramw6pGvoThVjztrIo3aPnYNDtzNMIHgIhLW3abdI3z
 01m4lg+beGobMddwyswRe49LyBaYUx8jvHBhtB+6RV+2SVqw+71hkXrRjJ25gdh0RP53
 mOkgvl4i3v7H5tCNt63mXtIVHRp22mcRj/QmwUCV/0pdZrdEaFckzve/r0Bf1MFZD/bV
 MUQA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fvZ1pkHX
Subject: [Buildroot] [PATCH 1/1] package/python-ipython: bump to version
 8.8.0
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
 Philippe Proulx <eeppeliteloop@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-ipython/python-ipython.hash | 4 ++--
 package/python-ipython/python-ipython.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-ipython/python-ipython.hash b/package/python-ipython/python-ipython.hash
index aae34f6f9b..f11ad1e18c 100644
--- a/package/python-ipython/python-ipython.hash
+++ b/package/python-ipython/python-ipython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/ipython/json
-md5  3adf9fca317512e5b3516a9ac25b3442  ipython-8.7.0.tar.gz
-sha256  882899fe78d5417a0aa07f995db298fa28b58faeba2112d2e3a4c95fe14bb738  ipython-8.7.0.tar.gz
+md5  a1ea9b6e43c5568e5031974eb3a6acb0  ipython-8.8.0.tar.gz
+sha256  f3bf2c08505ad2c3f4ed5c46ae0331a8547d36bf4b21a451e8ae80c0791db95b  ipython-8.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  341afcbd729887b7046fe7b98fc4f4edff3aed8d38f06eefd9b30670f043df17  COPYING.rst
 sha256  e0e390748ed440ab893ca1f135a88a920aaf5409dbb90a5b427c75c5e51268fb  LICENSE
diff --git a/package/python-ipython/python-ipython.mk b/package/python-ipython/python-ipython.mk
index 1af1081741..f5a114c2f3 100644
--- a/package/python-ipython/python-ipython.mk
+++ b/package/python-ipython/python-ipython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IPYTHON_VERSION = 8.7.0
+PYTHON_IPYTHON_VERSION = 8.8.0
 PYTHON_IPYTHON_SOURCE = ipython-$(PYTHON_IPYTHON_VERSION).tar.gz
-PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/82/2b/026af47da09998404f51064d328f5f1f68c78829082d2945be489343fde6
+PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/f5/39/89664d8c3e4dfb0a73862cbbff8eb4028a1e3d4305da80ab0a493848ed9b
 PYTHON_IPYTHON_LICENSE = BSD-3-Clause
 PYTHON_IPYTHON_LICENSE_FILES = COPYING.rst LICENSE
 PYTHON_IPYTHON_CPE_ID_VENDOR = ipython
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
