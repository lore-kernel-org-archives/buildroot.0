Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C5C7C98321
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:59:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30D4F8144C;
	Thu, 24 Sep 2026 18:59:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id axA23ftQwd1L; Thu, 24 Sep 2026 18:59:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 33F0381456
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276366;
	b=rOj1xhLfwh2O7nHjR4wNLr9tmHr9/chAM3/dsD5Y97xRSYsc4r2cw58rZq4DyjUArrTo
	 uYXOknEaxpgoW7bzAfTo6T/NpAzlqyoQNKiho0XfLoam0iwojiyfxufuiuz57mTGmHT2b
	 XGDjzw54Lun+hl0q0m8PKEmQVQeW+JjVcXPaWbibBPgLvkXa5FUtF3HkgwepxSFN3R54W
	 d86I+kiZWrLaI2Enc6xV2Dtzq+wOJbXhzwsi/UBzQfmOcMfXb/qgUyc19PLJ9EGze8PU2
	 gHq4CM0UoJJZQoUZKGIDeNe4yWz1MeM3+jPYgkw4vaBKOgBymtCWKOf0B2dCvfSdXRA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276366;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=38d7AcZ8IBztKPR5lipSWN2zeXrPDMFzMNev/Cr5NX4=;
	b=ZVVNIFVYSBOieBRcjbeIjKUcqzProaaqCLvNyL9YEfSUOQbQkn6XtDJWBjLa239QthCz
	 F4q3hXwEuK7kj8ZlCP3WZprcp4DxTl8M44zJSgZoaDt+c4qCiEmmGfQyqOmCs8JdUUSJZ
	 UzHPF3ShX8vlTwcmEMgUeHA+DTur97YM3egP34q5P5enXXZai0z70oyZCFthEQ0uQDP9H
	 j32eOk4JxQoRRSh20J4ZzCpC104xTjAkmy3CzHT44K+FbSxFg9TDR1tKlqZHYaSKp5fKh
	 EqeqJ/AIxlirGZTUblVkIE/9gchuIIl42ymCLUWRH/gCOAEF51xsbFPEoU6ltobn8VQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276366;
	bh=38d7AcZ8IBztKPR5lipSWN2zeXrPDMFzMNev/Cr5NX4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Y45u/ESPerrL5B4moH+owFo3yb+0q9cgOEgqEabttkEaVey25opy3ZoLa2hg+obsY
	 wfQb45b4WEPLxhYArihfy2S8QEj8aTdqiECgBxu/262n3O9OSJd2Rld/qv0C2VIOP+
	 y2ptTr7M2y8EgbTCBHMx36VBFcAGQv4OqYFGBbFL6aDDz3JFRR4WQ96jnvpeZGj6x9
	 ArxZ7FHbP59D2Z+A254gYqAT4dbwBDw0BpSllFRm2NCvieIfODktHOwK7QI/IhftrI
	 LcQC1dG5KnB2PrZQH0qTM2nGt3zdVYtw4NDcslYWNi3uOABBWtHhHlVI8g68OVKFLe
	 gxQFYXlX5K3rQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33F0381456;
	Thu, 24 Sep 2026 18:59:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CB633B7
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 080B6404D5
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zILJfaLkE8iJ for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 1722C404D2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276213;
 b=D3HnnXuX0PbJAcA2Sqi636jZ9LOq55ih0ItEGPvIoO/quZ2LhlD8dkpGmrEzMzlbYiG5
 aiym+IBP4A1sdDPcdu7hDzj1ao2J3OTFhYph4/8acNHp4Cn3Oe3W6Gekjo9jkdORQelIA
 u/z6raOH0oHkUeT4/0iLI9g/aaySaVChOE3lNvtcCY5x8o10l8KJ1B3Wvbh0JIP6Xn6zG
 2rQobShQZFggn4vqJkMTrpxHl7taKBjmf2PMjj5Q0qShwBfOpXZ4muerVJuNzwdlCvtel
 T3WCRgPsZiVRhHbpi03y6QZf59ACB3vvF83pWi+43bhlyAWKLDsYQtHHxZStDnmQ9yQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276213;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=txGYDbw7fNCGEKEY3HPgQ1xHyWL+tURtRaVKhKaWjWw=;
 b=Rc3K9m80xbghYYgRa7e8aZu/cZVnJZID+88KM0fe/ThSYl7WLct4ACsZaZH2EJ+RQiQz
 o7LgXvnrXEPVel0F+LZjpM+QQWct8XQ8t1ZDGQUA47XPZe516r/7PPajpPotI68+jACfj
 ookWPMRbDcdUjSoIkvw/h08FI2Dsxb5T2h61MTZRE225Pb2XkgdIlIx9NRTjDQwd7bI/4
 RCkX4sONhMRTIKPSbTHpM8gHz8WrkO4fL6e4QWWD8AmrG1eSwlWfRoSVddpNNSIFMg/Y0
 VcB3siLrwa5uplgmKJGuciPTHfCLykz76xmJVY1DmpkcqfOteQTkEiinG841seYNnYg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1722C404D2
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AE43E982D9; Thu, 24 Sep 2026 18:55:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:22:31 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 6ba2f6c7454f17eab32df0b6e7724ceb21e4c8a6
X-Git-Newrev: 7011d82a34a3f3e5655485eecc9b76582bbefbdb
X-Patchwork-Hint: ignore
Message-Id: <20260924185542.AE43E982D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/python-grpcio:
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
Content-Type: multipart/mixed; boundary="===============2752288197880430703=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2752288197880430703==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7011d82a34a3f3e5655485eecc9b76582bbefbdb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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

--===============2752288197880430703==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2752288197880430703==--
