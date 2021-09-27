Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85527C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 06:38:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3916360560
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 06:38:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3916360560
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E09B1404AC;
	Mon, 27 Sep 2021 06:38:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cBLRx3HC2w5p; Mon, 27 Sep 2021 06:38:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E5A524049A;
	Mon, 27 Sep 2021 06:38:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 409771BF307
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 06:38:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2ACFA40682
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 06:38:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4jnhyZN6mPP4 for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 06:38:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 232F340680
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 06:38:21 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id v17so5752575wrv.9
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 23:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N64zH8wQmUGNK+WY2bSD57KBqh1pMOz+ATZHxe2C4yU=;
 b=IGfH9ooBRFokwK/L2eDiUIay+iY3mnGbofjRagbNAeevgX5L12gaYl1fW7/GHGJM61
 OcWRoUsQr6jKEnvpTCGic8B4Lm1xN8U+OorI0//wLcnQFYn9F/GWKOnLhdiKuRZW4Puh
 nbxjmH0O1C2PmmLUovJ7U3om7+4t2bKD8sN30QldlR2k9nM9GRSkbv2BJXgpPFE+m9sv
 TcCdjEJpIGd2MAJvmIGgUlrhnQjHbKFIr0XEPJfrC08LtG863JoY9FIYan8d5CBecv6l
 7j1xbD0/2uCuGc7n/BgCvnceeqNIZ1CrifEU/ThXbL+EGbjcioim9yTM+mP4nT5rxAcP
 Fx9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N64zH8wQmUGNK+WY2bSD57KBqh1pMOz+ATZHxe2C4yU=;
 b=gzakNBDUw7xw9Z2OWmOLTPYC0GNi+rX0e3yuAq8q5AWpl7ZqKjIRrRx9xvXAR53JYu
 AGOJ4k8PKguUD+5ZykngogCA4+9uqr+3hqqc7+gd+SnjP9zy181Ms7OHY++dXq9hgDx6
 B9ESk5LKfg33C+fyMiAeXCnsitfc6ATIYoPcnwIFpdGkM/oBVlaCbuntWe5mrFGyxZqp
 MP+SQ3XYzjrod8MncXqKKALuItu/2dlISY2GHGs9FYEQLMTzIexvkBGYKWEUWfg2HfCY
 HInGIRIlMT/owyhCssaOAdT+syF6He4nCRduofEEngDRLPEIJQAOroBbl1tq5eZ3RF1E
 MEEg==
X-Gm-Message-State: AOAM531cOKplKojqT9JX5dY+5Ag+kjQLaEWvpRAadQP6m55IeN7g4HNh
 4h31xrBRJtSoDdM/XcoS2w1yh8eaQxU=
X-Google-Smtp-Source: ABdhPJwGSeBz3Atm2x1IM7Ensv7CzNwFF+aIZifKcm9tY5rYRqEgUPCNuogQGUKIYdJGlPSLoAK5sg==
X-Received: by 2002:a05:6000:105:: with SMTP id
 o5mr25579458wrx.413.1632724699124; 
 Sun, 26 Sep 2021 23:38:19 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:424d:6143:cd4e:c1e])
 by smtp.gmail.com with ESMTPSA id t13sm5061135wro.76.2021.09.26.23.38.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 23:38:18 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 09:38:06 +0300
Message-Id: <20210927063809.505480-4-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210927063809.505480-1-asafka7@gmail.com>
References: <20210927063809.505480-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-texttable: bump to version
 1.6.4
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

Plus, indent with two spaces in the hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-texttable/python-texttable.hash | 6 +++---
 package/python-texttable/python-texttable.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-texttable/python-texttable.hash b/package/python-texttable/python-texttable.hash
index a69e8ed465..a769e91772 100644
--- a/package/python-texttable/python-texttable.hash
+++ b/package/python-texttable/python-texttable.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/texttable/json
-md5  68e6b31d36f5c20221da7d5db3eca772  texttable-1.6.3.tar.gz
-sha256  ce0faf21aa77d806bbff22b107cc22cce68dc9438f97a2df32c93e9afa4ce436  texttable-1.6.3.tar.gz
+md5  15faadc07ba44d337cc1675ea6092a02  texttable-1.6.4.tar.gz
+sha256  42ee7b9e15f7b225747c3fa08f43c5d6c83bc899f80ff9bae9319334824076e9  texttable-1.6.4.tar.gz
 # Locally computed sha256 checksums
-sha256	4ba7bdab54504a3bc44eb33ecca873a26a63ab902822101a87bb46235da63594  LICENSE
+sha256  4ba7bdab54504a3bc44eb33ecca873a26a63ab902822101a87bb46235da63594  LICENSE
diff --git a/package/python-texttable/python-texttable.mk b/package/python-texttable/python-texttable.mk
index 6af23917b9..59df5f6ff5 100644
--- a/package/python-texttable/python-texttable.mk
+++ b/package/python-texttable/python-texttable.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TEXTTABLE_VERSION = 1.6.3
+PYTHON_TEXTTABLE_VERSION = 1.6.4
 PYTHON_TEXTTABLE_SOURCE = texttable-$(PYTHON_TEXTTABLE_VERSION).tar.gz
-PYTHON_TEXTTABLE_SITE = https://files.pythonhosted.org/packages/f5/be/716342325d6d6e05608e3a10e15f192f3723e454a25ce14bc9b9d1332772
+PYTHON_TEXTTABLE_SITE = https://files.pythonhosted.org/packages/d5/78/dbc2a5eab57a01fedaf975f2c16f04e76f09336dbeadb9994258aa0a2b1a
 PYTHON_TEXTTABLE_SETUP_TYPE = setuptools
 PYTHON_TEXTTABLE_LICENSE = MIT
 PYTHON_TEXTTABLE_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
