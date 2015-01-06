From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue,  6 Jan 2015 15:03:03 +0100
Subject: [Buildroot] [PATCH v5 05/16] erlang-lager: new package.
In-Reply-To: <1420552994-657-1-git-send-email-johan.oudinet@gmail.com>
References: <1420552994-657-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <1420552994-657-6-git-send-email-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ejabberd depends on host-erlang-lager.
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
 package/Config.in                    |  1 +
 package/erlang-lager/Config.in       | 13 +++++++++++++
 package/erlang-lager/erlang-lager.mk | 14 ++++++++++++++
 3 files changed, 28 insertions(+)
 create mode 100644 package/erlang-lager/Config.in
 create mode 100644 package/erlang-lager/erlang-lager.mk

diff --git a/package/Config.in b/package/Config.in
index 9e5b28a..6db6c5c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -398,6 +398,7 @@ menu "Interpreter languages and scripting"
 if BR2_PACKAGE_ERLANG
 menu "Erlang libraries/modules"
 	source "package/erlang-goldrush/Config.in"
+	source "package/erlang-lager/Config.in"
 endmenu
 endif
 	source "package/guile/Config.in"
diff --git a/package/erlang-lager/Config.in b/package/erlang-lager/Config.in
new file mode 100644
index 0000000..b7994fe
--- /dev/null
+++ b/package/erlang-lager/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_ERLANG_LAGER
+	bool "erlang-lager"
+	select BR2_PACKAGE_ERLANG_GOLDRUSH
+	help
+	  Logging framework for Erlang.
+	  
+	  Lager (as in the beer) is a logging framework for
+	  Erlang. Its purpose is to provide a more traditional way to
+	  perform logging in an erlang application that plays nicely
+	  with traditional UNIX logging tools like logrotate and
+	  syslog.
+
+	  https://github.com/basho/lager
diff --git a/package/erlang-lager/erlang-lager.mk b/package/erlang-lager/erlang-lager.mk
new file mode 100644
index 0000000..b725bfd
--- /dev/null
+++ b/package/erlang-lager/erlang-lager.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# erlang-lager
+#
+################################################################################
+
+ERLANG_LAGER_VERSION = 2.0.3
+ERLANG_LAGER_SITE = $(call github,basho,lager,$(ERLANG_LAGER_VERSION))
+ERLANG_LAGER_LICENSE = Apache-2.0
+ERLANG_LAGER_LICENSE_FILES = LICENSE
+ERLANG_LAGER_DEPENDENCIES = erlang-goldrush
+
+$(eval $(rebar-package))
+$(eval $(host-rebar-package))
-- 
2.1.0
