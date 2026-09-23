Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C04C98321
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B7AB8125E;
	Thu, 24 Sep 2026 18:57:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pke6rnAW2CuJ; Thu, 24 Sep 2026 18:57:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org EEFF28121F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276270;
	b=qoMD82GFaHNrL7NXR9iARgavFMKQ9HkumnSTrvr12NKIjv5bOyGWT6z3MGlN5BtwFJnw
	 xJqvsUWm0EngqfdP8wVbzCcClIJ7j+Ikw88g5aw0A1YfSQBEJxMkBmvGC+dt2G147zThF
	 QmFlfP1n4AWmaslsPurfKSg7ovdMBiE6eP47RF/+oTDCbrLBU2Vs3TcnazUFi28h7flGa
	 wia0W5hvnfaec0sHITwp6yjeirnh1tNOrLS3wHKpuFHutB1HO9bWuvTpG0aJKmeyy3sgR
	 xk2cja/tbyv9KNVT4qPVXuSt0thhFgzU144MKhOFNyh3x3ieN4XB0wUk2yKqEGTr4/Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276270;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=zLTPWhQhTG/jlIv2noLsGMe5U0lf6zBgLJIeSYV5yqU=;
	b=RJQYex3N6NZ5mZDRKdHuy3KJxuUu3V06fYafDb2FItE/U5QtDk/B9nfSIlP1SNDu79dn
	 UnTUcGcspcQCLXQjA84Sx071YJQIKvOadaSJ4qfgu6aTVt4nMkrvTXeuRciueW6JYkKvW
	 8gHtTzXDBwTPlYLPzcUhABKZ80FXjVj2j69yw1TB24T55+TiL0DjD4RmbzXPGdnD1+fEO
	 BMj6NaYj9VHMV2ROBgODCz9zB8MH5OE0PnS2dzneEe4M35P99I4OkZ9zspGxJBBWr2Gx4
	 efxC6F8kAPzDGwosstBW02fCf5N8yIsESfWdbCaU5GzI6IZYqwpKmMpLmf1ewGNpWPA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276270;
	bh=zLTPWhQhTG/jlIv2noLsGMe5U0lf6zBgLJIeSYV5yqU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EwYqovB5qURz8ADNJ/shq1f5oEQU3an5klYoZ4NLjDLZrWqvdAeVF/OhZKPK8u+gj
	 ljO6G2WqNmHQMrDOKRXb6FbSaHvU11r5as8EvS2dQvsTrZWeJ8S8bekGi2utjARkP6
	 P8gNU2uWV06ReT8pkbjU4VWYDEM1+Ix0eTYCGGivALcydTV622NaqyuZA688k8KvYj
	 Y72PO9yXcmnG6U8WnIdSgahrBBrPDYA2oAfpbFb2G9rK114WrkEcxQz6pAJGT7lr4j
	 3PsJpKcii++WcdsyaUefR7YJl1tCpi0NItp8kr9GmvcxbOe4W5RUAK6wVJMqrt5pef
	 S683pTvdPYgSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEFF28121F;
	Thu, 24 Sep 2026 18:57:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 35B83328
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1BADA40ABB
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NhY7aezS4Jxe for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4DBF340AB8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276204;
 b=WNkA8haCbv2zqKJkGWFhrpfIwfYATFVwT9+fjdB70gz8FKf988SKQDg0dtutjtHyHdxT
 B0DIC63akSnWRM7KOnmZAe2q4pyqPn5cBWUyCxtF4EQh/Ns/L6Lj0+q36qAu0BCGRKlyl
 II/9Bh0oghwb5oTN+qHJtqJ0LMXfW6Dm9YbArQv0yV/EOQARhjR2E2xwfltqIyHZvqUHv
 r8vp74fpRfcjtgdfSd9u+6Y6Nal/Vy2KJmPdxuDBV1ShObrbJp9NU/G3ztGsjDYTQvW6w
 qBD9S6zX2wEbBZ4a8f/ouiH/x/GHKzRUs9p8G6unwl1S6ceh5sCrgcGN7uBKDg8rcDA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276204;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=LKChCqjyCNYecixSni/cm6kAky5ewwS3rasjNDGxkdU=;
 b=s3AlXIusw8LqDTjg+6UvIy5PD3apGuSWkpD61t9IJjpMBNgjpeG3mikFCAHnvkYfWCQ6
 bZpH9yeTflRcfvyjJA3AOSW9WQ8JKtYB2M2DrlpIK979qx3mSMQ5ziWiViv0fewPg/GmE
 81BK8XHEDXywitMfy/20ovaIjlRiarQsEYK3N0uTFmPr7cW/L2K4/WenS80ydV/V1uj2x
 KFjyDMhEzvsoNo2hYhVDXZtpaY4Q0/giugIipmA3eOYM4SeuKvW1ma3R/LniNXyeQrCac
 /KyOQq8FoVN2TO2Hhfs8pKlOwv7VEHFH6I6P/RJ1enpWCzEjDsOi5ad+c4h2kWxdzdw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DBF340AB8
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E58DD8E85A; Thu, 24 Sep 2026 18:55:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:22:29 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: ac1ca473b5ed87e996dabd214dc1334ea07bd5f3
X-Git-Newrev: ec746f6b57d48850cb2ee86c94188d4b5c433978
X-Patchwork-Hint: ignore
Message-Id: <20260924185533.E58DD8E85A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-grpcio:
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
Content-Type: multipart/mixed; boundary="===============9120206497668732642=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9120206497668732642==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ec746f6b57d48850cb2ee86c94188d4b5c433978
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
(cherry picked from commit d4c13e96cfb60959d25b92ec0348f508c7d0349a)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/python-grpcio/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/python-grpcio/Config.in b/package/python-grpcio/Config.in
index 9657ccb6ed..831ec14793 100644
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

--===============9120206497668732642==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9120206497668732642==--
