Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29AA5CA5FCF
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 16:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5E928122D;
	Thu,  1 Oct 2026 16:51:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b5SrcMGLMnMV; Thu,  1 Oct 2026 16:51:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org DC3678121D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790873481;
	b=P85/Cf+Rbq0u2BmESa8dL4jj8LkEdf7hZN/JptV9qTEkcANhlse2CEofJ0Te2F8PmHAn
	 RPo0bhz8MsmDjt2D/pG+EGZCoMSBOp9YG6fXzwzQ1Tvcf7j7MtRooEcpbP/a3jbR7bFRE
	 ZueTY0pnrPJXcqcVImPVeIbFpxCWVd4Fd0UDAV6HNPS8Y/cDahxsvfgBDJe6NLLMBIocz
	 dXhQdpFzcqNySBD9R8ae6npQUuZNJVaiAcOC2JVp3/T7eroYkPXRq6pHgereBoVb3t56j
	 b0AzK8E0gVwL2uyqbJ8qag35Fi1RAYRO4QuUbYNuEXhFBhRmDgitG7ALPAF6JRXJeVw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790873481;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=jr50czKfoqGjyXDIQl7Hw8EDzff4/5sfHrEv3qaqKdg=;
	b=nvBL54xKt2o45E/CV7Qj3awzjlkHSyNmQyUqGhd7Y0eiBrsAETSMRnHk0mps3nkfEHsD
	 1cUZBTN6HtpxEYw0tjaLhLj7dgY4tccj1ny2gQ4zaTbvJzePgrOh1MCvK8o0q1j3Y7PES
	 QMXhG6BFDsUlHaGTb06m3ehbfXGPNQMioWK1489T5JdwZTInlBEqgAY1qbzDBhR7AR1AC
	 Ed+KQzSytBZvltWowDvfRwTx5YXdJUKQSJu0XhIiGzKlIHTw8ZSSTvEJO3rVW5S8JyjKX
	 Zqqfj+pd4tyxwa7uKGq8b9/D7FLcxmmA13bfYC0O2eEBFPEyJkoJRYzTsNpNH4G9iZQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790873480;
	bh=jr50czKfoqGjyXDIQl7Hw8EDzff4/5sfHrEv3qaqKdg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EX1hELzYnncCVsmY3U1lurlB9opR81FSN+c4FsT2aBAwaPWz7P+vPJqjPR5wbB+b6
	 QWktg6JehCUo8p9TqvlVPPuxzSIGXoKH4iuECgJWZN+gvYrws7iYA2qR2qLSm8lMmW
	 mBe0LTlzkpqftCvAUHDApGVgV3zayzoQEoeELeU0v0fEDBWcvi6q/8pMSTr8wIUZEH
	 ebXr3AJMp1NAUfH3p4hcVW8zYPqSRdEyQR4eg2XNf7f+si1bzgdRJnqqZy8ltZCImJ
	 crPhRfUxSY5wxlYOHZtObLE2LbLii0GPPfO1AMYyW/CxbJGklCLvGlgNdqJwjNNrKq
	 JUlcqIhSqexew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC3678121D;
	Thu,  1 Oct 2026 16:51:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E45632A
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 16:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63EA640C00
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 16:51:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zOkk7-VRfcHV for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 16:51:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A4DC140BE4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790873479;
 b=Zcxm/yUwQyVgXD241AxVg0Kc+g/F0mE5tKREDLO6JzoGNBMgreegmzmG/pW81hLDtinQ
 3W5csOp5Q4+i95ioNRYqsYKQNot2InZb4hC8myYvnOmf/RiaDx139timiQ19J+QFa7ip7
 FN3Ya95xBMtt9Qyq/aCRUtnSBwALyLzVaGa5cj/LG25qilHW+DrabTRsTtP+lNUiCbPyG
 jKOJgNK0KTZQ2cT3I7ygYYcT8y9L0bbXJ1d8Ojy4/sS9qRVNtaEau7m0F/+4dRr0B0osC
 VyExwRQ/YZWZ4sZcSLsaJFXFwWyRZ7Zq1oUYtG+vj0DNd+8qje8nK//qbOYAPrg+WzQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790873479;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=PaRswkt85rUi9Qcra+DOTC1zSLDRcW7RMkDQibw6YuY=;
 b=ZmAk99UmitR46Jvy/aoJ7rW9v54v2LgXJJxXFy0eNnmEp2La0PKCD3nm6CnSum3MYr1r
 hpqrj3pffpXlWUc+yPmgRBqbsIpIUOuUS+3r/4Zo4LWErUyOtMAkyCZe3ACaKneiikKyT
 z9ZFYTay1tENa2Z+9vJ12XpxWDFA32dZ3GHKjJUxFcEqeDO+VkwyMuR8H7YjDxMJL39hy
 GfGDU0m2YYZXQYUE/0tzpP+C3llHyG7YW1g2gmVNflxQJNs4kC6gUecXxaXvL8LDalzEM
 iILimUNrqosqgQzIMKoAqOCwdASDrInC3F6AhRt9wfYMBri+657g+0JXrN7qyQCklQA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4DC140BE4
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 16:51:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D4A34814D0; Thu,  1 Oct 2026 16:50:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Oct 2026 18:50:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 64002f0985a2568a7d30a1160f831c4ce3ddf6c7
X-Git-Newrev: 34964aa111270525811d1bd05168ad5ab19a577f
X-Patchwork-Hint: ignore
Message-Id: <20261001165005.D4A34814D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/igh-ethercat: bump to 1.6.13
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/34964aa111270525811d1bd05168ad5ab19a577f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This release replaces strncpy() with strscpy() in kernel space, which
fixes the build with Linux >= 7.2, where strncpy() is no longer
available to kernel code.

From:
https://gitlab.com/etherlab.org/ethercat/-/blob/1.6.13/NEWS.md#version-1613

- Made the macb (Cadence GEM) EtherCAT RX path allocation-free to
  avoid receive latency spikes under host memory pressure.
- Included macb in the device driver table and fixed a
  `CONFIG_MACB_USE_HWSTAMP` build issue.
- Use `strscpy` instead of the deprecated `strncpy` in kernel space,
  with a fallback for Linux < 4.2.
- Added a test build for kernel 6.18.
- Improved `ecrt_slave_config_dc()` documentation.
- Adopted the CPPlint configuration of stable-1.7, fixed CPPlint
  complaints and added exceptions for device drivers.
- Use an own pre-commit container with cache in CI.

Fixes: https://autobuild.buildroot.org/results/5c48b38fba102c38630e546eeea05cf206eb9e53/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/igh-ethercat/igh-ethercat.hash | 2 +-
 package/igh-ethercat/igh-ethercat.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/igh-ethercat/igh-ethercat.hash b/package/igh-ethercat/igh-ethercat.hash
index 23c28ccc24..930fbb0610 100644
--- a/package/igh-ethercat/igh-ethercat.hash
+++ b/package/igh-ethercat/igh-ethercat.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  1fd0c5746980de42b4c1d476d4bd20f5525a9b3fe6e6ff50032bc565c82dc85c  igh-ethercat-1.6.12.tar.gz
+sha256  cdf508cd0357f649657d44b1779b1ed9c993615f187761190575ec775a432a93  igh-ethercat-1.6.13.tar.gz
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/igh-ethercat/igh-ethercat.mk b/package/igh-ethercat/igh-ethercat.mk
index 8876b59f30..feba1738eb 100644
--- a/package/igh-ethercat/igh-ethercat.mk
+++ b/package/igh-ethercat/igh-ethercat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IGH_ETHERCAT_VERSION = 1.6.12
+IGH_ETHERCAT_VERSION = 1.6.13
 IGH_ETHERCAT_SITE = $(call gitlab,etherlab.org,ethercat,$(IGH_ETHERCAT_VERSION))
 IGH_ETHERCAT_LICENSE = GPL-2.0 (IgH EtherCAT master), LGPL-2.1 (libraries)
 IGH_ETHERCAT_LICENSE_FILES = COPYING COPYING.LESSER
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
