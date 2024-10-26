Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07188D0C604
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 20:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE02660778;
	Sat, 26 Oct 2024 20:36:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y9yl8n6K2rhY; Sat, 26 Oct 2024 20:36:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C33D960779
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C33D960779;
	Sat, 26 Oct 2024 20:36:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DF725C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:36:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FF8860777
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:36:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cPN4fGBiWFGV for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 20:36:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1182D605F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1182D605F4
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1182D605F4
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 20:36:23 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-3a39f73a2c7so12537315ab.0
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 13:36:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729974982; x=1730579782;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6CkdV1cYm6kRaFA3IyHh9go7G+YciBlQDAJ6T4LRExo=;
 b=FbmSQ++A3xCBDyidX+Uy0YD94W2bPi1ZZkSDMNet4660gObCdD3eWTeQFb/VReQo4J
 M1f5e9Zf3O7PRGh3Zh2PdDvs4j3ng2vGQK5mFdFxg26mDFbojvkz6jcLUE7nT6av55TL
 r3a0X66OTImLAzSEqIufkrZJe1ZmTpBeEP4GpApsXJT/Ky5Kt+fSlIjuNkPgUrTV2i/c
 DtWBfIfWb9Nb76ih/l7NJm9Bso9JSXGSJ24yLfnLMwS/y1ENxVQoybqE1q4XC6kWQOX9
 CZWy4ZD53XURzjwOQqUurgkY7YHA7RDKpxagnkAVQcoavZYTyzM6eCvq6hcb9Je7iToM
 msLA==
X-Gm-Message-State: AOJu0Yx49D1Y4CY4lrueJcDHLBpmoVEpV+xFXBh/IjTxpwS/tcAcPfss
 bgYOla9MUWVyq+4dJaJMqFmJRTx7/JiZYmeAb79s2wDnJO6AAu/lotDpwg==
X-Google-Smtp-Source: AGHT+IEf4Ln+7VL8KIoUgfFrFExFrXPVH1VccWdv7Da8pL+WbJun5nIinIsXWn7vL49P7RUG+0ojJg==
X-Received: by 2002:a05:6e02:1a0a:b0:3a4:eca2:960b with SMTP id
 e9e14a558f8ab-3a4ed29d9f1mr29509995ab.9.1729974982596; 
 Sat, 26 Oct 2024 13:36:22 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a4e6e56eccsm8734725ab.60.2024.10.26.13.36.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Oct 2024 13:36:22 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 14:36:20 -0600
Message-Id: <20241026203620.3617544-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729974982; x=1730579782; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6CkdV1cYm6kRaFA3IyHh9go7G+YciBlQDAJ6T4LRExo=;
 b=j6bJfqr3I3vqGtBfa3Zbhb9OtkCghsDsAZHb0+23+DGD1dod7xuFwrabhl+6yEO1bf
 Mo3aPStTzt7tPxXgZOYhQF/ys1tMqEDhSo0UGhXjn5COaB3RHL8p3TXxH/d3tfzNX8Se
 XUf1xPWVSoGoL33R9P8pyt6ybqwho5IZO8OwobTHBNuA7LDwlJgFXIZs9LtXGd2lG9lR
 ke7AhX2WFWnKrmxMeGWR0f65kbKaonYO8+FeDZDBXvvJyMBbvRf+Hg0veeuKaX+vwYN/
 FpXdBeRAzAX2ZKkKb9d02G+Ua1CRf4yAvH0Yj47IACuOsB25t78Pd+DUiXVLkT90X7SF
 FELQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=j6bJfqr3
Subject: [Buildroot] [PATCH 1/1] package/python-ipython: bump to version
 8.29.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
index 77d804f70c..ca2b0ea16c 100644
--- a/package/python-ipython/python-ipython.hash
+++ b/package/python-ipython/python-ipython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/ipython/json
-md5  2031b37b5054423f1c5009d99da1ca86  ipython-8.28.0.tar.gz
-sha256  0d0d15ca1e01faeb868ef56bc7ee5a0de5bd66885735682e8a322ae289a13d1a  ipython-8.28.0.tar.gz
+md5  728e73b95f7a3078fcbce50e64396bc3  ipython-8.29.0.tar.gz
+sha256  40b60e15b22591450eef73e40a027cf77bd652e757523eebc5bd7c7c498290eb  ipython-8.29.0.tar.gz
 # Locally computed sha256 checksums
 sha256  341afcbd729887b7046fe7b98fc4f4edff3aed8d38f06eefd9b30670f043df17  COPYING.rst
 sha256  e0e390748ed440ab893ca1f135a88a920aaf5409dbb90a5b427c75c5e51268fb  LICENSE
diff --git a/package/python-ipython/python-ipython.mk b/package/python-ipython/python-ipython.mk
index 9c1afed03a..7e7806b12d 100644
--- a/package/python-ipython/python-ipython.mk
+++ b/package/python-ipython/python-ipython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IPYTHON_VERSION = 8.28.0
+PYTHON_IPYTHON_VERSION = 8.29.0
 PYTHON_IPYTHON_SOURCE = ipython-$(PYTHON_IPYTHON_VERSION).tar.gz
-PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/f7/21/48db7d9dd622b9692575004c7c98f85f5629428f58596c59606d36c51b58
+PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/85/e0/a3f36dde97e12121106807d80485423ae4c5b27ce60d40d4ab0bab18a9db
 PYTHON_IPYTHON_LICENSE = BSD-3-Clause
 PYTHON_IPYTHON_LICENSE_FILES = COPYING.rst LICENSE
 PYTHON_IPYTHON_CPE_ID_VENDOR = ipython
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
