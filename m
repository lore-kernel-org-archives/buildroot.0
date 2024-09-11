Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 659B5EE57D7
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 20:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 124FD60632;
	Wed, 11 Sep 2024 20:53:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iTlCKi6B2HGg; Wed, 11 Sep 2024 20:53:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D71F2607DB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D71F2607DB;
	Wed, 11 Sep 2024 20:53:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E84E71BF423
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 20:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E215340C17
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 20:53:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uX0zhHaqURUT for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 20:53:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::131; helo=mail-il1-x131.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 930BA4070B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 930BA4070B
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 930BA4070B
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 20:53:26 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-39d3872e542so1084075ab.2
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 13:53:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726088005; x=1726692805;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o52AvSE6qKTmYMVoWYz/25GuC3uiVgfOU+aOQqQLJjw=;
 b=P0SrNTMmPCxbC1RUrb/aGIwugLuZuHztUlR5DzMrkYPccUvTY2osV2NUFq8XY+g1Ei
 Sb+PO4MEfvb8Az6zVPOnRKACh+ReZhgnlrtl8ofiHEegwfRcgmtHP10QoC8L2XPq9zkZ
 GHQtkj8paQSzcU+FKt936if1scqupNiwJFazNEwc6n8TYdxS0HCF7rD28Rptg1dcVXlq
 LOLJNx3+KrKahnTqM69Cs+BEydcARIbR9BF08mOhQPCBI9J6m7qr97dDK9/QtKtS84UT
 oB62HTxZBX9B6IatTT9NExO8mQ0SnUZ07uJD+K1u+FYwg0vu/lQNdN87fr2WO6aM3Wnv
 xhaw==
X-Gm-Message-State: AOJu0YzPTAv4YqfCakIgsyM01bONrAu5C3xMXbJIjCQ45tRkRJ+fBPKo
 2/wmvpZvVTiRaDwEdcSRjch2Azo9y0upjNBHBuXLepcikdpvYycEdkgSGg==
X-Google-Smtp-Source: AGHT+IG47hDhlGEHtumvw7hicyZ4Fe6qXkGLotWuWrWDGQdSvKXt66aDxkAGOEz9FcXqLoT7F6ab7Q==
X-Received: by 2002:a05:6e02:1c88:b0:39b:3b8f:d181 with SMTP id
 e9e14a558f8ab-3a084937567mr5040255ab.16.1726088005180; 
 Wed, 11 Sep 2024 13:53:25 -0700 (PDT)
Received: from james-x399.localdomain (97-118-128-240.hlrn.qwest.net.
 [97.118.128.240]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a05900e293sm28017215ab.64.2024.09.11.13.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 13:53:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 11 Sep 2024 14:53:21 -0600
Message-Id: <20240911205322.1772612-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726088005; x=1726692805; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=o52AvSE6qKTmYMVoWYz/25GuC3uiVgfOU+aOQqQLJjw=;
 b=SvPhkW3wIkkbWXB6ND+GioZRG5Ah3b+90K463dCJOGYQNxrK4mrSG1jr5NQXHhWz0H
 9DHS4HS7tEitAVhvdnB44UMt6ftFkkdSLrjpBaPxCpma7lO0n7ytZxoTDC9p2snviumH
 ATfVPoq8jUBxr7Rw8E1WgRIHlYEooVvx5uJMQqKAaDnnStYxnu1fUnJx+LK9LmT6dLbf
 /izRCtW2jAx+cXEqx5Ltaq9HBWLP0iAQUN/lvHebG8NoIVxTPMTEojpeDTxBx1ZV1atZ
 7qqNBAKkRwICiPPohjU0YFYiqc2/lZAQc3ewDV4a+44FZJYDUKpU7IBBEfQFj8B57nII
 IJbA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SvPhkW3w
Subject: [Buildroot] [PATCH 1/2] package/python-aiohappyeyeballs: new package
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
 package/Config.in                                 |  1 +
 package/python-aiohappyeyeballs/Config.in         |  6 ++++++
 .../python-aiohappyeyeballs.hash                  |  5 +++++
 .../python-aiohappyeyeballs.mk                    | 15 +++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-aiohappyeyeballs/Config.in
 create mode 100644 package/python-aiohappyeyeballs/python-aiohappyeyeballs.hash
 create mode 100644 package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk

diff --git a/package/Config.in b/package/Config.in
index 8f8f1ff8ee..4eccf77dd3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -970,6 +970,7 @@ menu "External python modules"
 	source "package/python-aioconsole/Config.in"
 	source "package/python-aiodns/Config.in"
 	source "package/python-aiofiles/Config.in"
+	source "package/python-aiohappyeyeballs/Config.in"
 	source "package/python-aiohttp/Config.in"
 	source "package/python-aiohttp-cors/Config.in"
 	source "package/python-aiohttp-debugtoolbar/Config.in"
diff --git a/package/python-aiohappyeyeballs/Config.in b/package/python-aiohappyeyeballs/Config.in
new file mode 100644
index 0000000000..86a998a7d6
--- /dev/null
+++ b/package/python-aiohappyeyeballs/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_AIOHAPPYEYEBALLS
+	bool "python-aiohappyeyeballs"
+	help
+	  Happy Eyeballs for asyncio.
+
+	  https://github.com/aio-libs/aiohappyeyeballs
diff --git a/package/python-aiohappyeyeballs/python-aiohappyeyeballs.hash b/package/python-aiohappyeyeballs/python-aiohappyeyeballs.hash
new file mode 100644
index 0000000000..c7b956238f
--- /dev/null
+++ b/package/python-aiohappyeyeballs/python-aiohappyeyeballs.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/aiohappyeyeballs/json
+md5  3c9a696b2d2808a3a633743965415d4d  aiohappyeyeballs-2.4.0.tar.gz
+sha256  55a1714f084e63d49639800f95716da97a1f173d46a16dfcfda0016abb93b6b2  aiohappyeyeballs-2.4.0.tar.gz
+# Locally computed sha256 checksums
+sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk b/package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk
new file mode 100644
index 0000000000..0d6abdf65e
--- /dev/null
+++ b/package/python-aiohappyeyeballs/python-aiohappyeyeballs.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-aiohappyeyeballs
+#
+################################################################################
+
+PYTHON_AIOHAPPYEYEBALLS_VERSION = 2.4.0
+PYTHON_AIOHAPPYEYEBALLS_SOURCE = aiohappyeyeballs-$(PYTHON_AIOHAPPYEYEBALLS_VERSION).tar.gz
+PYTHON_AIOHAPPYEYEBALLS_SITE = https://files.pythonhosted.org/packages/2d/f7/22bba300a16fd1cad99da1a23793fe43963ee326d012fdf852d0b4035955
+PYTHON_AIOHAPPYEYEBALLS_SETUP_TYPE = pep517
+PYTHON_AIOHAPPYEYEBALLS_LICENSE = PSF-2.0
+PYTHON_AIOHAPPYEYEBALLS_LICENSE_FILES = LICENSE
+PYTHON_AIOHAPPYEYEBALLS_DEPENDENCIES = host-python-poetry-core
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
