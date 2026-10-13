Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19613CC6B08
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 09:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC447605F4;
	Tue, 13 Oct 2026 09:55:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pugRIXFNm51I; Tue, 13 Oct 2026 09:55:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C26E260688
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791885321;
	b=qgmJ4C3XQELyMSGT5wspsM+bdjvcVAzvpMvmOtyYfsIJDm+KV0OwIgcT04C2QvdEGNbk
	 edYksdKOzFc0J9JUMYS841sIARDlAMgTbq1f8GePJtJ6NMT7yCZGQvMV1Gt8R4mBo9U1u
	 Mj4RwFljYd9yEml83AnqDjMNyErm4vMS89uK5Fi83tq240scSOviCe8VlqM2tWpAhYs9r
	 sILelZAZFjRZGnbqGvskgDERnuoF/goVg6RtapFMYY9SBLEagw2srifknD0BE8cAH1Qx6
	 InHohGw3zZ7Ox83s5gC19xHRx3jKjW8dgSjtxdWLZ6TzVqNnGDpeLp+hMaWj1KHRr1Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791885321;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=90oFnx6IJNs+x5qDsQX9pSlRgodv5rLavN23SSoedqU=;
	b=YPg2o1cFVErRcgHf8VfhdOv+rewW4H/YurSYIez2zHJ/e26X9tCMBewFO92h0s5sUCp1
	 hklB4ZzPzh3prYekFeKTUxK8RY7BVGx+n/koFPGPZBGTSQfyk1sGqWKp2OJT9ei2cWHpL
	 cleStxhUNqI9owYSeE1pZ7d7XHsuQu4VqLFdQrcoJqjt8BhshGoE2bDysMV3U3CYR6FN7
	 KGbAz6krAQrzgFUDCRmcAehWeRRnt4NghkXKgUNHZ3vrZhQhOQa6uTIbdwJpBHNuQ9/9/
	 +jh1IoFAM5e2fS9IvfNT9NhnlJm5vk6AmIW1aU3Po6+bc1DViy2AaFsQCz8cB5xA9hA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791885321;
	bh=90oFnx6IJNs+x5qDsQX9pSlRgodv5rLavN23SSoedqU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=B1dfDKbTIpXtTRefyVAcRcpur+qpgCgojzpWrdoh9mKj4Cvt26u8wQ4LLw7lSxagl
	 2GCUlUojm7qUyoDl43yqOKmWVjFehttbvOy01Trv0AFTOju/lCsHHLhkkBW/Jhktiw
	 E9CBtp/p/W/9NKXmS49PHE4mkQT0Si4bnLd2v5E9ICHIcGJMzcliFSIod7bI4JFL4y
	 BveujPTjrMgh0UP3j+kwQjNhx1LPGaZ69+ZxPHKpr1z489rweaWPQGkCM1kkQph9sh
	 VR0+WL1VjKJS+6HZ4AslLx3DR0WGt1tYtwFubPe1Uw6u3t5M1Xf13haMYUY2Iuu/E/
	 d68N4q48dNTbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C26E260688;
	Tue, 13 Oct 2026 09:55:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D187C235
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7776606F5
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:55:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9mkuEpopTyrb for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 09:55:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E5995605F4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791885318;
 b=f2+uuHDD5KHFwtt8Wnn3cftqFBxHtf3Up78dHjPInYIAox1gkNKNQjXf/NZQHGgGKN+r
 NZIq3eTH4cXEQwetSQ2jD7C5bP4lC4MmdKxx8fIWfjCgwZC9WqC4Si8EIZcRtSXS8u45c
 +Pfkiltm148TtqK6R1UYOJQQ0lojYsgdR9m07maIFU/GX0DTtUGzBMxCsyeQjaGIuvmVd
 M+xbc8o9Gnm6+6TqTC/uislzqzEr0vfDrYgZnEWD1Th7nBZzzR+NjTQa1yAP2lLn7vveO
 QTDn+WP9lHJpUm0G+IY857t5cP5iSBJRZOFSCT3HonmI1OkdEXdHoZibQeiUJm4J6Xg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791885318;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=8as6hISZ2TspaeU/wS8/7rAfHu0189Ifo6CJxFvLNHs=;
 b=Tzm7895naPNiSjU8ZfhtBs0OATjsVDC7Zyo6k+bCsYVLOyktZ182RGjYfq77euLTtfUz
 w+I7ye14YixRoLHipjFVRtOkFmF353ur0FIyvHO8u6SvxRJOaXphyTC1LPFg7R55erSiw
 AuwaOPBgHiU21EkEVaOg8KbTFa3Md1NxH10gK5YMXhPzonPrpFH3CGUc35hzJUK+/DMLT
 5ew6WfEE22z/xjcimqBvqopV7244F9dQnrzHP4eplNbwVbI3202eXhnvrc1TXEVLSsFsG
 eC7KAjPEmDyfOpzcmrfXkwqbxH6KYceQ0MtyxJ5w+5Wgn7bscNJPK7DZb9Sg0X9DNzA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5995605F4
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:55:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C3F0954E0; Tue, 13 Oct 2026 09:53:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 11:51:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ed97dccd60a964cf437e7acbff5d869000beaaf8
X-Git-Newrev: 1de1477752be6330f78db14c02456dad2c2bf473
X-Patchwork-Hint: ignore
Message-Id: <20261013095359.4C3F0954E0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libuhttpd: bump to version 3.14.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1de1477752be6330f78db14c02456dad2c2bf473
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This release updates the bundled ssl library, which adds support for
Mbed TLS 4.x and OpenSSL 4.0, and fixes HTTPS connections that should be
closed being kept open.

Drop the patch, as it is included in this release.

Release notes: https://github.com/zhaojh329/libuhttpd/releases/tag/v3.14.3

Use the sha256 hash provided by upstream.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-fix-cmake-required-minimum-version.patch  | 34 ----------------------
 package/libuhttpd/libuhttpd.hash                   |  5 ++--
 package/libuhttpd/libuhttpd.mk                     |  2 +-
 3 files changed, 4 insertions(+), 37 deletions(-)

diff --git a/package/libuhttpd/0001-fix-cmake-required-minimum-version.patch b/package/libuhttpd/0001-fix-cmake-required-minimum-version.patch
deleted file mode 100644
index 097a44cf85..0000000000
--- a/package/libuhttpd/0001-fix-cmake-required-minimum-version.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From b9bf3936b3778912444eff7f7866db1d66f4c50b Mon Sep 17 00:00:00 2001
-From: Thomas Perale <perale.thomas@gmail.com>
-Date: Sun, 6 Jul 2025 20:14:31 +0200
-Subject: [PATCH] fix: cmake required minimum version
-
-When trying to compile the project with CMake 4 the following error
-shows up:
-
-CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
-  Compatibility with CMake < 3.5 has been removed from CMake.
-
-This commit bump the minimum required cmake version to meet the needs of
-CMake v4.
-
-For more information see:
-  - https://cmake.org/cmake/help/latest/release/4.0.html#deprecated-and-removed-features
-
-Upstream: https://github.com/zhaojh329/libuhttpd/commit/b9bf3936b3778912444eff7f7866db1d66f4c50b
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 6719e5f..0392f25 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.0)
-+cmake_minimum_required(VERSION 3.5)
- 
- project(libuhttpd C)
- 
diff --git a/package/libuhttpd/libuhttpd.hash b/package/libuhttpd/libuhttpd.hash
index 7f0ecc0030..d1c003058b 100644
--- a/package/libuhttpd/libuhttpd.hash
+++ b/package/libuhttpd/libuhttpd.hash
@@ -1,3 +1,4 @@
-# Locally calculated
-sha256  ce2abbc599a922c4bac12f1cdf3e9c9740f387f819a54ca01e9fed60905baa40  libuhttpd-3.14.2.tar.gz
+# From https://github.com/zhaojh329/libuhttpd/releases/tag/v3.14.3
+sha256  ba54b06e63da50e493531bc342624195668c2ec8215f37b66f00f83f1e260297  libuhttpd-3.14.3.tar.gz
+# Locally computed
 sha256  99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
diff --git a/package/libuhttpd/libuhttpd.mk b/package/libuhttpd/libuhttpd.mk
index dca26fc3c0..7932ccc2ad 100644
--- a/package/libuhttpd/libuhttpd.mk
+++ b/package/libuhttpd/libuhttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUHTTPD_VERSION = 3.14.2
+LIBUHTTPD_VERSION = 3.14.3
 LIBUHTTPD_SITE = https://github.com/zhaojh329/libuhttpd/releases/download/v$(LIBUHTTPD_VERSION)
 LIBUHTTPD_LICENSE = MIT
 LIBUHTTPD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
