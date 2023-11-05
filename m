Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C159C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 03:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC5FB821FA;
	Sun,  5 Nov 2023 03:44:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC5FB821FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z32hMMV9ENQx; Sun,  5 Nov 2023 03:44:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECF65821F7;
	Sun,  5 Nov 2023 03:44:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECF65821F7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 30A6B1BF861
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 03:44:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0FEE841AEC
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 03:44:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FEE841AEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1S7ULcjK6Ktm for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 03:44:39 +0000 (UTC)
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C411141A42
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 03:44:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C411141A42
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-7a69a1b51baso105384739f.1
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 20:44:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699155878; x=1699760678;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wtoRSZzXa4hcA/vpmoDoPgBYBjlJLDmIGfz6tVKrI9A=;
 b=AQp/iXBfvNzlFcOlcC+KDLqNmp6jdPDkSFiNHk0gHDRi0eWgNq2HOGgtOxWc2TBrJI
 dCNAPrJcHx6WuM7nrRQQM04UONT9jiVsK2wdmLL5aBQF36VpddpyLfHkRLEbFD2nA6T7
 Ut+TYyGinBv0LlAIz+QqC8ciorpTGP15SyODgD4TLt7GsYVFi/V1ABzvgR449aTo+kPI
 HkZ+LcYSFWXXSIWMyhkJD6vSN+8OUQ1SaMsQ6n8Az+fKo6LtG0Txz7XoBZt+yNI87mks
 MuHg+EzACqM/nUxRIgz3/RP2WP2IZ5RiOVrZzOv+PdTh/TK5/JJlio6R7oNtKXruhdtU
 kfPw==
X-Gm-Message-State: AOJu0Yw8r72FpGhb1XDkKZelU55Bi2qLY9jlxBcWKY584O3iP7BzM8lz
 0JaMuqH5Y7gdM1p9ZpY85XnfVe8b8j0=
X-Google-Smtp-Source: AGHT+IGLM+6nb2r60PbZgCGYms19x3yZt7e7pbMaDF86PKZk2AMxfttPhn1mBkhJxpl1TfSMn8KiFw==
X-Received: by 2002:a05:6e02:1d87:b0:359:315c:368b with SMTP id
 h7-20020a056e021d8700b00359315c368bmr6624926ila.4.1699155878352; 
 Sat, 04 Nov 2023 20:44:38 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 u10-20020a92ccca000000b0034aa175c9c3sm1606390ilq.87.2023.11.04.20.44.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 20:44:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 21:44:36 -0600
Message-Id: <20231105034436.2799389-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699155878; x=1699760678; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wtoRSZzXa4hcA/vpmoDoPgBYBjlJLDmIGfz6tVKrI9A=;
 b=NqK8exmVOcnqjtOlBd1wxBow1CnrFW+HixJMeenvBENP9w6Y1BzRfeD/WmBs+p9SWG
 DvISRwVr1bNji8x9xMXwbChNskgqbG6fze9ohDnTBJaNJP8YaWXaPI1QBCCjhNf/8gxZ
 SgwZn/6qgrdInrvw6mzNVRXRLvN6N/nCaurl5q3EDkc2gCyET7QIOKtD1ImSib6BFNxi
 LnoLwc47o4i2qdiB+MBqD8OL51e1ZocVPAxruwBniQxtewSXD8EbETMAZyrTFwSLjnqR
 mBBO2Vxv/6Ci2c+ydsfgH5SU9x81NpQxqFn4bG+DqnhraXcPTvidUsxbpALbf/GvfunO
 dJBA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NqK8exmV
Subject: [Buildroot] [PATCH 1/1] package/python-cycler: bump to version
 0.12.1
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-cycler/python-cycler.hash | 4 ++--
 package/python-cycler/python-cycler.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cycler/python-cycler.hash b/package/python-cycler/python-cycler.hash
index cef416a86d..4c33c293a5 100644
--- a/package/python-cycler/python-cycler.hash
+++ b/package/python-cycler/python-cycler.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cycler/json
-md5  4d0c25f418956e91c47163179682e0ef  cycler-0.11.0.tar.gz
-sha256  9c87405839a19696e837b3b818fed3f5f69f16f1eec1a1ad77e043dcea9c772f  cycler-0.11.0.tar.gz
+md5  16905ad17e5724a6919f64d46c4e7143  cycler-0.12.1.tar.gz
+sha256  88bb128f02ba341da8ef447245a9e138fae777f6a23943da4540077d3601eb1c  cycler-0.12.1.tar.gz
 # Locally computed sha256 checksums
 sha256  f1218143d766da3fea66f13396b7f15df46a83303f29bf96ba6e98eb4d42f408  LICENSE
diff --git a/package/python-cycler/python-cycler.mk b/package/python-cycler/python-cycler.mk
index 03155d7241..df7abdf927 100644
--- a/package/python-cycler/python-cycler.mk
+++ b/package/python-cycler/python-cycler.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CYCLER_VERSION = 0.11.0
+PYTHON_CYCLER_VERSION = 0.12.1
 PYTHON_CYCLER_SOURCE = cycler-$(PYTHON_CYCLER_VERSION).tar.gz
-PYTHON_CYCLER_SITE = https://files.pythonhosted.org/packages/34/45/a7caaacbfc2fa60bee42effc4bcc7d7c6dbe9c349500e04f65a861c15eb9
+PYTHON_CYCLER_SITE = https://files.pythonhosted.org/packages/a9/95/a3dbbb5028f35eafb79008e7522a75244477d2838f38cbb722248dabc2a8
 PYTHON_CYCLER_LICENSE = BSD-3-Clause
 PYTHON_CYCLER_LICENSE_FILES = LICENSE
 PYTHON_CYCLER_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
