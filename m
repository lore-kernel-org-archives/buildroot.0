Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C69BEB64D7
	for <buildroot@archiver.kernel.org>; Tue, 20 Jun 2023 09:02:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B49A86129D;
	Tue, 20 Jun 2023 09:02:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B49A86129D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L2JG2W4EqHvP; Tue, 20 Jun 2023 09:02:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C960C60C1C;
	Tue, 20 Jun 2023 09:02:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C960C60C1C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3069A1BF3C3
 for <buildroot@lists.busybox.net>; Tue, 20 Jun 2023 09:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07A16415F0
 for <buildroot@lists.busybox.net>; Tue, 20 Jun 2023 09:01:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07A16415F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lkkx9-H1OaXu for <buildroot@lists.busybox.net>;
 Tue, 20 Jun 2023 09:01:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF717415CA
Received: from mail (kmf.trabucayre.com [91.121.117.161])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF717415CA
 for <buildroot@buildroot.org>; Tue, 20 Jun 2023 09:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost [127.0.0.1])
 by mail (Postfix) with ESMTP id B5B5339857;
 Tue, 20 Jun 2023 10:15:19 +0200 (CEST)
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jun 2023 10:15:18 +0200
Message-Id: <1687248918-42301-2-git-send-email-gwenj@trabucayre.com>
X-Mailer: git-send-email 1.6.4.2
In-Reply-To: <1687248918-42301-1-git-send-email-gwenj@trabucayre.com>
References: <1687248918-42301-1-git-send-email-gwenj@trabucayre.com>
Subject: [Buildroot] [PATCH 2/2] package/gnuradio: fix gnuradio python
 libraries for cross-compile
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: =?UTF-8?q?Martin=20B=C3=B6h?= <contact@martb.dev>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3947995829819154997=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3947995829819154997==
Content-Type: text/plain

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

By default, module libraries have a suffix based on cpython version + host
architecture: this is fine for a native compile when these libraries are used on
the same computer (or similar computers). But when target architecture is not
the same python is unable to find libraries due to the wrong suffix and produces
unclear errors messages:

# python3
Python 3.11.3 (main, Jun 19 2023, 14:15:44) [GCC 11.4.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> from gnuradio import blocks  
Traceback (most recent call last):
  File "/home/xxx/buildroot/output/build/gnuradio-3.10.4.0/gr-blocks/python/blocks/__init__.py", line 18, in <module>
ModuleNotFoundError: No module named 'gnuradio.blocks.blocks_python'

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/home/xxx/buildroot/output/build/gnuradio-3.10.4.0/gr-blocks/python/blocks/__init__.py", line 22, in <module>
ModuleNotFoundError: No module named 'gnuradio.blocks.blocks_python'
>>>


Based on: http://patchwork.ozlabs.org/project/buildroot/patch/20230223201511.217372-2-contact@martb.dev/

Upstream status: https://github.com/gnuradio/gnuradio/pull/6727

Signed-off-by: Martin Böh <contact@martb.dev>
Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 ...ix-invalid-suffix-when-cross-compile.patch | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 package/gnuradio/0003-grPyBind-fix-invalid-suffix-when-cross-compile.patch

diff --git a/package/gnuradio/0003-grPyBind-fix-invalid-suffix-when-cross-compile.patch b/package/gnuradio/0003-grPyBind-fix-invalid-suffix-when-cross-compile.patch
new file mode 100644
index 0000000000..37bd9147dc
--- /dev/null
+++ b/package/gnuradio/0003-grPyBind-fix-invalid-suffix-when-cross-compile.patch
@@ -0,0 +1,72 @@
+From fad27221925d71bcbcbffea9787abdd80351c5c5 Mon Sep 17 00:00:00 2001
+From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
+Date: Wed, 22 Feb 2023 03:05:08 +0100
+Subject: [PATCH] grPyBind: fix invalid suffix when cross-compile
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This is required as pybind11 uses host python3 and therefore the host platform
+suffixes.
+
+By default, module libraries have a suffix based on cpython version + host
+architecture: this is fine for a native compile when these libraries are used
+on the same computer (or similar computers). But when target architecture is
+not the same python is unable to find libraries due to the wrong suffix and
+produces unclear errors messages.
+This patch, when CMAKE_CROSSCOMPILING is set, force libraries suffix extension
+to resolve this runtime issue.
+
+Signed-off-by: Martin Böh <contact@martb.dev>
+Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
+[Upstream status: https://github.com/gnuradio/gnuradio/pull/6727]
+---
+ cmake/Modules/GrPybind.cmake | 18 ++++++++++++++++++
+ 1 file changed, 18 insertions(+)
+
+diff --git a/cmake/Modules/GrPybind.cmake b/cmake/Modules/GrPybind.cmake
+index 5a6fb7633..c2df17c2d 100644
+--- a/cmake/Modules/GrPybind.cmake
++++ b/cmake/Modules/GrPybind.cmake
+@@ -8,6 +8,12 @@ macro(GR_PYBIND_MAKE name updir filter files)
+                    ${CMAKE_CURRENT_BINARY_DIR} COPYONLY)
+ 
+     pybind11_add_module(${name}_python ${files})
++    
++    # Use normal .so suffix when crosscompiling
++    # See https://github.com/gnuradio/gnuradio/issues/5455
++    if (CMAKE_CROSSCOMPILING)
++        set_target_properties(${name}_python PROPERTIES SUFFIX ".so")
++    endif()
+ 
+     set(MODULE_NAME ${name})
+     if(${name} STREQUAL gr)
+@@ -135,6 +141,12 @@ macro(GR_PYBIND_MAKE_CHECK_HASH name updir filter files)
+ 
+     pybind11_add_module(${name}_python ${files})
+ 
++    # Use normal .so suffix when crosscompiling
++    # See https://github.com/gnuradio/gnuradio/issues/5455
++    if (CMAKE_CROSSCOMPILING)
++        set_target_properties(${name}_python PROPERTIES SUFFIX ".so")
++    endif()
++
+     set(MODULE_NAME ${name})
+     if(${name} STREQUAL gr)
+         set(MODULE_NAME "runtime")
+@@ -286,6 +298,12 @@ macro(GR_PYBIND_MAKE_OOT name updir filter files)
+ 
+     pybind11_add_module(${name}_python ${files})
+ 
++    # Use normal .so suffix when crosscompiling
++    # See https://github.com/gnuradio/gnuradio/issues/5455
++    if (CMAKE_CROSSCOMPILING)
++        set_target_properties(${name}_python PROPERTIES SUFFIX ".so")
++    endif()
++
+     set(MODULE_NAME ${name})
+     if(${name} STREQUAL gr)
+         set(MODULE_NAME "runtime")
+-- 
+2.39.3
+
-- 
2.39.3


--===============3947995829819154997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3947995829819154997==--
