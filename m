Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEED2C3DA64
	for <buildroot@archiver.kernel.org>; Wed, 31 Jul 2024 16:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B308380DC0;
	Wed, 31 Jul 2024 16:54:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ADIw2iLGSLSJ; Wed, 31 Jul 2024 16:54:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB75380E0D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB75380E0D;
	Wed, 31 Jul 2024 16:54:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E25E91BF3D8
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 16:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C91FE80B53
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 16:54:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W0uYossRA_Lz for <buildroot@lists.busybox.net>;
 Wed, 31 Jul 2024 16:54:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6751480AC7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6751480AC7
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 16:54:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3F2FD8041A; Wed, 31 Jul 2024 16:54:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 31 Jul 2024 18:31:55 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 4ec45eda0ed47458e6e667f05e9dfb9aabf3bcb4
X-Git-Newrev: b72162e8068f2e611e4d692afb6da840cd969a08
X-Patchwork-Hint: ignore
Message-Id: <20240731165429.3F2FD8041A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/qt5/qt5webkit:
 fix WebCore compatibility issue with updated libxml2
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
Content-Type: multipart/mixed; boundary="===============6976867250147043926=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6976867250147043926==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=b72162e8068f2e611e4d692afb6da840cd969a08
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

qt5webkit build currently breaks on the following error:

XSLStyleSheetLibxslt.cpp:148:129: error: invalid conversion from ‘void (*)(void*, xmlError*)’ {aka ‘void (*)(void*, _xmlError*)’} to ‘xmlStructuredErrorFunc’ {aka ‘void (*)(void*, const _xmlError*)’} [-fpermissive]
  148 |     XMLDocumentParserScope scope(cachedResourceLoader(), XSLTProcessor::genericErrorFunc, XSLTProcessor::parseErrorFunc, console);
      |                                                                                                                                 ^
      |                                                                                                                                 |
      |                                                                                                                                 void (*)(void*, xmlError*) {aka void (*)(void*, _xmlError*)}

This error is due to an API update in libxml2, enforcing const on more
struct in version 2.12.0 (see [1]). Buildroot now tracks v2.12.5.
Upstream Webkit project has already issued the corresponding fix ([2]),
which updates corresponding internal prototypes depending on libxml2
version, but the qt5webkit version tracked in buildroot does not integrate
the corresponding Webkit version.

Fix this build issue by bringing the upstream patch "as is" from Webkit

No autobuilder references because this build error was hidden by
another build error fixed in a previous patch.

[1] https://gitlab.gnome.org/GNOME/libxml2/-/releases/v2.12.0
[2] https://github.com/WebKit/WebKit/commit/1bad176b2496579d760852c80cff3ad9fb7c3a4b

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e24a11738896118870037d89ccd64d2fa331e15e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-with-libxml2-version-2.12.0-due-to-API-c.patch | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/package/qt5/qt5webkit/0008-Build-fails-with-libxml2-version-2.12.0-due-to-API-c.patch b/package/qt5/qt5webkit/0008-Build-fails-with-libxml2-version-2.12.0-due-to-API-c.patch
new file mode 100644
index 0000000000..d6f379ae8e
--- /dev/null
+++ b/package/qt5/qt5webkit/0008-Build-fails-with-libxml2-version-2.12.0-due-to-API-c.patch
@@ -0,0 +1,61 @@
+From df49bfc4c93001970c9b9266903ee7e8804fb576 Mon Sep 17 00:00:00 2001
+From: Adrian Perez de Castro <aperez@igalia.com>
+Date: Mon, 20 Nov 2023 07:42:30 -0800
+Subject: [PATCH] Build fails with libxml2 version 2.12.0 due to API change
+ https://bugs.webkit.org/show_bug.cgi?id=265128
+
+Reviewed by Philippe Normand.
+
+Starting with libxml2 2.12.0, the API has changed the const-ness of the
+xmlError pointers, which results in a build error due to a mismatched
+type in the parsing error callback. This papers over the difference by
+using preprocessor conditionals.
+
+* Source/WebCore/xml/XSLTProcessor.h: Use const when building against
+  libxml2 2.12.0 or newer.
+* Source/WebCore/xml/XSLTProcessorLibxslt.cpp:
+(WebCore::XSLTProcessor::parseErrorFunc): Ditto.
+
+Canonical link: https://commits.webkit.org/270977@main
+Upstream: https://github.com/WebKit/WebKit/commit/1bad176b2496579d760852c80cff3ad9fb7c3a4b
+Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
+---
+ Source/WebCore/xml/XSLTProcessor.h          | 4 ++++
+ Source/WebCore/xml/XSLTProcessorLibxslt.cpp | 4 ++++
+ 2 files changed, 8 insertions(+)
+
+diff --git a/Source/WebCore/xml/XSLTProcessor.h b/Source/WebCore/xml/XSLTProcessor.h
+index 21bb45b5cbe1..5cf20557918f 100644
+--- a/Source/WebCore/xml/XSLTProcessor.h
++++ b/Source/WebCore/xml/XSLTProcessor.h
+@@ -61,7 +61,11 @@ public:
+ 
+     void reset();
+ 
++#if LIBXML_VERSION >= 21200
++    static void parseErrorFunc(void* userData, const xmlError*);
++#else
+     static void parseErrorFunc(void* userData, xmlError*);
++#endif
+     static void genericErrorFunc(void* userData, const char* msg, ...);
+     
+     // Only for libXSLT callbacks
+diff --git a/Source/WebCore/xml/XSLTProcessorLibxslt.cpp b/Source/WebCore/xml/XSLTProcessorLibxslt.cpp
+index a65691087e3c..9f6b363dfc6c 100644
+--- a/Source/WebCore/xml/XSLTProcessorLibxslt.cpp
++++ b/Source/WebCore/xml/XSLTProcessorLibxslt.cpp
+@@ -59,7 +59,11 @@ void XSLTProcessor::genericErrorFunc(void*, const char*, ...)
+     // It would be nice to do something with this error message.
+ }
+ 
++#if LIBXML_VERSION >= 21200
++void XSLTProcessor::parseErrorFunc(void* userData, const xmlError* error)
++#else
+ void XSLTProcessor::parseErrorFunc(void* userData, xmlError* error)
++#endif
+ {
+     PageConsoleClient* console = static_cast<PageConsoleClient*>(userData);
+     if (!console)
+-- 
+2.43.1
+

--===============6976867250147043926==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6976867250147043926==--
