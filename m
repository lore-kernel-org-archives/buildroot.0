Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78445C02183
	for <buildroot@archiver.kernel.org>; Sun, 19 Jan 2025 08:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC1E960858;
	Sun, 19 Jan 2025 08:45:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o3-nFjOY-V8I; Sun, 19 Jan 2025 08:45:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D69BF60865
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D69BF60865;
	Sun, 19 Jan 2025 08:45:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B463569
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 08:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94F5F400C5
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 08:45:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m_bBNEhA1jnd for <buildroot@buildroot.org>;
 Sun, 19 Jan 2025 08:45:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7764C4012F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7764C4012F
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7764C4012F
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 08:45:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 829B640002;
 Sun, 19 Jan 2025 08:45:13 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Jan 2025 09:45:04 +0100
Message-ID: <20250119084511.2816892-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1737276314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PVqb7LVx/DkeWm0H98Tsf7OlHvDVT2KowWIXgiNQZas=;
 b=OnJvahubACXn9C7540Me99HhKS/doTLt7ng4UcLEGJhagEtHicbJdeScO8Dn7IlOf4B9no
 731hdoDDr+WuktnG+QI6UIN1Py4qQIuxiwT44vI6eyCdHYEnvrwb0QozKjsEutYuUu3w1m
 iGWKxslxZJP7wU5OhdHrkKJ2t6MHwVl8czIVUtdgTux/tVNkNyuWP6yfLMakWri7v2p3od
 3KeV9VzL2vc0obOUIqrMM3dH6TosfeveIrhhB2q4wyT9rzLIB9v80o9GWhz3ErlT91310g
 R4KZcIDJ/XUD/Q/2swlo5g201bEHKD1bq3bBtY+TCKp3gFONR0JPCF+c8lFYVg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OnJvahub
Subject: [Buildroot] [PATCH 0/4] syslinux and gnu-efi fixes and update
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

The starting point of this series was fixing gnu-efi build failures
reported in the autobuilders, which PATCH 3/4 addresses. While doing
this, I noticed that gnu-efi would benefit from a bump, which is done
in PATCH 4/4. In turn, while doing this, I noticed that syslinux was
failing to build for EFI targets with recent GCC versions, which is
addressed in PATCH 2/4. And in turn, this made me realize that the
current runtime tests for syslinux use a fixed version of the external
toolchain, which is why we didn't catch that newer GCC versions break
the syslinux build, so PATCH 1/4 changes those tests to use the latest
Bootlin toolchain.

Best regards,

Thomas

Thomas Petazzoni (4):
  support/testing/tests/boot/test_syslinux: use newer toolchains
  boot/syslinux: add multiple patches fixing build issues with GCC >= 14
  package/gnu-efi: fix build due to short-wchar
  package/gnu-efi: change upstream, bump to 4.0.0

 .../0021-load_linux-correct-a-type.patch      | 34 +++++++++++++
 ...echn.c-use-proper-type-in-struct-dat.patch | 46 ++++++++++++++++++
 ...n.h-use-proper-type-in-struct-data_a.patch | 42 ++++++++++++++++
 ...fix-incorrect-type-of-load_error_buf.patch | 48 +++++++++++++++++++
 ...n-t-override-ARCH-when-cross-compili.patch |  8 ++--
 package/gnu-efi/Config.in                     |  2 +-
 package/gnu-efi/gnu-efi.hash                  |  5 +-
 package/gnu-efi/gnu-efi.mk                    |  5 +-
 support/testing/tests/boot/test_syslinux.py   | 17 +------
 9 files changed, 180 insertions(+), 27 deletions(-)
 create mode 100644 boot/syslinux/0021-load_linux-correct-a-type.patch
 create mode 100644 boot/syslinux/0022-com32-modules-pxechn.c-use-proper-type-in-struct-dat.patch
 create mode 100644 boot/syslinux/0023-com32-chain-chain.h-use-proper-type-in-struct-data_a.patch
 create mode 100644 boot/syslinux/0024-efi-main.c-fix-incorrect-type-of-load_error_buf.patch

-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
