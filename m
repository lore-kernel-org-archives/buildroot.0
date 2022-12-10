Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC36DC4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 22:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E8A881516;
	Sat, 10 Dec 2022 22:31:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E8A881516
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eDzu7MgpSzZY; Sat, 10 Dec 2022 22:31:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B1A88149D;
	Sat, 10 Dec 2022 22:31:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B1A88149D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7948E1BF575
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 22:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 617BB8149D
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 22:31:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 617BB8149D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r93w2JGyiWJW for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 22:31:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5395E81497
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5395E81497
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 22:31:51 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id d14so1662437ilq.11
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 14:31:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V2/VY2+zRDIVOvXBXX3FQk9I2tfSwmzzGJmL/FfyfQ4=;
 b=20UOB5QLfWFJ59ULP6MVK6zjwZd+DLD9u1MEuuKXptuW7sb/3h/in5g8ZK8KmLW4fG
 imFvNoE7N8g6ThPrtcz4dD77pqPy5/7wP7UlINFP0OgLl3zLr3jHDnL2QMjCzHVdnvX/
 fXR4NB13XHuGnTEsC4yEZ0qiVGt6EOiSPvs+4IKZMxBxou/Qg4PRG9/a2rsYc0ykpBIO
 pYztS4LY3GwF6lU4t6L17jXBdH2+MFjo5usbryGt9uP0hhwtU6L35NwviNB6VhEPW3Db
 WyLL919oq5nETyWEc0vqc6/xQzQec8j54CHI/E42inmuM5pSL8D8o5NKc0aAkvbp7Lj4
 nvOA==
X-Gm-Message-State: ANoB5pk7NjVg7NFwWP4m7YlUchmOwvnoFoGt+IDmwBKDoZeX1dx6pJo/
 k32rywA1w66KXZrbKtzak8QuJhiKQ6nI3lyL
X-Google-Smtp-Source: AA0mqf5uRBdIqrZ7+47nk+xpCl6Kq9qeNJsd5m6g/H2bhzwU01HbJn+IDKMDCXezEz1Q8OlKdSuvAg==
X-Received: by 2002:a92:c945:0:b0:303:7aed:6fa7 with SMTP id
 i5-20020a92c945000000b003037aed6fa7mr6066359ilq.29.1670711510080; 
 Sat, 10 Dec 2022 14:31:50 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 c24-20020a023f58000000b00389c2fe0f9dsm1754521jaf.85.2022.12.10.14.31.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 14:31:49 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 15:31:48 -0700
Message-Id: <20221210223148.3853140-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=V2/VY2+zRDIVOvXBXX3FQk9I2tfSwmzzGJmL/FfyfQ4=;
 b=UCCcUisxJ++0NimORsZcoRWbYBpoif1csayrQljfgAgwZeM4fw+kMihvRt25S5/qUQ
 PF9kBVy+BF9/EihYIr+bVpf3X6tPH/4vd5V6VuN4ObjudlUqK8YxiKRMLVhaFeeoUeEQ
 VvfkQ4LAsmf1LUCU/L2jtJWr5pmGEe/l/VunSrMidf3RypNBImYQqvx4/SjTkhhvgduC
 toeFm1UUZ+AaLC0M8GfiK58l7KVp+lhuOmvuy7LjRiIqvmaKpYAPoSX8IvW8hHUsupBj
 5f1wcwsr6Bh+ZT1YNI2prmfSXvzqAKKqPBFX3iD1ekSW1Idz9p9/L/LjgGSyOOYPS57J
 FXlA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UCCcUisx
Subject: [Buildroot] [PATCH 1/1] package/python-pycares: bump to version
 4.3.0
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
 package/python-pycares/python-pycares.hash | 4 ++--
 package/python-pycares/python-pycares.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pycares/python-pycares.hash b/package/python-pycares/python-pycares.hash
index 13f640b1c1..7cdd93dd93 100644
--- a/package/python-pycares/python-pycares.hash
+++ b/package/python-pycares/python-pycares.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pycares/json
-md5  7706a01fdbfc593564b63ac0d71031d9  pycares-4.2.2.tar.gz
-sha256  e1f57a8004370080694bd6fb969a1ffc9171a59c6824d54f791c1b2e4d298385  pycares-4.2.2.tar.gz
+md5  d11b196cebb45a38caa56e850f4a60d9  pycares-4.3.0.tar.gz
+sha256  c542696f6dac978e9d99192384745a65f80a7d9450501151e4a7563e06010d45  pycares-4.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  427bb3a5372024a26e2c290b24382512bcc7ca123431c4dd178dd613beea7eee  LICENSE
diff --git a/package/python-pycares/python-pycares.mk b/package/python-pycares/python-pycares.mk
index 858adbf33b..b1c7dcef50 100644
--- a/package/python-pycares/python-pycares.mk
+++ b/package/python-pycares/python-pycares.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCARES_VERSION = 4.2.2
+PYTHON_PYCARES_VERSION = 4.3.0
 PYTHON_PYCARES_SOURCE = pycares-$(PYTHON_PYCARES_VERSION).tar.gz
-PYTHON_PYCARES_SITE = https://files.pythonhosted.org/packages/ac/a3/21594384c2398420dd7f6e8656aeb5a2c15128ddf2b85ef5f4403342e18d
+PYTHON_PYCARES_SITE = https://files.pythonhosted.org/packages/01/50/e3015e6e03a3cf64113f509e8b86b71af37169b59ccedfcb182f3d031329
 PYTHON_PYCARES_SETUP_TYPE = setuptools
 PYTHON_PYCARES_LICENSE = MIT
 PYTHON_PYCARES_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
