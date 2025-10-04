Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E33CAC5BB
	for <buildroot@archiver.kernel.org>; Sat,  4 Oct 2025 13:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1FE583B68;
	Sat,  4 Oct 2025 13:02:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id phhkGzQLy2DE; Sat,  4 Oct 2025 13:02:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45C8A83A71
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45C8A83A71;
	Sat,  4 Oct 2025 13:02:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 63781909
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 13:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48E5140485
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 13:02:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q6vfAzUVXOMY for <buildroot@buildroot.org>;
 Sat,  4 Oct 2025 13:02:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4E2624004D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E2624004D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4E2624004D
 for <buildroot@buildroot.org>; Sat,  4 Oct 2025 13:02:39 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a03c3.dip0.t-ipconnect.de [91.58.3.195])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6F5C8A4C5D4A;
 Sat,  4 Oct 2025 15:02:36 +0200 (CEST)
Received: from [192.168.1.144] (port=37792 helo=bruckner.lan.fli4l)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v51uG-000000001ls-0LfR;
 Sat, 04 Oct 2025 13:02:36 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  4 Oct 2025 15:02:35 +0200
Message-ID: <20251004130236.2314240-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1759582956;
 bh=U13TWY4TFNyHypGhNhZ5OQty7BWri+jK38pufVCmhNg=;
 h=From:To:Cc:Subject:Date:From;
 b=ie47t2qoi59L8vy2p7pArPDv1YwIIG3KhrXyu44eMCBbDmSLKFHG60TjDawfqvUK9
 AITPODWag+3Je+/pAnmQ/2dOENGKF3G+Iv7Z2HvZsACrTV9bKXujg58094Ft0ghb0i
 lVrg+riVP4Xk/RWls60bzI+7JcjhNRM+qyDtrrRJa8r9sJBMF8NzLxVFgMIlFjsvAf
 CvSN9nYHXkslZJTI7XKKRZ1avbq+LfC2b+ioRYegLdr+keQd20Te58tJE96qayTT+R
 TLiO9Of6YX8fxxphzE0FwVirhtmTfVyGVNAd9ZTlscZhTbZDtzndrZ7tJh/wbstKI4
 CxTCaSCXb9RIw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=ie47t2qo
Subject: [Buildroot] [PATCH 1/2] package/libidn: bump version to 1.43
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

License file COPYINGv3 was renamed to COPYING:
https://cgit.git.savannah.gnu.org/cgit/libidn.git/commit/?h=v1.43&id=799b11bdbcca9109c812c700e082cebc9295be5c

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libidn/libidn.hash | 4 ++--
 package/libidn/libidn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libidn/libidn.hash b/package/libidn/libidn.hash
index 65201fdfb5..9727aaf243 100644
--- a/package/libidn/libidn.hash
+++ b/package/libidn/libidn.hash
@@ -1,7 +1,7 @@
 # Locally computed:
-sha256  d6c199dcd806e4fe279360cb4b08349a0d39560ed548ffd1ccadda8cdecb4723  libidn-1.42.tar.gz
+sha256  bdc662c12d041b2539d0e638f3a6e741130cdb33a644ef3496963a443482d164  libidn-1.43.tar.gz
 
 # Hash for license files:
+sha256  e6037104443f9a7829b2aa7c5370d0789a7bda3ca65a0b904cdc0c2e285d9195  COPYING
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYINGv2
-sha256  e6037104443f9a7829b2aa7c5370d0789a7bda3ca65a0b904cdc0c2e285d9195  COPYINGv3
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING.LESSERv3
diff --git a/package/libidn/libidn.mk b/package/libidn/libidn.mk
index c7b8b4941c..6fdd84fa9f 100644
--- a/package/libidn/libidn.mk
+++ b/package/libidn/libidn.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-LIBIDN_VERSION = 1.42
+LIBIDN_VERSION = 1.43
 LIBIDN_SITE = $(BR2_GNU_MIRROR)/libidn
 LIBIDN_INSTALL_STAGING = YES
 LIBIDN_CONF_ENV = EMACS="no" MAKEINFO=true
 LIBIDN_CONF_OPTS = --disable-java --enable-csharp=no
 LIBIDN_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES) $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 LIBIDN_LICENSE = GPL-2.0+, GPL-3.0+, LGPL-3.0+
-LIBIDN_LICENSE_FILES = COPYINGv2 COPYINGv3 COPYING.LESSERv3
+LIBIDN_LICENSE_FILES = COPYING COPYINGv2 COPYING.LESSERv3
 LIBIDN_CPE_ID_VENDOR = gnu
 
 define LIBIDN_REMOVE_BINARY
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
