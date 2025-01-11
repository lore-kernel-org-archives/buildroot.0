Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB936E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 13:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7196960719;
	Sat, 11 Jan 2025 13:23:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E7hkxswFsnBX; Sat, 11 Jan 2025 13:23:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83E6B6071E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83E6B6071E;
	Sat, 11 Jan 2025 13:23:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2530C950
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 13:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 101EA40378
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 13:23:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AvgYsfhuWIOm for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 13:23:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CF557400F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF557400F2
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CF557400F2
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 13:23:21 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-844de072603so237658839f.0
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 05:23:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736601800; x=1737206600;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Im+wQGS7iRBbTQvnUGLNivpF2vg9SggtKgqwPvos5Yw=;
 b=nsvETeQyvBS/wMf4pk/DBW+FM+eUSxZK0sVEx16d1/XYBm4jIbBWJ+EIfxv3Es8Dzt
 88gJScynk+kX1ddjQ6xYIFFyHiQHd3xgFqPofTsCSQQLV6wZd/7JdKMHALr55AsofGr/
 0GXlSVBpBWh2fj4qX2x4Gzb+dkzeLL8tJI+rwHhes1uHjiMGk+XPAxY+fbe+DW/cslNv
 oVTvnWG/1tu0sGeUiV1G2OnOxCodpW6bd6UYVhyKH8DDQQRwdc7+DVmeiasmFMgrGS4i
 l0PpEW7Izg4w8p4As5R2meWLryY5Ck87ONntCQ7iJDv1XoajgegFJDMJYTK+tLp2XFFW
 /T1g==
X-Gm-Message-State: AOJu0YxahVhRVInSGVNwSB/pWxD9LIRCDyZYUPVQFVqAoXxAjAwYHGG4
 G8xt9uXowmv9kcSmPY4sroGxfhif7Y9gVrUOGthA4KkkYBDjwjZSW4WYAtIv2HA=
X-Gm-Gg: ASbGnctD9Inq28lDJXGtQ3rjhR3a3i7DIzaf8ZtDtJf5yeYuLnWRlupRF2tvpRQ2yn6
 JyaFlz4kgsRX2YVIe0EVj0o47ntjkV9Van2eEKE4CAGLo535fzwNJjpRcuSSc7J7CY1e3CwQ+3Y
 ju82xLLa6Z+5UR7HHZlPauGwbO0so6NVXmTSpxOLBFRUskHve2tvPT9IP+f0f4QfoWZTujM1BjC
 y/COR9rnUuJ6yTkglQMIQ3nnvlaVAdapQLQNYINJLAsfzC8VP12l0OMx7CdgJdL2X8r++nXBNH2
 V2FvfRFTw4DX8q1/YsoaEHGulk4HYGk=
X-Google-Smtp-Source: AGHT+IEcpeSUBbZ3HfupnPRAYq6IxBPktL0MmjxNzKuol0RZ4n90US4gcn+unCu/NFmsvPtYcbm4pg==
X-Received: by 2002:a05:6602:3985:b0:841:a9d3:3b39 with SMTP id
 ca18e2360f4ac-84ce00757d8mr1430540239f.5.1736601800553; 
 Sat, 11 Jan 2025 05:23:20 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b5f9379sm1515613173.24.2025.01.11.05.23.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 05:23:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 06:23:18 -0700
Message-Id: <20250111132318.2496023-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736601800; x=1737206600; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Im+wQGS7iRBbTQvnUGLNivpF2vg9SggtKgqwPvos5Yw=;
 b=A5Y3b1m7O0Gq7Z765NN3+zRffQgtuUcuA03AHGC+t0U0qW/Uz/DlycAsuRVPRPtThL
 mS7cM5ulB+2s3o0eX0KqO+coXaMBXoLieZ90cwWrKUnYjkK8KLa4ZAiGllAF9llMNRMZ
 iyvRN/bVH8tuvEmKhG5qnNu2+r5bQwWlb2RDlFWkSTFUDcznAwy0Uf8aLSPGXq85xyqf
 sxvl3qpZNypM6dWqOYHq1HxJ95LBEuJRv49t9WsSyrDstLgAKBZcE8F2hYppwaOaGD35
 WWRczBnTJ6l+j+dd/T8VMgEb1z9Yu6RrB/vC6jFevgNrvLrxGRBx8zTyaglwczEhaYV4
 8Y7g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=A5Y3b1m7
Subject: [Buildroot] [PATCH 1/1] package/python-matplotlib: bump to version
 3.10.0
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-matplotlib/python-matplotlib.hash | 4 ++--
 package/python-matplotlib/python-matplotlib.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-matplotlib/python-matplotlib.hash b/package/python-matplotlib/python-matplotlib.hash
index 2882997b8a..c862860b06 100644
--- a/package/python-matplotlib/python-matplotlib.hash
+++ b/package/python-matplotlib/python-matplotlib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/matplotlib/json
-md5  bb92dfd3c1e9c816100b91008be5e300  matplotlib-3.9.2.tar.gz
-sha256  96ab43906269ca64a6366934106fa01534454a69e471b7bf3d79083981aaab92  matplotlib-3.9.2.tar.gz
+md5  9c9a5c3ced2bba7b5b2f8dab68ae4b06  matplotlib-3.10.0.tar.gz
+sha256  b886d02a581b96704c9d1ffe55709e49b4d2d52709ccebc4be42db856e511278  matplotlib-3.10.0.tar.gz
 # Locally computed sha256 checksums
 sha256  5a1a81ea301728c8bba2933da832c0cd62229daf20893a024ab3d53244468dbc  LICENSE/LICENSE
diff --git a/package/python-matplotlib/python-matplotlib.mk b/package/python-matplotlib/python-matplotlib.mk
index 7312d2b1ec..49fbd76bdb 100644
--- a/package/python-matplotlib/python-matplotlib.mk
+++ b/package/python-matplotlib/python-matplotlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MATPLOTLIB_VERSION = 3.9.2
+PYTHON_MATPLOTLIB_VERSION = 3.10.0
 PYTHON_MATPLOTLIB_SOURCE = matplotlib-$(PYTHON_MATPLOTLIB_VERSION).tar.gz
-PYTHON_MATPLOTLIB_SITE = https://files.pythonhosted.org/packages/9e/d8/3d7f706c69e024d4287c1110d74f7dabac91d9843b99eadc90de9efc8869
+PYTHON_MATPLOTLIB_SITE = https://files.pythonhosted.org/packages/68/dd/fa2e1a45fce2d09f4aea3cee169760e672c8262325aa5796c49d543dc7e6
 PYTHON_MATPLOTLIB_LICENSE = Python-2.0
 PYTHON_MATPLOTLIB_LICENSE_FILES = LICENSE/LICENSE
 PYTHON_MATPLOTLIB_DEPENDENCIES = \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
