Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A263BEF99D4
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FC5E41E5F;
	Fri, 13 Feb 2026 19:35:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ylN4jTmFAB1; Fri, 13 Feb 2026 19:35:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62B0641E44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011334;
	bh=n0Os/mDBhGw5VMCSmxoBQ/fvCLU8a87G+6JESwD+n5s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=i+NdAyV/O2T1MXBIb9vpiqjqOPvdyXTJiPmEYmxNf2xqPD4TzEl4dFl889AALJzFu
	 wzZ/lylFFDDwohWLRolEYPU+CTEJxWecBjIdublMpdsWc9SWhQIscVnR4g/bDnG1E3
	 egWHPuFbNxQB6ndExnHVqYWZ3MbFSRPVFNn7mWtmM5ygJ5BOUaAbF9CFr5X2X38SCN
	 1v4aij0VW3uP9z8DZVudW2wYa32LMNMYibkpL0Sx3Ua2tpSdr3mKsa27jn7FGG5Pnd
	 3HjjQ1UPQegtUBi9l9JXqKCel4n6XJ++ybdvzF4xD4JkodrcdGARK4PsK9YxMjXLx+
	 UFlMtxCE8tQPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62B0641E44;
	Fri, 13 Feb 2026 19:35:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E316283
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8857041E37
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jbaycjoZZNE1 for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B795A41E21
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B795A41E21
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ACA0686C0F; Fri, 13 Feb 2026 19:35:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:21:35 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 8fd75e77357bfb463956172cc4dd88a1a0b52d21
X-Git-Newrev: 7a19511a9086bf123a5057beedc5c94bbb0f5d42
X-Patchwork-Hint: ignore
Message-Id: <20260213193526.ACA0686C0F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/zeek: add various
 fixes for gcc >= 13.x
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2974607412884591219=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2974607412884591219==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7a19511a9086bf123a5057beedc5c94bbb0f5d42
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Fixes:
https://autobuild.buildroot.net/results/906/9061a358d5b37d7674fe5498686cecefda6cf51e/

The build error

  ripemd_160.hpp:52:23: error: 'uint8_t' was not declared in this scope

which is fixed by patch 0002, afaics, first occurred on 2024-04-04:
https://autobuild.buildroot.net/results/7ff/7ff3d6a09bd4911ff78e01c14f2bfb7da3d43d60/
so a backport should be considered.

After fixing the build error other build errors occurred which are fixed by
backporting various upstream commits.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit eb8ee9f7fdd0bddda62e72fa0c5c47f4e1f4b39c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...dd-missing-includes-fix-build-with-GCC-13.patch | 40 ++++++++++++++++++
 ...-resulting-from-removal-of-ghc-filesystem.patch | 48 ++++++++++++++++++++++
 ...State.h-to-fix-compilation-error-on-gcc13.patch | 24 +++++++++++
 3 files changed, 112 insertions(+)

diff --git a/package/zeek/0002-Add-missing-includes-fix-build-with-GCC-13.patch b/package/zeek/0002-Add-missing-includes-fix-build-with-GCC-13.patch
new file mode 100644
index 0000000000..3590b01c58
--- /dev/null
+++ b/package/zeek/0002-Add-missing-includes-fix-build-with-GCC-13.patch
@@ -0,0 +1,40 @@
+From c41f1c24f6ed2a5441b231b17e1889580bbbc01c Mon Sep 17 00:00:00 2001
+From: Dominik Charousset <dominik@charousset.de>
+Date: Wed, 29 Mar 2023 17:01:37 +0200
+Subject: [PATCH] Add missing includes, fix build with GCC 13
+
+(cherry picked from commit c2ee99c38989deba848cc4c4ec9a230fa71162f7)
+
+Upstream: https://github.com/zeek/actor-framework/commit/c41f1c24f6ed2a5441b231b17e1889580bbbc01c
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ libcaf_core/caf/detail/ripemd_160.hpp     | 1 +
+ libcaf_core/caf/telemetry/metric_type.hpp | 2 ++
+ 2 files changed, 3 insertions(+)
+
+diff --git a/libcaf_core/caf/detail/ripemd_160.hpp b/libcaf_core/caf/detail/ripemd_160.hpp
+index ea9f44cec3..ec2482ecfa 100644
+--- a/auxil/broker/caf/libcaf_core/caf/detail/ripemd_160.hpp
++++ b/auxil/broker/caf/libcaf_core/caf/detail/ripemd_160.hpp
+@@ -42,6 +42,7 @@
+ 
+ #include <array>
+ #include <string>
++#include <cstdint>
+ 
+ #include "caf/detail/core_export.hpp"
+ 
+diff --git a/libcaf_core/caf/telemetry/metric_type.hpp b/libcaf_core/caf/telemetry/metric_type.hpp
+index 0525dd1da7..2047b5f6cc 100644
+--- a/auxil/broker/caf/libcaf_core/caf/telemetry/metric_type.hpp
++++ b/auxil/broker/caf/libcaf_core/caf/telemetry/metric_type.hpp
+@@ -4,6 +4,8 @@
+ 
+ #pragma once
+ 
++#include <cstdint>
++
+ namespace caf::telemetry {
+ 
+ enum class metric_type : uint8_t {
diff --git a/package/zeek/0003-Fix-some-missing-includes-resulting-from-removal-of-ghc-filesystem.patch b/package/zeek/0003-Fix-some-missing-includes-resulting-from-removal-of-ghc-filesystem.patch
new file mode 100644
index 0000000000..7789223a09
--- /dev/null
+++ b/package/zeek/0003-Fix-some-missing-includes-resulting-from-removal-of-ghc-filesystem.patch
@@ -0,0 +1,48 @@
+From 1f87382302896876df0838d83f0d107aae4b89d3 Mon Sep 17 00:00:00 2001
+From: Tim Wojtulewicz <tim@corelight.com>
+Date: Thu, 10 Jul 2025 16:28:40 -0700
+Subject: [PATCH] Fix some missing #includes resulting from removal of
+ ghc::filesystem
+
+Upstream: https://github.com/zeek/zeek/commit/1f87382302896876df0838d83f0d107aae4b89d3
+
+[Bernd:
+- backported only UDP.cc change from upstream commit
+- added similar change to src/script_opt/CPP/GenFunc.cc, no upstream
+  commit due to switch to from transform to std::ranges::transform:
+  https://github.com/zeek/zeek/commit/72c79006ac028558004a259081fa8e02de3ebe85
+  to fix build error:
+
+  /home/bernd/buildroot/output/build/zeek-4.1.1/src/script_opt/CPP/GenFunc.cc:
+   In member function ‘std::string zeek::detail::CPPCompile::BodyName(const zeek::detail::FuncInfo&)’:
+  /home/bernd/buildroot/output/build/zeek-4.1.1/src/script_opt/CPP/GenFunc.cc:214:17:
+   error: ‘transform’ was not declared in this scope
+    214 |                 transform(fns.begin(), fns.end(), fns.begin(), canonicalize);]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/packet_analysis/protocol/udp/UDP.cc      | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/packet_analysis/protocol/udp/UDP.cc b/src/packet_analysis/protocol/udp/UDP.cc
+index bebfabd3fbb..bf114f5518b 100644
+--- a/src/packet_analysis/protocol/udp/UDP.cc
++++ b/src/packet_analysis/protocol/udp/UDP.cc
+@@ -1,6 +1,9 @@
+ // See the file "COPYING" in the main distribution directory for copyright.
+ 
+ #include "zeek/packet_analysis/protocol/udp/UDP.h"
++
++#include <algorithm>
++
+ #include "zeek/RunState.h"
+ #include "zeek/Conn.h"
+ #include "zeek/session/Manager.h"
+--- a/src/script_opt/CPP/GenFunc.cc
++++ b/src/script_opt/CPP/GenFunc.cc
+@@ -1,5 +1,6 @@
+ // See the file "COPYING" in the main distribution directory for copyright.
+ 
++#include <algorithm>
+ #include <errno.h>
+ #include <unistd.h>
+ #include <sys/stat.h>
diff --git a/package/zeek/0004-Add-cstdint-to-WeirdState.h-to-fix-compilation-error-on-gcc13.patch b/package/zeek/0004-Add-cstdint-to-WeirdState.h-to-fix-compilation-error-on-gcc13.patch
new file mode 100644
index 0000000000..09207a2d62
--- /dev/null
+++ b/package/zeek/0004-Add-cstdint-to-WeirdState.h-to-fix-compilation-error-on-gcc13.patch
@@ -0,0 +1,24 @@
+From 122b8d6052ab987237dd8eb3feeed598230881f7 Mon Sep 17 00:00:00 2001
+From: Tim Wojtulewicz <tim@corelight.com>
+Date: Mon, 10 Apr 2023 16:07:18 -0700
+Subject: [PATCH] Add cstdint to WeirdState.h to fix compilation error on gcc13
+
+Upstream: https://github.com/zeek/zeek/commit/122b8d6052ab987237dd8eb3feeed598230881f7
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/WeirdState.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/WeirdState.h b/src/WeirdState.h
+index 5b8e90fba6a..b34a6da8e82 100644
+--- a/src/WeirdState.h
++++ b/src/WeirdState.h
+@@ -2,6 +2,7 @@
+ 
+ #pragma once
+ 
++#include <cstdint>
+ #include <string>
+ #include <unordered_map>
+ 

--===============2974607412884591219==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2974607412884591219==--
