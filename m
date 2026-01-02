Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A06FFA3753
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 15:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB61F60D9B;
	Fri,  2 Jan 2026 15:43:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CfMClrfXHYEI; Fri,  2 Jan 2026 15:43:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDD9060D9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767368627;
	bh=5X5Vd/W5HdOp/FqjXw0hDIG5G0ft7NtrypegJaELkXQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=F0IgepgMamqGkob5UjusCJjs5lqJCrpQPOZcgKLpfUQDhcRSj12YsHJLvnqr0C1dy
	 LO/N2m38Sk22KEC6RNZFvNp6txMF9+Myn2pGQ1uQO98LckNdNAxOx/CrRWDlK0a36z
	 MDkm/dbfxIWiQFvAd66+v+Am74u1ImrU+MTiX7vvLipKD5F7TiNssEmCciVoThdp+n
	 zpdw3vx8s/9Membl4+QeG/M0dBHO0b11nEostFJmienvYO/uGuFKfynblGjRR0zeTy
	 YVYp/ZWJWG9+JuG5CCVDJOGoUdf5waNhBt8xX4gNfVSeUf/Gl0iKCtTsWTZj6A4C1Z
	 /TkexfonkUgqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDD9060D9F;
	Fri,  2 Jan 2026 15:43:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BFB3351
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E4BE4083D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:43:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id spiW0tlkY_48 for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 15:43:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 91B2F40AE5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91B2F40AE5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 91B2F40AE5
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:43:44 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AA183A4C2A3F;
 Fri,  2 Jan 2026 16:43:42 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45948)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vbhJW-000000007c7-1FgG;
 Fri, 02 Jan 2026 15:43:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri,  2 Jan 2026 16:43:42 +0100
Message-ID: <20260102154342.1180158-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767368622;
 bh=rFlL3x2pjCpsXLjO4+GTdSEGApYKkgl5hglkzFC4NS4=;
 h=From:To:Cc:Subject:Date:From;
 b=rufzwTKVJqXjncAFcA+2Hujolagbvatu/WiSZXQlkTpbHplcRb/qW/2bpCrhT5c1D
 TGw+tV+2h7gost8gkmM43I4sbWazGXcXjEsauD9eE52UVpZBYnW8hKdDOC2ayMkuWz
 v6ahIfYrttqaeZ3lGj44xkft11p9+RnsKJJEmYBgjz0A5UBlN+t6ojiq+zmTyYUJ62
 oP17vnORVV9xXCCo4dkBUBmVDMjd2STJTMdfJ9/rhqCq5RTCusKwZsF4I2DQMT2IG5
 9LAXpbX99d/lYLfiTB8L9777hyKXQTyTqHte0K52qozBk4pofPwtqVwVx9q2VlmG6E
 6w75wYJRVoebg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=rufzwTKV
Subject: [Buildroot] [PATCH v2 1/1] package/atf: fix non-threaded build
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

Buildroot commit d6c3257e931ed256e3ebcd78938f6146bba8586f bumped the
package from 0.21 to 0.23. Upstream release 0.22 includes commit
https://github.com/freebsd/atf/commit/d7c7c53c0626ab59a62aa4efcf05323b3621baa9
which uses CLOCK_MONOTONIC without including time.h.

Fixes:
https://autobuild.buildroot.net/results/41b/41b25ee8e66e34323eca011e4b5fe479ece9ed76/

Two minimal defconfigs to reproduce the build error:

BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
BR2_PTHREADS_NONE=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_ATF=y

BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
BR2_PTHREADS_NONE=y
BR2_GCC_VERSION_13_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_ATF=y

All defconfigs of the build errors recorded by the buildroot autobuilders
contain BR2_PTHREADS_NONE=y.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: updated subject, build error is unrelated to gcc version (Thomas)

 .../0001-atf-check.cpp-include-time.h.patch   | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/atf/0001-atf-check.cpp-include-time.h.patch

diff --git a/package/atf/0001-atf-check.cpp-include-time.h.patch b/package/atf/0001-atf-check.cpp-include-time.h.patch
new file mode 100644
index 0000000000..359172c0e6
--- /dev/null
+++ b/package/atf/0001-atf-check.cpp-include-time.h.patch
@@ -0,0 +1,33 @@
+From 67e7d350a15aff88c151b1fc838dac83d35be955 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sat, 22 Nov 2025 23:47:41 +0100
+Subject: [PATCH] atf-check.cpp: include time.h
+
+Fixes build error with gcc 14 as reported by the buildroot autobuilders:
+https://autobuild.buildroot.net/results/41b/41b25ee8e66e34323eca011e4b5fe479ece9ed76/build-end.log
+
+atf-sh/atf-check.cpp: In function 'useconds_t get_monotonic_useconds()':
+atf-sh/atf-check.cpp:183:24: error: 'CLOCK_MONOTONIC' was not declared in this scope
+
+Upstream: https://github.com/freebsd/atf/commit/67e7d350a15aff88c151b1fc838dac83d35be955
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ atf-sh/atf-check.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/atf-sh/atf-check.cpp b/atf-sh/atf-check.cpp
+index 1354e3a..94da413 100644
+--- a/atf-sh/atf-check.cpp
++++ b/atf-sh/atf-check.cpp
+@@ -30,6 +30,7 @@ extern "C" {
+ #include <limits.h>
+ #include <signal.h>
+ #include <stdint.h>
++#include <time.h>
+ #include <unistd.h>
+ }
+ 
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
