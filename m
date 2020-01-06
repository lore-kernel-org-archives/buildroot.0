From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Jan 2020 21:24:44 +0100
Subject: [Buildroot] [git commit] package/ejabberd: bump to version 19.09.1
Message-ID: <20200106201550.C0E148EE93@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ba749cdaeea2eed4591a5d7d93b616272cd4d63e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There are two remainning patches to:

- change the Makefile rules so dependencies are not downloaded/compiled;
- fix ejabberd user in ejabberdctl script.

The erlang-p1-iconv package is not anymore a dependency for ejabberd.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ejabberd/0002-fix-ejabberdctl.patch | 18 +++++++-----------
 package/ejabberd/Config.in                  |  7 ++++++-
 package/ejabberd/S50ejabberd                |  2 +-
 package/ejabberd/ejabberd.hash              |  2 +-
 package/ejabberd/ejabberd.mk                |  7 +++----
 5 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/package/ejabberd/0002-fix-ejabberdctl.patch b/package/ejabberd/0002-fix-ejabberdctl.patch
index 090fcc52d2..e7fc9315c0 100644
--- a/package/ejabberd/0002-fix-ejabberdctl.patch
+++ b/package/ejabberd/0002-fix-ejabberdctl.patch
@@ -1,32 +1,28 @@
-From 168d5840dc2a541ec16385e666c1932cf02907e9 Mon Sep 17 00:00:00 2001
+From 4283f675f21d3923e200092cec6418014a03ad52 Mon Sep 17 00:00:00 2001
 From: Johan Oudinet <johan.oudinet@gmail.com>
-Date: Wed, 10 Jan 2018 15:00:07 +0100
+Date: Thu, 26 Dec 2019 17:06:34 +0100
 Subject: [PATCH] fix ejabberdctl
 
 Change default values so ejabberdctl run commands as ejabberd user.
-Also add a way for the user to change default values.
 
 Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
 ---
- ejabberdctl.template | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
+ ejabberdctl.template | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/ejabberdctl.template b/ejabberdctl.template
-index 83637766..5a8a8795 100755
+index a940c3df7..5166e5a27 100755
 --- a/ejabberdctl.template
 +++ b/ejabberdctl.template
-@@ -15,7 +15,10 @@ SCRIPT_DIR=$(cd "${0%/*}" && pwd)
+@@ -15,7 +15,7 @@ SCRIPT_DIR=$(cd "${0%/*}" && pwd)
  ERL="{{erl}}"
  IEX="{{bindir}}/iex"
  EPMD="{{epmd}}"
 -INSTALLUSER="{{installuser}}"
 +INSTALLUSER=ejabberd
-+
-+# Read default configuration file if present
-+[ ! -r /etc/default/ejabberd ] || . /etc/default/ejabberd
  
  # check the proper system user is used
  case $(id -un) in
 -- 
-2.14.1
+2.20.1
 
diff --git a/package/ejabberd/Config.in b/package/ejabberd/Config.in
index 7d51d1de9e..e24c7fee6b 100644
--- a/package/ejabberd/Config.in
+++ b/package/ejabberd/Config.in
@@ -3,11 +3,15 @@ config BR2_PACKAGE_EJABBERD
 	depends on BR2_PACKAGE_ERLANG
 	depends on BR2_INSTALL_LIBSTDCPP # jiffy, stringprep
 	select BR2_PACKAGE_ERLANG_EIMP
+	select BR2_PACKAGE_ERLANG_IDNA # runtime
 	select BR2_PACKAGE_ERLANG_JIFFY # runtime
+	select BR2_PACKAGE_ERLANG_JOSE # runtime
 	select BR2_PACKAGE_ERLANG_LAGER
+	select BR2_PACKAGE_ERLANG_P1_ACME # runtime
 	select BR2_PACKAGE_ERLANG_P1_CACHE_TAB
-	select BR2_PACKAGE_ERLANG_P1_ICONV
+	select BR2_PACKAGE_ERLANG_P1_MQTREE # runtime
 	select BR2_PACKAGE_ERLANG_P1_OAUTH2 # runtime
+	select BR2_PACKAGE_ERLANG_P1_PKIX # runtime
 	select BR2_PACKAGE_ERLANG_P1_SIP
 	select BR2_PACKAGE_ERLANG_P1_STRINGPREP
 	select BR2_PACKAGE_ERLANG_P1_STUN
@@ -16,6 +20,7 @@ config BR2_PACKAGE_EJABBERD
 	select BR2_PACKAGE_ERLANG_P1_XML
 	select BR2_PACKAGE_ERLANG_P1_XMPP
 	select BR2_PACKAGE_ERLANG_P1_YAML
+	select BR2_PACKAGE_ERLANG_P1_YCONF # runtime
 	select BR2_PACKAGE_ERLANG_P1_ZLIB
 	select BR2_PACKAGE_GETENT
 	select BR2_PACKAGE_OPENSSL
diff --git a/package/ejabberd/S50ejabberd b/package/ejabberd/S50ejabberd
index 830fcb85a7..83513bdc83 100644
--- a/package/ejabberd/S50ejabberd
+++ b/package/ejabberd/S50ejabberd
@@ -4,7 +4,7 @@
 #
 
 CTL=/usr/sbin/ejabberdctl
-DEFAULT=/etc/default/ejabberd
+DEFAULT=/etc/ejabberd/ejabberdctl.cfg
 INSTALLUSER=ejabberd
 RUNDIR=/var/run/ejabberd
 
diff --git a/package/ejabberd/ejabberd.hash b/package/ejabberd/ejabberd.hash
index aed269cb8d..277ae06107 100644
--- a/package/ejabberd/ejabberd.hash
+++ b/package/ejabberd/ejabberd.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 781a68d2deefb4afae563c29a8955063c759c244d308251167d46185f145d4ff ejabberd-18.09.tgz
+sha256 18ddf61af22fc9b59f8afc6835aae2aee9896eb91cc1030056d6bca6a1fa40d2 ejabberd-19.09.1.tgz
diff --git a/package/ejabberd/ejabberd.mk b/package/ejabberd/ejabberd.mk
index 6982375cf4..3419c6e59c 100644
--- a/package/ejabberd/ejabberd.mk
+++ b/package/ejabberd/ejabberd.mk
@@ -4,14 +4,13 @@
 #
 ################################################################################
 
-EJABBERD_VERSION = 18.09
+EJABBERD_VERSION = 19.09.1
 EJABBERD_SOURCE = ejabberd-$(EJABBERD_VERSION).tgz
 EJABBERD_SITE = https://www.process-one.net/downloads/ejabberd/$(EJABBERD_VERSION)
 EJABBERD_LICENSE = GPL-2.0+ with OpenSSL exception
 EJABBERD_LICENSE_FILES = COPYING
-EJABBERD_DEPENDENCIES = getent openssl erlang-eimp \
-	host-erlang-lager erlang-lager \
-	erlang-p1-cache-tab erlang-p1-iconv erlang-p1-sip \
+EJABBERD_DEPENDENCIES = getent openssl erlang-eimp host-erlang-lager \
+	erlang-lager erlang-p1-cache-tab erlang-p1-sip \
 	erlang-p1-stringprep erlang-p1-stun erlang-p1-tls \
 	erlang-p1-utils erlang-p1-xml erlang-p1-xmpp erlang-p1-yaml \
 	erlang-p1-zlib host-erlang-p1-utils host-erlang-p1-xmpp
