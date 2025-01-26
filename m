Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F134AC02181
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 11:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAE5480EF6;
	Sun, 26 Jan 2025 11:32:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ixk-B5vX7JzF; Sun, 26 Jan 2025 11:32:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD80A80F05
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD80A80F05;
	Sun, 26 Jan 2025 11:32:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 21889F10
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 11:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 42CDC60793
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 11:32:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 00TZ5qRywKXo for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 11:32:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 17644605ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17644605ED
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 17644605ED
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 11:32:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id A094A60004;
 Sun, 26 Jan 2025 11:32:35 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 26 Jan 2025 12:32:27 +0100
Message-ID: <20250126113234.4164811-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1737891155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=y3ygjlPyveVtE9eXnmknZ991+8X9sWQb6eufI51HRyE=;
 b=BB6+N5NAOyErrcHmzgGEHJazstNGicKBhHi+8XkH3V760Gq3NjfrP5pIWyuA+XnEvANJYG
 pJETdVEUE7KR+kDcIMK3FTZRamAI/9hEjE8WyKsjLQz3FSb2u4e4YjyKyYXZGjxoHHALky
 Q2wgziZ8DHJUVfxrPOppMUktUoO39q5e8JfL1ndV62cDzEnW3vofmE8ZlxNFci+/7ukYaN
 W37dXnfMbaTSuOu7l4FVZ5i1QYcjNwMlG9CakvAgbs+Bedohu3vpA2By7GOBrL01sCSjqF
 F5ImxrbSe2KYjIVinUnWyx8WPSdlBjEW/aYp98gMeHndtlhLU8TqSbLU+r20JQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BB6+N5NA
Subject: [Buildroot] [PATCH 0/4] Add support for GDB 16.x
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

This small series adds support for GDB 16.x, doing the usual dance of
adding 16.x, making 15.x the default, and dropping 13.

PATCH 1 fixes an existing issue with the gdb tests, due to an
unrelated commit, but that we fix here as it was needed for the GDB
tests to pass.

Thomas

Thomas Petazzoni (4):
  support/testing/tests/package/test_gdb.py: fix ARC test
  package/gdb: add support for GDB 16.1
  package/gdb: change the default to GDB 15.x
  package/gdb: remove version 13.x

 .checkpackageignore                           | 18 +++++++-------
 Config.in.legacy                              |  7 ++++++
 ...e-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch | 14 +++++------
 ...-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch |  8 +++----
 .../0003-use-asm-sgidefs.h.patch              |  8 +++----
 .../0004-gdbserver-fix-build-for-m68k.patch   | 17 ++++++-------
 ...fork-inferior-include-linux-ptrace.h.patch |  8 +++----
 ...getrandom-compile-for-uclibc-v1.0.35.patch |  4 ++--
 .../0007-fix-musl-build-on-riscv.patch        | 12 +++++-----
 ...-gdbserver-Makefile.in-fix-NLS-build.patch |  8 +++----
 .../0009-gdb-Fix-native-build-on-xtensa.patch |  8 +++----
 package/gdb/Config.in                         |  2 +-
 package/gdb/Config.in.host                    | 17 ++++++-------
 package/gdb/gdb.hash                          |  2 +-
 package/gdb/gdb.mk                            | 24 +++++--------------
 support/testing/tests/package/test_gdb.py     |  2 +-
 16 files changed, 78 insertions(+), 81 deletions(-)
 rename package/gdb/{13.2 => 16.1}/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch (84%)
 rename package/gdb/{13.2 => 16.1}/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch (86%)
 rename package/gdb/{13.2 => 16.1}/0003-use-asm-sgidefs.h.patch (88%)
 rename package/gdb/{13.2 => 16.1}/0004-gdbserver-fix-build-for-m68k.patch (81%)
 rename package/gdb/{13.2 => 16.1}/0005-nat-fork-inferior-include-linux-ptrace.h.patch (92%)
 rename package/gdb/{13.2 => 16.1}/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch (94%)
 rename package/gdb/{13.2 => 16.1}/0007-fix-musl-build-on-riscv.patch (91%)
 rename package/gdb/{13.2 => 16.1}/0008-gdbserver-Makefile.in-fix-NLS-build.patch (90%)
 rename package/gdb/{13.2 => 16.1}/0009-gdb-Fix-native-build-on-xtensa.patch (95%)

-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
