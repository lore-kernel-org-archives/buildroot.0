Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3936C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 12:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37DA380F8C;
	Sun, 20 Sep 2026 12:10:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2SKtMIymRhXT; Sun, 20 Sep 2026 12:10:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 4101E80F86
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789906198;
	b=FSmpbCfCcpH3HS2EWejbHdIajN5UBER3drpq7QMUAodDMwEdCj9PyU7lBKfDQSe4TyOe
	 7IaZIDzT5TVuyQT8FW0YT+SKADcymt1Mp3IRVJwQ/PpQXIxrraxaKbaISRkR+8hDrbWkW
	 BlRre8+BxCbzyU+nizBIJ2GDLzVJPjAr130/QwlQ86fc/JxZkQUANMrfcbOW6kQnP8GYB
	 1qjiA3Q6rvKiUK0bVALKxUIQ1ZH+KmdwQpg+LLRtTPPi9OHy7rLGEjoBoMizlIlXiyCMV
	 /L6xyycSd3cT5wIRaoyre20KsVMZJOYLVExAmbzVxTDOeEV8ed/HV6Fh9ddCFnDXznA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789906198;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=mjsfhBBvKtrji19C783Rx/NHsdCzfuqAtLWjzAwjDAY=;
	b=TucisYMD2/b1dEtGb02RwAwwTj7EPAit0wD09MxCOW/ItBhLI5j8hpt4bVU07QqoF5/N
	 B6E5sZrc9d11gJSPG4hK5fhuMC2pvPPHlPmjbKzW8bH+tF9miD+KME47QV1Df2IUkheFP
	 p7a69nibCY7OsdHNRqnNIo0T0PjbhYN8+xF7QtuL2gPrULHgVOE6R0vUS7k7MVuRCA1pE
	 o5HeL1wvvaV6cK8hJ9gDS+KmwxpqqwUGBFL5vxLUoJWnc6deYXMSsEaf0VS5/UjPgbNOy
	 1gXTVDkR4nEYoF0T2BY3XNgFawNRrEfILU4rPamYGGa13TNS6iBNP9/a3BkCy+aOvsA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789906198;
	bh=mjsfhBBvKtrji19C783Rx/NHsdCzfuqAtLWjzAwjDAY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EwPkEyXNAOrMsO887XP+lAwQFuBd9jHBa0nhuTgjp0mGoN6Ke0uSJbF9sAmiTM0F+
	 pTzUqxKOSBcnrGnJtA6jPLFr8KO/1ZaZbH+Q51ySsQC9etlpIC/PKwlonK3vJKTqGy
	 OhsnIStmTbBbrsxEO5BT6uTIcf28+2+MHAqCnZHpESnSHiD1vIenwK5HB2lWhKxxRR
	 o9HaSSkJ7kDvMH1APpYODmzz+RdaT7jOCRGZBt95wmllJaghx8Xm9YFDahLJ8YL4qx
	 xh/jAoU4NLIMSN/A0W+39VSBO2nWdi2H79gvieSWWKE10ZtcgSHTk+kV8jX71QCc7A
	 hXG7KkjfjkqPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4101E80F86;
	Sun, 20 Sep 2026 12:09:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 010A737A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE9F560624
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:09:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eypf2pUaU_Qj for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 12:09:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EFD126060E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789906196;
 b=nPSA48TbcYiwgRTOfsZ8YXcPzsYlbHcWYJiCBobiWAwZjaNDan4WyqpugUoCe5zWUY8R
 rx8if8I2Q/NGR9cCePtbHaVkrOAOXpkyijz/DrJrRFMNn+1BsPRpeXrYwuAo62OSlJk4V
 uxl3Uv0+4j9UVttcmkmRfxgT5DDIhT3SomGDfvJczGt9bAdMq6md8om5y3yHOmWl/sGkz
 wGr/FiglN81iz5cMX72lwunobqeUvbf+NxbIK/C4Ye4OqCxt9mWLrPjmy+yo7eGnJOMyK
 bY5bKp8QxsxK8Aq3NfTsQFhFF9b6nTL6eIjbOJ//d6v3SfXSyUgD+40yXoXINvgb2fQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789906196;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=8UdHEymb5F22RpnF7ts41sevJ+nbXUdPuFN4BGkJv8E=;
 b=qthlNIlmznkgwn9qbwDVKQrz3igOXo2TNeKyVsvVIJuoBl5qnQpZzG/CUu5CdOtm6F4P
 oTgqm43gOANM6NEMbMb/NENeHNyh3eh2IDhJGzlKkyLK8zGroADhL5ygjGgICZOJw5Phv
 HQRkGQxoWukLkU09/KeUKacb0CEjPiASkxNF56PS7xPakWWNdsFFAzq8A6+CIgeUH/JPq
 k+MwlEDPM8gEBrbeS/gD2pyXi+Ao+5nsB9Jy0DWv7uKxv8QdYPn3WlHCAHckegBXOjsOO
 EmX/Ye4p41NeCvmWstWZawB6ISFI3JF1JLr3iNY7PSoeOsWUTebd63wVSiPckDJ1IMg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EFD126060E
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 12:09:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B04D78D764; Sun, 20 Sep 2026 12:08:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 14:09:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d1bc4bddb4e021e5912f1d8263a5e71a4941df61
X-Git-Newrev: 1380791af28bbec6aef9394c0c5184c1f9ba40d9
X-Patchwork-Hint: ignore
Message-Id: <20260920120847.B04D78D764@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdeflate: bump version to 1.26
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1380791af28bbec6aef9394c0c5184c1f9ba40d9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/ebiggers/libdeflate/blob/v1.26/NEWS.md

Switched to sha256 tarball hash provided by upstream.

Depends on gcc >= 4.8 because "libdeflate now requires a C11 compiler":
https://github.com/ebiggers/libdeflate/commit/a7cbb2258188cd459e436b0c0a1e4b892e2b1ac7

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libdeflate/Config.in       | 4 ++++
 package/libdeflate/libdeflate.hash | 3 ++-
 package/libdeflate/libdeflate.mk   | 2 +-
 package/tiff/Config.in             | 4 ++++
 4 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/libdeflate/Config.in b/package/libdeflate/Config.in
index d2fb0d6c55..462ab02d14 100644
--- a/package/libdeflate/Config.in
+++ b/package/libdeflate/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_LIBDEFLATE
 	bool "libdeflate"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C11
 	help
 	  Libdeflate is a heavily optimized library for DEFLATE/zlib/
 	  gzip compression and decompression
 
 	  https://github.com/ebiggers/libdeflate
+
+comment "libdeflate needs a toolchain w/ gcc >= 4.8"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
diff --git a/package/libdeflate/libdeflate.hash b/package/libdeflate/libdeflate.hash
index 24aad4a799..851926182f 100644
--- a/package/libdeflate/libdeflate.hash
+++ b/package/libdeflate/libdeflate.hash
@@ -1,3 +1,4 @@
+# From https://github.com/ebiggers/libdeflate/releases/tag/v1.26
+sha256  125856d4656e0feab660f94842f835923410c9281fedbcee64598c918da42b5a  libdeflate-1.26.tar.gz
 # Locally computed
-sha256  fed5cd22f00f30cc4c2e5329f94e2b8a901df9fa45ee255cb70e2b0b42344477  libdeflate-1.25.tar.gz
 sha256  4ad69099cb4374836fd27583d9991e2838cd86b6e4666ab26b2d32582c91e73a  COPYING
diff --git a/package/libdeflate/libdeflate.mk b/package/libdeflate/libdeflate.mk
index 889e04c97b..a0b99cbf23 100644
--- a/package/libdeflate/libdeflate.mk
+++ b/package/libdeflate/libdeflate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDEFLATE_VERSION = 1.25
+LIBDEFLATE_VERSION = 1.26
 LIBDEFLATE_SITE = https://github.com/ebiggers/libdeflate/releases/download/v$(LIBDEFLATE_VERSION)
 LIBDEFLATE_LICENSE = MIT
 LIBDEFLATE_LICENSE_FILES = COPYING
diff --git a/package/tiff/Config.in b/package/tiff/Config.in
index d357d08406..ff5bbd2355 100644
--- a/package/tiff/Config.in
+++ b/package/tiff/Config.in
@@ -13,9 +13,13 @@ config BR2_PACKAGE_TIFF_CCITT
 
 config BR2_PACKAGE_TIFF_LIBDEFLATE
 	bool "Libdeflate usage (still requires Zlib)"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # libdeflate
 	select BR2_PACKAGE_LIBDEFLATE
 	select BR2_PACKAGE_TIFF_ZLIB
 
+comment "libdeflate usage needs a toolchain w/ gcc >= 4.8"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
 config BR2_PACKAGE_TIFF_PACKBITS
 	bool "Macintosh PackBits algorithm"
 	default y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
