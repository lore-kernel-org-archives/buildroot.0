Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D33C5AC67
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 10:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A42C40744;
	Sat,  8 Aug 2026 10:36:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MIC-zkto03wY; Sat,  8 Aug 2026 10:36:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0029140743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786185400;
	bh=RtjCq5g2IUfuDy1Zpe/GUV0me6wWfnwY656xE1rm/RY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YfgPzm/s2G+wt+SFkcEN34vROHpKFm9NjBRhXd/4p1UCGaep0hRotMvavCgv4OGgW
	 sXw/p/c3ndJLUDCzqVUaFxNYeR088BRNqwj7+dyVO947I/phiflnIO2t8T56n9PYtA
	 uu5P6HIi7N30tw3DuyLAMiSZs7yVH1s0u1bh5p3MHNnPSR3S72fQ2AvyxyDOGJXbyX
	 pEM0utLB5mPMrIYVnKguu39Ghh4DTivXCCDpFbfBYQdDGzxhnRMSqdAO7j9N/bhSjc
	 UFF65ZgpwPKf842AQpxzRY2LCBVdcc17FgtGEJGBwDKqkOwDv8V1u3Kw50N4xszavs
	 PYiyY9c4aOQkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0029140743;
	Sat,  8 Aug 2026 10:36:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 29368296
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 10:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E6C540743
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 10:36:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 80eM2hxP58u6 for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 10:36:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 37ED840742
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37ED840742
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 37ED840742
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 10:36:35 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0bda.dip0.t-ipconnect.de [91.58.11.218])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 08FA0A4C4961;
 Sat,  8 Aug 2026 12:36:32 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33260)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wsePo-0000000010p-34h9;
 Sat, 08 Aug 2026 10:36:32 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  8 Aug 2026 12:36:30 +0200
Message-ID: <20260808103632.3547378-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1786185393;
 bh=B5M4AKpe+gxlpjPM6ZERYs9uvnET2ykuqTTOli42V/c=;
 h=From:To:Cc:Subject:Date:From;
 b=VniQojV4SK9OBh1c3tY4LdC7hEEKXjQIt0tusHjw4Q4Nmge0Rm1zqHqWJTdUwrQzR
 hOrwGpz8qus7NcvHnnKggQYYasWebyMzhklyxcbVUnZO1FabV1ScTdts/YaOWKoDL9
 p4w9jkVZGzcWcBJFIwfK33bFciUghjwhrhfuWM7fiZZcCsc90fsI0SciV23XbDrpbO
 8E3hPfshkuQ2pZn6PnRqmCk/42oE+1yNWB6ZN4eMWRPp0MEOvOh1o2ELTnfSOcBD5W
 SLZI8dP/FPJys6meEY1NdayvkoRKu3gFjxoQcIP0ErvzQdprm+xgW8TAJooAHwX06d
 oxkUcppVpEp6Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=VniQojV4
Subject: [Buildroot] [PATCH v2 1/2] package/{glibc,
 localedef}: move to Gitlab mirror repo
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

Downloading from sourceware.org/git/glibc.git causes many 429 errors
these days so we switch to the upstream Gitlab mirror:
https://sourceware.org/glibc/wiki/GlibcGit#Fetching_The_Repository

Fixes:
https://autobuild.buildroot.net/results/09e/09e760063607b1cbf4ef687bf9bbe17b12d648b2/
https://autobuild.buildroot.net/results/22a/22afc952e0c05648d538d13ea593e5ad8c4c03c7/
https://autobuild.buildroot.net/results/281/28159f29e38b0475ae33fe73a9cab04ea3a8835f/
https://autobuild.buildroot.net/results/961/9616d46c46bd2a10a6e719d76ed6e1d8e3b3d0d2/
https://autobuild.buildroot.net/results/fd4/fd48fb96639871889fb2238dba360d1740d7962c/
https://autobuild.buildroot.net/results/91a/91a0b7ccad116911f84281b4cbcb080309ad952e/
https://autobuild.buildroot.net/results/17f/17ff61f0eac946b3c027a540147b2573e224dcdb/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: switched to gitlab.com (Julien)

Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/commits/233e242a9c29d806b130ddde63b8ff2cfa52f853

 package/glibc/glibc.mk         | 2 +-
 package/localedef/localedef.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 5aa2ef5f99..797df314e9 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -8,7 +8,7 @@
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
 GLIBC_VERSION = 2.43-45-gdae425b554207f7c4599c7fac707ad4c08545674
-GLIBC_SITE = https://sourceware.org/git/glibc.git
+GLIBC_SITE = https://gitlab.com/gnutools/glibc.git
 GLIBC_SITE_METHOD = git
 
 GLIBC_LICENSE = GPL-2.0+ (programs), LGPL-2.1+, BSD-3-Clause, MIT (library)
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 732ed6d4ad..8eff7f136d 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -9,7 +9,7 @@
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 LOCALEDEF_VERSION = 2.43-45-gdae425b554207f7c4599c7fac707ad4c08545674
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
-LOCALEDEF_SITE = https://sourceware.org/git/glibc.git
+LOCALEDEF_SITE = https://gitlab.com/gnutools/glibc.git
 LOCALEDEF_SITE_METHOD = git
 HOST_LOCALEDEF_DL_SUBDIR = glibc
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
