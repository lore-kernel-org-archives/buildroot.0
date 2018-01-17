From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Jan 2018 22:32:55 +0100
Subject: [Buildroot] [git commit] erlang-p1-xmpp: Bump to version 1.1.16
Message-ID: <20180117213346.E087F83F1D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab278a3a71b13a0853546a5ab33be8a26276e89d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This packages now depends also on erlang-p1-utils.
Adapt the patch that removes rebar dependencies to version changes.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0002-remove-dependencies-from-rebar-config.patch  | 19 ++++++++++---------
 package/erlang-p1-xmpp/Config.in                      |  1 +
 package/erlang-p1-xmpp/erlang-p1-xmpp.hash            |  2 +-
 package/erlang-p1-xmpp/erlang-p1-xmpp.mk              |  4 ++--
 4 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/package/erlang-p1-xmpp/0002-remove-dependencies-from-rebar-config.patch b/package/erlang-p1-xmpp/0002-remove-dependencies-from-rebar-config.patch
index fa5c269..fed44f6 100644
--- a/package/erlang-p1-xmpp/0002-remove-dependencies-from-rebar-config.patch
+++ b/package/erlang-p1-xmpp/0002-remove-dependencies-from-rebar-config.patch
@@ -4,15 +4,16 @@ by rebar at build time.
 Signed-off-by: Christophe Romain <cromain@process-one.net>
 
 diff --git a/rebar.config b/rebar.config
-index 79494b7..8d769f1 100644
---- a/rebar.config
-+++ b/rebar.config
-@@ -24,9 +24,6 @@
- 	    {i, "../fast_xml/include"},
- 	    {i, "deps/fast_xml/include"}]}.
+--- a/rebar.config	2017-11-30 14:24:52.348695123 +0100
++++ b/rebar.config	2017-11-30 14:35:11.816407195 +0100
+@@ -29,10 +29,6 @@
 
--{deps, [{fast_xml, ".*", {git, "https://github.com/processone/fast_xml", {tag, "1.1.22"}}},
--	{stringprep, ".*", {git, "https://github.com/processone/stringprep", {tag, "1.0.8"}}}]}.
+ {port_specs, [{"priv/lib/jid.so", ["c_src/jid.c"]}]}.
+
+-{deps, [{fast_xml, ".*", {git, "https://github.com/processone/fast_xml", {tag, "1.1.25"}}},
+-        {stringprep, ".*", {git, "https://github.com/processone/stringprep", {tag, "1.0.10"}}},
+-        {p1_utils, ".*", {git, "https://github.com/processone/p1_utils", {tag, "1.0.10"}}}]}.
 -
+ {clean_files, ["c_src/jid.gcda", "c_src/jid.gcno"]}.
+
  {cover_enabled, true}.
- {cover_export_enabled, true}.
diff --git a/package/erlang-p1-xmpp/Config.in b/package/erlang-p1-xmpp/Config.in
index c7a68bc..9b33e0c 100644
--- a/package/erlang-p1-xmpp/Config.in
+++ b/package/erlang-p1-xmpp/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_ERLANG_P1_XMPP
 	depends on BR2_INSTALL_LIBSTDCPP # erlang-p1-stringprep
 	select BR2_PACKAGE_ERLANG_P1_XML
 	select BR2_PACKAGE_ERLANG_P1_STRINGPREP
+	select BR2_PACKAGE_ERLANG_P1_UTILS
 	help
 	  XMPP library for Erlang.
 
diff --git a/package/erlang-p1-xmpp/erlang-p1-xmpp.hash b/package/erlang-p1-xmpp/erlang-p1-xmpp.hash
index f245c84..d3d2daf 100644
--- a/package/erlang-p1-xmpp/erlang-p1-xmpp.hash
+++ b/package/erlang-p1-xmpp/erlang-p1-xmpp.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 e7b5db5ab6204f5bc6ebf91a183ebeae2b43ca6372dd2506599a8e8168a99c50 erlang-p1-xmpp-1.1.9.tar.gz
+sha256 558e8d8734052bdbe679cf10165a63944c208940ab84be78c97ba661dfcf3cb2 erlang-p1-xmpp-1.1.16.tar.gz
diff --git a/package/erlang-p1-xmpp/erlang-p1-xmpp.mk b/package/erlang-p1-xmpp/erlang-p1-xmpp.mk
index 149d8bc..096876c 100644
--- a/package/erlang-p1-xmpp/erlang-p1-xmpp.mk
+++ b/package/erlang-p1-xmpp/erlang-p1-xmpp.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-ERLANG_P1_XMPP_VERSION = 1.1.9
+ERLANG_P1_XMPP_VERSION = 1.1.16
 ERLANG_P1_XMPP_SITE = $(call github,processone,xmpp,$(ERLANG_P1_XMPP_VERSION))
 ERLANG_P1_XMPP_LICENSE = Apache-2.0
 ERLANG_P1_XMPP_LICENSE_FILES = LICENSE.txt
 ERLANG_P1_XMPP_INSTALL_STAGING = YES
 ERLANG_P1_XMPP_DEPENDENCIES = erlang-p1-xml erlang-p1-stringprep \
-	host-erlang-p1-xml
+	erlang-p1-utils host-erlang-p1-xml
 
 $(eval $(rebar-package))
 $(eval $(host-rebar-package))
