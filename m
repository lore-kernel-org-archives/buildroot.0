Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 566A9C77B75
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 21:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E032040639;
	Sun,  7 May 2023 21:44:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E032040639
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UgnasIJYN1Jg; Sun,  7 May 2023 21:44:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8074D4177C;
	Sun,  7 May 2023 21:44:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8074D4177C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1A2171BF861
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7A2660706
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:43:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7A2660706
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RF8vWR7-JfoO for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 21:43:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 890F1606F5
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 890F1606F5
 for <buildroot@buildroot.org>; Sun,  7 May 2023 21:43:29 +0000 (UTC)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
 by mailout06.t-online.de (Postfix) with SMTP id 5F0941AF02;
 Sun,  7 May 2023 23:43:27 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.192.80]) by fwd84.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pvmA2-1dO61R0; Sun, 7 May 2023 23:43:18 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:50572)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pvmA1-0006xu-29;
 Sun, 07 May 2023 23:43:17 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun,  7 May 2023 23:43:14 +0200
Message-Id: <20230507214317.409305-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507214317.409305-1-bernd.kuhls@t-online.de>
References: <20230507214317.409305-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1683495798-99D4FC79-ECA9ED42/0/0 CLEAN NORMAL
X-TOI-MSGID: 4c5409e2-c31e-4119-acb6-5f8c6fa77db5
Subject: [Buildroot] [PATCH 2/5] package/kodi: fix build with gcc-13
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/0003-Fix-build-with-GCC-13.patch |  23 +++
 package/kodi/0004-Fix-build-with-GCC-13.patch | 172 ++++++++++++++++++
 package/kodi/0005-Fix-build-with-GCC-13.patch |  29 +++
 3 files changed, 224 insertions(+)
 create mode 100644 package/kodi/0003-Fix-build-with-GCC-13.patch
 create mode 100644 package/kodi/0004-Fix-build-with-GCC-13.patch
 create mode 100644 package/kodi/0005-Fix-build-with-GCC-13.patch

diff --git a/package/kodi/0003-Fix-build-with-GCC-13.patch b/package/kodi/0003-Fix-build-with-GCC-13.patch
new file mode 100644
index 0000000000..5c0ea358d9
--- /dev/null
+++ b/package/kodi/0003-Fix-build-with-GCC-13.patch
@@ -0,0 +1,23 @@
+From 3e9ca53755d14417ec0f426193f63593a4ee988f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Markus=20H=C3=A4rer?= <markus.haerer@gmx.net>
+Date: Sat, 6 May 2023 00:24:06 +0200
+Subject: [PATCH] IDecoder: Add missing cstdint include for gcc>=13
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+Upstream: https://github.com/xbmc/xbmc/pull/23239
+---
+ tools/depends/native/TexturePacker/src/decoder/IDecoder.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tools/depends/native/TexturePacker/src/decoder/IDecoder.h b/tools/depends/native/TexturePacker/src/decoder/IDecoder.h
+index 3279c55a1c13f..5bc06f2f96b43 100644
+--- a/tools/depends/native/TexturePacker/src/decoder/IDecoder.h
++++ b/tools/depends/native/TexturePacker/src/decoder/IDecoder.h
+@@ -20,6 +20,7 @@
+ 
+ #pragma once
+ 
++#include <cstdint>
+ #include <string>
+ #include <vector>
+ 
diff --git a/package/kodi/0004-Fix-build-with-GCC-13.patch b/package/kodi/0004-Fix-build-with-GCC-13.patch
new file mode 100644
index 0000000000..f11c25418b
--- /dev/null
+++ b/package/kodi/0004-Fix-build-with-GCC-13.patch
@@ -0,0 +1,172 @@
+From 28ed222150cea07c72ef3e063c1d3c70f67be4ba Mon Sep 17 00:00:00 2001
+From: Heiko Becker <heirecka@exherbo.org>
+Date: Sun, 29 Jan 2023 23:01:23 +0100
+Subject: [PATCH] Fix build with gcc 13 by including <cstdint>
+
+Like other versions before, gcc 13 moved some includes around and as a
+result <cstdint> is no longer transitively included. Explicitly include
+it for uint*_t.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+Upstream: https://github.com/xbmc/xbmc/commit/28ed222150cea07c72ef3e063c1d3c70f67be4ba
+---
+ xbmc/cores/RetroPlayer/cheevos/Cheevos.h                     | 1 +
+ xbmc/cores/VideoPlayer/VideoRenderers/ColorManager.cpp       | 1 +
+ xbmc/cores/VideoPlayer/VideoRenderers/ColorManager.h         | 1 +
+ xbmc/cores/VideoPlayer/VideoRenderers/HwDecRender/VaapiEGL.h | 1 +
+ xbmc/pictures/Picture.h                                      | 2 ++
+ xbmc/platform/Filesystem.h                                   | 1 +
+ xbmc/platform/posix/Filesystem.cpp                           | 1 +
+ xbmc/utils/CSSUtils.cpp                                      | 1 +
+ xbmc/utils/CharArrayParser.cpp                               | 1 +
+ xbmc/utils/CharArrayParser.h                                 | 1 +
+ xbmc/utils/StreamUtils.h                                     | 1 +
+ xbmc/windowing/X11/GLContextEGL.h                            | 2 ++
+ 12 files changed, 14 insertions(+)
+
+diff --git a/xbmc/cores/RetroPlayer/cheevos/Cheevos.h b/xbmc/cores/RetroPlayer/cheevos/Cheevos.h
+index 71c5ed5896198..70ffe41ed8b8d 100644
+--- a/xbmc/cores/RetroPlayer/cheevos/Cheevos.h
++++ b/xbmc/cores/RetroPlayer/cheevos/Cheevos.h
+@@ -10,6 +10,7 @@
+ 
+ #include "RConsoleIDs.h"
+ 
++#include <cstdint>
+ #include <map>
+ #include <string>
+ 
+diff --git a/xbmc/cores/VideoPlayer/VideoRenderers/ColorManager.cpp b/xbmc/cores/VideoPlayer/VideoRenderers/ColorManager.cpp
+index 0c0d953aca79d..e1888814cf935 100644
+--- a/xbmc/cores/VideoPlayer/VideoRenderers/ColorManager.cpp
++++ b/xbmc/cores/VideoPlayer/VideoRenderers/ColorManager.cpp
+@@ -15,6 +15,7 @@
+ #include "utils/TimeUtils.h"
+ #include "utils/log.h"
+ 
++#include <cstdint>
+ #include <math.h>
+ #include <vector>
+ 
+diff --git a/xbmc/cores/VideoPlayer/VideoRenderers/ColorManager.h b/xbmc/cores/VideoPlayer/VideoRenderers/ColorManager.h
+index b23da958d92e8..1366c3a1d32d4 100644
+--- a/xbmc/cores/VideoPlayer/VideoRenderers/ColorManager.h
++++ b/xbmc/cores/VideoPlayer/VideoRenderers/ColorManager.h
+@@ -12,6 +12,7 @@
+ #include <lcms2.h>
+ #endif
+ 
++#include <cstdint>
+ #include <string>
+ 
+ extern "C"
+diff --git a/xbmc/cores/VideoPlayer/VideoRenderers/HwDecRender/VaapiEGL.h b/xbmc/cores/VideoPlayer/VideoRenderers/HwDecRender/VaapiEGL.h
+index fe65b40587dea..4607946365b55 100644
+--- a/xbmc/cores/VideoPlayer/VideoRenderers/HwDecRender/VaapiEGL.h
++++ b/xbmc/cores/VideoPlayer/VideoRenderers/HwDecRender/VaapiEGL.h
+@@ -13,6 +13,7 @@
+ #include "platform/posix/utils/FileHandle.h"
+ 
+ #include <array>
++#include <cstdint>
+ 
+ #include <va/va.h>
+ 
+diff --git a/xbmc/pictures/Picture.h b/xbmc/pictures/Picture.h
+index 2d469d795d5f1..ee5a270d868c7 100644
+--- a/xbmc/pictures/Picture.h
++++ b/xbmc/pictures/Picture.h
+@@ -11,6 +11,8 @@
+ #include "pictures/PictureScalingAlgorithm.h"
+ #include "utils/Job.h"
+ 
++#include <cstddef>
++#include <cstdint>
+ #include <string>
+ #include <vector>
+ 
+diff --git a/xbmc/platform/Filesystem.h b/xbmc/platform/Filesystem.h
+index 3e6b7ec52bf73..732be9294c53c 100644
+--- a/xbmc/platform/Filesystem.h
++++ b/xbmc/platform/Filesystem.h
+@@ -8,6 +8,7 @@
+ 
+ #pragma once
+ 
++#include <cstdint>
+ #include <string>
+ #include <system_error>
+ namespace KODI
+diff --git a/xbmc/platform/posix/Filesystem.cpp b/xbmc/platform/posix/Filesystem.cpp
+index 477e7b660f391..6e7282ca0013b 100644
+--- a/xbmc/platform/posix/Filesystem.cpp
++++ b/xbmc/platform/posix/Filesystem.cpp
+@@ -19,6 +19,7 @@
+ #include <sys/statfs.h>
+ #endif
+ 
++#include <cstdint>
+ #include <cstdlib>
+ #include <limits.h>
+ #include <string.h>
+diff --git a/xbmc/utils/CSSUtils.cpp b/xbmc/utils/CSSUtils.cpp
+index 96105878e0fd2..329d70cdbc99b 100644
+--- a/xbmc/utils/CSSUtils.cpp
++++ b/xbmc/utils/CSSUtils.cpp
+@@ -8,6 +8,7 @@
+ 
+ #include "CSSUtils.h"
+ 
++#include <cstdint>
+ #include <string>
+ 
+ namespace
+diff --git a/xbmc/utils/CharArrayParser.cpp b/xbmc/utils/CharArrayParser.cpp
+index 2e917e2ff2ba0..5aeec2040babe 100644
+--- a/xbmc/utils/CharArrayParser.cpp
++++ b/xbmc/utils/CharArrayParser.cpp
+@@ -10,6 +10,7 @@
+ 
+ #include "utils/log.h"
+ 
++#include <cstdint>
+ #include <cstring>
+ 
+ void CCharArrayParser::Reset()
+diff --git a/xbmc/utils/CharArrayParser.h b/xbmc/utils/CharArrayParser.h
+index 7e5e314161413..3430946dd3a02 100644
+--- a/xbmc/utils/CharArrayParser.h
++++ b/xbmc/utils/CharArrayParser.h
+@@ -8,6 +8,7 @@
+ 
+ #pragma once
+ 
++#include <cstdint>
+ #include <string>
+ 
+ /*!
+diff --git a/xbmc/utils/StreamUtils.h b/xbmc/utils/StreamUtils.h
+index 079cfa3f5c62b..3d16e8a2224da 100644
+--- a/xbmc/utils/StreamUtils.h
++++ b/xbmc/utils/StreamUtils.h
+@@ -8,6 +8,7 @@
+ 
+ #pragma once
+ 
++#include <cstdint>
+ #include <string>
+ 
+ static constexpr int MP4_BOX_HEADER_SIZE = 8;
+diff --git a/xbmc/windowing/X11/GLContextEGL.h b/xbmc/windowing/X11/GLContextEGL.h
+index afea0b7c43eac..441787b67197b 100644
+--- a/xbmc/windowing/X11/GLContextEGL.h
++++ b/xbmc/windowing/X11/GLContextEGL.h
+@@ -12,6 +12,8 @@
+ #include "system_egl.h"
+ #include "threads/CriticalSection.h"
+ 
++#include <cstdint>
++
+ #include <EGL/eglext.h>
+ #ifdef HAVE_EGLEXTANGLE
+ #include <EGL/eglext_angle.h>
diff --git a/package/kodi/0005-Fix-build-with-GCC-13.patch b/package/kodi/0005-Fix-build-with-GCC-13.patch
new file mode 100644
index 0000000000..30b45600de
--- /dev/null
+++ b/package/kodi/0005-Fix-build-with-GCC-13.patch
@@ -0,0 +1,29 @@
+From 023717ed87267382e421f62cc9e47a7582fc4455 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Sun, 9 Apr 2023 15:45:29 +0000
+Subject: [PATCH] DRMHelpers: include missing <cstdint>
+
+gcc 13 moved some includes around and as a result <cstdint> is no longer transitively
+included [1]. Explicitly include it for uint{32,64}_t.
+
+[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
+
+Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+Upstream: https://github.com/xbmc/xbmc/commit/023717ed87267382e421f62cc9e47a7582fc4455
+---
+ xbmc/utils/DRMHelpers.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/xbmc/utils/DRMHelpers.h b/xbmc/utils/DRMHelpers.h
+index ea45823179549..dcc7f502f3603 100644
+--- a/xbmc/utils/DRMHelpers.h
++++ b/xbmc/utils/DRMHelpers.h
+@@ -8,6 +8,7 @@
+ 
+ #pragma once
+ 
++#include <cstdint>
+ #include <string>
+ 
+ namespace DRMHELPERS
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
