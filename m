Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FDB4C98318
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:59:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 235D3411A1;
	Thu, 24 Sep 2026 18:59:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IR_zhZQSIpqT; Thu, 24 Sep 2026 18:59:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 662E3411B2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276374;
	b=R7IjqWZ66PTq+oaciYmBmMZvHldqASCzQZUXKFNVdL/VMTclnWgE2btdLgBDqlRUAETA
	 0wrznPiYkUopJrrbKlDsyFHqkTFZLkYKdSDtiFB6Pmq49Mwwu70rsGdlDBTBJ/R88IGhq
	 g252S5+z/v3wR2jcyaz+PPpcbQ+P7DEMqAi7s6FfTtE4Lc87ELdSc8avAxonQcbfy5uWZ
	 V+LkQxhXDHF9WEViGy4Tr4MWQ0hxbDpFW+h6/3Dqq3emY3Aieyv6I5DQ2knLB6T8GfRM3
	 vQBpbBJWnnzKvKVZxqIaryWYDgfqiZBoWTusrBpecwpVXvE961RZM+Jv4HPEV/xxxNA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276374;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=XUZh6sRpaJ29ENUETiiC7A/2Zc/9hstEZ2mPcMkuDuo=;
	b=eJ9Ezpmro5FzQQsBGgwfUXkg4FN8hOO9hc58KLaScml8vdfx9NaE7CQa47rDDw98FMX3
	 A+2b1XjuZ7oPOrgUPQGdt9LfRBFaK3yZxJXlMyJRecPcLreDV2dpWyRelmGWX1hiW+Mjc
	 zc3YtHXsxEJ49C4052dH0EjveLesaYaX4sDAUvZySFIBN6brzY7XyGwTiitei35MtkuJu
	 FE0L8kfZpCqjJsJSUxFkZ8ic94m21WGbcUi+D2kmnLnjM/ujjNnazSdI00Sw0k0yOWi0F
	 z4RxBquRuboz0JQnQZkvMHnJtL1uFCL0YtEfRooJrwO9EXHTrFv3KjqyugL93b+PH4g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276374;
	bh=XUZh6sRpaJ29ENUETiiC7A/2Zc/9hstEZ2mPcMkuDuo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QLgVlqzzZGpXtM3zHpZDGQaqfKEieuT+CmBvkd09r9QHl6N5WgEbwdmHZZLhBv9UJ
	 P+NjefAFpUx6UOI4byhZRQHmJg3kU+GjEvKpVnmPpmjkkrVP/EuW4+xkeKB9KfOKKa
	 RwGbFpu4Vy7Nijp3WdoH5brU8Z+cThIJy5ltv1UZb1K7UnW5fQESCUH+FYRP2iotji
	 svzaNQpAwObHbujgaG8TrDu0pmq4Y34N2TRMiTh3aFj9OkdpIV9StkL+gngEHSlz7D
	 t5os6ESBW3492Gkv7ZoWZwY/IUeLzon7iEwTy8+BhbfnSREEOCkH5+tAw1oYWlHCmI
	 tmdhoK1wUhuUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 662E3411B2;
	Thu, 24 Sep 2026 18:59:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 33737431
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F97981069
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l_Z0BTmInRKa for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0830E8121E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276213;
 b=kFoRIBdSI5BZ2kaHTXqCAwe95AezQyKEANunmxYRiBvBTEWQBiH61K8QOhv+1pxPnE0l
 W/QgdA5RvlJqjZG/P15NVMixJ0hTxzo7U3HqwN9mcS/AVtIopOowqTzZQB/lv/SauPQgJ
 jJDYeSG3f3HIJLcdmJVFsxnnos2Dv5WA3VRDSYXmA92dj5y7d88C+uRcd5/nPJ9axXZIx
 uzo9mwbDJaFt9qR//RBvah5fJBZs3/MBAslq+5vkqWl49BZP0CCDnN+9SucH3wvmnQA8a
 GAldDgSPMZF3BYCfv3ACTAnvuLsxcglBLl2tWnQT+8szmOegyzbvXBPoy5PP6cass5w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276213;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=yWiyk0sRekLRzApl5OBnvM+iK9+36NsVTjls+VttVOI=;
 b=CnUP3qSg1xMBta+m0HRvJxl0HtI6o4GZsVZFu9FkWTNl4dkVeIietJk7TLOw2fb1UGoK
 BotTeAorhIoRpuV1+Rky2MjCuk5ZYJyzCjUD0aigoQf8l8hlLesnTX5oGcDxxrkAV0ASr
 9BP8xO/RGA48tdtPPYbYz/DFehz3XN9uEiXd9e2WJ4zwxaKhJVRyHtbe9UOGAh6hbUS1z
 QdgNX5JVaO5LxtN8UUKqXYx91XVA42QAYtq01WB/SlZ4CuSldGioVZBa49jdBOpnDf+uy
 8pfowfxYPty92dUo6LjfsPm2czVbz1YTe7LB1BGFATJUR2tQEzpVDG7ptrQxHNYkVvA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0830E8121E
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9FE3998323; Thu, 24 Sep 2026 18:55:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:21:59 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 4a383ac0c2124d29440c21d4ad5b098e52131cd6
X-Git-Newrev: 6ba2f6c7454f17eab32df0b6e7724ceb21e4c8a6
X-Patchwork-Hint: ignore
Message-Id: <20260924185542.9FE3998323@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/libabseil-cpp:
 disable for the MIPS n32 ABI
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
Content-Type: multipart/mixed; boundary="===============9189385131903154430=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9189385131903154430==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6ba2f6c7454f17eab32df0b6e7724ceb21e4c8a6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

absl::base_internal::DirectMmap() only implements mmap() via mmap2 for
the o32 ABI on MIPS:

    #if ... (defined(__mips__) && _MIPS_SIM == _MIPS_SIM_ABI32) || ...

With the n32 ABI, the "remaining 64-bit architectures" fallback is
selected instead, which fails to build because long is 32-bit there:

    absl/base/internal/direct_mmap.h: In function 'void* absl::lts_20260107::base_internal::DirectMmap(void*, size_t, int, int, int, off_t)':
    absl/base/internal/direct_mmap.h:130:39: error: static assertion failed: Platform is not 64-bit
      130 |   static_assert(sizeof(unsigned long) == 8, "Platform is not 64-bit");
          |                 ~~~~~~~~~~~~~~~~~~~~~~^~~~
    absl/base/internal/direct_mmap.h:130:39: note: the comparison reduces to '(4 == 8)'

direct_mmap.h is included by absl/base/internal/low_level_alloc.cc and
absl/base/internal/poison.cc, which are always built, so the failure is
unconditional. Upstream abseil has no support for the n32 ABI, so
disable the package for that ABI.

Since n32 is the default ABI for BR2_mips64/BR2_mips64el, this affects
every mips64 build that does not explicitly select n64. The o32
(BR2_MIPS_OABI32) and n64 (BR2_MIPS_NABI64) ABIs are unaffected, and all
in-tree mips64 defconfigs use n64.

For the LTS maintainers: the ABI list in direct_mmap.h is identical in
abseil 20200225 (the version in tree when the arch dependencies were
introduced) and in the current 20260817.0, so the failure has existed
ever since mips64 was allowed. It is still reproduced on all maintained
branches, e.g.:

    2026.02.x https://autobuild.buildroot.net/results/5818407a73cfd3371cd1f726a24df6ceb9afa42d/
    2025.02.x https://autobuild.buildroot.net/results/5065bda3b91bdbee53559dd97af8ab5a63a1e112/

so a backport is needed there.

Fixes: ae0557403a3a4cbf5354f0ab1784a08623382e5e ("package/libabseil-cpp: add BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS")
Fixes:
https://autobuild.buildroot.net/results/f375584f3721d61238b9e43d9926e037802f6141/

Assisted-by: Claude:claude-opus-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 263cfb165e7e3c95ebbac7def2a8729ff0271bcd)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libabseil-cpp/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libabseil-cpp/Config.in b/package/libabseil-cpp/Config.in
index 6bbe9518b2..773791ce3c 100644
--- a/package/libabseil-cpp/Config.in
+++ b/package/libabseil-cpp/Config.in
@@ -14,6 +14,10 @@ config BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	default y if BR2_sparc || BR2_sparc64
 	default y if BR2_x86_64
 	depends on BR2_TOOLCHAIN_HAS_UCONTEXT
+	# absl/base/internal/direct_mmap.h only implements DirectMmap()
+	# with mmap2 for the o32 ABI on MIPS, and its 64-bit fallback
+	# fails to build with the n32 ABI, where long is 32-bit
+	depends on !BR2_MIPS_NABI32
 
 config BR2_PACKAGE_LIBABSEIL_CPP
 	bool "libabseil-cpp"

--===============9189385131903154430==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9189385131903154430==--
