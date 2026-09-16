Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A01C982DA
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:06:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A209160DA8;
	Fri, 18 Sep 2026 13:06:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e6rqRs3mD79U; Fri, 18 Sep 2026 13:06:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EA8E760E1A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736813;
	b=oXvHF0I9RbxNp5cLS4MSWZ95/15i3QhjKMJt0WB848qFC6qnZytbBV2uaypL6Bs0rxKV
	 oVL1eK4N1nBhzi9ihDYEiskNWE6P3Wvu9ItX4jDW7pU6sU6E8LLhjwlqsrOVfUFxaGf8C
	 Ez9Vum5LESZyFvnJpsSaIXlMOrBZxSwHXwpw2BKfh448bJYcgVg+kKDLvhBbkBla/q0NH
	 OUdbmIDlGXOFLsWj2rBBlpRRyx5dUgggEZneN1LpHqnkaVuuBLomdOKSt2MHoHvHv0aoE
	 AmujD8nMAM00HiDJKoSUhKMMtbfs0Pi9pDDxg0zGxKOFZewVkC/SLyqy5CbFtxdGPuw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736813;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=0chausbV53iL3r/GcjwvT+Xqn7M5lH7d5wL7Ej4Rzig=;
	b=LaLFTAc+uMfzlmWGwZ1xCDJ0LnPfSxiYN6hsRIx6lNjVJKR7bRu3ZbG7w4YGVB2bsLfW
	 +lpXw6CY5QmRUSCwDyAXqj1eOoNQwQBlg1EoFtpXZ+616wy+sXRsxFBdG3DD829wsapZa
	 d8MIdSHj6y+f135EwusCLXEbRwpnkp1qUCr2BtyH/yzRlyaCWPMQbKn3YqJP96Ypq+VM8
	 Yy22th0Bqw0upMjDQ37uB/Dqml0HqSrCwLSGCd5AnYMxgdilJP6n4jA7QLG2h26oUZ51J
	 sLq+O3QmiE6NtOZ8j4l7ko2ylhfZ8va/5m5nLqTcGiP1Ida2SPSPKjhIs++If7KRMTw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736813;
	bh=0chausbV53iL3r/GcjwvT+Xqn7M5lH7d5wL7Ej4Rzig=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nL+uJr6i9x0B8HJzISVwvxuH3oap4f46za8rO7/leZaOo9fsAWJUepqwwLUB230Ik
	 hpwFDJg1g+twCM7unfKQMHS9SFAfmTp81Sw+Wk7gmDrlGbCOjIzAjO8gaWJnO0YOfr
	 Hkj/cLllWwVmTPjJmeShk22I/FmJMKXKP3uRLnVorLUipYsQBcVJqixTgcgLkY2Zs7
	 dcrSGR7/GWJKNd8dJR2KaWO54syrDP5lpypfJ4nLhlZ8kChMigKklBq0Wnp6r35qKe
	 RI1Gu2FbeNZ7qCRlitdIlDhvkWmtL627t44Im12Cie+9RPevIBVAv85nD3ZV/x4n9h
	 HIaD5Z8gSvzZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA8E760E1A;
	Fri, 18 Sep 2026 13:06:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E49442D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2031F81293
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l3VmJ_oNzqbg for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:06:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6E5F48124D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736811;
 b=etKw9HUpRSs4nJQOqjC6qPIt9bfvKigueRUyWK3dr4O09KJqieCSS7SlxlvK37N2RmBu
 jsfs/V49vOSgni1I2rbs+hu6gSbly62VVuUVwIBV9otUGVPuYkBhkZCwPFrGdBDLHnrPP
 X3NYixnbyB9KAxSlJHDzsTxQFUMhRA/WXTM9/EWeKYlGp4FNvTNpS315EalffqIT7xZXD
 fjpBJ6JYl8WpjeBKnVYCktd7mm7N4giz7Pl53hyfmySFwJYZKXV0WZe66iz22G0/mLq0+
 izIRvw/UyEugG9BzfVWHPRB6qDJ6LndR5OBa91QG40GwbEzlIRPijB8t4jKeOszgceQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736811;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=uIMRNjD6jHZKGym76DjUBMOYAnw5eZC2GDLq/1H2tg8=;
 b=r5+wDbURcd08YAIhQpbey0/jcIKUI0BEk6+ZKqx5kgqy4rjSbGJv1b07KUgFXelRBGg2
 TVYQrYTUvdbum+uaCshcNqoZnrJ6IMKf9k1FjnEtqNgYtR/xUp7GxwPjwVC2RTwL56kJM
 skFu/kLj8PiG9uG1OtYhrcH2aB0sn+KTRZVnqTRjgnc0LYsouR6z+WlzivOpehFO8nR38
 YERBjy6NWWNcXIm3fEm7M1fFi+hJIYPQF04eM9BxVSmdnjC3cBaEA7S8KRFUusNTsH+Vo
 xtCharCIizxLuuC7sMseeoRDwu7DdIGZcG1v8IAlVgLXEHGHefn4hm87E/h5sW1DPUQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E5F48124D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2688F97698; Fri, 18 Sep 2026 13:05:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 10:24:55 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: f9a1db7994a97dd30f5d1191ddc68279f64eedb8
X-Git-Newrev: fc11b65ca9799f76154048c24623f359cc2439e0
X-Patchwork-Hint: ignore
Message-Id: <20260918130544.2688F97698@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/i2pd: needs gcc
 >= 8
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fc11b65ca9799f76154048c24623f359cc2439e0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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
(cherry picked from commit a6bb4d52c0f5bbd6fe27f023ecdf2326cc0f03ff)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
