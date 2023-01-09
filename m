Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14CCC54EBD
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 05:28:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44957400DD;
	Mon,  9 Jan 2023 05:28:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44957400DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iN0cJtkiFic8; Mon,  9 Jan 2023 05:28:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 769E94032E;
	Mon,  9 Jan 2023 05:28:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 769E94032E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8F4601BF3EF
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 05:28:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A34C4094C
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 05:28:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A34C4094C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AjFzAvz4lSi7 for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 05:28:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E715740940
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E715740940
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 05:28:49 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id q190so4045551iod.10
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 21:28:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jH3FP39MvslZecv0O5L66qEVOouy7ctktw/JxXn+h3k=;
 b=67gs/vLlT4p2/v1DkyBY/tUki3m4lO8qLOfUCjNSJKG+3y5yhYrPI0DyiJoffhgYNC
 UXa0QLyWRV7bB9QAjSWi7LdUw2Veo2ndfPQKmD2P95VOQdBPWOrtMF5//feSH5sW2r4O
 5iVMwFSCyDQGCFwE0p9rLaos3JL0s+XnZQ32qg4ghxAFNqxp7HuuURMpWl4X9NZXurQi
 r0yJZrl1Y2kb37bOb9fYgDN+7NcfvENKRDO23BeOdXP4COXG+dTYTHkq056iTtmwIawk
 qfBdss16lszmndNwcPQepSnfdQAI5lVUtMmqREWZ0JRO2koiEbWItFxngwdMU6A/n3kD
 pIyg==
X-Gm-Message-State: AFqh2kqUDM9ZkxLn8akkmS54hhmYt6IKdq1Fz4WOgJdyTaxZN2vEj0Q+
 Wx9BdgJ6xg0o/+N+HhD5W1FCMBx22Cbeigfr
X-Google-Smtp-Source: AMrXdXucA7zRNIqwZIy8m3uwYOltsQb/OAnoJaYWHWZqTq8tE15XUcAELqclT70EJkty0wgPJ/3z0g==
X-Received: by 2002:a05:6602:10a:b0:6bc:d714:5202 with SMTP id
 s10-20020a056602010a00b006bcd7145202mr41583915iot.2.1673242128775; 
 Sun, 08 Jan 2023 21:28:48 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 m6-20020a0566022e8600b006f3c33e091fsm2909408iow.39.2023.01.08.21.28.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 21:28:48 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 22:28:46 -0700
Message-Id: <20230109052846.2653995-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jH3FP39MvslZecv0O5L66qEVOouy7ctktw/JxXn+h3k=;
 b=Nb1l4pNGB17226PvSULikJ9T3KqMFYctqi9cMHZd7FR3ch8101h25mBEzSBJdcCfaK
 ctM0a6SCRjuj8ns2ymwkSi+AGmuo1yMQ/k0jLnZRZRSYiYlC9JzMB7Gtm1DwbyRprkEX
 1az36HTVrwOdNgnSHml/bsGt+/wDPa+zmCC3AtlpwZN5KyJiQQsN7I56SeSoSCSB/k8z
 HEpg7RDbdhVc9UCMLSivZVPWjxdjonRYjDFI4rt4x9gsjgYcw3dce54Ck3ZeHUKHQS5V
 QsgQDu1dD4SC1zbSmemYOZqLwZMAWhshDvNrY+yHFwiHP8XfCofxB/UltActNbPZlS4w
 ZXwQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Nb1l4pNG
Subject: [Buildroot] [PATCH 1/1] package/python-pyrsistent: bump to version
 0.19.3
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
 package/python-pyrsistent/python-pyrsistent.hash | 4 ++--
 package/python-pyrsistent/python-pyrsistent.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyrsistent/python-pyrsistent.hash b/package/python-pyrsistent/python-pyrsistent.hash
index bb55c7135d..d5c9a22656 100644
--- a/package/python-pyrsistent/python-pyrsistent.hash
+++ b/package/python-pyrsistent/python-pyrsistent.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyrsistent/json
-md5  23da81256b8817e123568a858bf78997  pyrsistent-0.19.2.tar.gz
-sha256  bfa0351be89c9fcbcb8c9879b826f4353be10f58f8a677efab0c017bf7137ec2  pyrsistent-0.19.2.tar.gz
+md5  761266eab1f9dc9280cdb0a6d2dedb08  pyrsistent-0.19.3.tar.gz
+sha256  1a2994773706bbb4995c31a97bc94f1418314923bd1048c6d964837040376440  pyrsistent-0.19.3.tar.gz
 # Locally computed sha256 checksums
 sha256  3ea56753cbd0cc897d3f4414a902f5694991db7c1b3abb8230216381185f9112  LICENSE.mit
diff --git a/package/python-pyrsistent/python-pyrsistent.mk b/package/python-pyrsistent/python-pyrsistent.mk
index 6a5ac30a15..f3457feebe 100644
--- a/package/python-pyrsistent/python-pyrsistent.mk
+++ b/package/python-pyrsistent/python-pyrsistent.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYRSISTENT_VERSION = 0.19.2
+PYTHON_PYRSISTENT_VERSION = 0.19.3
 PYTHON_PYRSISTENT_SOURCE = pyrsistent-$(PYTHON_PYRSISTENT_VERSION).tar.gz
-PYTHON_PYRSISTENT_SITE = https://files.pythonhosted.org/packages/b8/ef/325da441a385a8a931b3eeb70db23cb52da42799691988d8d943c5237f10
+PYTHON_PYRSISTENT_SITE = https://files.pythonhosted.org/packages/bf/90/445a7dbd275c654c268f47fa9452152709134f61f09605cf776407055a89
 PYTHON_PYRSISTENT_SETUP_TYPE = setuptools
 PYTHON_PYRSISTENT_LICENSE = MIT
 PYTHON_PYRSISTENT_LICENSE_FILES = LICENSE.mit
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
