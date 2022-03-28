Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 286E9C4332F
	for <buildroot@archiver.kernel.org>; Mon, 28 Mar 2022 20:00:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5E64605A3;
	Mon, 28 Mar 2022 20:00:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e_BDFpyur_rj; Mon, 28 Mar 2022 20:00:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 013D760FDE;
	Mon, 28 Mar 2022 20:00:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 342671BF2BA
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 19:58:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B3A2D81B14
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 19:58:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DIY8saUmCMH0 for <buildroot@lists.busybox.net>;
 Mon, 28 Mar 2022 19:58:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 901B481B26
 for <buildroot@buildroot.org>; Mon, 28 Mar 2022 19:58:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A28A885F3E; Mon, 28 Mar 2022 19:48:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 28 Mar 2022 21:51:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1da911cbde3d744ff70211cf3ea714f55888adc5
X-Git-Newrev: 1506ff275b0e53a4ac886d6eed7d4fea9456ae00
X-Patchwork-Hint: ignore
Message-Id: <20220328194854.A28A885F3E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dbus-cxx: bump to version 2.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=1506ff275b0e53a4ac886d6eed7d4fea9456ae00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- License has been changed from GPL to LGPL or BSD-3-Clause
- Drop upstream patches

Signed-off-by: Daniel Lang <d.lang@abatec.at>
[Arnout: license is actually LGPL-3.0+, not LGPL-3.0]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/dbus-cxx/0001-gcc11-include-typeinfo.patch | 29 -------
 .../0002-cmake-improve-include-paths.patch         | 91 ----------------------
 package/dbus-cxx/0003-sasl-use-uid_t.patch         | 41 ----------
 package/dbus-cxx/dbus-cxx.hash                     |  4 +-
 package/dbus-cxx/dbus-cxx.mk                       |  4 +-
 5 files changed, 4 insertions(+), 165 deletions(-)

diff --git a/package/dbus-cxx/0001-gcc11-include-typeinfo.patch b/package/dbus-cxx/0001-gcc11-include-typeinfo.patch
deleted file mode 100644
index b4b7d83de2..0000000000
--- a/package/dbus-cxx/0001-gcc11-include-typeinfo.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 0a4c5db225d8d213916655593471e303ba71e0ea Mon Sep 17 00:00:00 2001
-From: Oleksandr Kravchuk <sashko@users.noreply.github.com>
-Date: Mon, 13 Dec 2021 03:42:44 +0100
-Subject: [PATCH] Include typeinfo for typeid() (#83)
-
-Otherwise fails with:
-    error: must '#include <typeinfo>' before using 'typeid'
-
-Fetch from: https://github.com/dbus-cxx/dbus-cxx/pull/83
-Upstream-Status: Accepted
-Signed-off-by: Daniel Lang <d.lang@abatec.at>
-
----
- dbus-cxx/demangle.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/dbus-cxx/demangle.h b/dbus-cxx/demangle.h
-index b71bcb9..9a4e99b 100644
---- a/dbus-cxx/demangle.h
-+++ b/dbus-cxx/demangle.h
-@@ -21,6 +21,7 @@
- #define DBUSCXX_DEMANGLE_H
- 
- #include <string>
-+#include <typeinfo>
- #include <dbus-cxx/dbus-cxx-config.h>
- 
- #if DBUS_CXX_HAS_CXXABI_H
-
diff --git a/package/dbus-cxx/0002-cmake-improve-include-paths.patch b/package/dbus-cxx/0002-cmake-improve-include-paths.patch
deleted file mode 100644
index 1f6a36a2c0..0000000000
--- a/package/dbus-cxx/0002-cmake-improve-include-paths.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From 5a0ebbf55515a928acf9926d3fcd789115e347d3 Mon Sep 17 00:00:00 2001
-From: Lang Daniel <d.lang@abatec.at>
-Date: Mon, 17 Jan 2022 13:57:55 +0100
-Subject: [PATCH] cmake: improve include paths
-
-Adding the dbus-cxx subfolders as an include path might override system
-headers (signal.h for gcc 10).
-By removing the subfolders, includes can happen via #include "..." or
-via #include <dbus-cxx/...>.
-
-Fetch from: https://github.com/dbus-cxx/dbus-cxx/pull/86
-Upstream-Status: Accepted
-Signed-off-by: Daniel Lang <d.lang@abatec.at>
-
----
- CMakeLists.txt                | 4 +---
- dbus-cxx/matchrule.h          | 2 +-
- dbus-cxx/sasl.h               | 2 +-
- dbus-cxx/sendmsgtransport.cpp | 2 +-
- dbus-cxx/simpletransport.cpp  | 2 +-
- 5 files changed, 5 insertions(+), 7 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 5b6d28c..e76cd61 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -207,9 +207,7 @@ set( DBUS_CXX_HEADERS
- 
- set( DBUS_CXX_INCLUDE_DIRECTORIES 
-     ${PROJECT_SOURCE_DIR} 
--    ${PROJECT_SOURCE_DIR}/dbus-cxx
--    ${PROJECT_BINARY_DIR}
--    ${PROJECT_BINARY_DIR}/dbus-cxx )
-+    ${PROJECT_BINARY_DIR} )
- include_directories( ${DBUS_CXX_INCLUDE_DIRECTORIES} 
-     ${dbus_INCLUDE_DIRS} 
-     ${sigc_INCLUDE_DIRS} )
-diff --git a/dbus-cxx/matchrule.h b/dbus-cxx/matchrule.h
-index 69fdab7..18c9e81 100644
---- a/dbus-cxx/matchrule.h
-+++ b/dbus-cxx/matchrule.h
-@@ -20,7 +20,7 @@
- #define DBUSCXX_MATCH_RULE_H
- 
- #include <memory>
--#include "dbus-cxx-config.h"
-+#include <dbus-cxx/dbus-cxx-config.h>
- 
- namespace DBus {
- 
-diff --git a/dbus-cxx/sasl.h b/dbus-cxx/sasl.h
-index d7429a3..44edd6e 100644
---- a/dbus-cxx/sasl.h
-+++ b/dbus-cxx/sasl.h
-@@ -19,7 +19,7 @@
- #ifndef DBUSCXX_SASL_H
- #define DBUSCXX_SASL_H
- 
--#include <dbus-cxx-config.h>
-+#include <dbus-cxx/dbus-cxx-config.h>
- 
- #include <memory>
- #include <stdint.h>
-diff --git a/dbus-cxx/sendmsgtransport.cpp b/dbus-cxx/sendmsgtransport.cpp
-index ae053ff..a10ae66 100644
---- a/dbus-cxx/sendmsgtransport.cpp
-+++ b/dbus-cxx/sendmsgtransport.cpp
-@@ -21,8 +21,8 @@
- #include "dbus-cxx-private.h"
- #include "utility.h"
- #include "validator.h"
-+#include "message.h"
- 
--#include <message.h>
- #include <string.h>
- #include <stdlib.h>
- #include <unistd.h>
-diff --git a/dbus-cxx/simpletransport.cpp b/dbus-cxx/simpletransport.cpp
-index f291d9f..fed4364 100644
---- a/dbus-cxx/simpletransport.cpp
-+++ b/dbus-cxx/simpletransport.cpp
-@@ -18,7 +18,7 @@
-  ***************************************************************************/
- #include "simpletransport.h"
- 
--#include <dbus-cxx-private.h>
-+#include "dbus-cxx-private.h"
- #include "demarshaling.h"
- #include "message.h"
- #include "utility.h"
-
diff --git a/package/dbus-cxx/0003-sasl-use-uid_t.patch b/package/dbus-cxx/0003-sasl-use-uid_t.patch
deleted file mode 100644
index f08769b6c5..0000000000
--- a/package/dbus-cxx/0003-sasl-use-uid_t.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 9db9673c0c2407e18e215844adadbd4a397e6f78 Mon Sep 17 00:00:00 2001
-From: Lang Daniel <d.lang@abatec.at>
-Date: Fri, 28 Jan 2022 07:53:13 +0100
-Subject: [PATCH] use uid_t instead of __uid_t
-
-uclibc and glibc define getuid() as
-extern __uid_t getuid (void) __THROW;
-https://elixir.bootlin.com/glibc/glibc-2.34/source/posix/unistd.h#L698
-which is a typedef for unsigned int.
-
-musl uses uid_t as return type
-uid_t getuid(void);
-https://elixir.bootlin.com/musl/v1.2.2/source/include/unistd.h#L108
-which is a typedef to unsigned.
-
-glibc and uclibc include typedefs from __uid_t to uid_t,
-which means one should be able to use uid_t as a replacement
-for __uid_t and make compiling with all three c standard libraries
-possible.
-
-Fetch from: https://github.com/dbus-cxx/dbus-cxx/pull/87
-Signed-off-by: Daniel Lang <d.lang@abatec.at>
-
----
- dbus-cxx/sasl.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/dbus-cxx/sasl.cpp b/dbus-cxx/sasl.cpp
-index e8a6060..7a76af6 100644
---- a/dbus-cxx/sasl.cpp
-+++ b/dbus-cxx/sasl.cpp
-@@ -70,7 +70,7 @@ std::tuple<bool, bool, std::vector<uint8_t>> SASL::authenticate() {
-     bool success = false;
-     bool negotiatedFD = false;
-     std::vector<uint8_t> serverGUID;
--    __uid_t uid = getuid();
-+    uid_t uid = getuid();
-     std::string line;
-     std::smatch regex_match;
- 
-
diff --git a/package/dbus-cxx/dbus-cxx.hash b/package/dbus-cxx/dbus-cxx.hash
index 907de1866f..5b3a6188fc 100644
--- a/package/dbus-cxx/dbus-cxx.hash
+++ b/package/dbus-cxx/dbus-cxx.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  05c4f4750261f09819564bb8ee93b5d7f56fd05bbcd755858860fa6697d09c2a  dbus-cxx-2.1.0.tar.gz
-sha256  e85e018c8ee7d4f439b097289bf4371f6fcfec24e89f3e77c422944501bc383d  COPYING
+sha256  55b2541b9c3f3fa705e51e12e6971f66826ebc7185071e0cd1bb6ec9e5adf47f  dbus-cxx-2.2.0.tar.gz
+sha256  99e5d0ad951d96567a6f9a17f3f17ac000c0582f53357c7f3601851c2dcbb786  COPYING
 sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  cmake-modules/LICENSE_1_0.txt
 sha256  c6596eb7be8581c18be736c846fb9173b69eccf6ef94c5135893ec56bd92ba08  tools/libcppgenerate/LICENSE
diff --git a/package/dbus-cxx/dbus-cxx.mk b/package/dbus-cxx/dbus-cxx.mk
index 3e89fc9db7..c0bcff1c67 100644
--- a/package/dbus-cxx/dbus-cxx.mk
+++ b/package/dbus-cxx/dbus-cxx.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-DBUS_CXX_VERSION = 2.1.0
+DBUS_CXX_VERSION = 2.2.0
 DBUS_CXX_SITE = $(call github,dbus-cxx,dbus-cxx,$(DBUS_CXX_VERSION))
-DBUS_CXX_LICENSE = GPL-3.0, Boost license (cmake-modules), Apache 2.0 (libcppgenerate)
+DBUS_CXX_LICENSE = LGPL-3.0+ or BSD-3-Clause, Boost license (cmake-modules), Apache 2.0 (libcppgenerate)
 DBUS_CXX_LICENSE_FILES = COPYING cmake-modules/LICENSE_1_0.txt tools/libcppgenerate/LICENSE
 DBUS_CXX_INSTALL_STAGING = YES
 DBUS_CXX_DEPENDENCIES = libsigc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
