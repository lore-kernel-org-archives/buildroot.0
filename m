Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B879CCD18E
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 21:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EADCD80D63;
	Tue, 14 Oct 2025 21:19:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fmONFGOfWN0h; Tue, 14 Oct 2025 21:19:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC73F80D81
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC73F80D81;
	Tue, 14 Oct 2025 21:19:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E390E1C9
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 21:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D55F780D81
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 21:19:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0gWfVyaXtGRc for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 21:19:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0918A80D63
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0918A80D63
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0918A80D63
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 21:19:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C61E1A4C662F;
 Tue, 14 Oct 2025 23:18:58 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38400)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v8mQ6-000000004Hb-0cwz;
 Tue, 14 Oct 2025 21:18:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 14 Oct 2025 23:18:58 +0200
Message-ID: <20251014211858.150756-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760476738;
 bh=bi2I5isxA6ud+YRsHxrZ9uDkxw/LPOLuzpki1j+V9RE=;
 h=From:To:Cc:Subject:Date:From;
 b=gdrGqvzRLY+3EsOOd8lZOv8R+MrQvbmUnY0XGLBmx6xrf54JgQO7x1SXJ8xo8VEh5
 vYvhTFYhZ0DHbxr0ey6tybeTcDsmTYBBzQB/TocvNfLS7bufOUBe2++Y9P1nMS4N4u
 59XFmbfOFDOG3j1bylgyNShZPfxI1NPlpfIE1Thm8AoCJ29+EIYCnoL4NVFJ/KtbzZ
 +NJxj4XCx36RqeSH6Ez4Jjh5J1PAO32cabxWZLVW1H3NyApl5lGqga8Eic+OiVCuJo
 eLw/xyhFXKNQ/1yVKkhUscARgL+QBI1p1y+4K+usMlUdTBCInRFdpuJi8mrKsJCreI
 KW9/wnkbHPlSQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=gdrGqvzR
Subject: [Buildroot] [PATCH 1/1] package/python3: bump version to 3.13.8
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://www.python.org/downloads/release/python-3138/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python3/python3.hash | 6 +++---
 package/python3/python3.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 8d9e67685f..a7ab3856cd 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-3137/
-md5  256cdb3bbf45cdce7499e52ba6c36ea3  Python-3.13.7.tar.xz
+# From https://www.python.org/downloads/release/python-3138/
+md5  ba3da8187b03db6f42052f8707c22564  Python-3.13.8.tar.xz
 # Locally computed
-sha256  5462f9099dfd30e238def83c71d91897d8caa5ff6ebc7a50f14d4802cdaaa79a  Python-3.13.7.tar.xz
+sha256  b9910730526b298299b46b35595ced9055722df60c06ad6301f6a4e2c728a252  Python-3.13.8.tar.xz
 sha256  78b12c3a81360b357002334f0e70ea0e92eebf7a9b358805c03c48484945f3bb  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 1546915f08..b501aa7859 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.13
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).7
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).8
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
