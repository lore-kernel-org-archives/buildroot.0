Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D77A4C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 23:55:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F12C6103D
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 23:55:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2F12C6103D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F40D380DB5;
	Sun, 24 Oct 2021 23:55:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qLdpTeKhOiFP; Sun, 24 Oct 2021 23:55:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 623C980DAE;
	Sun, 24 Oct 2021 23:55:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F07FE1BF3C4
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 23:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DEDCA4023A
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 23:55:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y1K4T0RXAhw2 for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 23:55:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A02CB4012D
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 23:55:27 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id p142so13314762iod.0
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 16:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n6NdK29a/Kk8wJinUDKKbNx3HG9u2LMS4Z/US8Cd8YQ=;
 b=HSTbiC8DtO+CoyG2qI4NTP80zhf4uqB6MNuZs6snJxPbjFWk5zMSLc1h+F0jPxMPP9
 agkoNJIzDojUWiVwPiXBo9tWCZEueU/pVyV2VZ3C8y2Pze33780wl/+GS2PEJfdDR7sH
 tH2joBiajsw2M9dKz9IfkqAGrAm3855LOVigrMY1o121H36606jrHXh4sywYi3sWX95C
 zCKb/Zl9Y8GNuOZsTWMLHeoVfAR7aj15M+mWQ2W+8NxjhgvzD1E6dilQWO9x66Eb9I6m
 x5gKBpK27XTV2Yb75PNYsxDe8ZJyEDl8VcpNZ71AqMG8U/R2P3N0SfaxXP5Ts3KKWQaO
 A4KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n6NdK29a/Kk8wJinUDKKbNx3HG9u2LMS4Z/US8Cd8YQ=;
 b=q7KR8hEDN/pnUrxuZbWhOFPjM5APSj88/IqIhYzpZtOpJ+uOdu2HTOLTVY2FM4BVOy
 sJsk2ZCnlpPQNzzbk1PEa2a1IiSOjOUQQlyhwEbUsDDrttTvCDvRfawzr67iBAXAs2oZ
 lK/Cni9mTe0j5Uj8thb5OH194yhMopwewgkXzq0wJkyPXziWP2Q83MZaiI1zyXe+LJ9/
 sZEPun4BsfBNSR7QVizzpzfDqbMAnyn/gLmEjG29Y4PanvHu6/PcTgeB61GBJPiz/Va9
 Nsz6Dqje7LZlBtKjRbaxg4i5lD1fO0xm8FCj2Z0dZBLl859MOvOXRIGIo1w2fZtQb+n9
 xObg==
X-Gm-Message-State: AOAM5334LHBbZaomlcXTzXd2hhUgcG/NGVE4Y9Die3DNihVKS6UOjTFx
 j868pjVEw2RWRx1Nh4TICp5mN14ik/w=
X-Google-Smtp-Source: ABdhPJxwQKTqWOXQf993qeZ5DwCH5UH1BopVd9Y/H9bPdd5YMb8ACLCFiQDD0etg8cKChjm7SeCbaA==
X-Received: by 2002:a5e:dd46:: with SMTP id u6mr8703899iop.217.1635119726587; 
 Sun, 24 Oct 2021 16:55:26 -0700 (PDT)
Received: from james-x399.localdomain (71-218-115-49.hlrn.qwest.net.
 [71.218.115.49])
 by smtp.gmail.com with ESMTPSA id l5sm7925712iln.50.2021.10.24.16.55.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Oct 2021 16:55:26 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Oct 2021 17:55:23 -0600
Message-Id: <20211024235523.2141274-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pycares: bump to version
 4.1.2
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
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
index 7f749938a1..85e0848b96 100644
--- a/package/python-pycares/python-pycares.hash
+++ b/package/python-pycares/python-pycares.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pycares/json
-md5  5908c5762f08d07310f081aa2d8397a2  pycares-4.0.0.tar.gz
-sha256  d0154fc5753b088758fbec9bc137e1b24bb84fc0c6a09725c8bac25a342311cd  pycares-4.0.0.tar.gz
+md5  9e66aa767a0afd681e2a797b835cad1d  pycares-4.1.2.tar.gz
+sha256  03490be0e7b51a0c8073f877bec347eff31003f64f57d9518d419d9369452837  pycares-4.1.2.tar.gz
 # Locally computed sha256 checksums
 sha256  427bb3a5372024a26e2c290b24382512bcc7ca123431c4dd178dd613beea7eee  LICENSE
diff --git a/package/python-pycares/python-pycares.mk b/package/python-pycares/python-pycares.mk
index b0abb1a41a..9be295d900 100644
--- a/package/python-pycares/python-pycares.mk
+++ b/package/python-pycares/python-pycares.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYCARES_VERSION = 4.0.0
+PYTHON_PYCARES_VERSION = 4.1.2
 PYTHON_PYCARES_SOURCE = pycares-$(PYTHON_PYCARES_VERSION).tar.gz
-PYTHON_PYCARES_SITE = https://files.pythonhosted.org/packages/25/5a/ed8cc3340b7e83a5e572b5d27387a968a7e52b1e3c269442076ca902b7ba
+PYTHON_PYCARES_SITE = https://files.pythonhosted.org/packages/83/61/17bd0cfb9c4dc8c3738484d604b50d47c78fe4fcfe0ca2c58a61a106f578
 PYTHON_PYCARES_SETUP_TYPE = setuptools
 PYTHON_PYCARES_LICENSE = MIT
 PYTHON_PYCARES_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
