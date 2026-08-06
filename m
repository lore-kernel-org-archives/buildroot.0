Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BEF5C56208
	for <buildroot@archiver.kernel.org>; Thu,  6 Aug 2026 16:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C459F407D1;
	Thu,  6 Aug 2026 16:33:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r3o1c_lQ-ZhR; Thu,  6 Aug 2026 16:33:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E82B407C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786034000;
	bh=GucN+b3ybcqBkA+9QM4eoIY6F5WRgWL0vZJRtPXyPms=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TfJ8IKbroiHLEMAUWjdmlu0CfD3w5F9bP4BrlBMkDe1/LIq1FmaVvdkTBtzNIi7lz
	 2jtoeqjuQbcM/vGnWKYHV+geWV1b+91sQhVDjyrcDtEd84dKjDTRD+SjgbIufFjlNO
	 JrJ2vDHyD6USBw9ySO+nESMlw9T0epIAqTUkfjniuilnv6zMY8IUKBNSjJhzaW/XJd
	 wsDMFzCf3LlTt8apUoxYdeeNI9+w4rYAW/9DSWkAWLSq04nag9cQulmtkmCWhYVox8
	 PhrktOEAmPn7btbLWLRmbD1cr4H+gZq/nWqxYBq7iwYTp1sfmMHU4I4rzX1CucHwLa
	 TpKT66DwX0uDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E82B407C2;
	Thu,  6 Aug 2026 16:33:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A01AD218
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 16:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92379402A4
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 16:33:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m9a8VVwujc2P for <buildroot@buildroot.org>;
 Thu,  6 Aug 2026 16:33:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9F38A40024
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F38A40024
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9F38A40024
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 16:33:16 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b3cd.dip0.t-ipconnect.de [84.161.179.205])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6FA5AA4C484E;
 Thu,  6 Aug 2026 18:33:11 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57518)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1ws11q-000000003Dj-331k;
 Thu, 06 Aug 2026 16:33:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Thu,  6 Aug 2026 18:33:10 +0200
Message-ID: <20260806163311.1312780-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1786033991;
 bh=9V66F0PpiVRIvwWcali9nAcfKOCXXuwd6Q0U/TYno9k=;
 h=From:To:Cc:Subject:Date:From;
 b=jrSzljijhC6ZGyPxDvhi83NBoHA6MQjMzmIfWKuJyCH/Vi8vraZirNWFVQso0jWvn
 YCh4En80HszA4Zy63ZFbYuLw2iYmWjLMnsgoo8HXJnRi14IBWrwwvMk4n7PqahiHyi
 wL+5MOy7bxpLJ0DjWyltl73K8EQGvS0MvQQYgtX7ERisF67bJ5o58aArVjaec8KF/5
 imx1E4AtUhInVIG/vRKnwWdJDoIb8LyBhmW+yLR3Wz2Ltm22u4F5wOiEu7ws28Gb+q
 eXvwRPuhUFJkb0awfgOK89eClBwjiQBKf8bXTzfWX7Ya+vNVjoUl690OjM4o3A1ktu
 12HeGbQsvZ9kg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=jrSzljij
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 26.2.0
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

https://lists.freedesktop.org/archives/mesa-announce/2026-August/000863.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/commits/879b8321593a98660cf0ad6c298c599b9eda2fa8

 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index d887d45325..430d78956f 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 26.1.6
+MESA3D_HEADERS_VERSION = 26.2.0
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 42c9e0a59e..d759c56047 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2026-July/000862.html
-sha256  5296b88a0f1e012e2cb9ada150a2bbadf728ca81e5a4fb2ab43c83a4d2158606  mesa-26.1.6.tar.xz
-sha512  6746b73f5b87e8ff3723eee586b4b5f033dbe6d13cd0309d743b7fa484c350268859ec8ff21aadcbca7a04070cdaa7828146dd28dde4b1935bb879891d687f0b  mesa-26.1.6.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2026-August/000863.html
+sha256  efd4bb08cdb7c365a812cd4e6c9202ab55b2f22cdcd13c7d6c4f9647b799a4ef  mesa-26.2.0.tar.xz
+sha512  c7c810c6958fa18eb75eea9968d84d0edd29b579d351a7f22d8c2b2b13b6e04e5b0df31dae3aa943672c792d124325bab03ccbd475a16d27267418bddbec4936  mesa-26.2.0.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 8e6f0bc125..cebc036071 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 26.1.6
+MESA3D_VERSION = 26.2.0
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
