Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD10E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 15:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D92FC60E4B;
	Sat, 11 Jan 2025 15:45:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1rcTwiWLr6ZP; Sat, 11 Jan 2025 15:45:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E62BC60E80
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E62BC60E80;
	Sat, 11 Jan 2025 15:45:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A138942
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28A9583B3B
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:45:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D-zs0xWQlWmc for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 15:45:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4AA8C83B38
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AA8C83B38
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4AA8C83B38
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 15:45:45 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-84cdacbc3dbso233039539f.2
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 07:45:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736610345; x=1737215145;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=904oPEdGrnr2TkgHF9/hk201c79PElMQTT++gWjE4BA=;
 b=RPWBaKYtpKZHOxNYtV9TBC0decTi81Upj+2kLVYCegCxSdXR5IgVPX1+NGCD6vd8ci
 AO+RQPOFkTwhB63CkqdgpTZwYNh534CE6X+I9PPh0Up9KrrKrKsesu/9j2+p6Ra6Khhq
 CMX791+2PACGEjMB2iLnqUCt6uU04hnwkz7nIKRML0XZzkxk/E/D6mGJIm2EtFVnyj6W
 +cW2s4pFuXELjZZvSGgLW3yTTOmC2PIYmBDDmyUjV3fhnWA3eAR9gamprTpISObtKcbw
 oySY6htxj8IbYFbOIhy1dFynTrccnRqsa/zjdJXgNRzB2DYprrbS59EhfHL6dRaSBtP6
 Z4tw==
X-Gm-Message-State: AOJu0YyK0sxjV43V9Iqy45bboRlPZlWA45hl29Ub3I2m6YVyETWHE3cf
 voOYa0XeI6o9KKhk9Y/NlxYLeI+VBO/htKYwl689CJbqZeebg4MjIyXdHOvmrqc=
X-Gm-Gg: ASbGncuBay4tC76Pu3+Kz+vh/ebawxUjmrGb3Rs0VMzUAoE8puyuBSyX62kxskqv3m3
 cSIaRidUVLN1YGjXOsrq1bmX9aWnC+uh1bldNc48eeUO+aoSVE26yHGbtVxmYFuq61sFU+azfr1
 cjd7GUd189sFCZB2H/EDj2M+LgyH/vksclPu3osN0TxjgUgzySD7reoPWkzLKBXZdAuEOFUKFPy
 gPWm2Xpa11bHdOt/lAF0+2AQv8nGlekkXFo5nTnvKuBbhOKh2tT/bcg7GI8X8WqnMIRZ7xmbnSu
 2d3GC96M80jwwssp6gdYQ/vXmPoxfJU=
X-Google-Smtp-Source: AGHT+IH9axePBT9mkJXgnOedTZpwddoqGD3jSMkPe3B1zMMzlfxt3lUreWorrLiCFsfEELMnnbhVFg==
X-Received: by 2002:a05:6602:6cc6:b0:844:debf:2c8f with SMTP id
 ca18e2360f4ac-84ce01a47ebmr1463817839f.14.1736610344901; 
 Sat, 11 Jan 2025 07:45:44 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-84d4fb5be0csm157147339f.27.2025.01.11.07.45.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 07:45:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 08:45:42 -0700
Message-Id: <20250111154542.2855769-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736610345; x=1737215145; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=904oPEdGrnr2TkgHF9/hk201c79PElMQTT++gWjE4BA=;
 b=VixwoEm4AoMifCXSigKY/FBmeIMagrjobizE5qj8HTZ+0WTJIA76HD1TGK2KgIZ6E4
 ZofzrXvHw5qEAQa6xwrPw3lN32DvvzPNdGRC/E3JDnFelg3J5YMMugFWQ43Bf/ZD8RGX
 6Job639C5E4aYm7Qed+RR3TU/ateRQWxkqLM7293XJlfsLMcqcTbKzWzW/NWFd8HBs/i
 +HXiN/2sjOzE69z6714/PQq/oM50DIwFNfNLZKk7VdTlxtOAZOwOI3w0qNSlQE0b8Kys
 RfddeRC/CW0yUHZ/E+P6kj/zRc07R7IS+1rDinUlcY2gCJ9ftjKk0xouBAc3pBfiCcNR
 4oXg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=VixwoEm4
Subject: [Buildroot] [PATCH 1/1] package/python-pygments: bump to version
 2.19.1
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
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pygments/python-pygments.hash | 4 ++--
 package/python-pygments/python-pygments.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pygments/python-pygments.hash b/package/python-pygments/python-pygments.hash
index 0b5d2cfe72..894b6c39d3 100644
--- a/package/python-pygments/python-pygments.hash
+++ b/package/python-pygments/python-pygments.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pygments/json
-md5  fbb7976df756f832f3391008778e8999  pygments-2.18.0.tar.gz
-sha256  786ff802f32e91311bff3889f6e9a86e81505fe99f2735bb6d60ae0c5004f199  pygments-2.18.0.tar.gz
+md5  5e6e00a0f63b9f3b63edfa260f71b1b5  pygments-2.19.1.tar.gz
+sha256  61c16d2a8576dc0649d9f39e089b5f02bcd27fba10d8fb4dcc28173f7a45151f  pygments-2.19.1.tar.gz
 # Locally computed sha256 checksums
 sha256  a9d66f1d526df02e29dce73436d34e56e8632f46c275bbdffc70569e882f9f17  LICENSE
diff --git a/package/python-pygments/python-pygments.mk b/package/python-pygments/python-pygments.mk
index d3e6624ad4..e94c9dc908 100644
--- a/package/python-pygments/python-pygments.mk
+++ b/package/python-pygments/python-pygments.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYGMENTS_VERSION = 2.18.0
+PYTHON_PYGMENTS_VERSION = 2.19.1
 PYTHON_PYGMENTS_SOURCE = pygments-$(PYTHON_PYGMENTS_VERSION).tar.gz
-PYTHON_PYGMENTS_SITE = https://files.pythonhosted.org/packages/8e/62/8336eff65bcbc8e4cb5d05b55faf041285951b6e80f33e2bff2024788f31
+PYTHON_PYGMENTS_SITE = https://files.pythonhosted.org/packages/7c/2d/c3338d48ea6cc0feb8446d8e6937e1408088a72a39937982cc6111d17f84
 PYTHON_PYGMENTS_LICENSE = BSD-2-Clause
 PYTHON_PYGMENTS_LICENSE_FILES = LICENSE
 PYTHON_PYGMENTS_CPE_ID_VENDOR = pygments
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
