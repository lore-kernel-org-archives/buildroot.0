Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEBCD10706DC
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 728D940FE3;
	Sat, 14 Mar 2026 14:05:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id omZGz-_3OFyN; Sat, 14 Mar 2026 14:05:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F6AF40FE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497127;
	bh=pP76xg+mjZWz9DROeDnqifn6Kx1Oj9mm7vTtHkXcGZ0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=e6/1cNzArjXRujr8BoKQY5ILJcA8W1u4Ha5/eIZIhRjCcmh8OcIoMBOYJe6lyVMtf
	 uJNX96TOF9URQylsKnMJEOl/Zbeku3CflIEzG+UPepjExzl7ITnb/7/e6uPiveuM0E
	 TpAKSQTg334GOP9fbw2HNdKex6w+GpSgX4qVpuJv5/F51U74FY36xADqeI/jlDWL49
	 JODB6IQWqW052uLaRDmTlj1aBIVMGYCAnB/PaLvKVxTUbh/IHmDgxVy+3D4GRb2jDn
	 D7YJ0EeMJgRXlmGptG1+T0Xo3GnG+A+mt3slMq9FbFChYHhIVryJjlOYBw7139UXVe
	 hIHEsMoSFBYRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F6AF40FE4;
	Sat, 14 Mar 2026 14:05:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 67C3E3C6
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D6E240FE4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:05:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 48K5TTOcyRi0 for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:05:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C2ED940FE3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2ED940FE3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C2ED940FE3
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:05:24 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CE2B6A4C13D3;
 Sat, 14 Mar 2026 15:05:21 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58676)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PcH-000000003HJ-1v5X;
 Sat, 14 Mar 2026 14:05:21 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:05:21 +0100
Message-ID: <20260314140521.2966649-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497121;
 bh=ULVvQvwG4dzP8hMTW357N+IGnlc0IEyelFoC18nT2oo=;
 h=From:To:Cc:Subject:Date:From;
 b=nvxyS6+Smhm+xbWvqLTgSeIBxkchcCUJR44JB/T/KNjRoMzbMXjBdyUkh7jaTw/Nd
 RyhuN/9C5XrW5z+Mi+5Ty4ugTDyI0G5iRa23LKk6VnKVT9rf1QnnVQRyTU68nY1PsQ
 EET57nLUyt3ihwAvo3ZGJh45mm5gls0GNIaIZR/D6eQimhjnX/ncooSPNE1XwNhdgQ
 HfwsJxZphzQGs6jy/ITsjgunxXlHwgUGMiWSwgzFvi+guSaovW+CK1laqKMsuv5LZL
 SDoQclwpK72fMKYjbe4WM4f1ZYwSfXBK+o25iAdDxm5xUjBjlVA72hSyrK6ILpW9yT
 dQDiXv/aY8pKQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=nvxyS6+S
Subject: [Buildroot] [PATCH 1/1] package/python-xlib: fix build with
 python-setuptools >= 82
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit 51365ff06379aaf6fcc9a751e8ff32ac694f3e92 bumped
python-setuptools from 80.9.0 to 82.0.0. This version removed
pkg_resources: https://github.com/pypa/setuptools/blob/v82.0.0/NEWS.rst

causing build errors:

  ModuleNotFoundError: No module named 'pkg_resources'

Fixes:
https://autobuild.buildroot.net/results/427/427cf89668cfe2477d01247b6f906cbc8b2c4b12/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Please note that the patch contains DOS line endings which might get
lost when this patch is sent by email.

 ...-remove-missing-pkg_resources-import.patch | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/python-xlib/0001-setup.py-remove-missing-pkg_resources-import.patch

diff --git a/package/python-xlib/0001-setup.py-remove-missing-pkg_resources-import.patch b/package/python-xlib/0001-setup.py-remove-missing-pkg_resources-import.patch
new file mode 100644
index 0000000000..7c13018bcd
--- /dev/null
+++ b/package/python-xlib/0001-setup.py-remove-missing-pkg_resources-import.patch
@@ -0,0 +1,34 @@
+From bc3686b25298d6ee34b2ac686ddc696ce2319c43 Mon Sep 17 00:00:00 2001
+From: wiz <wiz@pkgsrc.org>
+Date: Sat, 14 Mar 2026 14:59:35 +0100
+Subject: [PATCH] setup.py: remove missing pkg_resources import
+
+Upstream: https://github.com/python-xlib/python-xlib/issues/286
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ setup.py | 7 -------
+ 1 file changed, 7 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 71bdb08..3e7a706 100644
+--- a/setup.py
++++ b/setup.py
+@@ -1,14 +1,7 @@
+ # Distutils script for python-xlib
+ 
+-from pkg_resources import parse_requirements
+ from setuptools import (__version__ as setuptools_version, setup)
+ 
+-
+-# Check setuptools is recent enough to support `setup.cfg`.
+-setuptools_require = next(parse_requirements('setuptools>=30.3.0'))
+-assert setuptools_version in setuptools_require, '{} is required'.format(setuptools_require)
+-
+-
+ setup(
+     install_requires=['six>=1.10.0'],
+     setup_requires=['setuptools-scm'],
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
