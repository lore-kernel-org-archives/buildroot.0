Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB588C25B67
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 18:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92C85424B6;
	Thu, 26 Oct 2023 18:07:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92C85424B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LCc649iC-GZO; Thu, 26 Oct 2023 18:07:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83787424B9;
	Thu, 26 Oct 2023 18:07:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83787424B9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F0A781BF290
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 18:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1E2B42E6F
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 18:07:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1E2B42E6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nYLrgA8FyHWa for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 18:07:54 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D80C642E2E
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 18:07:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D80C642E2E
Received: from fli4l.lan.fli4l (p4fd6ced1.dip0.t-ipconnect.de [79.214.206.209])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 099B4A4C0C29
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 20:07:52 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59828)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1qw4lr-0003mf-2M
 for buildroot@buildroot.org; Thu, 26 Oct 2023 20:07:51 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 26 Oct 2023 20:07:51 +0200
Message-Id: <20231026180751.3150845-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1698343672;
 bh=9QgyeyruxTkBru9J8AmMWkAvvmELlxo5OOtfTt/luVs=;
 h=From:To:Subject:Date:From;
 b=KR43d6qSnDtvylasp3w9OOCsKjuLYVsbRUtQqzMe2UWP/CIxDvlAVyPsPedRAsn06
 hxVmGNBtiwfR8vennKO6Mg0SeC3DsTJyxnEAwhdjjRGJ33OZ+zBvvqOmAUdXwdUV0O
 LEyd28pd80MaYg2jSaqkRfezcZoxV2Sxjg3jRfg3nnBD2m+T8EFozsCMCHsd0cntyP
 NPtByCqBwsiBi9JlRS/MbqOcCbLjnaPd8+MjyUy4v6EsXYQdzV1kRk69AzoiodAmlm
 R0AkfUDsNHNlnUWtnynU+HvXY4k4qcI72CwgtARJHH+huCk3OiYKx3wGQ3OQTNiype
 nAEMc7OmmDqIw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=KR43d6qS
Subject: [Buildroot] [PATCH 1/1] package/kodi: fix build with python 3.12
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...ypeInfo-add-initialization-of-tp_wat.patch | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 package/kodi/0006-PythonBindings-TypeInfo-add-initialization-of-tp_wat.patch

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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
