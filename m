Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F65C4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 15:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBA7B814A9;
	Mon, 12 Dec 2022 15:06:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBA7B814A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v8og8T_Th99Y; Mon, 12 Dec 2022 15:06:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EEB68148B;
	Mon, 12 Dec 2022 15:06:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EEB68148B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A003D1BF2B4
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 15:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B88160B6A
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 15:06:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B88160B6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jmj7UKQRaZaa for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 15:06:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32F5460B5D
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 32F5460B5D
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 15:06:18 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id v2so33516ioe.4
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 07:06:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9wRq/z1qxQVRpSHXQ5ISXRqUVswcRwIhghLZ4rttq4I=;
 b=z8zr07jA3qkjlM+cYQEC+8I7ZZI9yUi4k4tWTCEnXJerq5SL1vaoFyfgMFaxE4A9xd
 Mh9hmdhnrq7JXsJIyVKyqEf9Ctgad2bI2kEMynGth66SABuKVMB9QH/58Nsh6BsjzdcK
 d3QzBz2spbul7qq7+FrFcLLtOdyItKRtmLzfwvJWExdU7TVFQmyq86kva7AHwPBfCKn8
 6IAC4R9lIbiE5iN6BKh2kRZfrAVuFpUMA5q8uhL56EHRBDa5oFGd008P8hqD88R5vUan
 WzYd4/4HZ6l+QIoc26LliXSdMjSA46OQYQox+Ww+MLQxGUAYLd2bbuXRvMwSZCAMZfa7
 4keA==
X-Gm-Message-State: ANoB5pk3xon0Gv7Yk/4isaxTI0RS7ZdzxJyQavR1ActCNrqJ67/hp+g8
 yEKsssFyOPgYXSySuLXkdiHdDUHz3BxRVQ==
X-Google-Smtp-Source: AA0mqf7RMZ4IiL6Oc9LrWLXI1EZ0gpb7sfLGytuSPDaB9Td55GdbhDKWQH/ouICfPKmCLJbtj7KPQw==
X-Received: by 2002:a6b:3111:0:b0:6de:c23a:3fb4 with SMTP id
 j17-20020a6b3111000000b006dec23a3fb4mr8731575ioa.9.1670857577094; 
 Mon, 12 Dec 2022 07:06:17 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 x10-20020a026f0a000000b00363fe31cf55sm12714jab.40.2022.12.12.07.06.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 07:06:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 12 Dec 2022 08:06:10 -0700
Message-Id: <20221212150610.2794627-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9wRq/z1qxQVRpSHXQ5ISXRqUVswcRwIhghLZ4rttq4I=;
 b=AkNAJg9C2F/G6f0KDg6JC1z7kyq/pJqmPEYN8+DX69dD4/OkKCAKvtRF+OPxc3yal1
 nuO21fHr/hwqEdo//KJ9nR17JQ/0fRH0/v4HEEMf/bTaoWytgl+vdunZ/RikDNP4mb9/
 Mxq23jIhfANdfDzmSoWMZJE4AyL25yVsoeKJ7qH4rK9WgicgfA0+dWm6AZnyPWz4fEKL
 cF+fkf/yC0Si5KGejIzhhYl3DFJq32aI6yPEaAVaFyRpHbxUNbvvlMzkxYZe/ayZ9vDI
 TTxMXSlEBhIAB/G4bnB3fyGORy+tTz+ijhv8Mt2pdq4fPPoRP/yk0e2liE+YhV/z/SHx
 909w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=AkNAJg9C
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp-remotes: bump to
 version 1.2.0
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

Migrate from distutils to flit package infrastructure.

Add a patch fixing incorrect flit requires/build-backend in
pyproject.toml.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...Fix-flit_core-build-requires-backend.patch | 32 +++++++++++++++++++
 .../python-aiohttp-remotes.hash               |  4 +--
 .../python-aiohttp-remotes.mk                 |  6 ++--
 3 files changed, 37 insertions(+), 5 deletions(-)
 create mode 100644 package/python-aiohttp-remotes/0001-Fix-flit_core-build-requires-backend.patch

diff --git a/package/python-aiohttp-remotes/0001-Fix-flit_core-build-requires-backend.patch b/package/python-aiohttp-remotes/0001-Fix-flit_core-build-requires-backend.patch
new file mode 100644
index 0000000000..cf940eaf87
--- /dev/null
+++ b/package/python-aiohttp-remotes/0001-Fix-flit_core-build-requires-backend.patch
@@ -0,0 +1,32 @@
+From 3d39ee9a03a1c96b8e798dc6acf98165da31da1f Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Fri, 11 Mar 2022 12:59:53 -0700
+Subject: [PATCH] Fix flit_core build requires/backend.
+
+Only flit_core should be required by pyproject.toml, the regular flit
+package is the pep517 frontend which is not what should be set for the
+build system.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[Upstream status:
+https://github.com/aio-libs/aiohttp-remotes/pull/355]
+---
+ pyproject.toml     | 4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 214d64d..8c6b882 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,6 +1,6 @@
+ [build-system]
+-requires=["flit"]
+-build-backend="flit.buildapi"
++requires=["flit_core"]
++build-backend="flit_core.buildapi"
+ 
+ [tool.flit.metadata]
+ module="aiohttp_remotes"
+-- 
+2.38.1
+
diff --git a/package/python-aiohttp-remotes/python-aiohttp-remotes.hash b/package/python-aiohttp-remotes/python-aiohttp-remotes.hash
index 595340d5d8..51c5cf08b4 100644
--- a/package/python-aiohttp-remotes/python-aiohttp-remotes.hash
+++ b/package/python-aiohttp-remotes/python-aiohttp-remotes.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp-remotes/json
-md5  da13880f25ec3b9cf98c7baff92835a2  aiohttp_remotes-1.1.0.tar.gz
-sha256  e44f2c5fd5fc3305477c89bb25f14570589100cc58c48b36745d4239839d3174  aiohttp_remotes-1.1.0.tar.gz
+md5  c46a71df656e7f1e111684ced68a85d0  aiohttp_remotes-1.2.0.tar.gz
+sha256  f95c3a6be5e2de746a85ce9af49ec548da6db8378d7e81bb171ec77b13562a6c  aiohttp_remotes-1.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4e7d0edf250abe2a28027788b8c55a53d1b5c9ff961b8a00643c76aed637ba13  LICENSE
diff --git a/package/python-aiohttp-remotes/python-aiohttp-remotes.mk b/package/python-aiohttp-remotes/python-aiohttp-remotes.mk
index e2bc3e1c18..e0ec789f41 100644
--- a/package/python-aiohttp-remotes/python-aiohttp-remotes.mk
+++ b/package/python-aiohttp-remotes/python-aiohttp-remotes.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_REMOTES_VERSION = 1.1.0
+PYTHON_AIOHTTP_REMOTES_VERSION = 1.2.0
 PYTHON_AIOHTTP_REMOTES_SOURCE = aiohttp_remotes-$(PYTHON_AIOHTTP_REMOTES_VERSION).tar.gz
-PYTHON_AIOHTTP_REMOTES_SITE = https://files.pythonhosted.org/packages/e3/fc/5523010172e2d8685a8934fbb49d564118c9ebc1e4233a62b77310f979db
-PYTHON_AIOHTTP_REMOTES_SETUP_TYPE = distutils
+PYTHON_AIOHTTP_REMOTES_SITE = https://files.pythonhosted.org/packages/54/05/7c4be6171cc78a13171a4f89e5d308c4a636bdd8ee36101367e99e410ed8
+PYTHON_AIOHTTP_REMOTES_SETUP_TYPE = flit
 PYTHON_AIOHTTP_REMOTES_LICENSE = MIT
 PYTHON_AIOHTTP_REMOTES_LICENSE_FILES = LICENSE
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
