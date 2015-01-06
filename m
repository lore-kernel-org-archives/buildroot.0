From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue,  6 Jan 2015 15:03:02 +0100
Subject: [Buildroot] [PATCH v5 04/16] erlang-goldrush: new package.
In-Reply-To: <1420552994-657-1-git-send-email-johan.oudinet@gmail.com>
References: <1420552994-657-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <1420552994-657-5-git-send-email-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ejabberd depends on host-erlang-lager, which depends on host-erlang-goldrush.
Hence $(eval $(host-rebar-package)).

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
Changes v4 -> v5:  (Thomas)
  - add explanation for the host package.
---
 package/Config.in                          |  5 +++++
 package/erlang-goldrush/Config.in          |  7 +++++++
 package/erlang-goldrush/erlang-goldrush.mk | 14 ++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 package/erlang-goldrush/Config.in
 create mode 100644 package/erlang-goldrush/erlang-goldrush.mk

diff --git a/package/Config.in b/package/Config.in
index 8d91b04..9e5b28a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -395,6 +395,11 @@ endmenu
 menu "Interpreter languages and scripting"
 	source "package/enscript/Config.in"
 	source "package/erlang/Config.in"
+if BR2_PACKAGE_ERLANG
+menu "Erlang libraries/modules"
+	source "package/erlang-goldrush/Config.in"
+endmenu
+endif
 	source "package/guile/Config.in"
 	source "package/haserl/Config.in"
 	source "package/jamvm/Config.in"
diff --git a/package/erlang-goldrush/Config.in b/package/erlang-goldrush/Config.in
new file mode 100644
index 0000000..2ee579a
--- /dev/null
+++ b/package/erlang-goldrush/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_ERLANG_GOLDRUSH
+	bool "erlang-goldrush"
+	help
+	  Goldrush is a small Erlang app that provides fast event
+	  stream processing.
+
+	  https://github.com/DeadZen/goldrush
diff --git a/package/erlang-goldrush/erlang-goldrush.mk b/package/erlang-goldrush/erlang-goldrush.mk
new file mode 100644
index 0000000..b18a8ec
--- /dev/null
+++ b/package/erlang-goldrush/erlang-goldrush.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# erlang-goldrush
+#
+################################################################################
+
+ERLANG_GOLDRUSH_VERSION = 0.1.6
+ERLANG_GOLDRUSH_SITE = $(call github,DeadZen,goldrush,$(ERLANG_GOLDRUSH_VERSION))
+ERLANG_GOLDRUSH_LICENSE = ISC
+ERLANG_GOLDRUSH_LICENSE_FILES = LICENSE
+ERLANG_GOLDRUSH_INSTALL_STAGING = YES
+
+$(eval $(rebar-package))
+$(eval $(host-rebar-package))
-- 
2.1.0
