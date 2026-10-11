Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 371BBCA9ECE
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 07:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75148810AC;
	Sun, 11 Oct 2026 07:06:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t4oBUY2L6Gcf; Sun, 11 Oct 2026 07:06:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0880281089
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791702402;
	b=mCbJjwB7vr9IHBgqy/8Rxan02nd208aMiAQVfhlO9c9JyG1WjvrDF4fB5I/+FbNxx4GW
	 JQfpIBGCRaNHi9h5Sn8rVoiVZLvOq60hZwoFIiUXgEjjwQBZoQb2WGWExqGXlH4CF36iW
	 KYd+R7eaZhF+hov/UIF6FyPavkpPkgxxpCDhyZhRfeibBc/gsRwyo9dKqePQPxXwW1LAY
	 CKV6fkaaT6pugD+fR+fYtD7akl+ISwqd7De52ocTTKgVwJ4SGR7uQd2gqTqIDuywguk5G
	 uL21NRlKovy7DQg85tNyeKsLpIkjkZuecsbGkNZrNpAXKeDgKdbhaiPjZwbSfH9+mHw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791702402;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=oAfHV+Gj2nyIth1tyMcU/AE1q9V6kduMJ/PySTijYmA=;
	b=jJu7EwWH9haMmo0c022yS01Sc1bFDetcY+Z4hnqTkHyDis/GjeXfCm9FJGCZBx/SishK
	 gq1JU8QzWliWdv0dWIJ5y783MMfefWmWvsL8IRu+1oJvBArulnWLSWFktRrEpLFqJs8pr
	 8zzLJS0eVvHih4LWGBx5fSMAVzJCatzuolFMWPXcgPjHxw8PMNyi47IGljQmQ8u6PvU9a
	 4JErHU0Ruo/bsDJO3glwu4btomnB/4NUQBVwTQf24B5bcD2R8bg0bVakDpgX4RKgI1ysi
	 GCAbnFd3UD51pGbVW+RbpqQQubWu6iCqa2jIFT60Gh3fu7GfglIK5iF9Iu3Fb8g7wrA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791702402;
	bh=oAfHV+Gj2nyIth1tyMcU/AE1q9V6kduMJ/PySTijYmA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DO6W7HYpmE8UMYevcFO4bE6+nyamiIaiVT/jLky19JgMMXkurn01D2OhjtLs1EB7z
	 9DS5M9gbmVb797a0EKrw/lQu3yvOsasqK70sP9Jr8WXyGnLyHvUbK4CLlCtc7gtrbU
	 tkH1gA63dwvxEEY8r2/2t+OZUp5LntNYy3H/cNbsudH5qvJcsQhv29VY7yqRPzm5xO
	 QC8AIBiFU6A4/oCRopuGtN7RN319XMcUfqpgtZr9rxffcj7G+ETucrIvOXB5z8jwkZ
	 mzeUsQzgspXNhtbDzJox52eY4e3H7n0ZAdFnYqDMQxeQXs2GhiO6aBQRjTbbmtckzU
	 XFQGtwKj92kWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0880281089;
	Sun, 11 Oct 2026 07:06:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 466221DE
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 07:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 28EF8606EF
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 07:06:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OIXFlyv4kA8n for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 07:06:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C24E060720
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791702396;
 b=mJCo8QjZD1v2kcaHD1mwd2UOF5JAa/x2ZkCiPDNaRatOEA8oggGHR019oR5KqLPfEOc6
 5tMiG6s+XtQLmZ1j8C8rTXwzQ9RLS5PiwFHBvpemGfEyaB1eymOt4AlRLdqN+w+uFHgKH
 4F88ojVatpKeT3iM7F+Jn++YyEUZaFVkjmeQN4ELguLBqmkZvxX4zsZ9aa8cFgKjpWqPT
 8YnHcf2ZqW7BjXF9m7YSG3uoNEfzgmH1m4UpMStuWBgju5GtZXVTKNB9iUlktx0VGFSQ0
 575/+eLuAi7H3fNIdjmrJ1ARWUZ+J3KrKQ5xEiw4wDuDGgG+MAnyuJMfsntMxVMMvDQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791702396;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=GBMT62lJp8dA1+/F2rtwTjGX/6+OzrVdI5wvMmpwrWU=;
 b=dB80IJ7ppGMr1ehLqDP/vLCjQZ7Nrs3SHe+93eWorUK4istDmWBbP+FpejISrDM+oy1I
 qAdkIgptV+6NqFp0zd5DfDR5MjUyuWoQO2YYkQODqZoYZpVkMyNndkgPv9bkk0azaBzBa
 huKbupQfCivAVepFQzVfNLpt2VsDQRuoCT1Dc5FhruWHTK1DmXm2pKn2tCBdOC5DXioyT
 3NkuyLn9G2OECwRk7BWLvhbhb+pggMNmeUKqJZ4zW2whNE3floTK7wlNPBMRgUUhgTyZ6
 w/hB5QEBYkXBJmhPI2HCqKZAmlmbsVm2UR/juTeGgf3asbIdhTgj8Tslv+cLvmrUvFQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C24E060720
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 07:06:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1A1AF8DFFA; Sun, 11 Oct 2026 07:05:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 09:06:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7e05cbe06e50dad5c0271a9b384c997aea445e95
X-Git-Newrev: 470faf4e6d75b1b55b766379f94912a493877948
X-Patchwork-Hint: ignore
Message-Id: <20261011070518.1A1AF8DFFA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/szip: remove package
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/470faf4e6d75b1b55b766379f94912a493877948
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

szip is not maintained upstream anymore: 2.1.1 is the last release,
there is no public repository, and the source is only available from
the HDF Group archive. Its license is not a standard open source one,
and the HDF Group itself recommends libaec as a replacement.

The package also fails to build with GCC >= 15 on non-glibc
toolchains, as only linux-gnu hosts get -ansi from szip's configure
and the code relies on pre-C23 empty parameter lists:

  rice.c:1323:15: error: too many arguments to function 'winner_ref_function'; expected 0, have 2

libaec provides libsz, a drop-in replacement with the same API and
soname, so select it through the legacy option.

Fixes:
  https://autobuild.buildroot.org/results/5e400d0e13480c58e8b1b0178bf7e5537dd31751

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy       |  9 +++++++++
 DEVELOPERS             |  3 ---
 package/Config.in      |  1 -
 package/szip/Config.in | 16 ----------------
 package/szip/szip.hash |  3 ---
 package/szip/szip.mk   | 13 -------------
 6 files changed, 9 insertions(+), 36 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 25eb19468a..97824f701f 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,15 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_PACKAGE_SZIP
+	bool "szip has been removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_LIBAEC
+	help
+	  The szip package has been removed, as it is no longer
+	  maintained upstream. libaec, which provides a drop-in
+	  replacement libsz library, has been selected instead.
+
 config BR2_PACKAGE_PYTHON3_2TO3
 	bool "python module 2to3 has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 0c03a503aa..657264a672 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -973,9 +973,6 @@ F:	package/imx-mkimage/
 N:	Erik Stromdahl <erik.stromdahl@gmail.com>
 F:	package/mxsldr/
 
-N:	Ernesto L. Williams Jr <realcontrols@gmail.com>
-F:	package/szip/
-
 N:	Esben Haabendal <esben@haabendal.dk>
 F:	package/python-kiwisolver/
 
diff --git a/package/Config.in b/package/Config.in
index c5806ad2a4..5773f33316 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1633,7 +1633,6 @@ menu "Compression and decompression"
 	source "package/minizip/Config.in"
 	source "package/minizip-zlib/Config.in"
 	source "package/snappy/Config.in"
-	source "package/szip/Config.in"
 	source "package/zchunk/Config.in"
 	source "package/zlib/Config.in"
 	source "package/zziplib/Config.in"
diff --git a/package/szip/Config.in b/package/szip/Config.in
deleted file mode 100644
index 5a24362f29..0000000000
--- a/package/szip/Config.in
+++ /dev/null
@@ -1,16 +0,0 @@
-config BR2_PACKAGE_SZIP
-	bool "szip"
-	help
-	  Szip is an implementation of the extended-Rice lossless
-	  compression algorithm.
-
-	  The Consultative Committee on Space Data Systems (CCSDS) has
-	  adopted the extended-Rice algorithm for international
-	  standards for space applications[1,6,7]. Szip is reported to
-	  provide fast and effective compression, specifically for the
-	  EOS data generated by the NASA Earth Observatory System
-	  (EOS)[1]. It was originally developed at University of New
-	  Mexico (UNM) and integrated with HDF4 by UNM researchers and
-	  developers.
-
-	  http://www.hdfgroup.org/doc_resource/SZIP
diff --git a/package/szip/szip.hash b/package/szip/szip.hash
deleted file mode 100644
index 5d3ee042f9..0000000000
--- a/package/szip/szip.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  21ee958b4f2d4be2c9cabfa5e1a94877043609ce86fde5f286f105f7ff84d412  szip-2.1.1.tar.gz
-sha256  98cc66747133b26563fefc4630ad4c8c7848c722c7b8a60ecd4afbc4c7d7eb01  COPYING
diff --git a/package/szip/szip.mk b/package/szip/szip.mk
deleted file mode 100644
index 869fc9c358..0000000000
--- a/package/szip/szip.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# szip
-#
-################################################################################
-
-SZIP_VERSION = 2.1.1
-SZIP_SITE = https://docs.hdfgroup.org/archive/support/ftp/lib-external/szip/$(SZIP_VERSION)/src
-SZIP_LICENSE = szip license
-SZIP_LICENSE_FILES = COPYING
-SZIP_INSTALL_STAGING = YES
-
-$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
