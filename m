Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F5A6C0015E
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 21:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE5C281EFC;
	Sat, 29 Jul 2023 21:59:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE5C281EFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OfhsX5pksiZv; Sat, 29 Jul 2023 21:59:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04F9681B35;
	Sat, 29 Jul 2023 21:59:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04F9681B35
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2FE3A1BF2AF
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 21:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 088C3409B6
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 21:59:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 088C3409B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mWpDsiAR9D_Y for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 21:59:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F42C409C3
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 21:59:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F42C409C3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 33A1783B6C; Sat, 29 Jul 2023 21:59:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 29 Jul 2023 23:42:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2c220643f9ffbabe7c0ff3c464c716fb8153e816
X-Git-Newrev: d24a36888db4521e40d2a0643fdd8ccf5eb50cd0
X-Patchwork-Hint: ignore
Message-Id: <20230729215906.33A1783B6C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi-inputstream-adaptive: fix
 build with gcc-13
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

commit: https://git.buildroot.net/buildroot/commit/?id=d24a36888db4521e40d2a0643fdd8ccf5eb50cd0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...include-missing-cstdint-to-support-gcc-13.patch | 103 +++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/package/kodi-inputstream-adaptive/0001-include-missing-cstdint-to-support-gcc-13.patch b/package/kodi-inputstream-adaptive/0001-include-missing-cstdint-to-support-gcc-13.patch
new file mode 100644
index 0000000000..ca4a363182
--- /dev/null
+++ b/package/kodi-inputstream-adaptive/0001-include-missing-cstdint-to-support-gcc-13.patch
@@ -0,0 +1,103 @@
+From 7b5c284e63c1d6327db7551a0646cffcbaf9410f Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Wed, 26 Apr 2023 15:47:17 +0000
+Subject: [PATCH] include missing <cstdint> to support gcc-13
+
+gcc 13 moved some includes around and as a result <cstdint> is no longer transitively
+included [1]. Explicitly include it for uint{32,64}_t.
+
+[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
+
+Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+Upstream: https://github.com/xbmc/inputstream.adaptive/commit/7b5c284e63c1d6327db7551a0646cffcbaf9410f
+[Bernd: backported from Omega branch]
+---
+ src/Iaes_decrypter.h        | 3 ++-
+ src/SSD_dll.h               | 1 +
+ src/utils/FileUtils.h       | 1 +
+ src/utils/PropertiesUtils.h | 1 +
+ src/utils/StringUtils.h     | 1 +
+ src/utils/Utils.h           | 1 +
+ src/utils/XMLUtils.h        | 1 +
+ 7 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/src/Iaes_decrypter.h b/src/Iaes_decrypter.h
+index 7fdf6046d..da992be95 100644
+--- a/src/Iaes_decrypter.h
++++ b/src/Iaes_decrypter.h
+@@ -10,6 +10,7 @@
+ 
+ #include <bento4/Ap4Types.h>
+ 
++#include <cstdint>
+ #include <string>
+ 
+ class IAESDecrypter
+@@ -31,4 +32,4 @@ class IAESDecrypter
+ 
+ private:
+   std::string m_licenseKey;
+-};
+\ No newline at end of file
++};
+diff --git a/src/SSD_dll.h b/src/SSD_dll.h
+index 4b2b70c1a..d23fcbe45 100644
+--- a/src/SSD_dll.h
++++ b/src/SSD_dll.h
+@@ -8,6 +8,7 @@
+ 
+ #pragma once
+ 
++#include <cstdint>
+ #include <stdarg.h> // va_list, va_start, va_arg, va_end
+ #include <string_view>
+ 
+diff --git a/src/utils/FileUtils.h b/src/utils/FileUtils.h
+index 40745b0d4..0924d8ff7 100644
+--- a/src/utils/FileUtils.h
++++ b/src/utils/FileUtils.h
+@@ -8,6 +8,7 @@
+ 
+ #pragma once
+ 
++#include <cstdint>
+ #include <string>
+ #include <string_view>
+ 
+diff --git a/src/utils/PropertiesUtils.h b/src/utils/PropertiesUtils.h
+index dee3e0a16..a658b835c 100644
+--- a/src/utils/PropertiesUtils.h
++++ b/src/utils/PropertiesUtils.h
+@@ -8,6 +8,7 @@
+ 
+ #pragma once
+ 
++#include <cstdint>
+ #include <map>
+ #include <string>
+ #include <utility>
+diff --git a/src/utils/StringUtils.h b/src/utils/StringUtils.h
+index 3f841a274..f209546fa 100644
+--- a/src/utils/StringUtils.h
++++ b/src/utils/StringUtils.h
+@@ -8,6 +8,7 @@
+ 
+ #pragma once
+ 
++#include <cstdint>
+ #include <string>
+ #include <string_view>
+ #include <vector>
+diff --git a/src/utils/Utils.h b/src/utils/Utils.h
+index 4966ece63..472a328c4 100644
+--- a/src/utils/Utils.h
++++ b/src/utils/Utils.h
+@@ -8,6 +8,7 @@
+ 
+ #pragma once
+ 
++#include <cstdint>
+ #include <map>
+ #include <string>
+ #include <string_view>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
