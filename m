Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0360AC25B48
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 09:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9FF8F41721;
	Thu, 26 Oct 2023 09:31:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FF8F41721
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Jd2mux8XNRs; Thu, 26 Oct 2023 09:30:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2539741725;
	Thu, 26 Oct 2023 09:30:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2539741725
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D93F51BF98E
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB2276124C
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 09:27:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB2276124C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DwUyRuJHA0sl for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 09:27:22 +0000 (UTC)
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CFD7A6124D
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 09:27:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFD7A6124D
Received: by mail-ej1-x643.google.com with SMTP id
 a640c23a62f3a-9c75ceea588so103447166b.3
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 02:27:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698312440; x=1698917240;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s2gb604XsrHxOhMy2B4hqiEibZ5T66cHG/2LPBv4fMI=;
 b=j/p2jqAIQJxEFl/eLXqYaPG8/7cqNw/rLBDD7yu6DR6qW/RBxwv00WWFwfFqjuUPA0
 dqhaxAhVwoSlMQUXkZxExjBoLZNyLno1Tr9suFZmBi5J8B8EQBGPJr4/isub62boRcv+
 R9N3lx6kMsrD48UsJ455QhrZeysMZ84ANF+rZdI+AEWNpsjXZDPOelGNnieQ9uY+bXKK
 xDCz+dbmOJFPuI4f6ieVtA0Jt+Zjv4bXWmkiEa1tnLZKb9LS+UnX+cVRppwmnU85ejhE
 EQvhscrbPF/Mft/gaagc9ZqI+CwAUCLn826zOBbK8ZgijDSIK2RcthpvA7NZTAIbqg2f
 VdpA==
X-Gm-Message-State: AOJu0Yzci0QwEYn3Z9iYorSbQGe3vFgog3P1G2mPMoJVSualfQTs/Pcu
 FKL3ln5cvkmW/nepZpDk5b/idFZHsb4dLpKRRnchox7yqBfNmaYU
X-Google-Smtp-Source: AGHT+IHRSbnW/hHRffoLVgWgnB4tT/b1B1c4N/w+p/PX4UROn4gLPSMRny6CD8H76v+pW/QBzR+zXw==
X-Received: by 2002:a17:907:7da9:b0:9b2:982e:339a with SMTP id
 oz41-20020a1709077da900b009b2982e339amr14908361ejc.22.1698312439803; 
 Thu, 26 Oct 2023 02:27:19 -0700 (PDT)
Received: from fedora.. ([77.241.232.0]) by smtp.gmail.com with ESMTPSA id
 mb8-20020a170906eb0800b009b947f81c4asm11268438ejb.155.2023.10.26.02.27.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 02:27:19 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 26 Oct 2023 11:26:47 +0200
Message-ID: <20231026092701.12345-17-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
References: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1698312440; x=1698917240;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s2gb604XsrHxOhMy2B4hqiEibZ5T66cHG/2LPBv4fMI=;
 b=rR3ltqabEsixmRUJ75JwAcTbXhbbcs9Vm9ILymFsLR001PiTMDCPtIQBqF5oyGZlpb
 0xqA4bqUXfEFAbDyHF8B3Sxhwn0OP6CoYQ6SfohuHHzXMTUCBxEhi/8iPAgaX7Ze2Apo
 bJ+FZKGRl+iSydFqDeiSlpSQAjFthXg5Aj/6A=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=rR3ltqab
Subject: [Buildroot] [PATCH 16/30] package/python-wsaccel: bump version to
 0.6.6
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/python-wsaccel/python-wsaccel.hash | 4 ++--
 package/python-wsaccel/python-wsaccel.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-wsaccel/python-wsaccel.hash b/package/python-wsaccel/python-wsaccel.hash
index b388c3cc7c..9991f8f454 100644
--- a/package/python-wsaccel/python-wsaccel.hash
+++ b/package/python-wsaccel/python-wsaccel.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/wsaccel/json
-md5  73bdc70035813ded14f9a4b81e82622a  wsaccel-0.6.4.tar.gz
-sha256  cbf66a88bcaf6c6ad16d50ea29215891526b6e993c4bc7ed44b044ee6fe3ad3d  wsaccel-0.6.4.tar.gz
+md5  b05eecfac9cb19326bfc3b538de495ac  wsaccel-0.6.6.tar.gz
+sha256  18efec0a7182587ba97102b4cd8df7b4f665f45d7ca36f19783f5f081ea114ea  wsaccel-0.6.6.tar.gz
 # Locally computed sha256 checksums
 sha256  b6982974cb838b985b54b663d1780d280735086249c2e28015f25dd455df25da  LICENSE
diff --git a/package/python-wsaccel/python-wsaccel.mk b/package/python-wsaccel/python-wsaccel.mk
index ce41d431ff..1f63aa5c40 100644
--- a/package/python-wsaccel/python-wsaccel.mk
+++ b/package/python-wsaccel/python-wsaccel.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WSACCEL_VERSION = 0.6.4
+PYTHON_WSACCEL_VERSION = 0.6.6
 PYTHON_WSACCEL_SOURCE = wsaccel-$(PYTHON_WSACCEL_VERSION).tar.gz
-PYTHON_WSACCEL_SITE = https://files.pythonhosted.org/packages/77/0b/a44df15382a76b6768184630d483b8363d65b9f70d1aacf76153d496bbb9
+PYTHON_WSACCEL_SITE = https://files.pythonhosted.org/packages/94/28/41c0e711b538f6031a247ab4ec5352267f12ed416e3a638b8d55fc33f609
 PYTHON_WSACCEL_LICENSE = Apache-2.0
 PYTHON_WSACCEL_LICENSE_FILES = LICENSE
 PYTHON_WSACCEL_SETUP_TYPE = setuptools
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
