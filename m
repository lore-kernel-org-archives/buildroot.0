Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36524C0218B
	for <buildroot@archiver.kernel.org>; Tue, 21 Jan 2025 22:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E91C96F4DE;
	Tue, 21 Jan 2025 22:12:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pG6wWz7N1pcy; Tue, 21 Jan 2025 22:12:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AA5D6F4F8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AA5D6F4F8;
	Tue, 21 Jan 2025 22:12:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AA413D7
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 22:12:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94ADA41928
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 22:12:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oxKPlv-2TWXL for <buildroot@buildroot.org>;
 Tue, 21 Jan 2025 22:12:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5C10B41926
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C10B41926
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5C10B41926
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 22:12:27 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-84ceaf2667aso431915639f.3
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 14:12:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737497546; x=1738102346;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wrNYpJADSPuK7KJvJVjOUO8X7lX0DyFUt27JW6uwmAE=;
 b=YK5UW+OoClxQhTVNHYYq+7NmLttDzjUxvF0vJReQ18drHz+y+tTnAAn8+acLh9rZp6
 AdzPF9xAochb2F7qKucWPpl54ihC4WrHzFgh6VOyr2iz1+1VtgwxPrFuF61mtRmaQ0QL
 nQLgePHEIwcXCL27IrvARd8SSC1Xbzju3UopWf0Wl76K4KK3fH/QzwFVkqZnKrxW2heD
 vTH7kX8C7fgfTD4Y34lzMklBjow05JdvtjrTS13npR/u12DXl/mmf4vW/AfIiWzMXEzz
 9pKjIaRwKr0ehVy0/rr6bos3PYWCFIAR8/33vMhGJtuXRkzdfCWjurROl1rjwGamS2Gx
 IJ6w==
X-Gm-Message-State: AOJu0YyBkCJCodj2R7JfV0jy3Y5dyNpOHiHkvv7T0URcr5VLuvNTRj32
 hdNbG0sTO0k68Pm17YnjhKZXTI1eYx77vvErpMPrr1MP8ZmboOH5DMPVyrND
X-Gm-Gg: ASbGncsnRLmaRGK8+QZmAnDx8DEVjnbYQBbKvXSKwOpRF5bz7897ndXPF9tP7vf/Zu0
 PliJ7MpbpKN7kh9IX2QiCQMEipqgXmdNt91DVn8rOK78QT1yfTRslX7fpRDckbyCRZZT/eVRMRO
 5JmIG+70qWkNX1awoDW+EqEZC6UJih66Tm5VjObf+HJ0hhdeiesd/4/xM+RzLHyX+w0QBslqav9
 oyX677hgSLclKrWdWx0c3MVj2D6vGPidO8vATI3tVmiXYaSAWNnkk8FKMVwsAF8gwbnaQUtnuF4
 bG1dyQBk6KN7QA6q1fj3xHD1RurBH5XTFqMShSvdskor
X-Google-Smtp-Source: AGHT+IFZ1bFx+3N60J1DltEtplPtW6mXgiFlQLQhsDOmQspcxBSH1kl4xrAgny+vwGykiLZhk5Flzg==
X-Received: by 2002:a05:6602:7287:b0:843:e8d0:a728 with SMTP id
 ca18e2360f4ac-851b618dc7bmr1799789639f.4.1737497546142; 
 Tue, 21 Jan 2025 14:12:26 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-851b04f8f9esm332579339f.40.2025.01.21.14.12.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2025 14:12:25 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Jan 2025 15:12:24 -0700
Message-Id: <20250121221224.3128817-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737497546; x=1738102346; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wrNYpJADSPuK7KJvJVjOUO8X7lX0DyFUt27JW6uwmAE=;
 b=IXw/soLpNCunwdTw1x+zNgs3yVLk+yumJvUda3UTr+rpEOfIptQMqzokEXtXmCAoW8
 85gESpx0Sxa8frsyPCxIjorE1DiPP/th6D7HkA3Q+jHxLF9AFSxtobkr+zVKito0IlZf
 D4RrwfUM8DSsWXJCWNMcDEuXlGerEivWT0A6/RFgEqPGdKMDwKhzxu/bk82Ut0EyvSzA
 7H5FTmvaCmdk8cbUVH1FWuduV8s71XK30XG2o1wmoBcSTZuC7XxturATEvACkvefMmw+
 QiheeTQdCKj3BaWxdp5eIHvJ0cBeFTpw5aWVIHUvlyIqf1ksK/VoWIVmHK1nAuqTw3bY
 pcnQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IXw/soLp
Subject: [Buildroot] [PATCH 1/1] package/python-botocore: bump to version
 1.36.3
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
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-botocore/python-botocore.hash | 4 ++--
 package/python-botocore/python-botocore.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-botocore/python-botocore.hash b/package/python-botocore/python-botocore.hash
index aebdba3d4f..1b69f254aa 100644
--- a/package/python-botocore/python-botocore.hash
+++ b/package/python-botocore/python-botocore.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/botocore/json
-md5  4e9617831cbc77e09203474718b40a2d  botocore-1.35.97.tar.gz
-sha256  88f2fab29192ffe2f2115d5bafbbd823ff4b6eb2774296e03ec8b5b0fe074f61  botocore-1.35.97.tar.gz
+md5  9d12679ec90f7e7185006dd0535595a6  botocore-1.36.3.tar.gz
+sha256  775b835e979da5c96548ed1a0b798101a145aec3cd46541d62e27dda5a94d7f8  botocore-1.36.3.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.txt
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  tests/unit/auth/aws4_testsuite/LICENSE
diff --git a/package/python-botocore/python-botocore.mk b/package/python-botocore/python-botocore.mk
index 42ca5b2e63..e000700c1e 100644
--- a/package/python-botocore/python-botocore.mk
+++ b/package/python-botocore/python-botocore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTOCORE_VERSION = 1.35.97
+PYTHON_BOTOCORE_VERSION = 1.36.3
 PYTHON_BOTOCORE_SOURCE = botocore-$(PYTHON_BOTOCORE_VERSION).tar.gz
-PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/48/cd/79656501384e265c9b3099358da2ec6a18568ddf44e5dd61582692a3e7b3
+PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/3a/61/69eb06a803c83e0da733b60b2bc65880c18ef2dee19ee10cf8732794a3c1
 PYTHON_BOTOCORE_SETUP_TYPE = setuptools
 PYTHON_BOTOCORE_LICENSE = Apache-2.0
 PYTHON_BOTOCORE_LICENSE_FILES = LICENSE.txt tests/unit/auth/aws4_testsuite/LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
