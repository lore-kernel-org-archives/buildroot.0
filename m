Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47AD7C98307
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 16:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0147F40824;
	Tue, 22 Sep 2026 16:50:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MppkCRYhkAZR; Tue, 22 Sep 2026 16:50:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 14A5E407C1
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790095816;
	b=U58SCtI2w/6e8ua/W7vTDVMWPYXvY3KRmCpyviPeLbkUEsUHOn8/E5f8+H9QiIKhuG30
	 d4lXv8c7rMMAupwcsaCzhBMeJFka9XPzwrIKGiyLPjtp6LJPLt/v9D1uwrb9zEoQ4dmV4
	 ukGWoRqGyJ7sIBhGGe2qNqV5oCmu8csS/ghdWXmQ++7jEzt2xgya0DvYPBJlrldypD7g7
	 VrA4zJl6j3wJuMkrn1hn1vLQdF3Ij4v3ZuDIMyoHgBcNQa+iVPu2dh2qfY4k49S1vRdyt
	 nz5ehRLVlQZ5P8QIe9VIG6L2bR5t0687wU9yDcmqgWOb7VHznRgr+U7Q9wiPLyYWmfw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790095816;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=L54WmhjGXmDaVhmSOXBU6hp5F82rRmuF3MyApLBO2sQ=;
	b=Q2coadm9eu7yqe19SRQsfbGT7WsCZiSra/ww7l8Zpx3+1RLxIDk6de2gbR4B4Y6M9/RP
	 MEkS4CU2kMa+IfFRLqPUyIAAkh+2OzFmy5Irv0m0Z/C7LT3NvCC3cXvsKgi5jClfdq5VE
	 4LoiTzWHJsVN8sP5BoyxlQyo77pumHF5CiWU5qkS593bq6vFu4N12ZtctjsT62SThKcOA
	 fSdwSduwpzE9ZfiLYdf1jr9lIKeRMbBVJtjl3dFJCQiAzg8tFCp83is+VutXkVgr2iMLd
	 mA6T7JauvmfLZhM2A3J25H+aY1t7jsJCTy1t3EZCaU/QPtlf5wxj2n53F6IGBtHe5yA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790095816;
	bh=L54WmhjGXmDaVhmSOXBU6hp5F82rRmuF3MyApLBO2sQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=a7H+HdEUsG63JvmtkrGKK6cIlUIi/e6l8YwKqx0bNx1svkBuJGfMdD2P1EU97ApwI
	 DZVgaFbsSABgM4hF3j1C1zyRmRWD/3x1WgEDrP89vmHbe0Oc1nBJBnI9mqI/OSlT6b
	 Nf92KkT6Mn8yQSqakW3qGANj1XNSx+wYpUg4fSiURu5ZNWkNzupar2gXcrKWufPnwq
	 elWamsghBCV4K7jX4kGbKJ3uWkdx9aWW8u+KlDv/gXl3IEjQHY85AAnhH5AT8xvSAO
	 Uh0xIypB53n44vcfO/a+4HCfYAanXNEACKuathphCppTzfa3C8E8mtyvH1zGKIegFH
	 9A+nquH2y2mcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14A5E407C1;
	Tue, 22 Sep 2026 16:50:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D9777D1
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 16:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6F7940076
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 16:50:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Aetq5_RxFzOo for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 16:50:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org E9BD440068
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790095804;
 b=UoCuuySwgz3bJ18sNrq9uqYwhW67nwr+1jVryQ6avbBwtcHWdsGAsJs/3OhEKEJ0WPw7
 NCdfSoi/96A/g/nAv2zDaYIP0Kd/B4bDokGWWgow39FoWRxoPVfph4JQY6N8sCiTzNuUl
 /Hy+dcber3YyfecAN5xoIdIL72FvPdlcX1f7BLaO3+UFSZ0CJ9SKqxdmGbOZGGYcPLHTQ
 +i8iUoKC/Gr02wFpxHQpv6FyUVUd9dIReTUQj2TE67Jvhiycfo9fisnnB6prFv+tS3iLN
 wIkbYkU6vsiDMr58su+TIokNI2ujZhY+dC1ZMVXv33DUDqTZRLxXjlAxv/BHgRaEpdg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790095804;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Vm2M9TImPFKGbB9gvg6pKwBog/4167H2I/L5eONUCdg=;
 b=D0RvcoqQH2atvputkuEZt55XuF2qawz4N7hmFrnRUEvb14WccIc31wJTu+K4HQlmtBvu
 6Tf2lbofEPQwjuQLH3DqftilJmtsg5Nxc1Qm1EAklZiQEJfwnawUfjwfZrA6lDhZgzFuj
 gUmuCrHopBo7W8qVnturqdJByRxOthVksOcek/1ZPh5lOKJ1XOf1OPUWQxZCp/5J3Oy0D
 sxJbARLn/4xvWqGFnWC2OyEtRElSzSl1DfXHGe1qqeZ6xC+zKmt63Tw87Wck3Lnw+b/nw
 XFF4XDup5zhcAkcf+quM3/3/bjffDPYyH0zVRMA5Cn02hazGZR+CeCckdMIp+M5AD+w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E9BD440068
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 16:50:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8211D96E45; Tue, 22 Sep 2026 16:48:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Sep 2026 18:47:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b5ce8971bb8fa5cec8e02dfeb381554efb37dea0
X-Git-Newrev: f18c4dbdcee9e4b42406a3ef96dc2a38e947d810
X-Patchwork-Hint: ignore
Message-Id: <20260922164855.8211D96E45@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libhttpserver: bump to version
 2.0.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f18c4dbdcee9e4b42406a3ef96dc2a38e947d810
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Version 2.0.0 requires C++20 and GCC 11 or newer.

This major release changes the API exposed to applications. However,
the 0.x release series is end-of-life, so staying on version 0.19.0 is
not a viable option.

The build system detects GnuTLS through its headers and links to it
directly. Make this detection deterministic by following the
libmicrohttpd SSL option and adding the corresponding dependency.

https://github.com/etr/libhttpserver/releases/tag/2.0.0

Signed-off-by: Stephan Hoffmann <sho@relinux.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libhttpserver/Config.in          | 6 +++---
 package/libhttpserver/libhttpserver.hash | 2 +-
 package/libhttpserver/libhttpserver.mk   | 8 +++++++-
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/package/libhttpserver/Config.in b/package/libhttpserver/Config.in
index 3120059a08..88f3aa0a74 100644
--- a/package/libhttpserver/Config.in
+++ b/package/libhttpserver/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBHTTPSERVER
 	bool "libhttpserver"
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11 # C++20
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBMICROHTTPD
@@ -12,6 +12,6 @@ config BR2_PACKAGE_LIBHTTPSERVER
 
 	  https://github.com/etr/libhttpserver
 
-comment "libhttpserver needs a toolchain w/ C++, threads, gcc >= 7"
+comment "libhttpserver needs a toolchain w/ C++, threads, gcc >= 11"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_11
diff --git a/package/libhttpserver/libhttpserver.hash b/package/libhttpserver/libhttpserver.hash
index 03ebdc4a76..b6b1987464 100644
--- a/package/libhttpserver/libhttpserver.hash
+++ b/package/libhttpserver/libhttpserver.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  b108769ed68d72c58961c517ab16c3a64e4efdc4c45687723bb45bb9e04c5193  libhttpserver-0.19.0.tar.gz
+sha256  c44d67aba1e4b6767c0fbb895e1acd643601c1e3ee3de7705a59ed09bcd8c92e  libhttpserver-2.0.0.tar.gz
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING.LESSER
diff --git a/package/libhttpserver/libhttpserver.mk b/package/libhttpserver/libhttpserver.mk
index 54774e763b..7b7aedef0d 100644
--- a/package/libhttpserver/libhttpserver.mk
+++ b/package/libhttpserver/libhttpserver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHTTPSERVER_VERSION = 0.19.0
+LIBHTTPSERVER_VERSION = 2.0.0
 LIBHTTPSERVER_SITE = $(call github,etr,libhttpserver,$(LIBHTTPSERVER_VERSION))
 LIBHTTPSERVER_LICENSE = LGPL-2.1+
 LIBHTTPSERVER_LICENSE_FILES = COPYING.LESSER
@@ -15,4 +15,10 @@ LIBHTTPSERVER_CONF_OPTS = \
 LIBHTTPSERVER_AUTORECONF = YES
 LIBHTTPSERVER_DEPENDENCIES = libmicrohttpd
 
+ifeq ($(BR2_PACKAGE_LIBMICROHTTPD_SSL),y)
+LIBHTTPSERVER_DEPENDENCIES += gnutls
+else
+LIBHTTPSERVER_CONF_ENV += ac_cv_header_gnutls_gnutls_h=no
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
