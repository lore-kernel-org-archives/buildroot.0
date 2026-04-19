Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C1EEA7193
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 09:01:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBFBA60FC0;
	Sun, 19 Apr 2026 09:01:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5bEVVVELYWt5; Sun, 19 Apr 2026 09:01:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF22760FAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776589283;
	bh=RPIdyAqWFE2yLgzgbiCFjGLDmIQe0seBxB4N4Y2DxiE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NEdjD6bGV5tXtg5AY/SsIobyq9CRukjGUtXxV2aWSbX7geg/JEho7vvUE/BXlgvQ6
	 Cr38fh9D2nxmZ2+XD7noI/vsDpPkqILAbVH5q+ruKg9O3erZaSYwuPKppvrt6NXoxc
	 O8psu4iulHQ9Ta+cO2ObJbmIaUnKdT0Mbjx/8gapI3FTY/imUQG1pJD7jGGeawqwrk
	 LrQyQ5kOdYXbS/ZBtCUkLFZy0Uj97BbCerRo9b+Sg8hFhyireE9LtBAQDcBeXljPy3
	 001K6X/fnUVot7Srk+oJjFCV/Ffm8VCdHPqpTuZWVjUyESlI8bDDSUcBbAy1LqgC0T
	 ROtKxLPXK/mXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF22760FAF;
	Sun, 19 Apr 2026 09:01:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 21CE624D
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 09:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0808240BAD
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 09:01:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l91LdGB0gLyW for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 09:01:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 30EC840B8E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30EC840B8E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 30EC840B8E
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 09:01:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc94.dip0.t-ipconnect.de [79.214.204.148])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EF639A4C0C96;
 Sun, 19 Apr 2026 11:01:15 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50252)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wEO1j-000000005ix-0QiY;
 Sun, 19 Apr 2026 09:01:15 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 19 Apr 2026 11:01:15 +0200
Message-ID: <20260419090115.1129567-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776589276;
 bh=pcctYbipgYh7NcIwAhWZxs/bSwgS8keO1x8dEu0jq1g=;
 h=From:To:Cc:Subject:Date:From;
 b=eYJOFkKiYtyzOgBjWh6f37Gm2HarC0LA5DzyaeTO245xRMeYJBwJuG/WJJJNZWbAC
 CoUGCvZzkF01gWvXuFKUGkZ6fZIztgCC4JN5Yi61Kdax68JajgYPkmZHSU3xGCmfWk
 edm/Sg5aLc/0xmd/cxzonlClmZ3lKZRphK3rdN9pWNDwNPe2ye4HjOzWpsPNkxroy+
 5Uwy/UK2+Rzj68I8/qm5PSym5T+T6fZtc51/OZ65b8XXTImzQSYae/CluZ2EO3Kwd+
 UOEVoXrJ/FGBhApqVJSNP+8uYezAlQgiFVr/xd5qO1PNPNaKpbPyUnTQzqIJUCHB3A
 nif6ZJJPjlHUQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=eYJOFkKi
Subject: [Buildroot] [PATCH 1/1] package/zeek: add various fixes for gcc >=
 15.x
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

Fixes:
https://autobuild.buildroot.net/results/022/0227cdc337fe7cbb19d9b88b2c3d890c6a3ee347/

Please note that patch 0006 fixes a follow-up error masked by the
configure error found by the autobuilders.

Building zeek with gcc 14.x works unpatched with this defconfig:

BR2_x86_64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_GLIBC_STABLE=y
BR2_PACKAGE_ZEEK=y

The cause of the build errors was the bump of gcc to 15.x, this
defconfig fails without these new patches:

BR2_x86_64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PER_PACKAGE_DIRECTORIES=y
BR2_PACKAGE_ZEEK=y

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
@Fabrice: Building with BR2_PACKAGE_ZEEK_ZEEKCTL=y is still broken.
Our zeek release 4.1.1 dates back to 2021 with > 8000 patches applied
to upstream since then, current version is 8.1.1. Backporting python-
related patches to fix the build of zeekctl looks really difficult due
to many changes in the 3rd-party libraries/submodules used by zeek.

Do you have any interest in further maintaining zeek or should we
consider to remove the package because it regularly causes build
errors due to its huge codebase?

 ...fedora-rawhide-due-to-FindBIND.cmake.patch | 28 ++++++++++
 ...dint-to-header-files-and-source-file.patch | 55 +++++++++++++++++++
 2 files changed, 83 insertions(+)
 create mode 100644 package/zeek/0005-Fix-build-with-fedora-rawhide-due-to-FindBIND.cmake.patch
 create mode 100644 package/zeek/0006-Add-include-cstdint-to-header-files-and-source-file.patch

diff --git a/package/zeek/0005-Fix-build-with-fedora-rawhide-due-to-FindBIND.cmake.patch b/package/zeek/0005-Fix-build-with-fedora-rawhide-due-to-FindBIND.cmake.patch
new file mode 100644
index 0000000000..53f4d7bc1e
--- /dev/null
+++ b/package/zeek/0005-Fix-build-with-fedora-rawhide-due-to-FindBIND.cmake.patch
@@ -0,0 +1,28 @@
+From dd6b23769d624b88abb452d657e2aede4af6a211 Mon Sep 17 00:00:00 2001
+From: Johanna Amann <johanna@corelight.com>
+Date: Sun, 19 Apr 2026 09:02:20 +0200
+Subject: [PATCH] Fix build with fedora rawhide due to FindBIND.cmake
+
+Upstream: https://github.com/zeek/zeek/issues/4329
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ cmake/FindBIND.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cmake/FindBIND.cmake b/cmake/FindBIND.cmake
+index a5e3204..da18242 100644
+--- a/cmake/FindBIND.cmake
++++ b/cmake/FindBIND.cmake
+@@ -66,7 +66,7 @@ foreach (bindlib ${bind_libs})
+         #include <arpa/nameser.h>
+         #include <resolv.h>
+         int main() {
+-            int (*p)() = res_mkquery;
++            int (*p)() = (int (*)())res_mkquery;
+             return 0;
+         }
+ " res_mkquery_works_${bindlib})
+-- 
+2.47.3
+
diff --git a/package/zeek/0006-Add-include-cstdint-to-header-files-and-source-file.patch b/package/zeek/0006-Add-include-cstdint-to-header-files-and-source-file.patch
new file mode 100644
index 0000000000..aacd86e7b5
--- /dev/null
+++ b/package/zeek/0006-Add-include-cstdint-to-header-files-and-source-file.patch
@@ -0,0 +1,55 @@
+From 4c7f302f0526713adae4aad7b3153be53039aca3 Mon Sep 17 00:00:00 2001
+From: i2z1 <i2z1@yandex.ru>
+Date: Tue, 6 May 2025 22:09:27 +0300
+Subject: [PATCH] Add `#include <cstdint>` to header files and source file
+
+Upstream: https://github.com/zeek/paraglob/commit/4c7f302f0526713adae4aad7b3153be53039aca3
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ auxil/paraglob/include/paraglob/paraglob.h   | 2 ++
+ auxil/paraglob/include/paraglob/serializer.h | 1 +
+ src/paraglob.cpp              | 2 ++
+ 3 files changed, 5 insertions(+)
+
+diff --git a/auxil/paraglob/include/paraglob/paraglob.h b/auxil/paraglob/include/paraglob/paraglob.h
+index d29488c..f02b4f6 100644
+--- a/auxil/paraglob/include/paraglob/paraglob.h
++++ b/auxil/paraglob/include/paraglob/paraglob.h
+@@ -13,6 +13,8 @@
+ #include <vector>
+ #include <memory> // std::unique_ptr
+ 
++#include <cstdint>
++
+ class AhoCorasickPlus;
+ 
+ namespace paraglob {
+diff --git a/auxil/paraglob/include/paraglob/serializer.h b/auxil/paraglob/include/paraglob/serializer.h
+index 38a3646..fe9be1a 100644
+--- a/auxil/paraglob/include/paraglob/serializer.h
++++ b/auxil/paraglob/include/paraglob/serializer.h
+@@ -6,6 +6,7 @@
+ 
+ #include <vector>
+ #include <memory> // std::unique_ptr
++#include <cstdint>
+ 
+ #include "paraglob/paraglob.h"
+ #include "paraglob/exceptions.h"
+diff --git a/auxil/paraglob/src/paraglob.cpp b/auxil/paraglob/src/paraglob.cpp
+index 3dd490f..feb87c6 100644
+--- a/auxil/paraglob/src/paraglob.cpp
++++ b/auxil/paraglob/src/paraglob.cpp
+@@ -4,6 +4,8 @@
+ 
+ #include "ahocorasick/AhoCorasickPlus.h"
+ 
++#include <cstdint>
++
+ paraglob::Paraglob::Paraglob()
+   : my_ac(new AhoCorasickPlus) {}
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
