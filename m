From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 May 2017 21:16:02 +0200
Subject: [Buildroot] [git commit branch/next] erlang-p1-xmpp: new package
Message-ID: <20170531191646.F16588220D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=704cca3ef5e0f4eb384c3fdc4b367252c3ed16df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                                             |  1 +
 package/Config.in                                      |  1 +
 package/erlang-p1-xmpp/0001-fix-includes.patch         | 16 ++++++++++++++++
 .../0002-remove-dependencies-from-rebar-config.patch   | 18 ++++++++++++++++++
 package/erlang-p1-xmpp/Config.in                       |  8 ++++++++
 package/erlang-p1-xmpp/erlang-p1-xmpp.hash             |  2 ++
 package/erlang-p1-xmpp/erlang-p1-xmpp.mk               | 16 ++++++++++++++++
 7 files changed, 62 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 231e733..f86e5c6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -871,6 +871,7 @@ F:	package/erlang-p1-stun/
 F:	package/erlang-p1-tls/
 F:	package/erlang-p1-utils/
 F:	package/erlang-p1-xml/
+F:	package/erlang-p1-xmpp/
 F:	package/erlang-p1-yaml/
 F:	package/erlang-p1-zlib/
 F:	package/nginx-dav-ext/
diff --git a/package/Config.in b/package/Config.in
index 2b53add..1b150b2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -520,6 +520,7 @@ menu "Erlang libraries/modules"
 	source "package/erlang-p1-tls/Config.in"
 	source "package/erlang-p1-utils/Config.in"
 	source "package/erlang-p1-xml/Config.in"
+	source "package/erlang-p1-xmpp/Config.in"
 	source "package/erlang-p1-yaml/Config.in"
 	source "package/erlang-p1-zlib/Config.in"
 endmenu
diff --git a/package/erlang-p1-xmpp/0001-fix-includes.patch b/package/erlang-p1-xmpp/0001-fix-includes.patch
new file mode 100644
index 0000000..d0a267b
--- /dev/null
+++ b/package/erlang-p1-xmpp/0001-fix-includes.patch
@@ -0,0 +1,16 @@
+Without this patch, rebar fails to find include file fxml.hrl.
+
+Signed-off-by: Christophe Romain <cromain@process-one.net>
+
+diff --git a/include/xmpp.hrl b/include/xmpp.hrl
+index afa5f61..678858e 100644
+--- a/include/xmpp.hrl
++++ b/include/xmpp.hrl
+@@ -26,7 +26,7 @@
+ -include("ns.hrl").
+ -include("jid.hrl").
+ -include("xmpp_codec.hrl").
+--include("fxml.hrl").
++-include_lib("p1_xml/include/fxml.hrl").
+
+ -type stanza() :: iq() | presence() | message().
diff --git a/package/erlang-p1-xmpp/0002-remove-dependencies-from-rebar-config.patch b/package/erlang-p1-xmpp/0002-remove-dependencies-from-rebar-config.patch
new file mode 100644
index 0000000..fa5c269
--- /dev/null
+++ b/package/erlang-p1-xmpp/0002-remove-dependencies-from-rebar-config.patch
@@ -0,0 +1,18 @@
+Without this patch, dependencies would be downloaded and compiled
+by rebar at build time.
+
+Signed-off-by: Christophe Romain <cromain@process-one.net>
+
+diff --git a/rebar.config b/rebar.config
+index 79494b7..8d769f1 100644
+--- a/rebar.config
++++ b/rebar.config
+@@ -24,9 +24,6 @@
+ 	    {i, "../fast_xml/include"},
+ 	    {i, "deps/fast_xml/include"}]}.
+
+-{deps, [{fast_xml, ".*", {git, "https://github.com/processone/fast_xml", {tag, "1.1.22"}}},
+-	{stringprep, ".*", {git, "https://github.com/processone/stringprep", {tag, "1.0.8"}}}]}.
+-
+ {cover_enabled, true}.
+ {cover_export_enabled, true}.
diff --git a/package/erlang-p1-xmpp/Config.in b/package/erlang-p1-xmpp/Config.in
new file mode 100644
index 0000000..1d518e2
--- /dev/null
+++ b/package/erlang-p1-xmpp/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_ERLANG_P1_XMPP
+	bool "erlang-p1-xmpp"
+	select BR2_PACKAGE_ERLANG_P1_XML
+	select BR2_PACKAGE_ERLANG_P1_STRINGPREP
+	help
+	  XMPP library for Erlang.
+
+	  https://github.com/processone/xmpp
diff --git a/package/erlang-p1-xmpp/erlang-p1-xmpp.hash b/package/erlang-p1-xmpp/erlang-p1-xmpp.hash
new file mode 100644
index 0000000..f245c84
--- /dev/null
+++ b/package/erlang-p1-xmpp/erlang-p1-xmpp.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 e7b5db5ab6204f5bc6ebf91a183ebeae2b43ca6372dd2506599a8e8168a99c50 erlang-p1-xmpp-1.1.9.tar.gz
diff --git a/package/erlang-p1-xmpp/erlang-p1-xmpp.mk b/package/erlang-p1-xmpp/erlang-p1-xmpp.mk
new file mode 100644
index 0000000..149d8bc
--- /dev/null
+++ b/package/erlang-p1-xmpp/erlang-p1-xmpp.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# erlang-p1-xmpp
+#
+################################################################################
+
+ERLANG_P1_XMPP_VERSION = 1.1.9
+ERLANG_P1_XMPP_SITE = $(call github,processone,xmpp,$(ERLANG_P1_XMPP_VERSION))
+ERLANG_P1_XMPP_LICENSE = Apache-2.0
+ERLANG_P1_XMPP_LICENSE_FILES = LICENSE.txt
+ERLANG_P1_XMPP_INSTALL_STAGING = YES
+ERLANG_P1_XMPP_DEPENDENCIES = erlang-p1-xml erlang-p1-stringprep \
+	host-erlang-p1-xml
+
+$(eval $(rebar-package))
+$(eval $(host-rebar-package))
