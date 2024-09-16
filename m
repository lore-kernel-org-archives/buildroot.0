Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F998C3ABB7
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 00:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CECDD4066B;
	Mon, 16 Sep 2024 00:02:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NYrGCS3SwXXf; Mon, 16 Sep 2024 00:02:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EAAD4067C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EAAD4067C;
	Mon, 16 Sep 2024 00:02:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1F1441BF365
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 00:02:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B235400A4
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 00:02:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1cnRGP1t1SFf for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 00:02:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D18EF40004
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D18EF40004
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D18EF40004
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 00:02:07 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-82cf3286261so130548639f.0
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 17:02:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726444926; x=1727049726;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=doq56WBjRZT87LK5Rpbdyualo2+cBDZcvb0LbTAPiZk=;
 b=uDlvWPlk3L6zdo7K3DMyq0eWktNJgUrOv44sX9AIKcaZjbdkIngSjwH7H0cXv2WRhW
 JjgTC6LsO+K4ni+1BkLUeHrmMIPLQO6UNF9MzMbm+57Hq741tTql0AsoruXH5hBEQMgU
 A+VB6mOuGiRWhgR2hEwtjGSl+VDvMm36Wg3Ea6EF1MbT3Ma90FZ8o6NSWdKpWufRzQHq
 K9v6MhiH9FOu6lFB2vwY6wsFqfncD3FR1YUWVKff7Sa0QoSqrow1NHATB8fQRiq6FX1s
 XdeiNYq0NWiroYx0EvtJj4OCmW/T0SFS9QK3owBwj57A2GZARJfuxbQ3JtLzXJyJf7fn
 QiYw==
X-Gm-Message-State: AOJu0YzIMvPxI6sNXT/qIJZ5l6NLCQPiKsiz96pT67ep45obz7DQZv0e
 JYjtEeBfTowLwiCrIBLaOem+BxtGbm8ZOfZ+TICLBoo5I59JFWE2lis0iA==
X-Google-Smtp-Source: AGHT+IECZY4XuAu1yEib3m3y5IDzwqWlvvQ3HnPBO3RLn0fJmRGEDehaGSzYCs+BYHTXDwg9tF2QmA==
X-Received: by 2002:a05:6602:1495:b0:806:31ee:132 with SMTP id
 ca18e2360f4ac-82d1f8e3c96mr1115386639f.4.1726444926354; 
 Sun, 15 Sep 2024 17:02:06 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-82d492b9218sm125327739f.28.2024.09.15.17.02.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 17:02:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 18:02:02 -0600
Message-Id: <20240916000202.2117443-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726444926; x=1727049726; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=doq56WBjRZT87LK5Rpbdyualo2+cBDZcvb0LbTAPiZk=;
 b=ksRL4u53V5Gobm6zjx1mWirFRANPMylmFxPgTUDnT0w8AgKwuBEdXumchF4GQ4wgiL
 N1FUvPUC/m0zDfyOuu7GfjQs7mpGuCl+27o8qvAy53f6RcRiABmxNoxT0kP0HWL6OKDn
 Gi0/6Di+Vm/aonz/SetViPjTStmVTJLq+r67UhFhxfJqfNAFbML4XWT5ygY4LidDO6W8
 SKZVZNL0pCEkZLzuYRy1OOXpC+GdxxMTFWK9V2QZp7bM+X5DDM+jhphHC0OsGx0rH5Zx
 hGNGNo06CrZ6pYTaxTniAVuEUQDVVCWDUwV9lwUMtd7yx8fy6HDXwvFm2O43fI87dund
 cmGg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ksRL4u53
Subject: [Buildroot] [PATCH 1/1] package/python-mimeparse: bump to version
 2.0.0
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
 Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-mimeparse/python-mimeparse.hash | 4 ++--
 package/python-mimeparse/python-mimeparse.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-mimeparse/python-mimeparse.hash b/package/python-mimeparse/python-mimeparse.hash
index 00985841dc..d8c9070fa7 100644
--- a/package/python-mimeparse/python-mimeparse.hash
+++ b/package/python-mimeparse/python-mimeparse.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-mimeparse/json
-md5  a32ae1df93be1ddb581d1c0fa124bab4  python-mimeparse-1.6.0.tar.gz
-sha256  76e4b03d700a641fd7761d3cd4fdbbdcd787eade1ebfac43f877016328334f78  python-mimeparse-1.6.0.tar.gz
+md5  e3d6505e9af0629a15b4d56d7f34b2ef  python_mimeparse-2.0.0.tar.gz
+sha256  5b9a9dcf7aa82465e31bd667f5cb7000604811dce83554f1c8a43693a32cb303  python_mimeparse-2.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSE
diff --git a/package/python-mimeparse/python-mimeparse.mk b/package/python-mimeparse/python-mimeparse.mk
index 00bb1cf8f4..a67d02f818 100644
--- a/package/python-mimeparse/python-mimeparse.mk
+++ b/package/python-mimeparse/python-mimeparse.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MIMEPARSE_VERSION = 1.6.0
-PYTHON_MIMEPARSE_SITE = https://files.pythonhosted.org/packages/0f/40/ac5f9e44a55b678c3cd881b4c3376e5b002677dbeab6fb3a50bac5d50d29
+PYTHON_MIMEPARSE_VERSION = 2.0.0
+PYTHON_MIMEPARSE_SOURCE = python_mimeparse-$(PYTHON_MIMEPARSE_VERSION).tar.gz
+PYTHON_MIMEPARSE_SITE = https://files.pythonhosted.org/packages/cd/85/c40f2e0b2128905f6c34894be01803c114f2b2efab0e8b4c3dca5e56b999
 PYTHON_MIMEPARSE_SETUP_TYPE = setuptools
 PYTHON_MIMEPARSE_LICENSE = MIT
 PYTHON_MIMEPARSE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
