Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7AA2C35FE7
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 08:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6483F81B72;
	Sun, 15 Sep 2024 08:03:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ifIDgogaBFLE; Sun, 15 Sep 2024 08:03:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F8A081B7B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F8A081B7B;
	Sun, 15 Sep 2024 08:03:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C7BEA1BF47D
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 08:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B61594028E
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 08:03:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h9CRkPAGM-Xa for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 08:03:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::130; helo=mail-il1-x130.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8ABF240136
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8ABF240136
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8ABF240136
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 08:03:51 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-3a08ca8d45aso12860955ab.0
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 01:03:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726387430; x=1726992230;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pyokk1lgTQzF97cgrD0vX9Lu14VKYNsVlrfnisnyyO4=;
 b=NvdzeJ2E0CYSjCMiqk1OSafSTqLbVevKveoL2YTUzVc7lACecDzX+twSXJYKyiw1vM
 garWeJDfDO1Sj6BG7PzWErp+4d825oQgQFsBEUz4r7Uy8b3CxGaGbm4sQZRXGsfQw1+t
 Z/B277cq7yvV0PP0Pm1Jz94ikOB3wC3zK1BSD9czkEBWmT3ypCkm4mn0L4WjSk9swYLB
 ng2KzNHucXjIECietuIoZcP5Jen22wxDwWShBTuU7ePdlAGDhAe5Uk7NbNLjuLzfZxaO
 nIvTw0L4n14sz1/TU7kI5EN831mjizX2eQG/JzwlPhindSjy++vfxmfJqniH3rWWGVxZ
 m3Aw==
X-Gm-Message-State: AOJu0YzyDemM6KCTAVYxZkR0xjI+TwEWURzMtRRM8He4KA5N692MWl9Z
 pL3TbOHFu/oLRDxw+8QCIWiyTwPPfzTKiKUZN49S0fzJOZB8Aal+9KTVOg==
X-Google-Smtp-Source: AGHT+IGV/4kspnMrDGFmGNDHloQL6tRyOq6kzMUfr8rHsedFpObMdR3k651aQ7xN/UIHFHoCGmMyNQ==
X-Received: by 2002:a05:6e02:1e06:b0:39f:5d96:1fde with SMTP id
 e9e14a558f8ab-3a0848ac92emr117845235ab.3.1726387430281; 
 Sun, 15 Sep 2024 01:03:50 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ec2b88dsm826169173.71.2024.09.15.01.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 01:03:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 02:03:48 -0600
Message-Id: <20240915080348.1569609-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726387430; x=1726992230; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pyokk1lgTQzF97cgrD0vX9Lu14VKYNsVlrfnisnyyO4=;
 b=WVTaVOUgVoOaOBJ+qcH+sQucEcWPcCz0FZRfBhM/RP8QedkXoH4hvyAYtT157wAkZA
 cI9ezHgWKFD0WxhoZdAhbUltSswC5OLrPYgFQihJPXr6bjDArRFFln6GjzGUlCcPywuG
 dD1HSSsRv9njJODBiTqOoUtUBH/wT/tH6XtoBduS+t7VoNBF1bk/xh+Bk5ap9nZVZXqR
 /JwPFQN1q0mXds3D1lhMVpcVUGwSydG/pjznkOdN1w3EsqFpPzxHaZ5Maty6NJmojMC6
 ErMRzvxljYXUAD478Cibg0h/Uxo41L24zkIEAH5fFMDmDBBKq27le8tJjQfqqG0RaFXu
 8YHw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WVTaVOUg
Subject: [Buildroot] [PATCH 1/1] package/python-humanize: bump to verison
 4.10.0
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

Migrate from setuptools to hatchling build backend.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-humanize/python-humanize.hash | 4 ++--
 package/python-humanize/python-humanize.mk   | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-humanize/python-humanize.hash b/package/python-humanize/python-humanize.hash
index 871bb9bfa5..98ea691e0e 100644
--- a/package/python-humanize/python-humanize.hash
+++ b/package/python-humanize/python-humanize.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/humanize/json
-md5  5e90552713107f756788ecdd8fbe341d  humanize-4.4.0.tar.gz
-sha256  efb2584565cc86b7ea87a977a15066de34cdedaf341b11c851cfcfd2b964779c  humanize-4.4.0.tar.gz
+md5  1c0f59ba335b32c06e121e5577ed1548  humanize-4.10.0.tar.gz
+sha256  06b6eb0293e4b85e8d385397c5868926820db32b9b654b932f57fa41c23c9978  humanize-4.10.0.tar.gz
 # Locally computed sha256 checksums
 sha256  8ba6c18112a431400ad3c743f70670079b302545d98884fc2f28a91c383a0380  LICENCE
diff --git a/package/python-humanize/python-humanize.mk b/package/python-humanize/python-humanize.mk
index 6155954b82..ff87f6a18d 100644
--- a/package/python-humanize/python-humanize.mk
+++ b/package/python-humanize/python-humanize.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PYTHON_HUMANIZE_VERSION = 4.4.0
+PYTHON_HUMANIZE_VERSION = 4.10.0
 PYTHON_HUMANIZE_SOURCE = humanize-$(PYTHON_HUMANIZE_VERSION).tar.gz
-PYTHON_HUMANIZE_SITE = https://files.pythonhosted.org/packages/51/19/3e1adf0e7a8c8361496b085edcab2ddcd85410735a2b6fdd044247fc5b75
-PYTHON_HUMANIZE_SETUP_TYPE = setuptools
+PYTHON_HUMANIZE_SITE = https://files.pythonhosted.org/packages/5d/b1/c8f05d5dc8f64030d8cc71e91307c1daadf6ec0d70bcd6eabdfd9b6f153f
+PYTHON_HUMANIZE_SETUP_TYPE = pep517
 PYTHON_HUMANIZE_LICENSE = MIT
 PYTHON_HUMANIZE_LICENSE_FILES = LICENCE
-PYTHON_HUMANIZE_DEPENDENCIES = host-python-setuptools-scm
+PYTHON_HUMANIZE_DEPENDENCIES = host-python-hatchling host-python-hatch-vcs
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
