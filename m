From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 12 Nov 2014 01:26:07 +0100
Subject: [Buildroot] [PATCH 21/24 v3] erlang-p1-sip: new package.
In-Reply-To: <cover.1415751395.git.yann.morin.1998@free.fr>
References: <cover.1415751395.git.yann.morin.1998@free.fr>
Message-ID: <e187a2f65b4dd9c8797f127dfbc1ddfdeea7d8a9.1415751395.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Johan Oudinet <johan.oudinet@gmail.com>

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in                                     |  1 +
 package/erlang-p1-sip/Config.in                       |  8 ++++++++
 .../erlang-p1-sip/erlang-p1-sip-01-fix-includes.patch | 19 +++++++++++++++++++
 package/erlang-p1-sip/erlang-p1-sip.mk                | 14 ++++++++++++++
 4 files changed, 42 insertions(+)
 create mode 100644 package/erlang-p1-sip/Config.in
 create mode 100644 package/erlang-p1-sip/erlang-p1-sip-01-fix-includes.patch
 create mode 100644 package/erlang-p1-sip/erlang-p1-sip.mk

diff --git a/package/Config.in b/package/Config.in
index 5656a1a..8abd6a6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -395,6 +395,7 @@ if BR2_PACKAGE_ERLANG
 menu "Erlang libraries/modules"
 	source "package/erlang-goldrush/Config.in"
 	source "package/erlang-lager/Config.in"
+	source "package/erlang-p1-sip/Config.in"
 	source "package/erlang-p1-stringprep/Config.in"
 	source "package/erlang-p1-stun/Config.in"
 	source "package/erlang-p1-tls/Config.in"
diff --git a/package/erlang-p1-sip/Config.in b/package/erlang-p1-sip/Config.in
new file mode 100644
index 0000000..64a12b1
--- /dev/null
+++ b/package/erlang-p1-sip/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_ERLANG_P1_SIP
+	bool "erlang-p1-sip"
+	depends on BR2_PACKAGE_ERLANG
+	select BR2_PACKAGE_ERLANG_P1_STUN
+	select BR2_PACKAGE_ERLANG_P1_TLS
+	select BR2_PACKAGE_ERLANG_P1_UTILS
+	help
+	  SIP library for Erlang
diff --git a/package/erlang-p1-sip/erlang-p1-sip-01-fix-includes.patch b/package/erlang-p1-sip/erlang-p1-sip-01-fix-includes.patch
new file mode 100644
index 0000000..80e2ab3
--- /dev/null
+++ b/package/erlang-p1-sip/erlang-p1-sip-01-fix-includes.patch
@@ -0,0 +1,19 @@
+Description: correct include
+ This part of the code was moved into it's own project and was packaged
+ separately by me. To make the build process work, this small fix is
+ necessary.
+Author: Philipp Huebner <debalance@debian.org>
+
+Index: erlang-p1-sip/src/esip_socket.erl
+===================================================================
+--- erlang-p1-sip.orig/src/esip_socket.erl
++++ erlang-p1-sip/src/esip_socket.erl
+@@ -22,7 +22,7 @@
+ 
+ -include("esip.hrl").
+ -include("esip_lib.hrl").
+--include("stun.hrl").
++-include_lib("p1_stun/include/stun.hrl").
+ 
+ -define(TCP_SEND_TIMEOUT, 15000).
+ -define(CONNECT_TIMEOUT, 20000).
diff --git a/package/erlang-p1-sip/erlang-p1-sip.mk b/package/erlang-p1-sip/erlang-p1-sip.mk
new file mode 100644
index 0000000..d38ff2b
--- /dev/null
+++ b/package/erlang-p1-sip/erlang-p1-sip.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# erlang-p1-sip
+#
+################################################################################
+
+ERLANG_P1_SIP_VERSION = bba4459
+ERLANG_P1_SIP_SITE = $(call github,processone,p1_sip,$(ERLANG_P1_SIP_VERSION))
+ERLANG_P1_SIP_LICENSE = GPLv2
+ERLANG_P1_SIP_LICENSE_FILES = COPYING
+ERLANG_P1_SIP_DEPENDENCIES = erlang erlang-p1-stun erlang-p1-tls erlang-p1-utils
+ERLANG_P1_SIP_INSTALL_STAGING = YES
+
+$(eval $(rebar-package))
-- 
1.9.1
