Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E6BBC88E7F
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 18:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E2B7406EB;
	Wed, 16 Sep 2026 18:54:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aHA00rNOLeRW; Wed, 16 Sep 2026 18:54:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 58D9F40711
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789584895;
	b=LTGkU0nBCasjDGLFy8ofSYV58tVK/15vwcZ0l+WIpnwOG958SCxpX5iqM5ZRvAYRmdOv
	 5jFxuDEFHv/TekecggKGJoS/5Y9VwxjgTUOW3SbUXy2LBXYv9Iy9zzpH2CxEMJHbqczo8
	 JHS/ffyDyTwHJWWVsEKk4bnuewH3d+jRWZM9w5P8XShj38wRRRmVGczaQWElzMFXOGgbV
	 HWXFKvWFDeUA3iQ//3xhqDYqV6T1aNQRAX/2Itv70XAREZcXFj1OgyUob6Oyc8eEJUfy5
	 xSF6nLPR0jDMw4UEc7Ps4okeF/B44pM5F7bJMeaXiTIBNJtX7g6r+D8cz+v28Oz5Tew==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789584895;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Ka93SQVeng1QMHKOzj6Z0tjAlKllcVgV7reNImlYL0I=;
	b=E3BDRIyv8xmgPBuGKteD/+0lvT4XhQ5FASb3vn4sH/Q5UI/MZ3N5ZP0j6mAcX75nerJ3
	 NGPRJ2QJCLCQCVye/i3MmWgyNCKB0lFb9iYHRJ8RdyK4Cgo21ImuJCe+MmT25dAnvCEWU
	 ewmXaWMBt/E1hTSMPRwDiA9UF6QOSQO7+OhfnwAR3GBKoxz9QpugLERfKi4VKQrF/5/lj
	 iJQ2g9HWw2Os+uD52BDEGkfncPE9Se3a4ZafZcfpHv6lLqarI+fyjlr531IaeqFiif0Ln
	 s3bPoZT5i5fumHddt/CScKi99rzD7yZwZE6rOocWxdXZA14dpOUGNyokGkYfsytluEQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789584895;
	bh=Ka93SQVeng1QMHKOzj6Z0tjAlKllcVgV7reNImlYL0I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jT06t4nnrQKMBgsk8LbRbYxhZTw4q1sFcFZxakMPTDFz/2ZqVRw2g41vM8RvXazKl
	 crGPzFu+IVcZOr7tlXZio5NX6voe0IPhtwFDojlOpnQ8Cj5Soqe6XNnIZmZ8D1dblO
	 N/rXyeg16u6RC+j5uhZKOs9Y2yzQBe1DqIUhbZngZhiIf5dm33jszvVsWH/gW1yC2i
	 RNWx8AXtokAOTpf6NZI9aO9MJq2IQRoQZ9VIcGpsJ8k0nFOCfqK/ukNwF4CgDyDZpE
	 W2o/cfYp0CpEuvMuimJf7anKr0ZEdU6SPrY3aPn4f0hOxrV8ywOzzYqNNBn7pjUPRk
	 IHX6e0o4FFAuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58D9F40711;
	Wed, 16 Sep 2026 18:54:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D1A517AD
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:54:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7C824008B
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:54:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 68Wmr5J8OgLD for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 18:54:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org F258D4006B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789584893;
 b=Yl4iarBIdCcd6po3DTwUitWPi6m5KczvDYT82FpFG6NV6+SitsP858eXeEd4pg6CxFYU
 uy6Iw6ILVHQRh07tj6fan0b7ZW+gHiDhUSnC3bJKavMIP/WHiWXxRaq8Jzm2bO0vWFldx
 670QFl4biaATK0rfe2NK+bpBMoaUQ8nnB3CpNaHqj28PSE3EEY/esjNHw3+r/seduZjPF
 +Ufb7J+zSxXoGpx6jgM6sXD9Fv3VbRZYoGxD2+Z7IgJD7UrP7O65EHgazy7I5AklTNlei
 rPRCn6xf6s3zHP6Z8OQqZs00SCnlxplZbUw3Whgl8NWdQv2+lCEQmKlI97cWCQqDDNw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789584893;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=3Mpph3RhdcRUAmBhQAKkkWJ8iB1FAwjlhZYTKnyAHJM=;
 b=DMdb4M+LpqG1P5t0yk6s3zzzwkU42R0PY1tSolD7cAaPSG/J+oTRzSmOLOQe/DkZvmLo
 uT6j9O+P+/KWgQiJkHdV67PkUwJWh6zhSy3d5Tf0ZCcnJLFH64yNJYX0RefdLEduxa250
 ToNpFpOOmFVD6axscXZi2UIaZtvUmSVaSfvIVxU7Nemgle+iaaFZWCZxu5VVYBoBhhh9g
 xq3WnQwKV0XhDfCAF+DbgP4ivOBjB1rmEPRUgUasiFiA+He2X/9cfN9an75DlsP170rEY
 nnJKbYPSlKFww5Q/xpl+L3L+LS5sGY33QYroV43G0Vubo5KJ0QWVoYQsgYem1YmrsDw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F258D4006B
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 18:54:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7B6849612B; Wed, 16 Sep 2026 18:53:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 20:54:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 05cbe542f9dad8868d7c9b257fe486d07c118630
X-Git-Newrev: c2bd6148c62dbc4068ea5d53c6e95ffdf6352f0c
X-Patchwork-Hint: ignore
Message-Id: <20260916185346.7B6849612B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: host-qemu does not support
 AVX512 CPUs
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c2bd6148c62dbc4068ea5d53c6e95ffdf6352f0c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Building gobject-introspection for an x86 CPU variant with AVX512 fails
when g-ir-scanner runs the freshly built target binaries under
qemu-user:

  qemu: uncaught target signal 4 (Illegal instruction) - core dumped

The Qemu TCG engine implements AVX, AVX2, F16C, FMA3 and VAES since Qemu
7.2, but it does not implement the AVX512 instruction set at all [0].
Therefore no -cpu value passed through
BR2_PACKAGE_HOST_QEMU_USER_MODE_ARGS can make such binaries run, and
user-mode emulation is simply not possible for these CPU variants.

Mark those CPUs as unsupported by host-qemu, the same way it is already
done for x86_steamroller and x86_core_avx2. This relies on the existing
BR2_X86_CPU_HAS_AVX512 symbol, so all AVX512 capable variants are
covered, and it disables gobject-introspection and nodejs, which are the
two packages needing host-qemu in user mode.

[0] https://gitlab.com/qemu-project/qemu/-/issues/2878

Fixes:

  https://autobuild.buildroot.org/results/7ed7f9c36dae1ddb965a0f0021db6cd319927b47/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qemu/Config.in.host | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index c7dd5876e5..e5379e7224 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -23,6 +23,10 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
 	default y if BR2_xtensa
 	default y if BR2_x86_64
 	depends on !BR2_x86_steamroller && !BR2_x86_core_avx2
+	# The Qemu TCG engine does not implement the AVX512
+	# instruction set, so binaries built for such CPUs cannot be
+	# emulated.
+	depends on !BR2_X86_CPU_HAS_AVX512
 	depends on !BR2_powerpc_620 && !BR2_powerpc_630
 
 config BR2_PACKAGE_HOST_QEMU_SYSTEM_ARCH_SUPPORTS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
