Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C9EC79FB7
	for <buildroot@archiver.kernel.org>; Wed,  9 Sep 2026 13:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B36280DBB;
	Wed,  9 Sep 2026 13:47:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1-JwsQbQkAre; Wed,  9 Sep 2026 13:46:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 30CF680D81
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788961619;
	b=bNjlC7NLR2zMGcYK+k5//3s/xhp+zYmqU7jXsHz4jtuI6NJnFhvFMYm3eS8uYerY00u/
	 U9C2c+IJb9WYi1hyngcEJNsULJ7cA05TZCkdy6rQT1eVyOnxlEHZpe5bQv0AHskC7ohQe
	 Z+lAJGJF7f9w3uYzrAdCsivHgj25oYpVNUDtifd0dhNXa5t3f4fZHDTnI+gqryYa4pcXA
	 8/pTusPGDbaPY6gQvJ81uQKZ+dM0P6/d+HzIHa6PlNMYSguQO/lH5UX6tkaAz4+TzsWnw
	 2kp59mxsL4DjXXDHe1J1rOkxIaGJdvYdBxJMJRdpySIzx8SfvLsnGeCAoFErqOJIjUQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788961619;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=vsbduKfVzOJfMrAfcrLsBoEd16MPTWiIGVakJrPb0O0=;
	b=eyNyk80ARkHhRBobrea4VbnaRXKbA5rjJHRLJV1/rjvJ7Q506y3N9z3RkjYjgkA3yzMo
	 vunqD65zgcd2CoOVqIaBRwJI05yjtTwhEFRAxapNihHlXH9+BJ+Dm8nJKh8zTIMFX29nz
	 jiJxwShHtwPPb2mnYCSPSDjZWkSN2DlOH4ktrOYD/OPbMvReU7Gm84xWdfGiHn2+P/T24
	 GBqRTRj28OtuvAI9ztKcVqc4erOSAQ8MAnJz+Ct2JByTSOnXwjzuO7hfw2jGvNe6ooZqn
	 +d363yugpDPxcmDKgutBijDCkBKJdKV32Z2VWXt6fDrvjnVT+KRtvabpYPl+TajsyFQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788961619;
	bh=vsbduKfVzOJfMrAfcrLsBoEd16MPTWiIGVakJrPb0O0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CqORIu76bHXnCTZLozDNnNf+u4piVKg/G4sIWxosLIvmosuQylAsxqKtxkpFw7sbY
	 VElQfhZLcrRaCkNH/bHvT2FWnL34GgR6axNB9zcTkJmxC5MH028dHCtb68AQK40u1l
	 NwPO5+SF5OvXPnaqj30nScZXCAS5DmO343Qos3K3xyETSDU7lbnjEByO4YB7hOOiOi
	 +snw2GeTgV8ANFcKGqz5ccHwBt4/8SSelwsHECybCTPuoteo9V0iqRIrrcMgtOZ4eH
	 aNCSpdhknCmmEeVg3lIRa82h1trxLTTj5h9PQR6rQhvnJp96hHMbA+WAcaLAkFOcdt
	 8IBLedniu1Sbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30CF680D81;
	Wed,  9 Sep 2026 13:46:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 68D7C970
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 13:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D28B80D81
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 13:46:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UxJfVtwc0WEo for <buildroot@buildroot.org>;
 Wed,  9 Sep 2026 13:46:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 836E880C63
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788961615;
 b=amxsLksRyp4tHEgmgSxIc8rpv2HIPHnBqUBwNsvuj/hksJU8GvlXef2M02lmWTC63xuh
 B8MZLtRKa8533GGVtuvnsIJLNjqgjiaEbUSZu41UWwzV20JhMRQVGS6W3tN1h3HnP1fmQ
 rdiu7bc942prWF8HDTt/vyYx4vxKb+Ync1d9yGM6JgC+kLNtiFJpCVtktsYtAmpmmuoc6
 Q0GAgPbycpNC7LmA1y6QVJZjtWfl4oB26Y9NP2SwZyRCqir+wFWgMZuN3+A2tkebzCUtC
 5fb8MsSZgZUVQj4vl+6C1SJMDpIjaox4pYm0qe4pqpxDpsFYIoPOeqjWr2xQ65Sy/Kw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788961615;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=MjGaYu6kQGThDQ2e7jxWfBYwXv7i3fbOQVd9ssXSZGo=;
 b=lavEJCLYXueiAh0PqRM6CJ/tO+EkBMbmcAyxv2nv2PoS5bN4folI8pd/EFUsiRIB/okI
 YrF3l/3F2sDKw4lpKOs+FvZnnrXLIxwa4L8k9+dmWKUjpyowDCVynKSqF5SSP1RsZQ/XY
 oTxw9ZEOALw6MbI8YiLGrfBmsWlo5q+CgbvxDZyomEoDzbUEchuagYkGsS2mMBBix22ck
 bGsokMKMycdxSb4pDHi/D0tVhvHYlirsgfGyuZDGrBRYpE/YG83llW5czI29LiAM5JT5D
 Oyfd2GKfwpA76PTY+T/GSt/Q70tuM6cZbHRMTOAcbGuK+7lzOdSQCRAWmk9nzQaAHAw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 836E880C63
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 13:46:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 71980954CE; Wed,  9 Sep 2026 13:45:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 9 Sep 2026 15:45:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eeec7b495f6b6127f0cf7020674f7853814a6d06
X-Git-Newrev: a6bb4d52c0f5bbd6fe27f023ecdf2326cc0f03ff
X-Patchwork-Hint: ignore
Message-Id: <20260909134552.71980954CE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/i2pd: needs gcc >= 8
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a6bb4d52c0f5bbd6fe27f023ecdf2326cc0f03ff
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Upstream started using std::string_view
https://github.com/search?q=repo%3APurpleI2P%2Fi2pd+string_view&type=commits&s=committer-date&o=asc

with commit
https://github.com/PurpleI2P/i2pd/commit/a3e0b3710c66b854eee33d7532cbe262e9a72ba0

first released in version 2.54.0 which was added to buildroot with
commit dea4f02bbb24b2125df6f4aa7a4b301a2316ef06.

Building the package with the gcc6-based defconfig
bootlin-aarch64-glibc-old is broken:

/builds/bkuhls/buildroot/br-test-pkg/bootlin-aarch64-glibc-old/build/i2pd-2.61.0/libi2pd/Base.h:14:23:
 fatal error: string_view: No such file or directory

BR2_TOOLCHAIN_HAS_GCC_BUG_64735 can be removed as well now as it depends
on gcc < 7.

A backport to LTS branches should be considered.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/i2pd/Config.in | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/package/i2pd/Config.in b/package/i2pd/Config.in
index cb6f7894ea..fc2f3b9367 100644
--- a/package/i2pd/Config.in
+++ b/package/i2pd/Config.in
@@ -1,13 +1,13 @@
 config BR2_PACKAGE_I2PD
 	bool "i2pd"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # string_view
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	# pthread_condattr_setclock
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # boost
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
@@ -24,15 +24,10 @@ config BR2_PACKAGE_I2PD
 
 	  http://i2pd.website
 
-comment "i2pd needs a toolchain w/ C++, NPTL, wchar"
+comment "i2pd needs a toolchain w/ C++, gcc >= 8, NPTL, wchar"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_USE_WCHAR
-
-comment "i2pd needs exception_ptr"
-	depends on BR2_USE_MMU
-	depends on BR2_TOOLCHAIN_HAS_ATOMIC
-	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
