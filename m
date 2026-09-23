Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20039C9830E
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:57:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2A2240AE4;
	Thu, 24 Sep 2026 18:57:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fM1Iy9QxdQrU; Thu, 24 Sep 2026 18:57:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A00AC40CB5
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276261;
	b=VCYEBqqHli5fABd/5Ctcqx74aw1rpWQ3dM2wHF65BWDTYmsNyT/Ux6ZVXMNCgf2CnsdT
	 JaeGfO1jT8JDLJ8ucr0takk/gz2vIP4yR0So/ZCqiSUFMAvPvr8B9xfbgh5+ZTYk2i0Rn
	 X75vV+VobMzsUWE+u2+pbxerIgpX4AvY6ftmkka2WpgLBrMPy4oOzrpV7OFr0aMHfiMdh
	 CDpyiUFBlPoWd/8YscHCt4KU3fRg4Zh/4wM1eG6GYxl+FsmKzP/AbHmUQn6ORwxPqhSP1
	 P2XGQnwRQ8VR9grD/nQm4mLTuxlsMlQL/3VuaxqrIwvy/Q5TA70ajGxuifN2m1VOWFg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276261;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=ZOYyhBT6abyAC+C4ke+gaHgqu26MiP7v5HlfmAmYHSM=;
	b=C9d4UxEngvh6LHSttf8s+O5nYvlkvUvyTFcEKoEtuIkC0ydd+0Ky/UM6UNRwokgf6/Zp
	 gi+IqYABSrIsQD36FUAb9CyaTF37SiP8vqqMutj8ocFl169F44TqhR7sJ9Gm8TlmUFoOc
	 3OoIeSszjeKBhA6WJC0G10+xs8X2o7/csFsyfIphWQq63SO3K7RKFBbjEA8kku6jmir7S
	 jVUUTpWdmyQp+PfwptVdASkNUNcUVyZKlquKyXtBqf4fuEFOQLdVzQzWsBQX1FlcTcTGW
	 ZHl101KnOIuSR4jxDTpnL6Y2xGTt3m90bkKaDsb34iloltjlw1uOv/kHBQ6TgVnKx/Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276261;
	bh=ZOYyhBT6abyAC+C4ke+gaHgqu26MiP7v5HlfmAmYHSM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dKsgJt2ZwQTxUKeCAUjrk0IrmQEiG6aSB+HAoeCffaH9960Jmic/yLu1gC3EyyKIL
	 XVI3SlagEUPiGg7udoTbsaW50f7EgvKCSnQ86mSD0t6neamNPV6o3EETTJ/70MkbFm
	 Gs0xDUXVQdU9UCvotfvM9ZDD8OgkN+aACBnBH2GiqSS2rMsQwhwzNDpxMYxAhoXSD+
	 laiBgXKb0QjcEgqbnI+KrFE8Nfz79vl8Y81HiDYhrKNPmEMAdpJN7jKVqmPnawbSrn
	 RUpbyWOTVsxrvlAIbj06vJEq3hBOQsUkWRBCDo+ckleWO6js1lTlfrd/+HN4RCicio
	 NZaynMVz9+e9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A00AC40CB5;
	Thu, 24 Sep 2026 18:57:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D9B7D328
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB7F040AC9
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id to7q5vAnDJw0 for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 41E8140AB6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276204;
 b=LD6fQnYN+dE/F+4BXDnUVMtIXhZZRkMql8w/EG5IK5ZDKitYRYkk/8jqnNJ9pbTsaYk/
 iqG2LjlFmpKYADgr5ju4j2vMYN6SvI3Sfa1+sGqxYDnnl5SyF1g55FnVtn8dbBd0zaG1u
 KfeilOtUdzitPZ/dNRqfDzFdak1m13sg2v+9Yl6ZBZ35JT4uADtlpq6dUwVTO0BdIDG3K
 ibMGY2HFF59igjLJHeu9mKj1sn+BjX6ujsQaWPASkKAEeKvtHIlUjTK5MtB5S35RrSwh+
 XB7RZdG4unzmEaNF4WoL1V7S7ejrrQoN7Lc0U/ySUBF7Kv57FK/upb+9tDgdYldbEJA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276204;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=uuyPRoZVdXI4dcHno0P0cajddJcJW5eajXDO6Z33Vhc=;
 b=NCCvMYpzDoA06LgBI23KNPr+crl7YCuHrzauyC16slAYwUg+CtzIR87CgbAjv0JiDoiG
 0UPCwCEq3WKB0qaxkm70xm/nprelxFFfDqy63eVchofwM0gPw8lcPorWgyvZRC9LzXYY+
 8vGPGjm973kDREVhyP5Df7gzO9ph5UKdcKlkDbu5xRlZ6Lb5tpztBiOWpFU/C8OeDhU7h
 dLbmi5nFmlnUoaK+VHsMrLJQsYOy+ZvZJ2ElFpZUtdcDHjEjBsjb59eHnxqGeMS1UlmJg
 yJb9dHNsaUVnXKGoDOibfXBHiJArh5o+fGnCmWC+C0frtKc/xTsa6DioWyf2qpdM7+g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41E8140AB6
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D8D7A98383; Thu, 24 Sep 2026 18:55:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:21:57 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 9f12591982c2990578c983c9141258b67ac76f7d
X-Git-Newrev: ac1ca473b5ed87e996dabd214dc1334ea07bd5f3
X-Patchwork-Hint: ignore
Message-Id: <20260924185533.D8D7A98383@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libabseil-cpp:
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
Content-Type: multipart/mixed; boundary="===============5185582388026096264=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5185582388026096264==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ac1ca473b5ed87e996dabd214dc1334ea07bd5f3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
index 7b65ec40d0..0750dc5495 100644
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

--===============5185582388026096264==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5185582388026096264==--
