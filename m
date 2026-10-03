Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D9FCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 16:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C6E180FAA;
	Sat,  3 Oct 2026 16:26:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j5jxC9FhT7Uw; Sat,  3 Oct 2026 16:26:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org ABFEB80F8C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791044785;
	b=qW1CxigEEu6bXO1RAJmSDdGnDrwPSOMlITt4Io45U+/qQsHMRWqVMJkPhcsmZggtYP7a
	 bHtjRD4GaXsAFGunSxuPyY74KOk3rSafMJ1ebj0y8tu1dot09sxS3J5Y9yeM1TZ5Pt7nl
	 XRVhwBjT8TjJwpT17jDyiGfslU5pLxNCreO+7V4kth0b8rtDvgj26lt6bqaizq9Bje6EA
	 8/EaiNViJrd4bHbDwUyflRtwPSNHDtk12xRxG9bSLv0gp1vB6KvnxReQZ1JZgyqyOtQMo
	 B6g9qeu/LUHVgHcKOPYTwsJJq0Kh26v1+c9dNkdSISGq4byl+nr/oSe93i4eRBuBCgQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791044785;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=g4wGZbTKxaaSDjf/pp13hHSFpHhWLoU69HbItCcP1Rk=;
	b=Kw1pWMI33s6uhcQCA2tef6Re2xCN9qSP18k+kYi0UWk0RKu4A9iIYACoipXl2lEWQbxL
	 86n9idc5r7o0UlnGRn+rvABkPVPQR0/nix+zGuw8KNp760tVRNkbeXrH5b1Blz2GwIQV+
	 ePl8pLuazo2BUx3xQb6xtJfm0YX302xUs9+Jo8QZwoAsSaadUc5Hg/Bv8EMBHY7bEt2EC
	 vPD6unB8asCk0nu6F0lJwqUsSdYLpabsSRNew1vHyJrhNKzFxoNZEczNi/L+ig9g4ppjd
	 QqjfZ4WQHI3COWt4itbylMHAM0BNQEbOgf9378dwCW0SPyYvXqMS41zI+VKOrwuI0wA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791044785;
	bh=g4wGZbTKxaaSDjf/pp13hHSFpHhWLoU69HbItCcP1Rk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EMIfKObpDLLym2WNBYiGRz6oiqxRZh+Uq+Nh7IXqXsawZNmLFx6mnnQ3dGTgcfbog
	 r57NqMi7wJY0jxL3g35yr/Bdoa15wsXhJ4jd0f9FRqwOKXWeOcrdRGMWQPNeAXAwXI
	 GPT4/sMrv48ovhcaXmX8U0Qn+sNMTy1HDHzBoabNQvhrx0dr6ZI9sGGsji3ApQ6TKg
	 k5Gfn+VS+GGtsTwZmL6r1YYxPZqU9v8LbwNYKAgg1jCWw9X0Qt/ZVFFusyBS3YmjH0
	 xvPBzHmpU9O4i5zSEt6IUpKKKPGRlskADoiU7WdlXcFssZhTTeV68Q0vV5kkuCl9zA
	 rrtDNVhvlNoYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABFEB80F8C;
	Sat,  3 Oct 2026 16:26:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E0862E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FD4240048
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:26:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v1_FyrtLB49o for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 16:26:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org D301040024
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791044783;
 b=FcrGVVMvItUkdlk65KzbiCLj3E3YMNq6eIBvvsPx8SvisgWtE9M2rvmOheZQZZzAQeCA
 LRpHey/EPKQXTuBoBGW6UTVx7LkVc9lwgWgtnypQYwxnvNvTUD9tMRKh6yuomqn6ScrJ8
 keTS+3g0t1m7ZOMJ5YWCrD+i+21rRNxbsTyoZJsETE5xCYMJOaz2Mthiui/5VBka2K+am
 IO+rd9Ir4RZtTrRFbcxAlzskzUl1h/yzCsGezBN9wB/Kzx8Ra0//lCaRqmZQ3qrzBheUQ
 kQ1qo33jFZePXx03fZoS1RTVWuTYUCDFvFJiowv89nqBvJGMH7Fkrk3WK5eGYGsWxxg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791044783;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=p99//aGetm51qqu8KDNfgHWY6keJwN51tQLdJd3NZn0=;
 b=h9uI2LLCyhAARMF5gZj7YxumJyrm1yQQKibWaIMTBRFHr6Oa6tGKRyB/3RtSrwUmGFR3
 +WEBT4pixy/bN8P+97yZ1tWzyCiIWVtfiVP7/rz6P869+mZsMQHTLpe0MpEECD8wiszH4
 CVnKoFJ8wz6kxU3zBr4nDszeX9XCZYNI+RJS34fh2oFntnn/6XWSSaUTiO0P5+02JWLqh
 WJIQa2au6BC0xVQ6S8XU2WEu05C7Wh1L83qvjfUsKGUSosiUBxX639trhTGdHfkrzxgBS
 DjMsGm0fzfXkPDC48TaTrS6rtvR6Lr5PIfkzP2EnoEMRlvSY3KHkoL7HJJgDoGXAJJw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D301040024
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:26:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0B6AE8B447; Sat,  3 Oct 2026 16:25:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 18:24:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f6c2c6a086ae1a5857f99514324ebf4038dab31a
X-Git-Newrev: 4e6cd0c6156fe6f098fb78a64579956e98bd98e6
X-Patchwork-Hint: ignore
Message-Id: <20261003162509.0B6AE8B447@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/coreutils: bump version to 6.12
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4e6cd0c6156fe6f098fb78a64579956e98bd98e6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

- bump version to 6.12 (for details see [1] and [2])
- remove 'utils_cv_localtime_cache' configure option as removed with
  upstream commit [3]

[1] https://lists.gnu.org/archive/html/coreutils-announce/2026-04/msg00000.html
[2] https://lists.gnu.org/archive/html/coreutils-announce/2026-09/msg00000.html
[3] https://cgit.git.savannah.gnu.org/cgit/coreutils.git/commit/?id=b64f9bfe4fd4ce5d276626fd149af2a625b6d434

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/coreutils/coreutils.hash | 2 +-
 package/coreutils/coreutils.mk   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/coreutils/coreutils.hash b/package/coreutils/coreutils.hash
index ce507a3015..3b14acef3d 100644
--- a/package/coreutils/coreutils.hash
+++ b/package/coreutils/coreutils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  16535a9adf0b10037364e2d612aad3d9f4eca3a344949ced74d12faf4bd51d25  coreutils-9.10.tar.xz
+sha256  a480198559733e9b3da999e90543ac6f888a2caa544d8d664c5a1f17e528e210  coreutils-9.12.tar.xz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 01c0cc72f1..b5fa968dad 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-COREUTILS_VERSION = 9.10
+COREUTILS_VERSION = 9.12
 COREUTILS_SITE = $(BR2_GNU_MIRROR)/coreutils
 COREUTILS_SOURCE = coreutils-$(COREUTILS_VERSION).tar.xz
 COREUTILS_LICENSE = GPL-3.0+
@@ -51,7 +51,6 @@ COREUTILS_CONF_ENV = ac_cv_c_restrict=no \
 	gl_cv_func_working_utimes=yes \
 	gl_cv_macro_MB_CUR_MAX_good=yes \
 	gl_cv_have_proc_uptime=yes \
-	utils_cv_localtime_cache=no \
 	PERL=missing \
 	MAKEINFO=true \
 	INSTALL_PROGRAM=$(INSTALL)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
