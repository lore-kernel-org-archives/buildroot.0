Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD30C88E75
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 07:37:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB00680DCF;
	Fri, 18 Sep 2026 07:37:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EzldkcP_6BxG; Fri, 18 Sep 2026 07:37:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C14BC80DD3
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789717032;
	b=nGTnLZWV2H21i4tsl6xIapS7NkZh+rd79AFBvGx8dTDEhmZMVOPQW7rZdyuhADPYbw2x
	 pO9bPdbIFZgvPM+4cVIijHg5VmaY1nqdr4jLCa6DEVmjfr+YuRgs0tQOrA/3gCVqO0qYm
	 XykT4iMFRo5/ThLio1LQCJboAZo9G+OalMmrMpAD2yO3ZUxl6fAviMCc01eQoEgN1XKbn
	 y7U7+SMgSTRtWsnnc2nZC8VWQqyapK/W5Mg7Rxa7ukVWi4nTk0LD3uY0IKFG9BqX/G+2A
	 e2oufgEp8w1ri3MiAuaYg7nGumX8Uv7jNm8yq+UzGZelCIJ9CVERi8YHoQrOryzfTpA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789717032;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=GqZ47DM6NndWS33S94yf096UMaZ0uvrt36gL/OaoKTs=;
	b=T6u7hwQFrBTCnbU1m4zTu/rz9XW+k5scSZPNxUzWaoh0II8et1vpprDFBw6+m3KshMPV
	 tz2jyItj8zBjANldDmlqwxszjcK0BPlxDIoc1E9I/CZukKdQJ8d/Dy2T9zFXW5DbIA33E
	 SWKFqXHnDGHQGLbvm+KWaUVTocqRJOEV/SPZasNGHcYVhPUUflRJ8hnnW6Vg9nkHA1d22
	 Kc0dqbqimizIiR8KUrCX8JAPiOkv+S6wR+OiFbXVdBQdJ8v88Ut14TndDeDK1f37tsoWF
	 KOLzIemejev11anXxlIibE1DL4uYkWD6be2oh7rub0MoaAoBfMiwhCh8G1qy/qVhnug==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789717032;
	bh=GqZ47DM6NndWS33S94yf096UMaZ0uvrt36gL/OaoKTs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ITJ0N1j0Of3kCJfEBhowQ1uoOKP6q2oO46zVHUNQ35yShHnnz6nbwOg9sFJm1KWWM
	 qRjAmsv6ZXxefExJOVbapEZkIzuQkLaS2dzkPMhHYUbcc0PjKwf02gUjF58vHfcBwD
	 D8uaFk5EVHBl4FD42nnLgYVN1kbsPlhCGbC8/UvkdKRU73a2OCM8nCCaulueEpUYaZ
	 GlRI8vaJRnzk4EMHrfpquR5IMZu4x2Fm+8mTPlRHEzzDX5DSn8YPE2ATNChVxGkZ5O
	 24eGvmLDfHt2QmFH7sdMUT2xNEORZGTfEhr5upbfCIjzlY/bz9G/Rm3Iq+PaoWc5L5
	 xiVzFXhgv1e2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C14BC80DD3;
	Fri, 18 Sep 2026 07:37:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 70F62352
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 07:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56AC040B05
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 07:37:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id llg02DMrQ7sP for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 07:37:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 931AD40B04
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789717029;
 b=r1BZFoKQ2rVV5sg8M/QWYSOXDfeaC12NsahI05vdDoDUSkluvgttiVYuvuWGCpgzFcLI
 8ZAgvrglHsT1XdRzt50xJ04GXfiTQN/TgLZQ5RmtRKEXy3vd/DudSjjvRO91nhuQd89Ef
 Y8/Rx8uAChUyA5UlODiRnfRj21LVes3x2mXMxipSmA1GaM7/7iS2OrVpSZZBywF63cfPg
 onfDpXoi3CgVr82wF67m16d/j4+cxOASB4EgDKUN99nqzjThlj5d1gpq8MCCTQVQN9YAc
 GN0H/k74WsjpD7z96DUQm/fEDnaVmscq0C77YO8R3lXMdvs1xTAq/XnLkVOfidyR0sw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789717029;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Nm8ZlsSS8Q52Oniz8a8ggkeM9PdhtvKiNh9R6kRXZHc=;
 b=qTbjJa/p5VVECyyvWpH0X+P9M8ICUvFFGD31ujDamn7/CbjTzhfyBl2kdcUV0OfOaXTJ
 skhHPkbGGQhKuL1+rCo1mHHiwaJHoZl2PjWlJol3YQRNaEIETcPPaaZ7i/CkPl9WN8wVF
 hsq5nZzB1xkjKVsrZl2zVW7eEBhSLXhftOOqdFStiLM+ZjPwUEmKSnKXPCBrTAeJDtjGc
 QVgVIvogZ/QBL8dwOfUs9BAer9DViD2R1OzTCHeGO5yME9Scyc0N8Cvqu7+aBYdTyBYWO
 CDmdq+TvlIylLEHsigtW9cOHDkXwrKfnDm0ZQneYFi+kRmdhLCC0cD5VZqX1Ljh7pEg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 931AD40B04
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 07:37:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5745F96D8F; Fri, 18 Sep 2026 07:36:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 09:36:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 263cfb165e7e3c95ebbac7def2a8729ff0271bcd
X-Git-Newrev: d4c13e96cfb60959d25b92ec0348f508c7d0349a
X-Patchwork-Hint: ignore
Message-Id: <20260918073602.5745F96D8F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-grpcio: disable for the
 MIPS n32 ABI
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d4c13e96cfb60959d25b92ec0348f508c7d0349a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

python-grpcio builds its own bundled copy of abseil-cpp, which only
implements DirectMmap() with mmap2 for the o32 ABI on MIPS:

    #if ... (defined(__mips__) && _MIPS_SIM == _MIPS_SIM_ABI32) || ...

With the n32 ABI, the "remaining 64-bit architectures" fallback is
selected instead, which fails to build because long is 32-bit there:

    third_party/abseil-cpp/absl/base/internal/direct_mmap.h:130:39:
        error: static assertion failed: Platform is not 64-bit
      130 |   static_assert(sizeof(unsigned long) == 8, "Platform is not 64-bit");
          |                 ~~~~~~~~~~~~~~~~~~~~~~^~~~
    third_party/abseil-cpp/absl/base/internal/direct_mmap.h:130:39:
        note: the comparison reduces to '(4 == 8)'

This is the same defect fixed for libabseil-cpp in the previous patch,
but the dependency added there does not help here: python-grpcio does
not use the Buildroot abseil, it compiles the copy bundled in the
tarball.

Using the Buildroot-provided abseil instead is not an option today.
setup.py does have a GRPC_PYTHON_BUILD_SYSTEM_ABSL knob, but it is
hardcoded to the build machine paths:

    if BUILD_WITH_SYSTEM_ABSL:
        CORE_C_FILES = filter(
            lambda x: "third_party/abseil-cpp" not in x, CORE_C_FILES
        )
        ABSL_INCLUDE = (os.path.join("/usr", "include"),)
    [...]
    if BUILD_WITH_SYSTEM_ABSL:
        EXTENSION_LIBRARIES += tuple(
            lib.stem[3:]
            for lib in sorted(pathlib.Path("/usr").glob("lib*/libabsl_*.so"))
        )

i.e. it would pick up the host headers and host libraries, so it cannot
be used when cross-compiling without patching setup.py. And even with
such a patch it would not fix this build failure, since Buildroot's
abseil has the very same limitation.

So just disable the package for the n32 ABI. The o32 and n64 ABIs are
unaffected. Note that n32 is the default ABI for BR2_mips64/BR2_mips64el,
so this affects every mips64 build that does not explicitly select n64.

For the LTS maintainers: python-grpcio gained MIPS support in commit
2bfad952c374, released in 2024.02, and the autobuilders have been hitting
this ever since, already with grpcio 1.60.0, the version shipped in
2024.02:

    https://autobuild.buildroot.net/results/e6cb7f473a28af8b53e7cbb8d8a582adffdeb66e/

It is still reproduced on 2025.02.x:

    https://autobuild.buildroot.net/results/9cf98bff7ce05262d6ff4221953901ae5543880e/

so a backport is needed there.

Fixes: 2bfad952c374258e37ffdf46a2c450d860640e11 ("package/python-grpcio: add BR2_PACKAGE_PYTHON_GRPCIO_ARCH_SUPPORTS")
Fixes:
https://autobuild.buildroot.net/results/90405c0a3d0b2e929d5074305906e6fe3679298c/

Assisted-by: Claude:claude-opus-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-grpcio/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/python-grpcio/Config.in b/package/python-grpcio/Config.in
index 6119991c7e..f52e19dc18 100644
--- a/package/python-grpcio/Config.in
+++ b/package/python-grpcio/Config.in
@@ -6,6 +6,11 @@ config BR2_PACKAGE_PYTHON_GRPCIO_ARCH_SUPPORTS
 	default y if BR2_i386 || BR2_x86_64
 	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	default y if BR2_riscv
+	# The bundled abseil-cpp only implements DirectMmap() for the o32
+	# ABI on MIPS, and its 64-bit fallback fails to build with the n32
+	# ABI, where long is 32-bit. See
+	# third_party/abseil-cpp/absl/base/internal/direct_mmap.h
+	depends on !BR2_MIPS_NABI32
 
 config BR2_PACKAGE_PYTHON_GRPCIO
 	bool "python-grpcio"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
