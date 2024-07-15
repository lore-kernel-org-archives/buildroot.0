Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F42C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 10:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0C72404A5;
	Mon, 15 Jul 2024 10:15:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wKJkpyIS88ou; Mon, 15 Jul 2024 10:15:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11DCD4062F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11DCD4062F;
	Mon, 15 Jul 2024 10:15:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 65E8B1BF3FF
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 10:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4868040591
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 10:14:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CdhmPZaVevIb for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 10:14:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 427E240025
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 427E240025
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 10:14:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C60186C42; Mon, 15 Jul 2024 10:14:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Jul 2024 12:13:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 31d676229dff5134f3dda66d08a6ce409ab81e99
X-Git-Newrev: 3c998848b4c75601f8e55a886d79b4d51bb6f83f
X-Patchwork-Hint: ignore
Message-Id: <20240715101424.3C60186C42@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt5webengine-chromium: fix
 build with recent libxml2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8284093315971291864=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8284093315971291864==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3c998848b4c75601f8e55a886d79b4d51bb6f83f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport upstream qtwebengine-chromium patch to fix:

./../../3rdparty/chromium/third_party/blink/renderer/core/xml/xslt_processor_libxslt.cc: In function ‘xmlDoc* blink::DocLoaderFunc(const xmlChar*, xmlDictPtr, int, void*, xsltLoadType)’:
./../../3rdparty/chromium/third_party/blink/renderer/core/xml/xslt_processor_libxslt.cc:127:32: error: invalid conversion from ‘void (*)(void*, xmlError*)’ {aka ‘void (*)(void*, _xmlError*)’} to ‘xmlStructuredErrorFunc’ {aka ‘void (*)(void*, const _xmlError*)’} [-fpermissive]
  127 |       xmlSetStructuredErrorFunc(console, XSLTProcessor::ParseErrorFunc);
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                |
      |                                void (*)(void*, xmlError*) {aka void (*)(void*, _xmlError*)}

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0010-Fix-building-with-system-libxml2.patch    | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/package/qt5/qt5webengine-chromium/0010-Fix-building-with-system-libxml2.patch b/package/qt5/qt5webengine-chromium/0010-Fix-building-with-system-libxml2.patch
new file mode 100644
index 0000000000..4a4dade203
--- /dev/null
+++ b/package/qt5/qt5webengine-chromium/0010-Fix-building-with-system-libxml2.patch
@@ -0,0 +1,57 @@
+From 67ceca4b097a2d3de28020c9461641d9670009cc Mon Sep 17 00:00:00 2001
+From: Martin Negyokru <negyokru@inf.u-szeged.hu>
+Date: Thu, 7 Dec 2023 15:37:53 +0100
+Subject: [PATCH] Fix building with system libxml2
+
+Libxml2 2.12.0 has changed the const-ness of the
+xmlError pointers, which results in a build error.
+
+Change-Id: Id86fcfbfe004f89109808b9bdb11c01133553884
+Reviewed-on: https://codereview.qt-project.org/c/qt/qtwebengine-chromium/+/523633
+Reviewed-by: Allan Sandfeld Jensen <allan.jensen@qt.io>
+(cherry picked from commit 159dff274a7f32f9b53711df6a5b6fbae8c64b4a)
+Reviewed-on: https://codereview.qt-project.org/c/qt/qtwebengine-chromium/+/525714
+Reviewed-by: Qt Cherry-pick Bot <cherrypick_bot@qt-project.org>
+Upstream: https://github.com/qt/qtwebengine-chromium/commit/c98d28f2f0f23721
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ .../third_party/blink/renderer/core/xml/xslt_processor.h     | 5 +++++
+ .../blink/renderer/core/xml/xslt_processor_libxslt.cc        | 4 ++++
+ 2 files changed, 9 insertions(+)
+
+diff --git a/chromium/third_party/blink/renderer/core/xml/xslt_processor.h b/chromium/third_party/blink/renderer/core/xml/xslt_processor.h
+index e501cf17c37..e4550ec5009 100644
+--- a/chromium/third_party/blink/renderer/core/xml/xslt_processor.h
++++ b/chromium/third_party/blink/renderer/core/xml/xslt_processor.h
+@@ -79,7 +79,12 @@ class XSLTProcessor final : public ScriptWrappable {
+ 
+   void reset();
+ 
++#if LIBXML_VERSION >= 21200
++  static void ParseErrorFunc(void* user_data, const xmlError*);
++#else
+   static void ParseErrorFunc(void* user_data, xmlError*);
++#endif
++
+   static void GenericErrorFunc(void* user_data, const char* msg, ...);
+ 
+   // Only for libXSLT callbacks
+diff --git a/chromium/third_party/blink/renderer/core/xml/xslt_processor_libxslt.cc b/chromium/third_party/blink/renderer/core/xml/xslt_processor_libxslt.cc
+index b3ce345f320..2174d1df1da 100644
+--- a/chromium/third_party/blink/renderer/core/xml/xslt_processor_libxslt.cc
++++ b/chromium/third_party/blink/renderer/core/xml/xslt_processor_libxslt.cc
+@@ -60,7 +60,11 @@ void XSLTProcessor::GenericErrorFunc(void*, const char*, ...) {
+   // It would be nice to do something with this error message.
+ }
+ 
++#if LIBXML_VERSION >= 21200
++void XSLTProcessor::ParseErrorFunc(void* user_data, const xmlError* error) {
++#else
+ void XSLTProcessor::ParseErrorFunc(void* user_data, xmlError* error) {
++#endif
+   FrameConsole* console = static_cast<FrameConsole*>(user_data);
+   if (!console)
+     return;
+-- 
+2.25.1
+

--===============8284093315971291864==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8284093315971291864==--
