Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC1AE7FDE0
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 21:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1ED8540917;
	Mon,  2 Feb 2026 21:28:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q0CvRXTLsrnP; Mon,  2 Feb 2026 21:28:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FD5440968
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770067707;
	bh=SRuxKvHUpAcArCEhd+3t3Q6ruvWQaE5DCwbQQC5SFIw=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=VJWDYFhQQg3V19bImBugoMd516K5IQ1eHMe7rQaU3ur3cTZ6mpPxiReNmh9rCxAbe
	 t0piBrsJs0v6mrJir5YuF49Vq3u+9wgMTm2WFFAIYWBYgOXU/V+XOzi4JsynS1AlTy
	 zjGXdhO4xXEjYtl3AQmY/cVnXV/S5YIYzvD+ryyCsmeUO+h5uqoZ/nNwo3qlMLe1Pq
	 S8tWG74UJAN0dVChyXJORbND/Adt2UhIV0KiO73HCx9cBfpO48kkNEQyp+MbQRp58b
	 mp2IjI3Yw9qk5AxgTMmDhTSGR2AnpEO2s4ZbC1cwVricnpjkkEakjG2E5/bj6KkelA
	 HyT1vcI8R737A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FD5440968;
	Mon,  2 Feb 2026 21:28:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 24580149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 21:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 11F0360760
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 21:28:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E8pdUC-iZAzC for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 21:28:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D9D6660744
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9D6660744
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D9D6660744
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 21:28:24 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 0D055C237F6;
 Mon,  2 Feb 2026 21:28:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0750C60767;
 Mon,  2 Feb 2026 21:28:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A0F56119A8888; Mon,  2 Feb 2026 22:28:19 +0100 (CET)
To: Buildroot List <buildroot@buildroot.org>
Cc: Marcus Hoffmann <buildroot@bubu1.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  2 Feb 2026 22:28:06 +0100
Message-ID: <20260202212814.2607588-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770067700; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=jHt4PykhRL4ACjEXppv31XwlgNVUm5qRx2/vlFhvvhY=;
 b=0AgdlAH2RQIZyvZIVyn/a91UoVyDavtJm9WH/kosUHs1kNKGgTOU0XLkpBy7M4CFz1b2a1
 42S/lvNpXGd4i5VTLL8vsj50eq8A7PhWIiTpFkGohjKZHnVxe4occ4E959aBVulKyAfRfn
 4rrqWKvMad6hBUm6Ot9zFVbLEOzdI5gpEx4XzrPVktHq+xfcjkLxpIy+//cFmrnZT44R52
 TMEhah80dKTvimL4ay55O/TgBbMX4qCmZThBOFGmAK1dAgQ47/6mWp63cJK9/rQ4ai6Cn1
 fiiPs0f7mOL76u3/j5ih1oLfnYxzOSKIIJ3RzVgg/cQRBgnG5XRn8fJLDZP3OQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=0AgdlAH2
Subject: [Buildroot] [PATCH 0/5] Refresh our test-pkg toolchain selection
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

In his patch [1] bumping systemd to v258, Marcus Hoffmann pointed out
that the new version of systemd was causing build failures with
test-pkg on some really old toolchains that we have. It doesn't make
much sense to bother with build issues with those old toolchains, so
this patch series does a refresh of our toolchain-config.csv to drop
useless toolchain configurations if they are already covered by
reasonably similar Bootlin toolchains, adds a few more Bootlin
toolchain cases when needed, etc.

This should make the test-pkg testing a bit faster (less internal
toolchain configurations are tested, and less configurations are
tested overall) while still being reasonably meaningful. We're also
adding an "old" toolchain, but targeting AArch64/glibc, which is less
likely to cause issues than old toolchains for obscure architectures
and uClibc-ng/musl for which old versions tend to lack features needed
to build modern software.

Best regards,

Thomas

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20260202102931.3364406-1-buildroot@bubu1.eu/

Thomas Petazzoni (5):
  support/config-fragments/autobuild: drop Buildroot ARC toolchains
  support/config-fragments/autobuild: reduce ARM internal toolchain
  support/config-fragments/autobuild: drop somewhat duplicate toolchain
    configs
  support/config-fragments/autobuild: replace MIPS64 toolchains
  support/config-fragments/autobuild: add a really old toolchain

 .../autobuild/bootlin-aarch64-glibc-old.config |  9 +++++++++
 .../autobuild/bootlin-mips64el-glibc.config    |  4 ++++
 .../autobuild/br-arc-full-internal.config      |  3 ---
 .../autobuild/br-arc-internal-glibc.config     |  4 ----
 .../autobuild/br-arm-internal-full.config      |  5 -----
 .../autobuild/br-arm-internal-musl.config      |  4 ----
 .../autobuild/br-i386-pentium4-full.config     | 10 ----------
 .../br-microblazeel-full-internal.config       |  1 -
 .../autobuild/br-mips64-n64-full.config        | 10 ----------
 .../autobuild/br-mips64r6-el-hf-glibc.config   | 12 ------------
 .../autobuild/br-powerpc-603e-basic-cpp.config | 10 ----------
 .../autobuild/br-powerpc-internal-full.config  |  4 ----
 .../autobuild/br-powerpc64-power7-glibc.config |  9 ---------
 .../autobuild/br-riscv64-full-internal.config  |  4 ----
 .../br-s390x-z13-internal-glibc.config         |  4 ----
 .../autobuild/br-xtensa-full-internal.config   |  3 ---
 .../autobuild/toolchain-configs.csv            | 18 ++++--------------
 17 files changed, 17 insertions(+), 97 deletions(-)
 create mode 100644 support/config-fragments/autobuild/bootlin-aarch64-glibc-old.config
 create mode 100644 support/config-fragments/autobuild/bootlin-mips64el-glibc.config
 delete mode 100644 support/config-fragments/autobuild/br-arc-full-internal.config
 delete mode 100644 support/config-fragments/autobuild/br-arc-internal-glibc.config
 delete mode 100644 support/config-fragments/autobuild/br-arm-internal-full.config
 delete mode 100644 support/config-fragments/autobuild/br-arm-internal-musl.config
 delete mode 100644 support/config-fragments/autobuild/br-i386-pentium4-full.config
 delete mode 100644 support/config-fragments/autobuild/br-microblazeel-full-internal.config
 delete mode 100644 support/config-fragments/autobuild/br-mips64-n64-full.config
 delete mode 100644 support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config
 delete mode 100644 support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config
 delete mode 100644 support/config-fragments/autobuild/br-powerpc-internal-full.config
 delete mode 100644 support/config-fragments/autobuild/br-powerpc64-power7-glibc.config
 delete mode 100644 support/config-fragments/autobuild/br-riscv64-full-internal.config
 delete mode 100644 support/config-fragments/autobuild/br-s390x-z13-internal-glibc.config
 delete mode 100644 support/config-fragments/autobuild/br-xtensa-full-internal.config

-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
