Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADFA9E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 12:52:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DD8080AFA;
	Sat, 11 Jan 2025 12:52:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hTNOkWJzujs7; Sat, 11 Jan 2025 12:52:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 785EE805B7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 785EE805B7;
	Sat, 11 Jan 2025 12:52:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 65156942
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 12:52:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 511CB40BD3
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 12:52:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6DCjQ_PiYsUF for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 12:52:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12f; helo=mail-il1-x12f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2B28C40BDC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B28C40BDC
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2B28C40BDC
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 12:52:19 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id
 e9e14a558f8ab-3a78b39034dso9079535ab.3
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 04:52:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736599938; x=1737204738;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g8hMpH7qtgbqeJdQz2bxF0+QDbuAyWiAxBuDPGLdbpU=;
 b=gE9lMi/DHjg1NKQ+Pb5ql3Lk7lEkklIEyyjYXWY+7SsHiFs9ktM1xWCEqqHxDVqpvA
 0gIGop4rRc3PsBceRKSWeErqf6Buq/FPuiwCZxgP8Rs/45ucYEFPing/2Wn7/24CilUt
 NGssp/P8xekWF1EViJp1X3zjGXS19EuShWkFPYp0gpUa4mInbvqOawH+jjx8ARsN6P/B
 B9mxh9couke006/MbDcNrTjd39e6yBm+5Y9W/AIHd5BUH5fPcAmWhdV4IY/mqO0QhHfz
 zdAnkH5hnk4sV3hhCHnJl3X4HbyN4Bch+/8qwjPn1H4NM6YTNNdQCsqE/6j0B1ezuAZm
 Obwg==
X-Gm-Message-State: AOJu0YxK2Nl3f2XGFUlanM6yqWGzxt0QLhgm95ZegOzZCKQuLH3neybQ
 5MNmrfdGlceSNbEUQiPWCAAy2/BIiXtAYE7RZ2qmMa7z8lWlCHnsP5p8hJzP3Mk=
X-Gm-Gg: ASbGncs84fa3Q00DdJg7oZXLMP0gXMriL4lWYT2F3i4AA+XxCBLAYS7rToAA1svRokh
 ZL12QbEPdCQpEO3a+OjmXl0UjUwa/4y4HUdVE30+GtEwwCtkNMsF3dOIMpL6+qbDFUJObiIgXYx
 Av1dx7A1Vv7vnTStjsrzspdrmi+Yc+n7LirzkUgxyOgMVDvO3HXZUh41T13SfpfloS21PEB/Uvf
 Whp0QAVr+k3TBs78K9zD7FnRPFZJjkfgpO+VtxGA9JT1ofr8LkK70ceikFVObji/PiJB6UPeMGY
 qKwPd/I31cKo+NA3dh3NXmkJg3OdbkM=
X-Google-Smtp-Source: AGHT+IG4tb4JQUNswCu/LvMf3B5jZGc0p06axbrj9AURVYbCqxfcpd/c/4+sGHq5/K5uHAkqCT6OEQ==
X-Received: by 2002:a05:6e02:b44:b0:3a7:c2ea:1095 with SMTP id
 e9e14a558f8ab-3ce3a9a572bmr115636635ab.1.1736599938292; 
 Sat, 11 Jan 2025 04:52:18 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3ce4afc44c4sm15326995ab.71.2025.01.11.04.52.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 04:52:17 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 05:52:16 -0700
Message-Id: <20250111125216.2449244-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736599938; x=1737204738; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=g8hMpH7qtgbqeJdQz2bxF0+QDbuAyWiAxBuDPGLdbpU=;
 b=N2XsDBVFCEfYO9zV/8dw3pt1YylsZNCxuoJZKn/Wpv9UTXgGpZWqkzDLgtyWXoX7Kn
 zRqKVudzfL23Nsfkm+oPCI3KjJ2MLGPKaCNrsmNUB1xQP3DzMQoxYgJN4mQ/zJgesPRd
 YEiRILTUgdqAI4mlRtO5tN6CgSMyvYCShvXnV/Ivs1buJFO1qs96pNjw7uy7QRpCe/5L
 JNzWwqgpegeXsBi5DFSxVuYLCGCbJ/S4ah+KHAL/x2Qp7DIlb8j0DMyJFH+o6UOhHipo
 /unwXWut4wDJ9g/S35vOMYgYpDkeDpiIPs8y++eHcqZZhMf5vChtKKneZnjvn6FixnnK
 YJOA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=N2XsDBVF
Subject: [Buildroot] [PATCH 1/1] package/python-kiwisolver: bump to version
 1.4.8
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
 Esben Haabendal <esben@haabendal.dk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-kiwisolver/python-kiwisolver.hash | 4 ++--
 package/python-kiwisolver/python-kiwisolver.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-kiwisolver/python-kiwisolver.hash b/package/python-kiwisolver/python-kiwisolver.hash
index c4ae255377..ded337b823 100644
--- a/package/python-kiwisolver/python-kiwisolver.hash
+++ b/package/python-kiwisolver/python-kiwisolver.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/kiwisolver/json
-md5  3e1406c57a4fdce3804096f57a9b4855  kiwisolver-1.4.7.tar.gz
-sha256  9893ff81bd7107f7b685d3017cc6583daadb4fc26e4a888350df530e41980a60  kiwisolver-1.4.7.tar.gz
+md5  2eb55aab42272292a732411bb6c79dee  kiwisolver-1.4.8.tar.gz
+sha256  23d5f023bdc8c7e54eb65f03ca5d5bb25b601eac4d7f1a042888a1f45237987e  kiwisolver-1.4.8.tar.gz
 # Locally computed sha256 checksums
 sha256  238e69906d7e507a94832b9831131862c4176d58c002b388e2e99db5d83677d2  LICENSE
diff --git a/package/python-kiwisolver/python-kiwisolver.mk b/package/python-kiwisolver/python-kiwisolver.mk
index 4220e1c890..cbdb5c3aee 100644
--- a/package/python-kiwisolver/python-kiwisolver.mk
+++ b/package/python-kiwisolver/python-kiwisolver.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_KIWISOLVER_VERSION = 1.4.7
+PYTHON_KIWISOLVER_VERSION = 1.4.8
 PYTHON_KIWISOLVER_SOURCE = kiwisolver-$(PYTHON_KIWISOLVER_VERSION).tar.gz
-PYTHON_KIWISOLVER_SITE = https://files.pythonhosted.org/packages/85/4d/2255e1c76304cbd60b48cee302b66d1dde4468dc5b1160e4b7cb43778f2a
+PYTHON_KIWISOLVER_SITE = https://files.pythonhosted.org/packages/82/59/7c91426a8ac292e1cdd53a63b6d9439abd573c875c3f92c146767dd33faf
 PYTHON_KIWISOLVER_LICENSE = BSD-3-Clause
 PYTHON_KIWISOLVER_LICENSE_FILES = LICENSE
 PYTHON_KIWISOLVER_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
