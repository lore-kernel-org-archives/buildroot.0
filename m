Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D4F4C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11FD070775;
	Fri, 28 Feb 2025 16:59:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XDZO1ftxSZg9; Fri, 28 Feb 2025 16:59:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20A696FCCD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20A696FCCD;
	Fri, 28 Feb 2025 16:59:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 14CFC68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:39:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C99541810
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X10SfgvxEgvt for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD8BD41A15
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD8BD41A15
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C5A2883B5A; Fri, 28 Feb 2025 16:30:12 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 16 Jan 2025 23:29:54 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 30b05ce90d3368c0c74d2602735afdadbe50ec54
X-Git-Newrev: e2e152496a588cbb9a877b9f53b261a83692c52d
X-Patchwork-Hint: ignore
Message-Id: <20250228163012.C5A2883B5A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libxml2: fix segfault
 with python-lxml
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e2e152496a588cbb9a877b9f53b261a83692c52d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Backport a patch fixing a segfault first introduced by
ca63c4409b3c811e8c4ee19c2860c53af35c4ce1 in buildroot.

Fixes:
==4792== Invalid read of size 8
==4792==    at 0x4FE7661: __gconv_close (gconv_close.c:33)
==4792==    by 0x4FE70EE: iconv_close (iconv_close.c:34)
==4792==    by 0x5AED422: xmlCharEncCloseFunc (encoding.c:2678)
==4792==    by 0x587A78C: __pyx_f_4lxml_5etree__find_PyUCS4EncodingName (etree.c:126676)
==4792==    by 0x5888666: __pyx_pymod_exec_etree (etree.c:289773)
==4792==    by 0x4A06345: PyModule_ExecDef (moduleobject.c:440)
==4792==    by 0x4AE23A8: _imp_exec_dynamic_impl (import.c:3801)
==4792==    by 0x4AE23A8: _imp_exec_dynamic (import.c.h:534)
==4792==    by 0x4A046A3: cfunction_vectorcall_O (methodobject.c:509)
==4792==    by 0x4AAA203: _PyEval_EvalFrameDefault (bytecodes.c:3263)
==4792==    by 0x49B9D2B: _PyObject_VectorcallTstate (pycore_call.h:92)
==4792==    by 0x49B9D2B: object_vacall (call.c:850)
==4792==    by 0x49B9F44: PyObject_CallMethodObjArgs (call.c:911)
==4792==    by 0x4AE648A: import_find_and_load (import.c:2781)
==4792==    by 0x4AE648A: PyImport_ImportModuleLevelObject (import.c:2864)
==4792==  Address 0x8 is not stack'd, malloc'd or (recently) free'd

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0002-Fix-Fix-compilation-with-uclibc.patch     | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/package/libxml2/0002-Fix-Fix-compilation-with-uclibc.patch b/package/libxml2/0002-Fix-Fix-compilation-with-uclibc.patch
new file mode 100644
index 0000000000..76ea711962
--- /dev/null
+++ b/package/libxml2/0002-Fix-Fix-compilation-with-uclibc.patch
@@ -0,0 +1,31 @@
+From 539663626b91567159a70791c0f2b3b167135e9b Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Thu, 16 Jan 2025 15:50:46 +0100
+Subject: [PATCH] Fix "Fix compilation with uclibc"
+
+The ICU code must initialize the iconv members as well.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Upstream: https://gitlab.gnome.org/GNOME/libxml2/-/commit/539663626b91567159a70791c0f2b3b167135e9b
+---
+ encoding.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/encoding.c b/encoding.c
+index 41ecde18..0ce8d479 100644
+--- a/encoding.c
++++ b/encoding.c
+@@ -1641,6 +1641,10 @@ xmlCreateUconvHandler(const char *name, xmlCharEncodingHandler **out) {
+     }
+     enc->input = NULL;
+     enc->output = NULL;
++#ifdef LIBXML_ICONV_ENABLED
++    enc->iconv_in = (iconv_t) -1;
++    enc->iconv_out = (iconv_t) -1;
++#endif
+     enc->uconv_in = ucv_in;
+     enc->uconv_out = ucv_out;
+ 
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
