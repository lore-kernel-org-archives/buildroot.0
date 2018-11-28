From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 28 Nov 2018 22:27:04 +0100
Subject: [Buildroot] [git commit] package/pkg-rebar.mk: remove dependencies
 from rebar.config
Message-ID: <20181202071600.48E94803E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1402956d4b7d44026a1a566dfa3995d97a93af7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of having a patch in every rebar package to remove the
dependencies in the rebar.config file in order to avoid rebar
downloading such dependencies at build time, implement it directly
as a post-patch hook in the rebar infrastructure.
Add a way to explicitly deactivate this behavior if any package needs
such lines in the rebar.config file.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
[Thomas:
 - rename macro to remove-rebar-config-dependencies
 - move the macro outside the inner-rebar-package, so that it is
   declared with the other utility macros found in pkg-rebar.mk]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...002-remove-dependencies-from-rebar-config.patch | 106 ---------------------
 ...002-remove-dependencies-from-rebar-config.patch |  20 ----
 ...001-remove-dependencies-from-rebar-config.patch |  16 ----
 ...001-remove-dependencies-from-rebar-config.patch |  18 ----
 ...002-remove-dependencies-from-rebar-config.patch |  19 ----
 ...001-remove-dependencies-from-rebar-config.patch |  18 ----
 package/pkg-rebar.mk                               |  12 +++
 7 files changed, 12 insertions(+), 197 deletions(-)

diff --git a/package/ejabberd/0002-remove-dependencies-from-rebar-config.patch b/package/ejabberd/0002-remove-dependencies-from-rebar-config.patch
deleted file mode 100644
index 154c7bffd5..0000000000
--- a/package/ejabberd/0002-remove-dependencies-from-rebar-config.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-From 8674f61701da41cc53c532b5fa3a516838a2c5d4 Mon Sep 17 00:00:00 2001
-From: Johan Oudinet <johan.oudinet@gmail.com>
-Date: Wed, 10 Jan 2018 15:14:56 +0100
-Subject: [PATCH] remove dependencies from rebar config
-
-Without this patch, dependencies would be downloaded and compiled by
-rebar at build time.
-
-Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
----
- rebar.config | 72 ------------------------------------------------------------
- 1 file changed, 72 deletions(-)
-
-diff --git a/rebar.config b/rebar.config
-index d6ad5e7b..0b246b92 100644
---- a/rebar.config
-+++ b/rebar.config
-@@ -18,68 +18,6 @@
- %%%
- %%%----------------------------------------------------------------------
- 
--{deps, [{lager, ".*", {git, "https://github.com/erlang-lager/lager",
--                       {tag, {if_version_above, "17", "3.4.2", "3.2.1"}}}},
--        {p1_utils, ".*", {git, "https://github.com/processone/p1_utils", {tag, "1.0.10"}}},
--        {cache_tab, ".*", {git, "https://github.com/processone/cache_tab", {tag, "1.0.12"}}},
--        {fast_tls, ".*", {git, "https://github.com/processone/fast_tls", {tag, "1.0.17"}}},
--        {stringprep, ".*", {git, "https://github.com/processone/stringprep", {tag, "1.0.10"}}},
--        {fast_xml, ".*", {git, "https://github.com/processone/fast_xml", {tag, "1.1.25"}}},
--        {xmpp, ".*", {git, "https://github.com/processone/xmpp", {tag, "1.1.16"}}},
--        {fast_yaml, ".*", {git, "https://github.com/processone/fast_yaml", {tag, "1.0.12"}}},
--        {jiffy, ".*", {git, "https://github.com/davisp/jiffy", {tag, "0.14.8"}}},
--        {p1_oauth2, ".*", {git, "https://github.com/processone/p1_oauth2", {tag, "0.6.2"}}},
--        {luerl, ".*", {git, "https://github.com/rvirding/luerl", {tag, "v0.2"}}},
--	{jose, ".*", {git, "git://github.com/potatosalad/erlang-jose.git", {tag, "1.8.4"}}},
--	{fs, ".*", {git, "https://github.com/synrc/fs.git", {tag, "2.12.0"}}},
--	{if_var_true, stun, {stun, ".*", {git, "https://github.com/processone/stun", {tag, "1.0.16"}}}},
--	{if_var_true, sip, {esip, ".*", {git, "https://github.com/processone/esip", {tag, "1.0.17"}}}},
--        {if_var_true, mysql, {p1_mysql, ".*", {git, "https://github.com/processone/p1_mysql",
--                                               {tag, "1.0.4"}}}},
--        {if_var_true, pgsql, {p1_pgsql, ".*", {git, "https://github.com/processone/p1_pgsql",
--                                               {tag, "1.1.4"}}}},
--        {if_var_true, sqlite, {sqlite3, ".*", {git, "https://github.com/processone/erlang-sqlite3",
--                                               {tag, "1.1.5"}}}},
--        {if_var_true, pam, {epam, ".*", {git, "https://github.com/processone/epam",
--                                           {tag, "1.0.3"}}}},
--        {if_var_true, zlib, {ezlib, ".*", {git, "https://github.com/processone/ezlib",
--                                           {tag, "1.0.3"}}}},
--        {if_var_true, riak, {riakc, ".*", {git, "https://github.com/processone/riak-erlang-client.git",
--                                           {tag, {if_version_above, "19", "develop", "2.5.3"}}}}},
--	{if_var_true, graphics, {eimp, ".*", {git, "https://github.com/processone/eimp.git", {tag, "1.0.2"}}}},
--	%% Elixir support, needed to run tests
--        {if_var_true, elixir, {elixir, ".*", {git, "https://github.com/elixir-lang/elixir",
--                                              {tag, {if_version_above, "17", "v1.4.4", "v1.1.1"}}}}},
--        %% TODO: When modules are fully migrated to new structure and mix, we will not need anymore rebar_elixir_plugin
--	{if_not_rebar3, {if_var_true, elixir, {rebar_elixir_plugin, ".*",
--					       {git, "https://github.com/processone/rebar_elixir_plugin", "0.1.0"}}}},
--        {if_var_true, iconv, {iconv, ".*", {git, "https://github.com/processone/iconv",
--                                            {tag, "1.0.6"}}}},
--        {if_var_true, tools, {meck, "0.8.*", {git, "https://github.com/eproxus/meck",
--                                              {tag, "0.8.4"}}}},
--        {if_var_true, tools, {moka, ".*", {git, "https://github.com/processone/moka.git",
--                                           {tag, "1.0.5c"}}}},
--        {if_var_true, redis, {eredis, ".*", {git, "https://github.com/wooga/eredis",
--                                             {tag, "v1.0.8"}}}}]}.
--
--{if_var_true, latest_deps,
-- {floating_deps, [cache_tab,
--                  fast_tls,
--                  stringprep,
--                  fast_xml,
--                  esip,
--                  stun,
--                  fast_yaml,
--		  xmpp,
--                  p1_utils,
--                  p1_mysql,
--                  p1_pgsql,
--                  p1_oauth2,
--                  epam,
--                  ezlib,
--		  eimp,
--                  iconv]}}.
--
- {erl_first_files, ["src/ejabberd_config.erl", "src/gen_mod.erl", "src/mod_muc_room.erl", "src/mod_push.erl"]}.
- 
- {erl_opts, [nowarn_deprecated_function,
-@@ -153,16 +91,6 @@
- {if_version_above, "17", {cover_enabled, true}}.
- {cover_export_enabled, true}.
- 
--{post_hook_configure, [{"fast_tls", []},
--                       {"stringprep", []},
--                       {"fast_yaml", []},
--                       {if_var_true, sip, {"esip", []}},
--                       {"fast_xml", [{if_var_true, full_xml, "--enable-full-xml"}]},
--                       {if_var_true, pam, {"epam", []}},
--                       {if_var_true, zlib, {"ezlib", []}},
--		       {if_var_true, graphics, {"eimp", []}},
--                       {if_var_true, iconv, {"iconv", []}}]}.
--
- {port_env, [{"CFLAGS", "-g -O2 -Wall"}]}.
- 
- {port_specs, [{"priv/lib/jid.so", ["c_src/jid.c"]}]}.
--- 
-2.14.1
-
diff --git a/package/erlang-p1-sip/0002-remove-dependencies-from-rebar-config.patch b/package/erlang-p1-sip/0002-remove-dependencies-from-rebar-config.patch
deleted file mode 100644
index da86076988..0000000000
--- a/package/erlang-p1-sip/0002-remove-dependencies-from-rebar-config.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Without this patch, dependencies would be downloaded and compiled
-by rebar at build time.
-
-Signed-off-by: Christophe Romain <cromain@process-one.net>
-
-diff --git a/rebar.config b/rebar.config
-index ed93134..5b32788 100644
---- a/rebar.config
-+++ b/rebar.config
-@@ -31,10 +31,6 @@
-
- {port_specs, [{"priv/lib/esip_drv.so", ["c_src/esip_codec.c"]}]}.
-
--{deps, [{stun, ".*", {git, "https://github.com/processone/stun", {tag, "1.0.16"}}},
--	{fast_tls, ".*", {git, "https://github.com/processone/fast_tls", {tag, "1.0.17"}}},
--	{p1_utils, ".*", {git, "https://github.com/processone/p1_utils", {tag, "1.0.10"}}}]}.
--
- {clean_files, ["c_src/esip_codec.gcda", "c_src/esip_codec.gcno"]}.
-
- {cover_enabled, true}.
diff --git a/package/erlang-p1-stun/0001-remove-dependencies-from-rebar-config.patch b/package/erlang-p1-stun/0001-remove-dependencies-from-rebar-config.patch
deleted file mode 100644
index 7e6b4b5345..0000000000
--- a/package/erlang-p1-stun/0001-remove-dependencies-from-rebar-config.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Without this patch, dependencies would be downloaded and compiled
-by rebar at build time.
-
-diff --git a/rebar.config b/rebar.config
-index f02ea40..d0af863 100644
---- a/rebar.config
-+++ b/rebar.config
-@@ -22,9 +22,6 @@
-
- {erl_opts, [debug_info, {i, "include"}]}.
-
--{deps, [{fast_tls, ".*", {git, "https://github.com/processone/fast_tls", {tag, "1.0.17"}}},
--	{p1_utils, ".*", {git, "https://github.com/processone/p1_utils", {tag, "1.0.10"}}}]}.
--
- {cover_enabled, true}.
- {cover_export_enabled, true}.
diff --git a/package/erlang-p1-xml/0001-remove-dependencies-from-rebar-config.patch b/package/erlang-p1-xml/0001-remove-dependencies-from-rebar-config.patch
deleted file mode 100644
index b58db3f2c5..0000000000
--- a/package/erlang-p1-xml/0001-remove-dependencies-from-rebar-config.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Without this patch, dependencies would be downloaded and compiled
-by rebar at build time.
-
-Signed-off-by: Christophe Romain <cromain@process-one.net>
-
-diff --git a/rebar.config b/rebar.config
-index 99f5047..ac2f3b2 100644
---- a/rebar.config
-+++ b/rebar.config
-@@ -32,8 +32,6 @@
- {port_specs, [{"priv/lib/fxml.so", ["c_src/fxml.c"]},
-               {"priv/lib/fxml_stream.so", ["c_src/fxml_stream.c"]}]}.
-
--{deps, [{p1_utils, ".*", {git, "https://github.com/processone/p1_utils", {tag, "1.0.10"}}}]}.
--
- {clean_files, ["c_src/fxml.gcda", "c_src/fxml.gcno", "c_src/fxml_stream.gcda", "c_src/fxml_stream.gcno"]}.
-
- {cover_enabled, true}.
diff --git a/package/erlang-p1-xmpp/0002-remove-dependencies-from-rebar-config.patch b/package/erlang-p1-xmpp/0002-remove-dependencies-from-rebar-config.patch
deleted file mode 100644
index fed44f626d..0000000000
--- a/package/erlang-p1-xmpp/0002-remove-dependencies-from-rebar-config.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Without this patch, dependencies would be downloaded and compiled
-by rebar at build time.
-
-Signed-off-by: Christophe Romain <cromain@process-one.net>
-
-diff --git a/rebar.config b/rebar.config
---- a/rebar.config	2017-11-30 14:24:52.348695123 +0100
-+++ b/rebar.config	2017-11-30 14:35:11.816407195 +0100
-@@ -29,10 +29,6 @@
-
- {port_specs, [{"priv/lib/jid.so", ["c_src/jid.c"]}]}.
-
--{deps, [{fast_xml, ".*", {git, "https://github.com/processone/fast_xml", {tag, "1.1.25"}}},
--        {stringprep, ".*", {git, "https://github.com/processone/stringprep", {tag, "1.0.10"}}},
--        {p1_utils, ".*", {git, "https://github.com/processone/p1_utils", {tag, "1.0.10"}}}]}.
--
- {clean_files, ["c_src/jid.gcda", "c_src/jid.gcno"]}.
-
- {cover_enabled, true}.
diff --git a/package/erlang-p1-yaml/0001-remove-dependencies-from-rebar-config.patch b/package/erlang-p1-yaml/0001-remove-dependencies-from-rebar-config.patch
deleted file mode 100644
index 4dfdb929c1..0000000000
--- a/package/erlang-p1-yaml/0001-remove-dependencies-from-rebar-config.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Without this patch, dependencies would be downloaded and compiled
-by rebar at build time.
-
-Signed-off-by: Christophe Romain <cromain@process-one.net>
-
-diff --git a/rebar.config b/rebar.config
-index e09d08d..651a829 100644
---- a/rebar.config
-+++ b/rebar.config
-@@ -24,8 +24,6 @@
- {port_env, [{"CFLAGS", "$CFLAGS"}, {"LDFLAGS", "$LDFLAGS -lyaml"}]}.
- {port_specs, [{"priv/lib/fast_yaml.so", ["c_src/fast_yaml.c"]}]}.
-
--{deps, [{p1_utils, ".*", {git, "git://github.com/processone/p1_utils", {tag, "1.0.10"}}}]}.
--
- {clean_files, ["c_src/fast_yaml.gcda", "c_src/fast_yaml.gcno"]}.
-
- {cover_enabled, true}.
diff --git a/package/pkg-rebar.mk b/package/pkg-rebar.mk
index e2b4a58681..b6b095929c 100644
--- a/package/pkg-rebar.mk
+++ b/package/pkg-rebar.mk
@@ -94,6 +94,12 @@ define install-rebar-deps
 		$(REBAR_$(2)_DEPS_DIR)/$($(PKG)_ERLANG_APP)
 endef
 
+# Remove the "deps" statement from a rebar.config file
+define remove-rebar-config-dependencies
+	$(SED) '/^{deps/,/}\.$$/d' $($(PKG)_DIR)/rebar.config
+endef
+
+
 ################################################################################
 # inner-rebar-package -- defines how the configuration, compilation
 # and installation of a rebar package should be done, implements a few
@@ -227,6 +233,12 @@ $(2)_REBAR = rebar
 $(2)_DEPENDENCIES += host-erlang-rebar
 endif
 
+# Remove dependencies listed in rebar.config unless the package says
+# otherwise
+ifeq ($$($(2)_KEEP_DEPENDENCIES),)
+$(2)_POST_PATCH_HOOKS += remove-rebar-config-dependencies
+endif
+
 # The package sub-infra to use
 #
 ifeq ($$($(2)_USE_AUTOCONF),YES)
