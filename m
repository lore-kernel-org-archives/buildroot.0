Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8672C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AA7082333;
	Mon, 20 Feb 2023 22:55:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AA7082333
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TtUFq-c-alVh; Mon, 20 Feb 2023 22:55:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 810DF82334;
	Mon, 20 Feb 2023 22:55:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 810DF82334
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B2A701BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 385486124E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 385486124E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2dhcWBZPfaxj for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6485C61203
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6485C61203
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5C7778648F; Mon, 20 Feb 2023 20:52:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 22:23:04 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d534bb8d93319212b3c083b083189e8e7b414637
X-Git-Newrev: 16ed6b9a4a689496b69ba7b5daf122a88db40ce9
X-Patchwork-Hint: ignore
Message-Id: <20230220205209.5C7778648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/intel-mediadriver: fix
 build without X11
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=16ed6b9a4a689496b69ba7b5daf122a88db40ce9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:
http://autobuild.buildroot.net/results/52c/52c8f5352b16ced4e85286950f95e1b57c564fa5/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-dont-include-va-dricommon-h.patch         | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/intel-mediadriver/0001-dont-include-va-dricommon-h.patch b/package/intel-mediadriver/0001-dont-include-va-dricommon-h.patch
new file mode 100644
index 0000000000..9d512f9c0b
--- /dev/null
+++ b/package/intel-mediadriver/0001-dont-include-va-dricommon-h.patch
@@ -0,0 +1,36 @@
+From e0d2caafcd5e583a01f7792eaec5d1f2d540bdf1 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Fri, 18 Nov 2022 22:44:52 +1100
+Subject: [PATCH] [Media Common] [VP] dont include va_dricommon.h
+
+<va/va_dricommon.h> is not in non-X11 libva 2.16.0
+The header "media_libva_putsurface_linux.h" is included
+
+Downloaded from upstream commit
+https://github.com/intel/media-driver/commit/e0d2caafcd5e583a01f7792eaec5d1f2d540bdf1
+
+Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ media_softlet/linux/common/vp/ddi/ddi_vp_functions.cpp | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/media_softlet/linux/common/vp/ddi/ddi_vp_functions.cpp b/media_softlet/linux/common/vp/ddi/ddi_vp_functions.cpp
+index 8695d6c86..6719c07b3 100644
+--- a/media_softlet/linux/common/vp/ddi/ddi_vp_functions.cpp
++++ b/media_softlet/linux/common/vp/ddi/ddi_vp_functions.cpp
+@@ -23,7 +23,6 @@
+ //! \file     ddi_vp_functions.cpp
+ //! \brief    ddi vp functions implementaion.
+ //!
+-#include <va/va_dricommon.h>
+ #include "ddi_vp_functions.h"
+ #include "media_libva_util_next.h"
+ #include "media_libva_common_next.h"
+@@ -4700,4 +4699,4 @@ VAStatus DdiVpFunctions::PutSurfaceLinuxHW(
+ 
+     return VA_STATUS_SUCCESS;
+ }
+-#endif // !defined(ANDROID) && defined(X11_FOUND)
+\ No newline at end of file
++#endif // !defined(ANDROID) && defined(X11_FOUND)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
