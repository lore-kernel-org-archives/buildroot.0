From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2016 18:51:16 +0100
Subject: [Buildroot] [git commit] erlang-p1-stringprep: bump to version 1.0.0
Message-ID: <20160302202754.A5A317FF3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=861ebf9111ab432857d6fbd98680bbf4996cfd07
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version includes C++ code, so also add dependency on a C++
compiler.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
[Thomas:
 - propagate new C++ dependency to ejabberd, as noticed by
   Romain Naour
 - fix license information and license files. Not all the code is
   under the TCL license, in fact most of the code is under the
   Apache-2.0 license, and some additional license files have been
   added to clarify this.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ejabberd/Config.in                           | 5 +++--
 package/erlang-p1-stringprep/Config.in               | 4 ++++
 package/erlang-p1-stringprep/erlang-p1-stringprep.mk | 6 +++---
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/package/ejabberd/Config.in b/package/ejabberd/Config.in
index 7b4e99b..5d176c3 100644
--- a/package/ejabberd/Config.in
+++ b/package/ejabberd/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_EJABBERD
 	bool "ejabberd"
 	depends on BR2_PACKAGE_ERLANG
+	depends on BR2_INSTALL_LIBSTDCPP # stringprep
 	select BR2_PACKAGE_ERLANG_LAGER
 	select BR2_PACKAGE_ERLANG_P1_CACHE_TAB
 	select BR2_PACKAGE_ERLANG_P1_ICONV
@@ -18,5 +19,5 @@ config BR2_PACKAGE_EJABBERD
 
 	  http://www.ejabberd.im
 
-comment "ejabberd needs erlang"
-	depends on !BR2_PACKAGE_ERLANG
+comment "ejabberd needs erlang, toolchain w/ C++"
+	depends on !BR2_PACKAGE_ERLANG || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/erlang-p1-stringprep/Config.in b/package/erlang-p1-stringprep/Config.in
index 3ef77ed..bc4d139 100644
--- a/package/erlang-p1-stringprep/Config.in
+++ b/package/erlang-p1-stringprep/Config.in
@@ -1,5 +1,9 @@
+comment "erlang-p1-stringprep needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
 config BR2_PACKAGE_ERLANG_P1_STRINGPREP
 	bool "erlang-p1-stringprep"
+	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  Erlang interface to stringprep
 
diff --git a/package/erlang-p1-stringprep/erlang-p1-stringprep.mk b/package/erlang-p1-stringprep/erlang-p1-stringprep.mk
index 60c80bc..0a5a1f5 100644
--- a/package/erlang-p1-stringprep/erlang-p1-stringprep.mk
+++ b/package/erlang-p1-stringprep/erlang-p1-stringprep.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-ERLANG_P1_STRINGPREP_VERSION = 3c64023
+ERLANG_P1_STRINGPREP_VERSION = 1.0.0
 ERLANG_P1_STRINGPREP_SITE = $(call github,processone,stringprep,$(ERLANG_P1_STRINGPREP_VERSION))
-ERLANG_P1_STRINGPREP_LICENSE = TCL
-ERLANG_P1_STRINGPREP_LICENSE_FILES = LICENSE.TCL
+ERLANG_P1_STRINGPREP_LICENSE = TCL (tools/*.tcl), Apache-2.0 (rest)
+ERLANG_P1_STRINGPREP_LICENSE_FILES = LICENSE.ALL LICENSE.TCL LICENSE.txt
 
 $(eval $(rebar-package))
