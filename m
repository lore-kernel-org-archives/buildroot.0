From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 May 2017 21:14:12 +0200
Subject: [Buildroot] [git commit branch/next] erlang-jiffy: new package
Message-ID: <20170531191433.5FE428274A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ded9546447d649b1b26546944da1725e5639faed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/erlang-jiffy/Config.in         | 10 ++++++++++
 package/erlang-jiffy/erlang-jiffy.hash |  2 ++
 package/erlang-jiffy/erlang-jiffy.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a8fa143..231e733 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -861,6 +861,7 @@ F:	package/python-libconfig/
 N:	Johan Oudinet <johan.oudinet@gmail.com>
 F:	package/ejabberd/
 F:	package/erlang-goldrush/
+F:	package/erlang-jiffy/
 F:	package/erlang-lager/
 F:	package/erlang-p1-cache-tab/
 F:	package/erlang-p1-iconv/
diff --git a/package/Config.in b/package/Config.in
index 7991353..2b53add 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -510,6 +510,7 @@ menu "Interpreter languages and scripting"
 if BR2_PACKAGE_ERLANG
 menu "Erlang libraries/modules"
 	source "package/erlang-goldrush/Config.in"
+	source "package/erlang-jiffy/Config.in"
 	source "package/erlang-lager/Config.in"
 	source "package/erlang-p1-cache-tab/Config.in"
 	source "package/erlang-p1-iconv/Config.in"
diff --git a/package/erlang-jiffy/Config.in b/package/erlang-jiffy/Config.in
new file mode 100644
index 0000000..d65f42c
--- /dev/null
+++ b/package/erlang-jiffy/Config.in
@@ -0,0 +1,10 @@
+comment "erlang-jiffy needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
+config BR2_PACKAGE_ERLANG_JIFFY
+	bool "erlang-jiffy"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  JSON NIFs for Erlang.
+
+	  https://github.com/davisp/jiffy
diff --git a/package/erlang-jiffy/erlang-jiffy.hash b/package/erlang-jiffy/erlang-jiffy.hash
new file mode 100644
index 0000000..1f83e27
--- /dev/null
+++ b/package/erlang-jiffy/erlang-jiffy.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 7d1054c475c82c626de3ad57201a7fc51da38667c8a7502149eb751edc6b601d erlang-jiffy-0.14.8.tar.gz
diff --git a/package/erlang-jiffy/erlang-jiffy.mk b/package/erlang-jiffy/erlang-jiffy.mk
new file mode 100644
index 0000000..674c80f
--- /dev/null
+++ b/package/erlang-jiffy/erlang-jiffy.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# erlang-jiffy
+#
+################################################################################
+
+ERLANG_JIFFY_VERSION = 0.14.8
+ERLANG_JIFFY_SITE = $(call github,davisp,jiffy,$(ERLANG_JIFFY_VERSION))
+ERLANG_JIFFY_LICENSE = MIT (core), \
+	BSD-3-Clause (Google double conversion library), \
+	BSD-3-Clause (tests)
+ERLANG_JIFFY_LICENSE_FILES = LICENSE
+
+$(eval $(rebar-package))
