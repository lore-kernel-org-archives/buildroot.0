Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D7CC433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 14:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE7204151B;
	Sat, 12 Feb 2022 14:44:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QLi86OhAB9vi; Sat, 12 Feb 2022 14:44:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F6DD409DB;
	Sat, 12 Feb 2022 14:44:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BFC431BF5A1
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 14:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD160401CC
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 14:44:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CtYUlr5kKqhc for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 14:44:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37B3640391
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 14:44:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 16C0080114; Sat, 12 Feb 2022 14:37:02 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 12 Feb 2022 15:37:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9c8453734bf0f2c3e9dbf50c604952253f2b1524
X-Git-Newrev: a0fb3eed27cc0fa4a7729f46b88b935309374b4d
X-Patchwork-Hint: ignore
Message-Id: <20220212143702.16C0080114@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dbus-cxx: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=a0fb3eed27cc0fa4a7729f46b88b935309374b4d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

DBus-cxx provides an object-oriented interface to DBus

Signed-off-by: Lang Daniel <d.lang@abatec.at>
[Arnout:
 - reorder licenses;
 - select dbus instead of depends, + propagate dependency
 - make qt5 and libglib2 integration automatic
]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/dbus-cxx/0001-gcc11-include-typeinfo.patch | 29 +++++++
 .../0002-cmake-improve-include-paths.patch         | 91 ++++++++++++++++++++++
 package/dbus-cxx/0003-sasl-use-uid_t.patch         | 41 ++++++++++
 package/dbus-cxx/Config.in                         | 24 ++++++
 package/dbus-cxx/dbus-cxx.hash                     |  5 ++
 package/dbus-cxx/dbus-cxx.mk                       | 28 +++++++
 8 files changed, 220 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index be8231a2af..b36f42e274 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -622,6 +622,7 @@ N:	Daniel J. Leach <dleach@belcan.com>
 F:	package/dacapo/
 
 N:	Daniel Lang <d.lang@abatec.at>
+F:	package/dbus-cxx/
 F:	package/paho-mqtt-cpp/
 
 N:	Damien Lanson <damien@kal-host.com>
diff --git a/package/Config.in b/package/Config.in
index f48b0c646d..314a17a6db 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -461,6 +461,7 @@ endmenu
 	source "package/davinci-bootcount/Config.in"
 	source "package/dbus/Config.in"
 	source "package/dbus-cpp/Config.in"
+	source "package/dbus-cxx/Config.in"
 	source "package/dbus-glib/Config.in"
 	source "package/dbus-python/Config.in"
 	source "package/dbus-triggerd/Config.in"
diff --git a/package/dbus-cxx/0001-gcc11-include-typeinfo.patch b/package/dbus-cxx/0001-gcc11-include-typeinfo.patch
new file mode 100644
index 0000000000..b4b7d83de2
--- /dev/null
+++ b/package/dbus-cxx/0001-gcc11-include-typeinfo.patch
@@ -0,0 +1,29 @@
+From 0a4c5db225d8d213916655593471e303ba71e0ea Mon Sep 17 00:00:00 2001
+From: Oleksandr Kravchuk <sashko@users.noreply.github.com>
+Date: Mon, 13 Dec 2021 03:42:44 +0100
+Subject: [PATCH] Include typeinfo for typeid() (#83)
+
+Otherwise fails with:
+    error: must '#include <typeinfo>' before using 'typeid'
+
+Fetch from: https://github.com/dbus-cxx/dbus-cxx/pull/83
+Upstream-Status: Accepted
+Signed-off-by: Daniel Lang <d.lang@abatec.at>
+
+---
+ dbus-cxx/demangle.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/dbus-cxx/demangle.h b/dbus-cxx/demangle.h
+index b71bcb9..9a4e99b 100644
+--- a/dbus-cxx/demangle.h
++++ b/dbus-cxx/demangle.h
+@@ -21,6 +21,7 @@
+ #define DBUSCXX_DEMANGLE_H
+ 
+ #include <string>
++#include <typeinfo>
+ #include <dbus-cxx/dbus-cxx-config.h>
+ 
+ #if DBUS_CXX_HAS_CXXABI_H
+
diff --git a/package/dbus-cxx/0002-cmake-improve-include-paths.patch b/package/dbus-cxx/0002-cmake-improve-include-paths.patch
new file mode 100644
index 0000000000..1f6a36a2c0
--- /dev/null
+++ b/package/dbus-cxx/0002-cmake-improve-include-paths.patch
@@ -0,0 +1,91 @@
+From 5a0ebbf55515a928acf9926d3fcd789115e347d3 Mon Sep 17 00:00:00 2001
+From: Lang Daniel <d.lang@abatec.at>
+Date: Mon, 17 Jan 2022 13:57:55 +0100
+Subject: [PATCH] cmake: improve include paths
+
+Adding the dbus-cxx subfolders as an include path might override system
+headers (signal.h for gcc 10).
+By removing the subfolders, includes can happen via #include "..." or
+via #include <dbus-cxx/...>.
+
+Fetch from: https://github.com/dbus-cxx/dbus-cxx/pull/86
+Upstream-Status: Accepted
+Signed-off-by: Daniel Lang <d.lang@abatec.at>
+
+---
+ CMakeLists.txt                | 4 +---
+ dbus-cxx/matchrule.h          | 2 +-
+ dbus-cxx/sasl.h               | 2 +-
+ dbus-cxx/sendmsgtransport.cpp | 2 +-
+ dbus-cxx/simpletransport.cpp  | 2 +-
+ 5 files changed, 5 insertions(+), 7 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 5b6d28c..e76cd61 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -207,9 +207,7 @@ set( DBUS_CXX_HEADERS
+ 
+ set( DBUS_CXX_INCLUDE_DIRECTORIES 
+     ${PROJECT_SOURCE_DIR} 
+-    ${PROJECT_SOURCE_DIR}/dbus-cxx
+-    ${PROJECT_BINARY_DIR}
+-    ${PROJECT_BINARY_DIR}/dbus-cxx )
++    ${PROJECT_BINARY_DIR} )
+ include_directories( ${DBUS_CXX_INCLUDE_DIRECTORIES} 
+     ${dbus_INCLUDE_DIRS} 
+     ${sigc_INCLUDE_DIRS} )
+diff --git a/dbus-cxx/matchrule.h b/dbus-cxx/matchrule.h
+index 69fdab7..18c9e81 100644
+--- a/dbus-cxx/matchrule.h
++++ b/dbus-cxx/matchrule.h
+@@ -20,7 +20,7 @@
+ #define DBUSCXX_MATCH_RULE_H
+ 
+ #include <memory>
+-#include "dbus-cxx-config.h"
++#include <dbus-cxx/dbus-cxx-config.h>
+ 
+ namespace DBus {
+ 
+diff --git a/dbus-cxx/sasl.h b/dbus-cxx/sasl.h
+index d7429a3..44edd6e 100644
+--- a/dbus-cxx/sasl.h
++++ b/dbus-cxx/sasl.h
+@@ -19,7 +19,7 @@
+ #ifndef DBUSCXX_SASL_H
+ #define DBUSCXX_SASL_H
+ 
+-#include <dbus-cxx-config.h>
++#include <dbus-cxx/dbus-cxx-config.h>
+ 
+ #include <memory>
+ #include <stdint.h>
+diff --git a/dbus-cxx/sendmsgtransport.cpp b/dbus-cxx/sendmsgtransport.cpp
+index ae053ff..a10ae66 100644
+--- a/dbus-cxx/sendmsgtransport.cpp
++++ b/dbus-cxx/sendmsgtransport.cpp
+@@ -21,8 +21,8 @@
+ #include "dbus-cxx-private.h"
+ #include "utility.h"
+ #include "validator.h"
++#include "message.h"
+ 
+-#include <message.h>
+ #include <string.h>
+ #include <stdlib.h>
+ #include <unistd.h>
+diff --git a/dbus-cxx/simpletransport.cpp b/dbus-cxx/simpletransport.cpp
+index f291d9f..fed4364 100644
+--- a/dbus-cxx/simpletransport.cpp
++++ b/dbus-cxx/simpletransport.cpp
+@@ -18,7 +18,7 @@
+  ***************************************************************************/
+ #include "simpletransport.h"
+ 
+-#include <dbus-cxx-private.h>
++#include "dbus-cxx-private.h"
+ #include "demarshaling.h"
+ #include "message.h"
+ #include "utility.h"
+
diff --git a/package/dbus-cxx/0003-sasl-use-uid_t.patch b/package/dbus-cxx/0003-sasl-use-uid_t.patch
new file mode 100644
index 0000000000..f08769b6c5
--- /dev/null
+++ b/package/dbus-cxx/0003-sasl-use-uid_t.patch
@@ -0,0 +1,41 @@
+From 9db9673c0c2407e18e215844adadbd4a397e6f78 Mon Sep 17 00:00:00 2001
+From: Lang Daniel <d.lang@abatec.at>
+Date: Fri, 28 Jan 2022 07:53:13 +0100
+Subject: [PATCH] use uid_t instead of __uid_t
+
+uclibc and glibc define getuid() as
+extern __uid_t getuid (void) __THROW;
+https://elixir.bootlin.com/glibc/glibc-2.34/source/posix/unistd.h#L698
+which is a typedef for unsigned int.
+
+musl uses uid_t as return type
+uid_t getuid(void);
+https://elixir.bootlin.com/musl/v1.2.2/source/include/unistd.h#L108
+which is a typedef to unsigned.
+
+glibc and uclibc include typedefs from __uid_t to uid_t,
+which means one should be able to use uid_t as a replacement
+for __uid_t and make compiling with all three c standard libraries
+possible.
+
+Fetch from: https://github.com/dbus-cxx/dbus-cxx/pull/87
+Signed-off-by: Daniel Lang <d.lang@abatec.at>
+
+---
+ dbus-cxx/sasl.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/dbus-cxx/sasl.cpp b/dbus-cxx/sasl.cpp
+index e8a6060..7a76af6 100644
+--- a/dbus-cxx/sasl.cpp
++++ b/dbus-cxx/sasl.cpp
+@@ -70,7 +70,7 @@ std::tuple<bool, bool, std::vector<uint8_t>> SASL::authenticate() {
+     bool success = false;
+     bool negotiatedFD = false;
+     std::vector<uint8_t> serverGUID;
+-    __uid_t uid = getuid();
++    uid_t uid = getuid();
+     std::string line;
+     std::smatch regex_match;
+ 
+
diff --git a/package/dbus-cxx/Config.in b/package/dbus-cxx/Config.in
new file mode 100644
index 0000000000..1892f73a72
--- /dev/null
+++ b/package/dbus-cxx/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_DBUS_CXX
+	bool "dbus-cxx"
+	depends on BR2_USE_MMU # dbus
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libsigc
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_DBUS # runtime
+	select BR2_PACKAGE_LIBSIGC
+	help
+	  DBus-cxx is a C++ implementation for DBus. DBus is a
+	  Linux-specific RPC (remote procedure call) and
+	  IPC (inter-process communications) mechanism.
+	  DBus-cxx provides an object-oriented view of all programs
+	  on the DBus, and allows an object-oriented way of
+	  exporting methods onto the DBus.
+
+	  https://dbus-cxx.github.io/
+
+comment "dbus-cxx needs a toolchain w/ C++, threads, gcc >= 7 and dynamic library support"
+	depends on BR2_USE_MMU # dbus
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
diff --git a/package/dbus-cxx/dbus-cxx.hash b/package/dbus-cxx/dbus-cxx.hash
new file mode 100644
index 0000000000..907de1866f
--- /dev/null
+++ b/package/dbus-cxx/dbus-cxx.hash
@@ -0,0 +1,5 @@
+# Locally computed:
+sha256  05c4f4750261f09819564bb8ee93b5d7f56fd05bbcd755858860fa6697d09c2a  dbus-cxx-2.1.0.tar.gz
+sha256  e85e018c8ee7d4f439b097289bf4371f6fcfec24e89f3e77c422944501bc383d  COPYING
+sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  cmake-modules/LICENSE_1_0.txt
+sha256  c6596eb7be8581c18be736c846fb9173b69eccf6ef94c5135893ec56bd92ba08  tools/libcppgenerate/LICENSE
diff --git a/package/dbus-cxx/dbus-cxx.mk b/package/dbus-cxx/dbus-cxx.mk
new file mode 100644
index 0000000000..3e89fc9db7
--- /dev/null
+++ b/package/dbus-cxx/dbus-cxx.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# dbus-cxx
+#
+################################################################################
+
+DBUS_CXX_VERSION = 2.1.0
+DBUS_CXX_SITE = $(call github,dbus-cxx,dbus-cxx,$(DBUS_CXX_VERSION))
+DBUS_CXX_LICENSE = GPL-3.0, Boost license (cmake-modules), Apache 2.0 (libcppgenerate)
+DBUS_CXX_LICENSE_FILES = COPYING cmake-modules/LICENSE_1_0.txt tools/libcppgenerate/LICENSE
+DBUS_CXX_INSTALL_STAGING = YES
+DBUS_CXX_DEPENDENCIES = libsigc
+
+ifeq ($(BR2_PACKAGE_QT5BASE),y)
+DBUS_CXX_CONF_OPTS += -DENABLE_QT_SUPPORT=ON
+DBUS_CXX_DEPENDENCIES += qt5base
+else
+DBUS_CXX_CONF_OPTS += -DENABLE_QT_SUPPORT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+DBUS_CXX_CONF_OPTS += -DENABLE_GLIB_SUPPORT=ON
+DBUS_CXX_DEPENDENCIES += libglib2
+else
+DBUS_CXX_CONF_OPTS += -DENABLE_GLIB_SUPPORT=OFF
+endif
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
