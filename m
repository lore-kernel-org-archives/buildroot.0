Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E546CCAC5B0
	for <buildroot@archiver.kernel.org>; Sat,  4 Oct 2025 10:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98A9641006;
	Sat,  4 Oct 2025 10:58:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id awpfjuSXe0wW; Sat,  4 Oct 2025 10:58:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DACD740F15
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DACD740F15;
	Sat,  4 Oct 2025 10:58:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EADB6909
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 10:58:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD1BF40F06
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 10:58:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n0iELNYwLRYf for <buildroot@buildroot.org>;
 Sat,  4 Oct 2025 10:58:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 02ED640EFB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02ED640EFB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 02ED640EFB
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 10:58:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a03c3.dip0.t-ipconnect.de [91.58.3.195])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E9D6CA4C5B74
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 12:58:01 +0200 (CEST)
Received: from [192.168.1.144] (port=37054 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v4zxh-000000005OD-2U5Y
 for buildroot@buildroot.org; Sat, 04 Oct 2025 10:58:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  4 Oct 2025 12:58:01 +0200
Message-ID: <20251004105801.380109-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1759575481;
 bh=DyXJYP3YLyfm+rZbR+U99ohI9QEORDkZoJg3+7MCqfc=;
 h=From:To:Subject:Date:From;
 b=kewuhJ/pcSdoM62/5HhPXntQpgNfYMsKq8ZBW7V2G5qu3ltZvEdJirN6koDQW639e
 CPyNOdFSiUK3f7R5pkngkfT5uIvGaSdy8ESpM/vm/jiEyn1mOvsc5ZIlyKVGGQDc3n
 oi9WfM84RvgMN7s5ubkS8ulgfyVxn1AQEHTmMmuVdeEYeSTDy3/YjHQvmTHSXNXJ37
 P0GD2cpG97O1XtjQkdh63RFO2Y8RX3+8dnFvF0xNYQKZiZIqEFE43Tcmb7mNirNH47
 f3yaAFbYovqb63F0bAo/0F4pqO6ZqSOe3kOCjk+hun4hg2Jq5oyXo9zKPJJpD3kuwj
 uzdbRIt6gECxA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=kewuhJ/p
Subject: [Buildroot] [PATCH 1/1] package/libao: bump version to 1.2.2
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

Added upstream patch to fix a missing include, autobuild did not record
any build errors but Arch Linux provides the patch:
https://gitlab.archlinux.org/archlinux/packaging/packages/libao/-/commit/bad3196d4e3030d31b01eb3bd41fff8afc8ca113

Switched to gitlab tarball because the previous site does not provide a
tarball for version 1.2.2 which was tagged in 2016:
https://gitlab.xiph.org/xiph/libao/-/tags/1.2.2

Added autoreconf due to usage of gitlab tarball which does not contain
a configure script.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libao/libao.hash | 6 ++----
 package/libao/libao.mk   | 5 +++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/libao/libao.hash b/package/libao/libao.hash
index 91c6bd11a7..70e6b4987e 100644
--- a/package/libao/libao.hash
+++ b/package/libao/libao.hash
@@ -1,5 +1,3 @@
-# From http://downloads.xiph.org/releases/ao/SHA256SUMS.txt
-sha256  03ad231ad1f9d64b52474392d63c31197b0bc7bd416e58b1c10a329a5ed89caf  libao-1.2.0.tar.gz
-
-# Hash for license file:
+# Locally computed
+sha256  df8a6d0e238feeccb26a783e778716fb41a801536fe7b6fce068e313c0e2bf4d  libao-1.2.2.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/libao/libao.mk b/package/libao/libao.mk
index 19a4c165c6..a9fd739ff3 100644
--- a/package/libao/libao.mk
+++ b/package/libao/libao.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-LIBAO_VERSION = 1.2.0
-LIBAO_SITE = http://downloads.xiph.org/releases/ao
+LIBAO_VERSION = 1.2.2
+LIBAO_SITE = https://gitlab.xiph.org/xiph/libao/-/archive/$(LIBAO_VERSION)
 LIBAO_DEPENDENCIES = host-pkgconf
 LIBAO_INSTALL_STAGING = YES
 LIBAO_LICENSE = GPL-2.0+
 LIBAO_LICENSE_FILES = COPYING
 LIBAO_CPE_ID_VENDOR = xiph
+LIBAO_AUTORECONF = YES
 LIBAO_CONF_OPTS = \
 	--disable-esd \
 	--disable-wmm \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
