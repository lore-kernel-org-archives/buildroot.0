Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85EFFCD6E52
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 14:39:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 536CF429DD;
	Sun, 31 May 2026 14:39:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F9LopBsZrVLW; Sun, 31 May 2026 14:39:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB940429CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780238356;
	bh=CpnWgm1jb9nQvjo4q0+L1E+1HBEn+g610FfkGfd3iOE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GlcSkipw/XT8XDWZ4Z28X88R21/SGG7xR+Ru+WAWnLavMohsx/ytm6FmXOJbL4CDg
	 mSP2nE9vLWwPNzVh62ZNJLZ5tXseVL4JyBP3mPo/qDVYHXCagvgKOhxFmGB6/978Nq
	 4yd/owBZyB5I79mYAyxfh70XvVD8VYzvDxX4nSCxmJJixnlAgKCgZ4XZsULSqsqtHk
	 U+V/PgCeyKxRxDr89ibYAGJ5EhJ7k0+FtQVFfqY9/ndwTHvS4I6xRmjuZUnSgp5ENL
	 6noyZ1fLPHf+NuS4FKtScGRePRaaRyXKEgATf6KWesdJiFAREqeJXqJ0/A08w6/OQE
	 Rcs741DILCzjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB940429CA;
	Sun, 31 May 2026 14:39:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D3251257
 for <buildroot@buildroot.org>; Sun, 31 May 2026 14:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9D45608CB
 for <buildroot@buildroot.org>; Sun, 31 May 2026 14:39:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fVJoRufat_6x for <buildroot@buildroot.org>;
 Sun, 31 May 2026 14:39:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 95698608BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95698608BE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 95698608BE
 for <buildroot@buildroot.org>; Sun, 31 May 2026 14:39:13 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0bc7.dip0.t-ipconnect.de [91.58.11.199])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6E35AA4C2E86
 for <buildroot@buildroot.org>; Sun, 31 May 2026 16:39:11 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36154)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wThJn-000000000jL-2CAy
 for buildroot@buildroot.org; Sun, 31 May 2026 14:39:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 31 May 2026 16:39:11 +0200
Message-ID: <20260531143911.2967639-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780238351;
 bh=chERTvPrsWJjeAsAwGwI6pR4d4nGg4Tms8fuf/oAqwM=;
 h=From:To:Subject:Date:From;
 b=IGOY4zSREYgWi7KIjNxMhyd32pulF84UTtOgpFZBOuM1Kdhiwwk2ytTqDaSTSXBDv
 78VIU2Is2WAAN41emaeTEkmctpGE5jBU3/tP9s0jPn7tGevozslFrfuttsvtvPZw37
 eclo3MuBXeJnED8BV9ZkPahP3btbxdig22x46+Ua7z1bd351UyVGgOdQVgBtFuMzdr
 k0Ajeo+MVTziw3GgaGE2ogfA7CdLh+HK+XxA63aDviX+Aboe7AX/i0B2zIH1T9NABn
 r/5JBswVjBP0V7TgA8eSXFUcO4tw+6DBKNCefoiS+DiCbIwmFdpP66TYYMfnJqDVny
 9tA9r5V/pBQCw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=IGOY4zSR
Subject: [Buildroot] [PATCH/next 1/1] package/nut: bump version to 2.8.5
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updated license hash due to upstream commit:
https://github.com/networkupstools/nut/commit/d5b040b2a9e7eb86d819b534a0ba274f76616dfa

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/519992f1ef95ffb845fdec5c1fc3eaccc65b841d

 package/nut/nut.hash | 6 +++---
 package/nut/nut.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/nut/nut.hash b/package/nut/nut.hash
index 0d78324818..43560d5028 100644
--- a/package/nut/nut.hash
+++ b/package/nut/nut.hash
@@ -1,7 +1,7 @@
-# From https://github.com/networkupstools/nut/releases/download/v2.8.4/nut-2.8.4.tar.gz.sha256
-sha256  0130ba82ea79f04ba4f34c5249a85943977efd984ed7df6aec1a518d5a3594f8  nut-2.8.4.tar.gz
+# From https://github.com/networkupstools/nut/releases/download/v2.8.5/nut-2.8.5.tar.gz.sha256
+sha256  18bf32e59eb764b13da3c4fa70384926d7fa584cb31d2fe7f137a570633eeec1  nut-2.8.5.tar.gz
 
 # Locally computed
-sha256  40885775f43463c404d74bbd00a59fac6c0fe73f838d4520472d721917412577  COPYING
+sha256  a6c3d535c77fbfcecb33a3545668cfa0354a5ad517930c255eb39f135f7213db  COPYING
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE-GPL2
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  LICENSE-GPL3
diff --git a/package/nut/nut.mk b/package/nut/nut.mk
index 4fc461a993..3b4aef28ce 100644
--- a/package/nut/nut.mk
+++ b/package/nut/nut.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NUT_VERSION = 2.8.4
+NUT_VERSION = 2.8.5
 NUT_SITE = https://github.com/networkupstools/nut/releases/download/v$(NUT_VERSION)
 NUT_LICENSE = GPL-2.0+, GPL-3.0+ (python scripts), GPL/Artistic (perl client)
 NUT_LICENSE_FILES = COPYING LICENSE-GPL2 LICENSE-GPL3
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
