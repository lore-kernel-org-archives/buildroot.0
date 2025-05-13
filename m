Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 460BCC3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8C676F5EE;
	Mon, 19 May 2025 10:48:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4gopv1TEKmfS; Mon, 19 May 2025 10:48:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DC3F6F5E6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DC3F6F5E6;
	Mon, 19 May 2025 10:48:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 37A92E4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 44EC7417F5
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T0-KCfHkrbLz for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75AC14180E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75AC14180E
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 739968348A; Mon, 19 May 2025 10:40:02 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 13 May 2025 22:01:50 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 467aa8cd56a4b6e8cef0ec39ac8dff9928a40973
X-Git-Newrev: 4dfe97dde426c8419ad137e4ee6e92b1857af066
X-Patchwork-Hint: ignore
Message-Id: <20250519104002.739968348A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libsndfile: Add
 upstream commits to fix build with gcc-15.x
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

commit: https://git.buildroot.net/buildroot/commit/?id=4dfe97dde426c8419ad137e4ee6e92b1857af066
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...5-ALAC-Include-config.h-to-avoid-warnings.patch | 95 ++++++++++++++++++++++
 ...bool.h-instead-of-redefining-bool-true-an.patch | 65 +++++++++++++++
 2 files changed, 160 insertions(+)

diff --git a/package/libsndfile/0015-ALAC-Include-config.h-to-avoid-warnings.patch b/package/libsndfile/0015-ALAC-Include-config.h-to-avoid-warnings.patch
new file mode 100644
index 0000000000..27181493b7
--- /dev/null
+++ b/package/libsndfile/0015-ALAC-Include-config.h-to-avoid-warnings.patch
@@ -0,0 +1,95 @@
+From 2c6ffea6ac8bb1b89e1f778bdad8bf8b0342d32f Mon Sep 17 00:00:00 2001
+From: Marcel Telka <marcel@telka.sk>
+Date: Wed, 20 Sep 2023 14:54:42 +0200
+Subject: [PATCH] ALAC: Include config.h to avoid warnings
+
+Upstream: https://github.com/libsndfile/libsndfile/commit/2c6ffea6ac8bb1b89e1f778bdad8bf8b0342d32f
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/ALAC/ag_dec.c       | 2 ++
+ src/ALAC/ag_enc.c       | 2 ++
+ src/ALAC/alac_decoder.c | 2 ++
+ src/ALAC/alac_encoder.c | 2 ++
+ src/ALAC/matrix_dec.c   | 2 ++
+ src/ALAC/matrix_enc.c   | 2 ++
+ 6 files changed, 12 insertions(+)
+
+diff --git a/src/ALAC/ag_dec.c b/src/ALAC/ag_dec.c
+index 37671d240..68707f825 100644
+--- a/src/ALAC/ag_dec.c
++++ b/src/ALAC/ag_dec.c
+@@ -26,6 +26,8 @@
+ 	Copyright:	(c) 2001-2011 Apple, Inc.
+ */
+ 
++#include "config.h"
++
+ #include <math.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+diff --git a/src/ALAC/ag_enc.c b/src/ALAC/ag_enc.c
+index 4737b96e3..a56db7b18 100644
+--- a/src/ALAC/ag_enc.c
++++ b/src/ALAC/ag_enc.c
+@@ -27,6 +27,8 @@
+ 	Copyright:	(c) 2001-2011 Apple, Inc.
+ */
+ 
++#include "config.h"
++
+ #include "aglib.h"
+ #include "ALACBitUtilities.h"
+ #include "EndianPortable.h"
+diff --git a/src/ALAC/alac_decoder.c b/src/ALAC/alac_decoder.c
+index 46d333060..978919a70 100644
+--- a/src/ALAC/alac_decoder.c
++++ b/src/ALAC/alac_decoder.c
+@@ -23,6 +23,8 @@
+ 	File:		ALACDecoder.cpp
+ */
+ 
++#include "config.h"
++
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <stddef.h>
+diff --git a/src/ALAC/alac_encoder.c b/src/ALAC/alac_encoder.c
+index 599399afe..29012f3f4 100644
+--- a/src/ALAC/alac_encoder.c
++++ b/src/ALAC/alac_encoder.c
+@@ -28,6 +28,8 @@
+ #define DebugMsg			printf
+ 
+ // headers
++#include "config.h"
++
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+diff --git a/src/ALAC/matrix_dec.c b/src/ALAC/matrix_dec.c
+index 6d0b40153..bc1f028a9 100644
+--- a/src/ALAC/matrix_dec.c
++++ b/src/ALAC/matrix_dec.c
+@@ -27,6 +27,8 @@
+ 	Copyright:	(c) 2004-2011 Apple, Inc.
+ */
+ 
++#include "config.h"
++
+ #include "matrixlib.h"
+ #include "ALACAudioTypes.h"
+ #include "shift.h"
+diff --git a/src/ALAC/matrix_enc.c b/src/ALAC/matrix_enc.c
+index b50f83b78..dcd9cab11 100644
+--- a/src/ALAC/matrix_enc.c
++++ b/src/ALAC/matrix_enc.c
+@@ -27,6 +27,8 @@
+ 	Copyright:	(c) 2004-2011 Apple, Inc.
+ */
+ 
++#include "config.h"
++
+ #include "matrixlib.h"
+ #include "ALACAudioTypes.h"
+ 
diff --git a/package/libsndfile/0016-Include-stdbool.h-instead-of-redefining-bool-true-an.patch b/package/libsndfile/0016-Include-stdbool.h-instead-of-redefining-bool-true-an.patch
new file mode 100644
index 0000000000..adfd85787d
--- /dev/null
+++ b/package/libsndfile/0016-Include-stdbool.h-instead-of-redefining-bool-true-an.patch
@@ -0,0 +1,65 @@
+From 2251737b3b175925684ec0d37029ff4cb521d302 Mon Sep 17 00:00:00 2001
+From: Fabian Greffrath <fabian@greffrath.com>
+Date: Tue, 17 Dec 2024 10:38:47 +0100
+Subject: [PATCH] Include <stdbool.h> instead of redefining `bool`, `true` and
+ `false` keywords
+
+Fixes #1049
+
+Upstream: https://github.com/libsndfile/libsndfile/commit/2251737b3b175925684ec0d37029ff4cb521d302.patch
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/ALAC/alac_decoder.c | 6 +-----
+ src/ALAC/alac_encoder.c | 7 +------
+ 2 files changed, 2 insertions(+), 11 deletions(-)
+
+diff --git a/src/ALAC/alac_decoder.c b/src/ALAC/alac_decoder.c
+index 978919a70..417645316 100644
+--- a/src/ALAC/alac_decoder.c
++++ b/src/ALAC/alac_decoder.c
+@@ -28,6 +28,7 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <stddef.h>
++#include <stdbool.h>
+ #include <string.h>
+ 
+ #include "alac_codec.h"
+@@ -40,11 +41,6 @@
+ #include "ALACBitUtilities.h"
+ #include "EndianPortable.h"
+ 
+-typedef enum
+-{	false = 0,
+-	true = 1
+-} bool ;
+-
+ // constants/data
+ const uint32_t kMaxBitDepth = 32 ;			// max allowed bit depth is 32
+ 
+diff --git a/src/ALAC/alac_encoder.c b/src/ALAC/alac_encoder.c
+index 29012f3f4..c9395b1d5 100644
+--- a/src/ALAC/alac_encoder.c
++++ b/src/ALAC/alac_encoder.c
+@@ -32,6 +32,7 @@
+ 
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <stdbool.h>
+ #include <string.h>
+ 
+ #include "sfendian.h"
+@@ -46,12 +47,6 @@
+ #include "ALACAudioTypes.h"
+ #include "EndianPortable.h"
+ 
+-typedef enum
+-{
+-	false = 0,
+-	true = 1
+-} bool ;
+-
+ static void	GetConfig (ALAC_ENCODER *p, ALACSpecificConfig * config) ;
+ 
+ static int32_t	EncodeStereo (ALAC_ENCODER *p, struct BitBuffer * bitstream, const int32_t * input, uint32_t stride, uint32_t channelIndex, uint32_t numSamples) ;
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
