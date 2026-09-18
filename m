Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B119AC982D2
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 07:37:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 637A460BCD;
	Fri, 18 Sep 2026 07:37:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WJ2bRMh8Ze4R; Fri, 18 Sep 2026 07:37:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 809CA60BD8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789717031;
	b=U1laFuKfh8stglPA9DXdHJqV5DqOSpPYRcKlWcZDAUC/4bmrosuZ0LYp0v6TjicoBwWo
	 xiuXdlsG0myH7IaVkX24E3lZ1WW6p3uxXpbXFVBEj3OQAR5wlHznXaP0Nsigyh6z9kUgc
	 P1GeZTKkwUoNvN1uWK4fhy+uiV3b9uPLtXP8vs8vN4UJtdEFY/knvgBFrFnjPQhQgKLWy
	 SADt9uzhvb1u/YJOlHRsBthvW9/ALVoV9pE54ruL32pgicvo+hfGOjhi/MTPz2pgfjspp
	 ofU6Ny4d3JLvHpMc+DTc1+554gLt5s2wvwt6FDyIhRcfnODbMldEedX/QjzASrsYgOw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789717031;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=V7D1OZ6GZzP2yRm/iyIS2J9sAphKTnGcatkV8erY7Bk=;
	b=hSnnJgBc0ZYQXKEzl2nav4zglI2bu7lDWEny9qL/yafZbJR+ZpZTpuBHayX393r74xYH
	 kS5SxgJ08RVRVxNKMMLqMDta1xxDYwmC8WCVrNyusT201QxEQ/eC7oVW+zrl6GctDGHSG
	 BmpXSwkhAWXQGNAMl5Iht0xbxfP7CyTeXVfkOOZH28sBx/0B70lMEZobuG6t9Xb6SRIfI
	 tDVthfkF8oidILOg7c6mUA43mY6W1hTYqgTRyLJjMm5JhqQX1cKnuZVXTQ5/iAqnzpgYZ
	 4YzxiBwRUNdsofCSYkdX0JnaF8Eo2O1PT9EBM2Klg6u//s9W8JdIBsOgrhpuPcxvWyA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789717031;
	bh=V7D1OZ6GZzP2yRm/iyIS2J9sAphKTnGcatkV8erY7Bk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=j+1z8VNV/V4bKjUXO3eFv9i+DS/uNaM8mTSN7dygb7tpD1i5oXnLlivkqwAABop/5
	 yCKb6eiz8bbTwjmuaar7a3WBIiOijfZP8n8fR+Qp95xuR/o6FwHQHj1+xYqlojXyEI
	 3FvqYnb0j1iPtmF74hIcccM9DpkHKdmSVNYeM8xGMjPx9rRIZ93HoAIINRCgMQKbR3
	 P3y3/ZwfcRbNnqtolW5KujPxJAlsfGt4ixlNEDKMQypZr937vHQHdhBi0WPi3guytK
	 UZ1tNqHvUoLoGD5u/i+ddAlqxXsHkdjmmySE8WaiVRT0rxl7p/63FdyC0Z4fOxk6YX
	 2jpttZmOfrZbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 809CA60BD8;
	Fri, 18 Sep 2026 07:37:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6170137A
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 07:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48455404CD
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 07:37:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SnA70aTVAzvb for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 07:37:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 82E324044A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789717029;
 b=KVRAl2tIwtPhck6zRpS7K3LcD27LRJ8xbV9yiPIHWBMlvfOyzJI8ZmWhYGRpq9r2qtGz
 oHtSkGIlp0WQPmBnwAwAbgrFKu3wVKoGwczBgGvcgXPq0YXfn+v+ZIQe3xaGzumdPAs+D
 iC7GbMKl4NRaYYODOHpCaSQpx9vg1lpFXi1r5iQKrXKP8gEdamhc0YVdrnYvT4qwOcWua
 puKG3SbmAAawfCM7PoXPz2Q8R/J2upJfnUZxTpLSfYlstr1Z+cNXwGBGrKmeKZMzdQe7s
 Ab+rOjaa0y8R3hTim0byTh/z04C7fz4loezxaBJ5gCcOlrrywwZtLqiFSp5cu3g9JRg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789717029;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=4GGTd0n9FC0hwsKUdmxHckKBMd4dGugmNOVYzw+2unQ=;
 b=JFYpg/ctJYLJFI4ydpXNl3vtbzS9SInaR07A5fItTXU1mVFzAbgXlYxE6E0BdD9fHyNR
 2azACeXj1hbqmTIg90WNHw0yE/zhuLOxEAJ7bCD51bgle+Fo3WfAzU5yyiPVdYyCNiOt2
 fJrhfIm8szNdRdSPMbC/HGj9lkkK2znHBQPTlNL/bCSafemurKiAeC0hDB74FVwhUXUcv
 v2wZIEoVT7O/YmxhfqJWDBDuHqYCTRd38fLMZXVoiriGSSie9bVTIj8pB42NXW+ftBQDY
 bczUX3DGE3aOoeQAHSBEJVM9XHpgmBSx13C6dOGjPdxaXUTpIR+0cre639VMK/SFrdg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82E324044A
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 07:37:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A75A96D5F; Fri, 18 Sep 2026 07:36:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 09:36:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4dc8e8b6f927bcfd11302a3cee68ea958cc266dc
X-Git-Newrev: 263cfb165e7e3c95ebbac7def2a8729ff0271bcd
X-Patchwork-Hint: ignore
Message-Id: <20260918073602.4A75A96D5F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libabseil-cpp: disable for the
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/263cfb165e7e3c95ebbac7def2a8729ff0271bcd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
---
 package/libabseil-cpp/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libabseil-cpp/Config.in b/package/libabseil-cpp/Config.in
index d13bf6e663..feb4963042 100644
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
