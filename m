Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F54AC4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 21:28:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51C5784EFD;
	Sun, 11 Feb 2024 21:28:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IRfy2FROovuI; Sun, 11 Feb 2024 21:28:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 397E783DE6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 397E783DE6;
	Sun, 11 Feb 2024 21:28:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 97A9E1BF2EF
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:28:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 843C44189D
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:28:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id En5NZXRji0bX for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 21:28:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D17E4189A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D17E4189A
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 21:28:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 63A5A87779; Sun, 11 Feb 2024 21:28:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 22:27:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6e5229c252abbf4b86476cfafbc26753f803cfd0
X-Git-Newrev: 69ad593a410ac734a629fd0dc4590ec7f43308ec
X-Patchwork-Hint: ignore
Message-Id: <20240211212840.63A5A87779@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uhd: fix build with gcc >= 13
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

commit: https://git.buildroot.net/buildroot/commit/?id=69ad593a410ac734a629fd0dc4590ec7f43308ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with gcc >= 13:

In file included from /home/buildroot/autobuild/instance-3/output-1/build/uhd-4.3.0.0/host/lib/cal/database.cpp:7:
/home/buildroot/autobuild/instance-3/output-1/build/uhd-4.3.0.0/host/include/uhd/cal/database.hpp:86:24: error: 'uint8_t' was not declared in this scope
   86 |     static std::vector<uint8_t> read_cal_data(const std::string& key,
      |                        ^~~~~~~
/home/buildroot/autobuild/instance-3/output-1/build/uhd-4.3.0.0/host/include/uhd/cal/database.hpp:14:1: note: 'uint8_t' is defined in header '<cstdint>'; did you forget to '#include <cstdint>'?
   13 | #include <functional>
  +++ |+#include <cstdint>
   14 |

Fixes:
 - http://autobuild.buildroot.org/results/cc52f2ed4fa43fe9c92713eb8561afcba29e12f3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...d-with-GCC-13-add-missing-cstdint-include.patch | 117 +++++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/package/uhd/0002-Fix-build-with-GCC-13-add-missing-cstdint-include.patch b/package/uhd/0002-Fix-build-with-GCC-13-add-missing-cstdint-include.patch
new file mode 100644
index 0000000000..acf720a15d
--- /dev/null
+++ b/package/uhd/0002-Fix-build-with-GCC-13-add-missing-cstdint-include.patch
@@ -0,0 +1,117 @@
+From 3acf784e988608cbce34cd0be0a8703ba53ea515 Mon Sep 17 00:00:00 2001
+From: Sam James <sam@gentoo.org>
+Date: Tue, 3 Jan 2023 23:04:52 +0000
+Subject: [PATCH] Fix build with GCC 13 (add missing <cstdint> include)
+
+GCC 13 (as usual for new compiler releases) shuffles around some
+internal includes and so <cstdint> is no longer transitively included.
+
+Explicitly include <cstdint> for uint8_t.
+
+```
+/var/tmp/portage/net-wireless/uhd-4.3.0.0/work/uhd-4.3.0.0/host/include/uhd/rfnoc/defaults.hpp:43:14: error: 'uint32_t' does not name a type
+   43 | static const uint32_t DEFAULT_NOC_ID  = 0xFFFFFFFF;
+      |              ^~~~~~~~
+/var/tmp/portage/net-wireless/uhd-4.3.0.0/work/uhd-4.3.0.0/host/include/uhd/rfnoc/defaults.hpp:1:1: note: 'uint32_t' is defined in header '<cstdint>'; did you forget to '#include <cstdint>'?
+  +++ |+#include <cstdint>
+    1 | //
+```
+
+Signed-off-by: Sam James <sam@gentoo.org>
+
+Upstream: https://github.com/EttusResearch/uhd/commit/3acf784e988608cbce34cd0be0a8703ba53ea515
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ host/include/uhd/cal/database.hpp                      | 1 +
+ host/include/uhd/rfnoc/defaults.hpp                    | 1 +
+ host/include/uhd/types/eeprom.hpp                      | 1 +
+ host/include/uhd/usrp/zbx_tune_map_item.hpp            | 1 +
+ host/lib/usrp/dboard/magnesium/magnesium_constants.hpp | 1 +
+ host/lib/usrp/dboard/rhodium/rhodium_constants.hpp     | 1 +
+ host/lib/utils/serial_number.cpp                       | 1 +
+ 7 files changed, 7 insertions(+)
+
+diff --git a/host/include/uhd/cal/database.hpp b/host/include/uhd/cal/database.hpp
+index b6abbb6df7..9d47febedd 100644
+--- a/host/include/uhd/cal/database.hpp
++++ b/host/include/uhd/cal/database.hpp
+@@ -8,6 +8,7 @@
+ 
+ #include <uhd/config.hpp>
+ #include <stddef.h>
++#include <cstdint>
+ #include <string>
+ #include <vector>
+ #include <functional>
+diff --git a/host/include/uhd/rfnoc/defaults.hpp b/host/include/uhd/rfnoc/defaults.hpp
+index aa7778aacf..6c878a8d70 100644
+--- a/host/include/uhd/rfnoc/defaults.hpp
++++ b/host/include/uhd/rfnoc/defaults.hpp
+@@ -8,6 +8,7 @@
+ 
+ #pragma once
+ 
++#include <cstdint>
+ #include <string>
+ 
+ namespace uhd { namespace rfnoc {
+diff --git a/host/include/uhd/types/eeprom.hpp b/host/include/uhd/types/eeprom.hpp
+index 3a7605d3cb..420440aa64 100644
+--- a/host/include/uhd/types/eeprom.hpp
++++ b/host/include/uhd/types/eeprom.hpp
+@@ -6,6 +6,7 @@
+ 
+ #pragma once
+ 
++#include <cstdint>
+ #include <map>
+ #include <string>
+ #include <vector>
+diff --git a/host/include/uhd/usrp/zbx_tune_map_item.hpp b/host/include/uhd/usrp/zbx_tune_map_item.hpp
+index e49f49f785..ce95623de2 100644
+--- a/host/include/uhd/usrp/zbx_tune_map_item.hpp
++++ b/host/include/uhd/usrp/zbx_tune_map_item.hpp
+@@ -6,6 +6,7 @@
+ 
+ #pragma once
+ #include <uhd/config.hpp>
++#include <cstdint>
+ #include <cstring>
+ #include <string>
+ #include <vector>
+diff --git a/host/lib/usrp/dboard/magnesium/magnesium_constants.hpp b/host/lib/usrp/dboard/magnesium/magnesium_constants.hpp
+index 99f2b910c6..99f5a4933f 100644
+--- a/host/lib/usrp/dboard/magnesium/magnesium_constants.hpp
++++ b/host/lib/usrp/dboard/magnesium/magnesium_constants.hpp
+@@ -9,6 +9,7 @@
+ 
+ #include <uhd/types/ranges.hpp>
+ #include <cstddef>
++#include <cstdint>
+ #include <string>
+ #include <vector>
+ 
+diff --git a/host/lib/usrp/dboard/rhodium/rhodium_constants.hpp b/host/lib/usrp/dboard/rhodium/rhodium_constants.hpp
+index 591d02d305..1577e02d9e 100644
+--- a/host/lib/usrp/dboard/rhodium/rhodium_constants.hpp
++++ b/host/lib/usrp/dboard/rhodium/rhodium_constants.hpp
+@@ -9,6 +9,7 @@
+ 
+ #include <array>
+ #include <cstddef>
++#include <cstdint>
+ #include <string>
+ #include <vector>
+ 
+diff --git a/host/lib/utils/serial_number.cpp b/host/lib/utils/serial_number.cpp
+index 61296a9139..c07730e24d 100644
+--- a/host/lib/utils/serial_number.cpp
++++ b/host/lib/utils/serial_number.cpp
+@@ -5,6 +5,7 @@
+ //
+ 
+ #include <uhdlib/utils/serial_number.hpp>
++#include <cstdint>
+ #include <stdexcept>
+ #include <string>
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
