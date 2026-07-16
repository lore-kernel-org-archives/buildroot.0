Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F55FC44515
	for <buildroot@archiver.kernel.org>; Thu, 16 Jul 2026 18:17:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F204C810A6;
	Thu, 16 Jul 2026 18:17:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o3EihIWRCLS1; Thu, 16 Jul 2026 18:17:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D11CD80F9E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784225851;
	bh=6WbZx9nferywOYcynvb1cO8ozWQWqDMM0hwbU2wscg4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RO/lMRsgPhlkluFIUx00LonZ0hny52B+krua8Vyif1x5/yqfZb5DBoo9ecw3XjOo1
	 mOaJnEjOJzhmKCy3Ir441ORHJMOZMMwLK+tl6Y/JhPg0nXwwdqLQa0GUtl4q/ngF/u
	 13Swevc7aJbbYWmTbRUkNvTE3p/dZ7Cz/aro9fm0gobP8luW5ahWGOdwPWSLcXRU7J
	 +0PTPfgeq4AgsZj0QFSFGKc0LmSNMKMKFu6SnSPUDlykVSKykdQtnhc8c81iDRtKSy
	 /Z0Wlt9bPx2c85GQL0ODwuh5bWM0AyBJnAu/cRLmNyM6w8kwsrtPxy2FApqYNgVouH
	 iBC+tLK2vpLog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D11CD80F9E;
	Thu, 16 Jul 2026 18:17:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 13D1D320
 for <buildroot@buildroot.org>; Thu, 16 Jul 2026 18:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 118BC4037E
 for <buildroot@buildroot.org>; Thu, 16 Jul 2026 18:17:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iY-MXSlPjxGU for <buildroot@buildroot.org>;
 Thu, 16 Jul 2026 18:17:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 76980400A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76980400A6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 76980400A6
 for <buildroot@buildroot.org>; Thu, 16 Jul 2026 18:17:27 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b1ce.dip0.t-ipconnect.de [84.161.177.206])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6FDE9A4C3AE3;
 Thu, 16 Jul 2026 20:17:24 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50006)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wkQeB-000000005dh-0rqf;
 Thu, 16 Jul 2026 18:17:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Thu, 16 Jul 2026 20:17:23 +0200
Message-ID: <20260716181723.131839-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1784225844;
 bh=+5zuAv+R7L/C5jVeDeKTKz9cE1Bgl/DItjHIX38Sjgs=;
 h=From:To:Cc:Subject:Date:From;
 b=jFJxS+wxtW7FiSYrQZFyCWDP0ERlqzHEUB25lTSvOwHT8S4Gp50OFvzFb9qiAY1hM
 G0BFi5vV0r23p4u58hH26awfBjDsq9kpVzl1cWn8o+lZUs9bENx0foE/1/QxZNgsv8
 xSJELcA0lStADed/tfFLJjUFB6sNMzxYFS/0CWfhJlkouY8+G3YCpK+qStvfDvhTkn
 YVWiQwMuIAVpp2KGr85M9Py3guJvSebyt16rv8LjeiMUm3n7alp98YKKO+LIZhskSW
 s3Fe+6F8nQcjMkI8K4EJlnVn55IPDLCbk7cLYUo8lRQ0T5lZEf0kSGf4V+1bV0GjYl
 KQ6by3ADiDA4g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=jFJxS+wx
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 26.1.5
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://lists.freedesktop.org/archives/mesa-announce/2026-July/000858.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/commits/df36d3e418c98a449e053d20ced648030d14c6cb

 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 324d4e1708..b36f834270 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 26.1.4
+MESA3D_HEADERS_VERSION = 26.1.5
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 6e77b17b0d..73f900c907 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2026-July/000857.html
-sha256  072705caa9adf4740f1489194b13e278ad959166863b5271fe423a86353c9ab6  mesa-26.1.4.tar.xz
-sha512  39d15574e876005fd1a483d1cb3c801b08297ec73820a89cbf368d0f2a922cc770d0e623e99acc66b71791332cdadc6cc3095f059f713b09128921ff2d0197a8  mesa-26.1.4.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2026-July/000858.html
+sha256  79e421c7ce18cd9e790b8375920325779f10798630bf30e0b22f1a21c8617122  mesa-26.1.5.tar.xz
+sha512  8b1714e0fe63d3077c0d761245680724537a94db65e17dedb7124c7c861f070a13493a060695e81b2ca9b6889007b52c7b5788dace8fe5d8e2e1ed67efdbbf07  mesa-26.1.5.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 8e6c2ee5b8..43899cd084 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 26.1.4
+MESA3D_VERSION = 26.1.5
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
