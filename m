Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2541C3ABBC
	for <buildroot@archiver.kernel.org>; Tue,  6 May 2025 15:57:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7081460706;
	Tue,  6 May 2025 15:57:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x5OIpCZZwBbR; Tue,  6 May 2025 15:57:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70ACD60DDF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70ACD60DDF;
	Tue,  6 May 2025 15:57:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 31CAC20F8
 for <buildroot@buildroot.org>; Tue,  6 May 2025 15:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2350740900
 for <buildroot@buildroot.org>; Tue,  6 May 2025 15:57:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IGuwtuV6Cmoo for <buildroot@buildroot.org>;
 Tue,  6 May 2025 15:57:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 58706408FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58706408FB
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 58706408FB
 for <buildroot@buildroot.org>; Tue,  6 May 2025 15:57:36 +0000 (UTC)
Received: from home.juju.sh (unknown [86.210.113.106])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 20EECB005C8;
 Tue,  6 May 2025 17:57:29 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Vincent Fazio <vfazio@xes-inc.com>
Date: Tue,  6 May 2025 17:57:16 +0200
Message-ID: <20250506155716.213768-1-ju.o@free.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746547053;
 bh=A3Oi8w4u56DdoH8GfTTrbSXQioRM4KrO0V+7/f2GCSI=;
 h=From:To:Cc:Subject:Date:From;
 b=AfMbhF/vie6Lv9QwnPjfblDGRaT9kySIrbBus8Orqt2vvywxpmN+7afNyB5LNAXDm
 7Uwq5lRnYKv1e4XYQBXorcCoiDHKLsJ3ap7BZIld8k/FCL3hzeiLLpo2RXJYr5k+12
 NHYWmaVGZC9RFwoQC5pc46WAKP8Uay+jHd8gu9SJt752hiaHI3VHL/gXQuPEuCiYWh
 RGZju087MFqnW20+dg3r1OVD651N5FCmHh6Gd6eOYaq1V3Wzx5mOYxszTej2qVVznc
 nBMIw1U+GZnGOPJllhSPW6QaCad47ApIlAL1UxtzpI6e1d0yg9xopmH6YuExBiih1O
 clMPQ77cUv6vQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=AfMbhF/v
Subject: [Buildroot] [PATCH RFC 1/1] support/testing/tests/package/test_zfs:
 fix uclibc test by using bleeding-edge toolchain
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

Since commit [1] which bumped Python from 3.12.9 to 3.13.2, the runtime
test tests.package.test_zfs.TestZfsUclibc is failing with the error:

    WARN: defconfig can't be used
          Missing: BR2_PACKAGE_PYTHON3=y

This is because Python 3.13 requires time64, and uclibc supports it only
with toolchain headers >= 5.1. The stable bootlin toolchain is based on
4.19 headers and is no longer sufficient.

This commit fixes the issue by updating the defconfig of the runtime
test, to use the bleeding-edge toolchain (which is based on 5.15
headers).

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/9922591461

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/d63e207eb869063f82c867658676c2903beb08cb

Cc: Vincent Fazio <vfazio@xes-inc.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
While testing this patch in
https://gitlab.com/jolivain/buildroot/-/jobs/9935681972
it appears that it does fix the initial build issue, but it also
reveal a new runtime issue. The Python interpreter (from the
arc_summary script) crashes with a message:

    Fatal Python error: _PyThreadState_Attach: non-NULL old thread state
    Python runtime state: preinitialized
    Thread 0xSegmentation fault

So even when applying this patch, the runtime test still fails (it
just goes a bit farther). The issue now seems to be only related to
python 3.13 and uclibc.

Does anybody have an idea?
---
 support/testing/tests/package/test_zfs.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_zfs.py b/support/testing/tests/package/test_zfs.py
index 1b907ac4de..5c8fc58ac5 100644
--- a/support/testing/tests/package/test_zfs.py
+++ b/support/testing/tests/package/test_zfs.py
@@ -74,9 +74,14 @@ class TestZfsGlibc(TestZfsBase):
 
 
 class TestZfsUclibc(TestZfsBase):
+    # This test uses uClibc bleeding edge toolchain, because it
+    # selects python3 which needs time64 since 3.13. time64 support in
+    # uclibc requires toolchain headers >= 5.1. The bleeding edge
+    # toolchains are based on 5.15 headers, while the stable
+    # toolchains are on 4.19.
     config = TestZfsBase.config + \
         """
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_STABLE=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_BLEEDING_EDGE=y
         """
 
     def test_run(self):
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
