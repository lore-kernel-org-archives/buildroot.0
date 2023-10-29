Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B8F1C4332F
	for <buildroot@archiver.kernel.org>; Sun, 29 Oct 2023 08:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E82C74249E;
	Sun, 29 Oct 2023 08:47:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E82C74249E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bMtjewIk1Lms; Sun, 29 Oct 2023 08:47:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DED2A43122;
	Sun, 29 Oct 2023 08:47:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DED2A43122
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A6FD51BF41A
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 08:47:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8079070449
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 08:47:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8079070449
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9-pAy3D7EoDF for <buildroot@lists.busybox.net>;
 Sun, 29 Oct 2023 08:47:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD18C7042A
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 08:47:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD18C7042A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9EE69860E9; Sun, 29 Oct 2023 08:47:33 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Oct 2023 09:47:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ce7d054878ddfcdfaa4718085d6621c7f527f7ae
X-Git-Newrev: cf368a3d117a226741569a579820e044a6998079
X-Patchwork-Hint: ignore
Message-Id: <20231029084733.9EE69860E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi: fix build with python 3.12
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cf368a3d117a226741569a579820e044a6998079
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...ngs-TypeInfo-add-initialization-of-tp_wat.patch | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/package/kodi/0006-PythonBindings-TypeInfo-add-initialization-of-tp_wat.patch b/package/kodi/0006-PythonBindings-TypeInfo-add-initialization-of-tp_wat.patch
new file mode 100644
index 0000000000..ed0c340f52
--- /dev/null
+++ b/package/kodi/0006-PythonBindings-TypeInfo-add-initialization-of-tp_wat.patch
@@ -0,0 +1,59 @@
+From cbfee0e6add2b57c6a2a8641a60b4322543f4675 Mon Sep 17 00:00:00 2001
+From: Lukas Rusak <lorusak@gmail.com>
+Date: Wed, 12 Jul 2023 19:58:08 -0700
+Subject: [PATCH] PythonBindings: TypeInfo: add initialization of
+ tp_watched for PyTypeObject
+
+This member was added in upstream commit https://github.com/python/cpython/commit/82ccbf69a842db25d8117f1c41b47aa5b4ed96ab
+
+This change first appeared in Python v3.12.0a1
+
+Signed-off-by: Lukas Rusak <lorusak@gmail.com>
+
+Upstream: https://github.com/xbmc/xbmc/commit/2c84ee54a75770e291f38d4ebb2c31c8f2c3b8c5
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ xbmc/interfaces/python/swig.cpp | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/xbmc/interfaces/python/swig.cpp b/xbmc/interfaces/python/swig.cpp
+index 5a2599a84ea0f..74baa72ee5c4c 100644
+--- a/xbmc/interfaces/python/swig.cpp
++++ b/xbmc/interfaces/python/swig.cpp
+@@ -71,6 +71,9 @@ namespace PythonBindings
+ #endif
+ #if PY_VERSION_HEX < 0x03090000
+       0,
++#endif
++#if PY_VERSION_HEX >= 0x030C00A1
++      0,
+ #endif
+     };
+ 
+
+From e3ba40936cc10de05c46d507851568ee3e351f43 Mon Sep 17 00:00:00 2001
+From: Lukas Rusak <lorusak@gmail.com>
+Date: Thu, 13 Jul 2023 08:57:38 -0700
+Subject: [PATCH] swig.cpp: add clang-format formatting
+
+Signed-off-by: Lukas Rusak <lorusak@gmail.com>
+---
+ xbmc/interfaces/python/swig.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/xbmc/interfaces/python/swig.cpp b/xbmc/interfaces/python/swig.cpp
+index 74baa72ee5c4c..0c49f87ca84e1 100644
+--- a/xbmc/interfaces/python/swig.cpp
++++ b/xbmc/interfaces/python/swig.cpp
+@@ -18,8 +18,8 @@ namespace PythonBindings
+ {
+   TypeInfo::TypeInfo(const std::type_info& ti) : swigType(NULL), parentType(NULL), typeIndex(ti)
+   {
+-    static PyTypeObject py_type_object_header =
+-    { PyVarObject_HEAD_INIT(nullptr, 0) 0,
++    static PyTypeObject py_type_object_header = {
++      PyVarObject_HEAD_INIT(nullptr, 0) 0,
+       0,
+       0,
+       0,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
