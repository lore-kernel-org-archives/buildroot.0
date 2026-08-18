Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F26DC5DF81
	for <buildroot@archiver.kernel.org>; Tue, 18 Aug 2026 18:18:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4705D6078D;
	Tue, 18 Aug 2026 18:18:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x8IfCNxfZ07c; Tue, 18 Aug 2026 18:17:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 447556079A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787077079;
	bh=wQ0d8pIsaoiOpmyoGcjOSZya4p4NpNF78zZB3TiEKm4=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=C/RVc+UWxQnGVcUrQLmob82ec5xcJ6XSjLMNYfADqbo5lbrnypLuEYtEDUHLrR1Ie
	 5lOkkiAhcT25pZQMSlF7dHTwmQ0isc6lITThNh5gMmsXShhBWWKj27vySKdmer0X3v
	 9EX+bKlSee6YRWDidRX3ECgn8MxTAhnqbsfvTrFatjSHB4IBI4d5MWgkkhxJE2Qn2Y
	 Bjh2RRdg1xzkwJmXF7hT0xjuwygcQy+wkmBe/oZOg7fnczSH1glw2a0v9vIiWaQ95v
	 YL3B3WG1goC3bfPQ9l5HHyu4BetWG5IYEk3OqQ8iceTrFO5zq5j8z5G0AZ5KuattT9
	 x+6yM5vxa3aMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 447556079A;
	Tue, 18 Aug 2026 18:17:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 782562FD
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 18:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5EBB16079A
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 18:17:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c2AsjLlql3_M for <buildroot@buildroot.org>;
 Tue, 18 Aug 2026 18:17:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3AE626078D
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AE626078D
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3AE626078D
 for <buildroot@buildroot.org>; Tue, 18 Aug 2026 18:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1787077074; bh=1XpueUCZHTjMPzpEZkfaIrAWc9YtpLxWF1KNAQ0hl40=;
 h=Date:From:To:Cc:Subject:From;
 b=CU4t3DWx+DWxmkllNvs85lVruOKulmAlDvVrpWS9BdKdtEYXK1+9RO155v9Flrhth
 wbrvyr3syHmmWa9VECM8DqcS5J5ZX1NXGj0JKNVl8BoJrfIqxSkEHutL2JBCokq3S1
 ulZAPlB8pLabBcGJfrPoq5ku1OOPHOzd95Kqg+wM+FFMWAe2aCon1N1z8C0qoQgfHM
 mpgahAYq8QthTUShpx2WARuMcqTg6KiRGTnh6FR7d16TlGHNUAiB1AyDJIkdPWwhML
 Ny/FgCo5Mi9Ks72+F3OypNXRlijMDmQXv2gB0cfRsJggm+6D6OJbaIAlDfARcfwIZf
 tNNoI1yNwBGmQ==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id CB55131E0D33; Tue, 18 Aug 2026 20:17:54 +0200 (CEST)
Date: Tue, 18 Aug 2026 20:17:54 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <aoSh0nj09EJBIC4F@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.96+deb13-amd64 x86_64
Subject: [Buildroot] [PATCH] package/uclibc: fix for gcc libquadmath conflict
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

As seen in the Buildroot autobuilders, struct rm_ctx should
not be exposed in the public fenv.h header.

Fixes:
 - https://autobuild.buildroot.net/results/761/7613538e0847a10eb3e2a7e40f3ae76386ac015b/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 ...tx-should-be-private-and-not-exposed.patch | 151 ++++++++++++++++++
 1 file changed, 151 insertions(+)
 create mode 100644 package/uclibc/0003-fenv-struct-rm_ctx-should-be-private-and-not-exposed.patch

diff --git a/package/uclibc/0003-fenv-struct-rm_ctx-should-be-private-and-not-exposed.patch b/package/uclibc/0003-fenv-struct-rm_ctx-should-be-private-and-not-exposed.patch
new file mode 100644
index 0000000000..e77f079dcc
--- /dev/null
+++ b/package/uclibc/0003-fenv-struct-rm_ctx-should-be-private-and-not-exposed.patch
@@ -0,0 +1,151 @@
+From 1105fd6c97f020f6ca7426e19d29081f404b567d Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Tue, 18 Aug 2026 18:13:29 +0200
+Subject: [PATCH] fenv: struct rm_ctx should be private and not exposed in a
+ public header
+
+Upstream: https://gogs.waldemar-brodkorb.de/oss/uclibc-ng/commit/1105fd6c97f020f6ca7426e19d29081f404b567d
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ include/fenv.h              | 10 ----------
+ include/fenv_private.h      | 24 ++++++++++++++++++++++++
+ libm/aarch64/fenv_private.h |  1 +
+ libm/arc/fenv_private.h     |  1 +
+ libm/arm/fenv_private.h     |  1 +
+ libm/csky/fenv_private.h    |  1 +
+ libm/mips/fenv_private.h    |  1 +
+ libm/sparc/fenv_private.h   |  1 +
+ 8 files changed, 30 insertions(+), 10 deletions(-)
+ create mode 100644 include/fenv_private.h
+
+diff --git a/include/fenv.h b/include/fenv.h
+index 4b532c573..34042d5ac 100644
+--- a/include/fenv.h
++++ b/include/fenv.h
+@@ -1,5 +1,4 @@
+ /* Copyright (C) 1997, 1999, 2000 Free Software Foundation, Inc.
+-   This file is part of the GNU C Library.
+ 
+    The GNU C Library is free software; you can redistribute it and/or
+    modify it under the terms of the GNU Lesser General Public
+@@ -131,15 +130,6 @@ extern int fedisableexcept (int __excepts) __THROW;
+ extern int fegetexcept (void) __THROW;
+ #endif
+ 
+-/* Rounding mode context.  This allows functions to set/restore rounding mode
+-   only when the desired rounding mode is different from the current rounding
+-   mode.  */
+-struct rm_ctx
+-{
+-  fenv_t env;
+-  bool updated_status;
+-};
+-
+ __END_DECLS
+ 
+ #endif /* fenv.h */
+diff --git a/include/fenv_private.h b/include/fenv_private.h
+new file mode 100644
+index 000000000..5e81c71aa
+--- /dev/null
++++ b/include/fenv_private.h
+@@ -0,0 +1,24 @@
++/* Copyright (C) 1997, 1999, 2000 Free Software Foundation, Inc.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <http://www.gnu.org/licenses/>.  */
++
++/* Rounding mode context.  This allows functions to set/restore rounding mode
++   only when the desired rounding mode is different from the current rounding
++   mode.  */
++struct rm_ctx
++{
++  fenv_t env;
++  bool updated_status;
++};
+diff --git a/libm/aarch64/fenv_private.h b/libm/aarch64/fenv_private.h
+index 5afb790ea..3eaf0eb3f 100644
+--- a/libm/aarch64/fenv_private.h
++++ b/libm/aarch64/fenv_private.h
+@@ -19,6 +19,7 @@
+ #define AARCH64_FENV_PRIVATE_H 1
+ 
+ #include <fenv.h>
++#include <fenv_private.h>
+ #include <fpu_control.h>
+ 
+ static __always_inline void
+diff --git a/libm/arc/fenv_private.h b/libm/arc/fenv_private.h
+index 5f74c5e13..2e985722f 100644
+--- a/libm/arc/fenv_private.h
++++ b/libm/arc/fenv_private.h
+@@ -19,6 +19,7 @@
+ #define _FENV_PRIVATE_H 1
+ 
+ #include <fenv.h>
++#include <fenv_private.h>
+ #include "get-rounding-mode.h"
+ 
+ /* The standards only specify one variant of the fenv.h interfaces.
+diff --git a/libm/arm/fenv_private.h b/libm/arm/fenv_private.h
+index 566bf443c..61418d9f4 100644
+--- a/libm/arm/fenv_private.h
++++ b/libm/arm/fenv_private.h
+@@ -19,6 +19,7 @@
+ #define ARM_FENV_PRIVATE_H 1
+ 
+ #include <fenv.h>
++#include <fenv_private.h>
+ #include <fpu_control.h>
+ 
+ static __always_inline void
+diff --git a/libm/csky/fenv_private.h b/libm/csky/fenv_private.h
+index f0f48a88a..e6015abee 100644
+--- a/libm/csky/fenv_private.h
++++ b/libm/csky/fenv_private.h
+@@ -19,6 +19,7 @@
+ #define CSKY_FENV_PRIVATE_H 1
+ 
+ #include <fenv.h>
++#include <fenv_private.h>
+ #include <fpu_control.h>
+ #include "fenv_libc.h"
+ 
+diff --git a/libm/mips/fenv_private.h b/libm/mips/fenv_private.h
+index bc9be3b62..273d6faf8 100644
+--- a/libm/mips/fenv_private.h
++++ b/libm/mips/fenv_private.h
+@@ -24,6 +24,7 @@
+    code instead.  */
+ 
+ #include <fenv.h>
++#include <fenv_private.h>
+ #include "fenv_libc.h"
+ #include <fpu_control.h>
+ 
+diff --git a/libm/sparc/fenv_private.h b/libm/sparc/fenv_private.h
+index b888d8442..c76fbad7f 100644
+--- a/libm/sparc/fenv_private.h
++++ b/libm/sparc/fenv_private.h
+@@ -2,6 +2,7 @@
+ #define SPARC_FENV_PRIVATE_H 1
+ 
+ #include <fenv.h>
++#include <fenv_private.h>
+ #include <fpu_control.h>
+ 
+ /* For internal use only: access the fp state register.  */
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
