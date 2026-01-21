Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 658BAC44501
	for <buildroot@archiver.kernel.org>; Wed, 21 Jan 2026 09:16:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E99B611D7;
	Wed, 21 Jan 2026 09:16:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hBflfXZtvELp; Wed, 21 Jan 2026 09:16:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D1B5611D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768986989;
	bh=5twKUGzDalJ5N2qSlIXKePvItsZZKLVAHHO4jWFNdRI=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DNq3cifcWvDkzksRqyWIAA7MreSnAZcXdaJ+ljKUtXJiFWpDOK8ZtP/jfWIDNvzQ6
	 56lKHbSt+9/pA59XYrf5AjG0QPX+Egp3d3iN4fBmsEKznHyrPYmkmfSms+RDot/iQx
	 T6bHOvIgdH+8kRH3Ng4aCCQ41hbTtuhCqI9WcMw1k0YdQ2IcuisKw66/i/SS2x8q5r
	 TqiorPKgwYDb2B0yZDMvpyBdXeYJFXXnbiFnZyOQ7DZQnxXvJ6cnFR7CpZMsCdpPMI
	 6UxrZVQbJewy/lJEKfEvwLoE+zftw4jUzOk5uptXePdPPNprZoiqyrzsA1oDaIBzl/
	 YOnAxLXBaFbAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D1B5611D8;
	Wed, 21 Jan 2026 09:16:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 190E6160
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 09:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFD4240E87
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 09:16:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ai5nr_JYg3-8 for <buildroot@buildroot.org>;
 Wed, 21 Jan 2026 09:16:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1B81740D0E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B81740D0E
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1B81740D0E
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 09:16:25 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id A4F2C31E0B54; Wed, 21 Jan 2026 10:16:21 +0100 (CET)
Date: Wed, 21 Jan 2026 10:16:21 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aXCZZRkyVbbN8ou4@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.63+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1768986981; bh=UIOMmPgxXmbpTNE6u5eixJlvubq3F2zRw3S1Gy0+52g=;
 h=Date:From:To:Subject:From;
 b=OxQovNev4jG6+6ADsGCGyt0Hh/RyHZNPSp/5SFgYoXzCRmKly+zsD+Kc2vsX6B3p1
 qi6/APB2DVpFeRCo+dUSp7tw9qF6yQwmLgaQ6lYWPB3h0zzst1/rzPhypFc8HQ4vv8
 FZuXV+7kzLsQCnqD99Ekt84IcHswX32D28jXuK4G2V3UEPPe1W7Cw+ba+euDOWFsjE
 2v13a9V00CM0rc3ykU7oYzcSGeKTyLIfNUpqAI0dvf6rXt0yMmgewtyaKxrc5lrvPD
 dfKXHd9o/8hmHeIsTlpPV8ZXgktQnlNRIBBZZQEXsLSJj+v5xOu+w+Zt4g/O/xF8BV
 ih0ackugC0sxg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=OxQovNev
Subject: [Buildroot] [PATCH] package/{glibc,
 localedef}: security update for 2.42
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

Fixes following CVE's:
CVE-2025-15281
CVE-2026-0861
CVE-2026-0915

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
Should be backported to stable branches.
---
 package/glibc/glibc.hash       | 2 +-
 package/glibc/glibc.mk         | 2 +-
 package/localedef/localedef.mk | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 538f8b69a7..a58bb7b9a7 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  a364a548ebda9c570f5bf62bf5e4ad3240a90056455b9edfbf1472a7254bd1c0  glibc-2.42-3-gbc13db73937730401d592b33092db6df806d193e.tar.gz
+sha256  f63ffa06cd17ee8ff891f6de41de6e189b96edc6b2be2807ae597291f4464388  glibc-2.42-51-gcbf39c26b25801e9bc88499b4fd361ac172d4125.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 9c3ff7124e..e3453b8cc2 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.42-3-gbc13db73937730401d592b33092db6df806d193e
+GLIBC_VERSION = 2.42-51-gcbf39c26b25801e9bc88499b4fd361ac172d4125
 
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index c34fe22b5e..254a79026a 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.42-3-gbc13db73937730401d592b33092db6df806d193e
+LOCALEDEF_VERSION = 2.42-51-gcbf39c26b25801e9bc88499b4fd361ac172d4125
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
 LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
 HOST_LOCALEDEF_DL_SUBDIR = glibc
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
