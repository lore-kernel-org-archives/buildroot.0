Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28016D3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 14:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8C38404A7;
	Sun, 28 Dec 2025 14:56:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2DA5qooQa7N0; Sun, 28 Dec 2025 14:56:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC56C40476
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766933768;
	bh=XuDmzc1iYAvyLVPRCzSZ6W5q/gDiVbNNETLg2XKikHc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=BvmdpEuFqbl16ZvITg5XXyEysDtuEOw/Oo3xYMznPIqdhA9Gitz1BYj7hsKFZ1wI3
	 Gje9QUIRjmcm1Ts1vqhFXLBA0jSI8tV0+Zi6m+C6shW/FdTzrznoHpwasQCh7uoY9h
	 3Sfh20aQQpQiHI0AieHHE952YCY0Pc7DH4/S1eusryKNPhxf6e0Py6nw9wv2XuB6Sz
	 PNBX/cT3mztIN9yy5VuZEdWA50R46K0+kLRMLeNJYhsBcHFI3/1RNuuNIvm2ZK6vYw
	 EfE1/+hC3MRhahl+5wKfoFpxLAoigXDOgRWk4Sk1oo5aEQ+CrOy8RSZg+FywF+LovH
	 SeLk10dn0FINQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC56C40476;
	Sun, 28 Dec 2025 14:56:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B0F7DD8
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 14:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 96FA180C8F
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 14:56:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p2QOgfjjA509 for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 14:56:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3E5CD80C88
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E5CD80C88
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E5CD80C88
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 14:56:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C1C62A4C1F34;
 Sun, 28 Dec 2025 15:55:58 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55780)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vZsBa-000000008VO-0fyn;
 Sun, 28 Dec 2025 14:55:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 15:55:58 +0100
Message-ID: <20251228145558.1390919-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766933758;
 bh=kXCHX8y/cpvaCfLYz32WsCFP8gbQ35RjQMdNcKHsaKQ=;
 h=From:To:Cc:Subject:Date:From;
 b=J0cR86hMj+3R5y261JNTkF2yuFRibMZVltbbFeBUrCM22L75NnA9zd+5v5W1LoUyi
 a9pdplZdn6mCvmvUI5afNUHaGgWpjzaUp+kNb893V7aq3i56nJ7SFeMjucIuYwEpxj
 y9j1O0PVO9B9CmIGW979zSnQ5h0QC4aAi3J3avCkCLUhpOxH/v5NNgyBHzRx4rFHQF
 iTMea1adfzkjhtunoSajx+PRQiBGM2xGQ8vA4ezb79taai8YDTfIbuTVPXkgOmOqPf
 5FUqRgmtqHG02XFAD/JiL634El0x0Z6wDIHQgGzfuT7LdsQ4LClJLq8zr01NcrCjgK
 aaF7HdOZQLCDg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=J0cR86hM
Subject: [Buildroot] [PATCH 1/1] package/python-web2py: bump version to 3.1.1
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-web2py/python-web2py.hash | 2 +-
 package/python-web2py/python-web2py.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-web2py/python-web2py.hash b/package/python-web2py/python-web2py.hash
index 098f8dc490..b100a1fec8 100644
--- a/package/python-web2py/python-web2py.hash
+++ b/package/python-web2py/python-web2py.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  12669396396044f68a3f0ae9c44137f1a3b327c26e963f52b5e8b2bb20c51561  python-web2py-v3.0.11-git4.tar.gz
+sha256  b22b5c2db862cdef9e0feace1c8841741a14eb5e735b674d6ce2bd5c7f4cac64  python-web2py-v3.1.1-git4.tar.gz
 sha256  2aae96826184a492bc799add49aed7b29036e7aba2d2294fb65053bd30fe55fe  LICENSE.web2py.txt
diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
index 9e1de5c932..5b473698a6 100644
--- a/package/python-web2py/python-web2py.mk
+++ b/package/python-web2py/python-web2py.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_WEB2PY_VERSION = v3.0.11
+PYTHON_WEB2PY_VERSION = v3.1.1
 PYTHON_WEB2PY_SITE = https://github.com/web2py/web2py.git
 PYTHON_WEB2PY_SITE_METHOD = git
 PYTHON_WEB2PY_GIT_SUBMODULES = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
