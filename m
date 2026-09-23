Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C06AC98318
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:57:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3294040C9A;
	Thu, 24 Sep 2026 18:57:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ufYaEaMENwVH; Thu, 24 Sep 2026 18:57:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A554E40CC3
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276248;
	b=QYcI5ULci7J3Y437Tp0+Kc2qWzMHPYvdfoj4hPCohIKpBy1bRq2aYVuvrj33CQsV+ODR
	 jeYUe2GeRvchq3KUHbSUcTxwNqFdf42okX4RKZRTeVedzZ3pT6zyCoKEQ/wGi+8HlpB1B
	 MfX5QEBoZ1iN68OpjCIeleQmhto8rf0ECrD2o0WFtHXZ5/2ky9bSZ4g0w/hbdrI5fBlQY
	 o/g/XvmHgCi9AsR7KjfELY+vZ6aBnrjgNmwUr6rjyZCLHmuxG9I0jgHkiGEo7tECVUye7
	 ZMJ/PUhqktLjYMJaIrWds+TMFS2dAHvl38CJaGa3um0ZuJ8JeeRFTBCQPdbQWY0sSWg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276248;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=7Du4bU1hjabgoAYe/3EqKqaFQN0n+Hkg2kbi6MisWbg=;
	b=dUGP3C0lo916LkTUv1Wo3I1y1E3Pp0rPN6Ngho31xhxIfjmFbWNoTEPNtF6ABtHNVZyy
	 wAYJqWtKuE/4KXM0KwP1rkH/uQEa/S0YHWX18i51TtEHVW8tGSD/VYJzOyHIR2+2osAiu
	 zBqzbgjiqkMMFKPxmaWxraAHdyeEIYw049GaIlgxNcnY8kSl6odLnt02/0fWLDquUYBvv
	 X4S4gIxPYJgGnSqJz9GQoXb8UUEPgmDVJG8SAcsuL4jrRoDvk2o9oAvcgNqcAWtynFh6b
	 6OqxPuT2sxo/wlvvuewLP1FrmQcmEtcCTcFUL0xLErDSWBbQcoWyUI2Oo15gLhgYgQQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276248;
	bh=7Du4bU1hjabgoAYe/3EqKqaFQN0n+Hkg2kbi6MisWbg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=g7HlcaliD5li7eK2imcbKUFK0BYi2XelZTajTAstSE7s+CmFuKayR/RQ4TI2jR6O6
	 EWpgpFGNg2e5iOnhhah75/AsuQqOgP9UPvddLPrjDWA811Yq0jBo4i02b0Y3eqWxmo
	 rtiGSX6ukwzAxi3Rl5c78L90Owg2NHadOibt8BdUUCNSUCYQ5BA3+KmACtW8gcLepK
	 X7oOQePqwC+eokS5/EtzSn0N+QxJ6/No51Bfw7/7KmYYPLqH/ABauD97yG9JRFmfkX
	 lLrRTghnvSYpSeyXNXka8EWwkJQk2TOkpXtsQy2IYT7akU+ZjLPW4seBzTIesbgS+Q
	 N/PLcqwd0v7XQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A554E40CC3;
	Thu, 24 Sep 2026 18:57:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A2537332
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 936D040ACE
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5w8NOl75uo8o for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5635740AA7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276203;
 b=g5dCZuL9i7hMmWe2yTFNdfN/DP7rbv1GrVCfxOe3z6IIYTv4JSOtNBxeFzYzvS1zeE8y
 d0bGGg4c9VnzWSuZsscakiW0x/mIQ0QGs9eyrppd/C/3P9NSTcLswZVQ6GdApIKZcmt8c
 QyDvghjaL+o/w0cVAM0GWOxfuDoy2n1Ka+Gf3/ny2R29/yotTkYrtcv7Tdj6znX4Pl7Ql
 w9Sw3hI4UAHgE7eqc+/Z4irXCuAGhgRYy+jbFMzx5JnmyXnuMJwuvGPBpIdGdjGKR6xhy
 xuc12GSgRttKrPBkovrYxyjzNSO3tKLQwqTsLavj3MeYRBdQPafh0DFsEQr7c4iJqng==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276203;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=v7G69iB7Mf9F8I4HpZzdoZxrHZuk0zrG3slN/bUFykU=;
 b=pMH6ugo5kkgGXKNZGnvI8TqN7e562FWWd9IpenIaMM7nxFo7Q53+ZSCqjUOfixoW04Kc
 f9jExn1LxyJpKKc3fQp++N3DRl4gJLcU+xMxokOIJKgLexaQu6qgV/UxeamC8Sqg7MmNK
 Xo5RmmbwWy9lS7/punjjvHwMl8ksosUldqjHiBxYBMBywRsit5OQ+VbuUeIrsgT79JxAH
 SaXXK3X8LOJRpNC5SP57KPqa55zS61AWeCft3DeAVNAukJNaczjAelpRyAqNVV+wjjSnc
 OnmiO1k071eN6YipIjIsqMK5SCB+uWj+RKE3lzxdAkgwyMKUwlc+CNHzgBHS3c5Iufg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5635740AA7
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EEE6798361; Thu, 24 Sep 2026 18:55:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:14:26 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: eb53f3e00aeed08fee2e4babd9e7d1fcf4e61947
X-Git-Newrev: 09d589ff35c9904ca678becf74e7c6b77967cc3e
X-Patchwork-Hint: ignore
Message-Id: <20260924185532.EEE6798361@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/bind: security
 bump version to 9.20.29
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3541141712548965715=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3541141712548965715==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/09d589ff35c9904ca678becf74e7c6b77967cc3e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://downloads.isc.org/isc/bind9/9.20.29/doc/arm/html/notes.html#notes-for-bind-9-20-28
"The BIND 9.20.28 release was withdrawn after the discovery of a
 regression in it during pre-release testing."

https://downloads.isc.org/isc/bind9/9.20.29/doc/arm/html/notes.html#notes-for-bind-9-20-29
https://downloads.isc.org/isc/bind9/9.20.29/doc/arm/html/changelog.html
https://seclists.org/oss-sec/2026/q3/801

Fixes CVE-2026-19033, CVE-2026-19662, CVE-2026-19666, CVE-2026-19667,
CVE-2026-19668, CVE-2026-19941, CVE-2026-75029, CVE-2026-76163,
CVE-2026-77119, CVE-2026-77692, CVE-2026-78301, CVE-2026-80274,
CVE-2026-81563 & CVE-2026-81736.

Raise the minimum gcc version to 8 to fix a build error found by the
Gitlab pipelines which would be introduced by this bump due to upstream
commit:
https://gitlab.isc.org/isc-projects/bind9/-/commit/a891e7423379e69340e5004a753dc121320ef244

opensslrsa_link.c:53:51: error: initializer element is not constant
 static const unsigned int rsa_max_modulus_bytes = (rsa_max_modulus_bits + 7) /

make[1]: *** [package/pkg-generic.mk:273:
 /builds/bkuhls/buildroot/br-test-pkg/bootlin-aarch64-glibc-old/build/bind-9.20.29/.stamp_built]
 Error 2

According to https://stackoverflow.com/a/67000730 the code needs gcc 8.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6c781be5062dacab1e1e943df9f2887eef351782)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/bind/Config.in | 6 +++---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/bind/Config.in b/package/bind/Config.in
index 4eb024b260..7e691a35ca 100644
--- a/package/bind/Config.in
+++ b/package/bind/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_BIND
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
 	depends on BR2_INSTALL_LIBSTDCPP # liburcu
 	depends on !BR2_STATIC_LIBS # libuv
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libuv
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS # liburcu
 	select BR2_PACKAGE_LIBCAP
 	select BR2_PACKAGE_LIBURCU
@@ -48,9 +48,9 @@ config BR2_PACKAGE_BIND_TOOLS
 
 endif
 
-comment "bind needs a toolchain w/ NPTL, dynamic library, C++, gcc >= 4.9"
+comment "bind needs a toolchain w/ NPTL, dynamic library, C++, gcc >= 8"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
-		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_8
diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 2131f51978..8129fa2d2b 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.20.27/bind-9.20.27.tar.xz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.20.27/bind-9.20.29.tar.xz.asc
 # with key 706B6C28620E76F91D11F7DF510A642A06C52CEC
-sha256  145ab7a50b33a06d9d488b5e668c887e754f42acf8954e2b5dc7e238b080e4a0  bind-9.20.27.tar.xz
+sha256  587029508b3b1b43229fae416c97e5543aba45809cefaca98a5004a02a5736c1  bind-9.20.29.tar.xz
 sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 2b42e87d62..a05ef6c362 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.20.27
+BIND_VERSION = 9.20.29
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_INSTALL_STAGING = YES

--===============3541141712548965715==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3541141712548965715==--
