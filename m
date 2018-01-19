From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Fri, 19 Jan 2018 17:29:31 +0100
Subject: [Buildroot] [PATCH v2] ejabberd: Bump to version 17.11
Message-ID: <20180119162931.27721-1-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Adapt all patches.
* Use the new configure option enable-system-deps even though there is
  still a patch needed to correct includes.
* Disable graphics to not depends on X libraries. Disable also
  mod_avatar from the default loaded modules, since this module
  requires graphics enabled.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>

---
Changes v1 -> v2:
  - Remove Erlang cookie configuration.
  - Link 0004-xxx patch to corresponding upstream discussion and explain
    how it has been created.
  - Fix warnings found by utils/check-package.
---
 .../0001-remove-make-targets-for-deps.patch        |    5 +-
 ...002-remove-dependencies-from-rebar-config.patch |   82 +-
 package/ejabberd/0004-correct-include.patch        |   58 -
 package/ejabberd/0004-correct-includes.patch       | 1919 ++++++++++++++++++++
 package/ejabberd/0007-fix-ejabberdctl.patch        |   34 +-
 .../0008-handle-error-case-from-lib_dir.patch      |   32 +
 .../0008-rebar-uses-host-dependencies.patch        |   33 -
 package/ejabberd/0009-disable-mod_avatar.patch     |   32 +
 package/ejabberd/ejabberd.hash                     |    2 +-
 package/ejabberd/ejabberd.mk                       |   26 +-
 10 files changed, 2074 insertions(+), 149 deletions(-)
 delete mode 100644 package/ejabberd/0004-correct-include.patch
 create mode 100644 package/ejabberd/0004-correct-includes.patch
 create mode 100644 package/ejabberd/0008-handle-error-case-from-lib_dir.patch
 delete mode 100644 package/ejabberd/0008-rebar-uses-host-dependencies.patch
 create mode 100644 package/ejabberd/0009-disable-mod_avatar.patch

diff --git a/package/ejabberd/0001-remove-make-targets-for-deps.patch b/package/ejabberd/0001-remove-make-targets-for-deps.patch
index aee09670a1..f012140a18 100644
--- a/package/ejabberd/0001-remove-make-targets-for-deps.patch
+++ b/package/ejabberd/0001-remove-make-targets-for-deps.patch
@@ -9,10 +9,10 @@ using rebar at build time.
 Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
 
 diff --git a/Makefile.in b/Makefile.in
-index a0b4553d..4190a515 100644
+index df2abfdc..8c8fd714 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -77,26 +77,11 @@ else
+@@ -86,27 +86,11 @@ else
    INIT_USER=$(INSTALLUSER)
  endif
 
@@ -24,6 +24,7 @@ index a0b4553d..4190a515 100644
 -deps/.got:
 -	rm -rf deps/.got
 -	rm -rf deps/.built
+-	mkdir -p deps
 -	$(REBAR) get-deps && :> deps/.got
 -
 -deps/.built: deps/.got
diff --git a/package/ejabberd/0002-remove-dependencies-from-rebar-config.patch b/package/ejabberd/0002-remove-dependencies-from-rebar-config.patch
index bcf1e8a5ee..154c7bffd5 100644
--- a/package/ejabberd/0002-remove-dependencies-from-rebar-config.patch
+++ b/package/ejabberd/0002-remove-dependencies-from-rebar-config.patch
@@ -1,54 +1,61 @@
-From d399ecdd99e62b5554210a3b5c733e738e4d54be Mon Sep 17 00:00:00 2001
-From: Philipp Huebner <debalance@debian.org>
-Date: Wed, 20 Jan 2016 08:08:42 -0500
+From 8674f61701da41cc53c532b5fa3a516838a2c5d4 Mon Sep 17 00:00:00 2001
+From: Johan Oudinet <johan.oudinet@gmail.com>
+Date: Wed, 10 Jan 2018 15:14:56 +0100
 Subject: [PATCH] remove dependencies from rebar config
 
-Without this patch, dependencies would be downloaded and compiled
-by rebar at build time.
+Without this patch, dependencies would be downloaded and compiled by
+rebar at build time.
 
-Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
+Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
+---
+ rebar.config | 72 ------------------------------------------------------------
+ 1 file changed, 72 deletions(-)
 
 diff --git a/rebar.config b/rebar.config
-index aef3a017..71937023 100644
+index d6ad5e7b..0b246b92 100644
 --- a/rebar.config
 +++ b/rebar.config
-@@ -18,63 +18,6 @@
+@@ -18,68 +18,6 @@
  %%%
  %%%----------------------------------------------------------------------
-
--{deps, [{lager, ".*", {git, "https://github.com/basho/lager", {tag, "3.2.1"}}},
--        {p1_utils, ".*", {git, "https://github.com/processone/p1_utils", {tag, "1.0.8"}}},
--        {cache_tab, ".*", {git, "https://github.com/processone/cache_tab", {tag, "1.0.7"}}},
--        {fast_tls, ".*", {git, "https://github.com/processone/fast_tls", {tag, "1.0.11"}}},
--        {stringprep, ".*", {git, "https://github.com/processone/stringprep", {tag, "1.0.8"}}},
--        {fast_xml, ".*", {git, "https://github.com/processone/fast_xml", {tag, "1.1.21"}}},
--        {xmpp, ".*", {git, "https://github.com/processone/xmpp", {tag, "1.1.9"}}},
--        {stun, ".*", {git, "https://github.com/processone/stun", {tag, "1.0.10"}}},
--        {esip, ".*", {git, "https://github.com/processone/esip", {tag, "1.0.11"}}},
--        {fast_yaml, ".*", {git, "https://github.com/processone/fast_yaml", {tag, "1.0.9"}}},
+ 
+-{deps, [{lager, ".*", {git, "https://github.com/erlang-lager/lager",
+-                       {tag, {if_version_above, "17", "3.4.2", "3.2.1"}}}},
+-        {p1_utils, ".*", {git, "https://github.com/processone/p1_utils", {tag, "1.0.10"}}},
+-        {cache_tab, ".*", {git, "https://github.com/processone/cache_tab", {tag, "1.0.12"}}},
+-        {fast_tls, ".*", {git, "https://github.com/processone/fast_tls", {tag, "1.0.17"}}},
+-        {stringprep, ".*", {git, "https://github.com/processone/stringprep", {tag, "1.0.10"}}},
+-        {fast_xml, ".*", {git, "https://github.com/processone/fast_xml", {tag, "1.1.25"}}},
+-        {xmpp, ".*", {git, "https://github.com/processone/xmpp", {tag, "1.1.16"}}},
+-        {fast_yaml, ".*", {git, "https://github.com/processone/fast_yaml", {tag, "1.0.12"}}},
 -        {jiffy, ".*", {git, "https://github.com/davisp/jiffy", {tag, "0.14.8"}}},
--        {p1_oauth2, ".*", {git, "https://github.com/processone/p1_oauth2", {tag, "0.6.1"}}},
+-        {p1_oauth2, ".*", {git, "https://github.com/processone/p1_oauth2", {tag, "0.6.2"}}},
 -        {luerl, ".*", {git, "https://github.com/rvirding/luerl", {tag, "v0.2"}}},
+-	{jose, ".*", {git, "git://github.com/potatosalad/erlang-jose.git", {tag, "1.8.4"}}},
+-	{fs, ".*", {git, "https://github.com/synrc/fs.git", {tag, "2.12.0"}}},
+-	{if_var_true, stun, {stun, ".*", {git, "https://github.com/processone/stun", {tag, "1.0.16"}}}},
+-	{if_var_true, sip, {esip, ".*", {git, "https://github.com/processone/esip", {tag, "1.0.17"}}}},
 -        {if_var_true, mysql, {p1_mysql, ".*", {git, "https://github.com/processone/p1_mysql",
--                                               {tag, "1.0.2"}}}},
+-                                               {tag, "1.0.4"}}}},
 -        {if_var_true, pgsql, {p1_pgsql, ".*", {git, "https://github.com/processone/p1_pgsql",
--                                               {tag, "1.1.2"}}}},
+-                                               {tag, "1.1.4"}}}},
 -        {if_var_true, sqlite, {sqlite3, ".*", {git, "https://github.com/processone/erlang-sqlite3",
 -                                               {tag, "1.1.5"}}}},
 -        {if_var_true, pam, {epam, ".*", {git, "https://github.com/processone/epam",
--                                           {tag, "1.0.2"}}}},
+-                                           {tag, "1.0.3"}}}},
 -        {if_var_true, zlib, {ezlib, ".*", {git, "https://github.com/processone/ezlib",
--                                           {tag, "1.0.2"}}}},
--        {if_var_true, riak, {riakc, ".*", {git, "https://github.com/basho/riak-erlang-client",
--                                           {tag, "2.4.1"}}}},
+-                                           {tag, "1.0.3"}}}},
+-        {if_var_true, riak, {riakc, ".*", {git, "https://github.com/processone/riak-erlang-client.git",
+-                                           {tag, {if_version_above, "19", "develop", "2.5.3"}}}}},
+-	{if_var_true, graphics, {eimp, ".*", {git, "https://github.com/processone/eimp.git", {tag, "1.0.2"}}}},
 -	%% Elixir support, needed to run tests
 -        {if_var_true, elixir, {elixir, ".*", {git, "https://github.com/elixir-lang/elixir",
--                                              {tag, {if_version_above, "17", "v1.2.6", "v1.1.1"}}}}},
+-                                              {tag, {if_version_above, "17", "v1.4.4", "v1.1.1"}}}}},
 -        %% TODO: When modules are fully migrated to new structure and mix, we will not need anymore rebar_elixir_plugin
 -	{if_not_rebar3, {if_var_true, elixir, {rebar_elixir_plugin, ".*",
 -					       {git, "https://github.com/processone/rebar_elixir_plugin", "0.1.0"}}}},
 -        {if_var_true, iconv, {iconv, ".*", {git, "https://github.com/processone/iconv",
--                                            {tag, "1.0.4"}}}},
+-                                            {tag, "1.0.6"}}}},
 -        {if_var_true, tools, {meck, "0.8.*", {git, "https://github.com/eproxus/meck",
 -                                              {tag, "0.8.4"}}}},
 -        {if_var_true, tools, {moka, ".*", {git, "https://github.com/processone/moka.git",
@@ -62,33 +69,38 @@ index aef3a017..71937023 100644
 -                  stringprep,
 -                  fast_xml,
 -                  esip,
--                  luerl,
 -                  stun,
 -                  fast_yaml,
 -		  xmpp,
 -                  p1_utils,
 -                  p1_mysql,
 -                  p1_pgsql,
+-                  p1_oauth2,
 -                  epam,
 -                  ezlib,
+-		  eimp,
 -                  iconv]}}.
 -
- {erl_first_files, ["src/ejabberd_config.erl", "src/gen_mod.erl", "src/mod_muc_room.erl"]}.
-
+ {erl_first_files, ["src/ejabberd_config.erl", "src/gen_mod.erl", "src/mod_muc_room.erl", "src/mod_push.erl"]}.
+ 
  {erl_opts, [nowarn_deprecated_function,
-@@ -142,15 +85,6 @@
+@@ -153,16 +91,6 @@
  {if_version_above, "17", {cover_enabled, true}}.
  {cover_export_enabled, true}.
-
+ 
 -{post_hook_configure, [{"fast_tls", []},
 -                       {"stringprep", []},
 -                       {"fast_yaml", []},
--                       {"esip", []},
+-                       {if_var_true, sip, {"esip", []}},
 -                       {"fast_xml", [{if_var_true, full_xml, "--enable-full-xml"}]},
 -                       {if_var_true, pam, {"epam", []}},
 -                       {if_var_true, zlib, {"ezlib", []}},
+-		       {if_var_true, graphics, {"eimp", []}},
 -                       {if_var_true, iconv, {"iconv", []}}]}.
 -
  {port_env, [{"CFLAGS", "-g -O2 -Wall"}]}.
-
+ 
  {port_specs, [{"priv/lib/jid.so", ["c_src/jid.c"]}]}.
+-- 
+2.14.1
+
diff --git a/package/ejabberd/0004-correct-include.patch b/package/ejabberd/0004-correct-include.patch
deleted file mode 100644
index 4db7395f75..0000000000
--- a/package/ejabberd/0004-correct-include.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 705a9ad229de49cd9cce226a2025716902455663 Mon Sep 17 00:00:00 2001
-From: Philipp Huebner <debalance@debian.org>
-Date: Wed, 20 Jan 2016 08:13:21 -0500
-Subject: [PATCH] correct include
-
-This part of the code was moved into it's own project and was packaged
-separately by me. To make the build process work, this small fix is
-necessary.
-
-Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
----
- src/mod_sip.erl           | 2 +-
- src/mod_sip_proxy.erl     | 2 +-
- src/mod_sip_registrar.erl | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/mod_sip.erl b/src/mod_sip.erl
-index c8c9533..7f188a0 100644
---- a/src/mod_sip.erl
-+++ b/src/mod_sip.erl
-@@ -38,7 +38,7 @@
- 
- -include("ejabberd.hrl").
- -include("logger.hrl").
---include_lib("esip/include/esip.hrl").
-+-include_lib("p1_sip/include/esip.hrl").
- 
- %%%===================================================================
- %%% API
-diff --git a/src/mod_sip_proxy.erl b/src/mod_sip_proxy.erl
-index bf297bc..d8b65cd 100644
---- a/src/mod_sip_proxy.erl
-+++ b/src/mod_sip_proxy.erl
-@@ -40,7 +40,7 @@
- 
- -include("ejabberd.hrl").
- -include("logger.hrl").
---include_lib("esip/include/esip.hrl").
-+-include_lib("p1_sip/include/esip.hrl").
- 
- -define(SIGN_LIFETIME, 300). %% in seconds.
- 
-diff --git a/src/mod_sip_registrar.erl b/src/mod_sip_registrar.erl
-index 44091ed..4d2ec82 100644
---- a/src/mod_sip_registrar.erl
-+++ b/src/mod_sip_registrar.erl
-@@ -37,7 +37,7 @@
- 
- -include("ejabberd.hrl").
- -include("logger.hrl").
---include_lib("esip/include/esip.hrl").
-+-include_lib("p1_sip/include/esip.hrl").
- 
- -define(CALL_TIMEOUT, timer:seconds(30)).
- -define(DEFAULT_EXPIRES, 3600).
--- 
-2.5.0
-
diff --git a/package/ejabberd/0004-correct-includes.patch b/package/ejabberd/0004-correct-includes.patch
new file mode 100644
index 0000000000..f8f827a4eb
--- /dev/null
+++ b/package/ejabberd/0004-correct-includes.patch
@@ -0,0 +1,1919 @@
+From 0487178693143955ff57e3c9371fb6e7b164294c Mon Sep 17 00:00:00 2001
+From: Johan Oudinet <johan.oudinet@gmail.com>
+Date: Thu, 11 Jan 2018 12:49:38 +0100
+Subject: [PATCH] correct includes
+
+Use include_lib() instead of include() for files from external
+libraries. See https://github.com/processone/ejabberd/pull/1446
+
+Note: Philipp Huebner has a similar patch in Debian's port of ejabberd
+but it was easier to redo this patch from scratch with the following sed
+command on ejabberd git repository than adapting Huebner's patch format:
+for f in src/*.erl include/*.hrl; do
+    sed -i -e 's,esip/include,s1_sip/include,g' \
+    -e 's,include("ns.hrl,include_lib("p1_xmpp/include/ns.hrl,g' \
+    -e 's,include("fxml.hrl,include_lib("p1_xml/include/fxml.hrl,g' \
+    -e 's,include("xmpp\.hrl,include_lib("p1_xmpp/include/xmpp.hrl,g' \
+    -e 's,include("jid\.hrl,include_lib("p1_xmpp/include/jid.hrl,g' \
+    "$f"
+done
+
+Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
+---
+ include/jlib.hrl                  | 4 ++--
+ src/acl.erl                       | 2 +-
+ src/acme_challenge.erl            | 2 +-
+ src/ejabberd_acme.erl             | 2 +-
+ src/ejabberd_acme_comm.erl        | 2 +-
+ src/ejabberd_auth_anonymous.erl   | 2 +-
+ src/ejabberd_bosh.erl             | 2 +-
+ src/ejabberd_c2s.erl              | 2 +-
+ src/ejabberd_captcha.erl          | 2 +-
+ src/ejabberd_http.erl             | 2 +-
+ src/ejabberd_http_ws.erl          | 2 +-
+ src/ejabberd_iq.erl               | 2 +-
+ src/ejabberd_local.erl            | 2 +-
+ src/ejabberd_oauth.erl            | 2 +-
+ src/ejabberd_oauth_rest.erl       | 2 +-
+ src/ejabberd_oauth_sql.erl        | 2 +-
+ src/ejabberd_piefxis.erl          | 2 +-
+ src/ejabberd_router.erl           | 2 +-
+ src/ejabberd_router_multicast.erl | 2 +-
+ src/ejabberd_s2s.erl              | 2 +-
+ src/ejabberd_s2s_in.erl           | 2 +-
+ src/ejabberd_s2s_out.erl          | 2 +-
+ src/ejabberd_service.erl          | 2 +-
+ src/ejabberd_sm.erl               | 2 +-
+ src/ejabberd_socket.erl           | 2 +-
+ src/ejabberd_system_monitor.erl   | 2 +-
+ src/ejabberd_web.erl              | 2 +-
+ src/ejabberd_web_admin.erl        | 2 +-
+ src/ejabberd_websocket.erl        | 2 +-
+ src/ejabberd_xmlrpc.erl           | 2 +-
+ src/gen_iq_handler.erl            | 2 +-
+ src/gen_pubsub_node.erl           | 2 +-
+ src/gen_pubsub_nodetree.erl       | 2 +-
+ src/jd2ejd.erl                    | 2 +-
+ src/mod_adhoc.erl                 | 2 +-
+ src/mod_admin_extra.erl           | 2 +-
+ src/mod_admin_update_sql.erl      | 2 +-
+ src/mod_announce.erl              | 2 +-
+ src/mod_announce_mnesia.erl       | 2 +-
+ src/mod_announce_riak.erl         | 2 +-
+ src/mod_announce_sql.erl          | 2 +-
+ src/mod_avatar.erl                | 2 +-
+ src/mod_block_strangers.erl       | 2 +-
+ src/mod_blocking.erl              | 2 +-
+ src/mod_bosh.erl                  | 2 +-
+ src/mod_caps.erl                  | 2 +-
+ src/mod_carboncopy.erl            | 2 +-
+ src/mod_client_state.erl          | 2 +-
+ src/mod_configure.erl             | 2 +-
+ src/mod_delegation.erl            | 2 +-
+ src/mod_disco.erl                 | 2 +-
+ src/mod_echo.erl                  | 2 +-
+ src/mod_fail2ban.erl              | 2 +-
+ src/mod_http_api.erl              | 2 +-
+ src/mod_http_upload.erl           | 2 +-
+ src/mod_http_upload_quota.erl     | 2 +-
+ src/mod_irc.erl                   | 2 +-
+ src/mod_irc_connection.erl        | 2 +-
+ src/mod_irc_mnesia.erl            | 2 +-
+ src/mod_irc_riak.erl              | 2 +-
+ src/mod_irc_sql.erl               | 2 +-
+ src/mod_last.erl                  | 2 +-
+ src/mod_legacy_auth.erl           | 2 +-
+ src/mod_mam.erl                   | 2 +-
+ src/mod_mam_mnesia.erl            | 2 +-
+ src/mod_mam_sql.erl               | 2 +-
+ src/mod_metrics.erl               | 2 +-
+ src/mod_mix.erl                   | 2 +-
+ src/mod_muc.erl                   | 2 +-
+ src/mod_muc_admin.erl             | 2 +-
+ src/mod_muc_log.erl               | 2 +-
+ src/mod_muc_mnesia.erl            | 2 +-
+ src/mod_muc_riak.erl              | 2 +-
+ src/mod_muc_room.erl              | 2 +-
+ src/mod_muc_sql.erl               | 2 +-
+ src/mod_multicast.erl             | 2 +-
+ src/mod_offline.erl               | 2 +-
+ src/mod_offline_mnesia.erl        | 2 +-
+ src/mod_offline_riak.erl          | 2 +-
+ src/mod_offline_sql.erl           | 2 +-
+ src/mod_ping.erl                  | 2 +-
+ src/mod_pres_counter.erl          | 2 +-
+ src/mod_privacy.erl               | 2 +-
+ src/mod_privacy_mnesia.erl        | 2 +-
+ src/mod_privacy_riak.erl          | 2 +-
+ src/mod_privacy_sql.erl           | 2 +-
+ src/mod_private.erl               | 2 +-
+ src/mod_private_mnesia.erl        | 2 +-
+ src/mod_private_riak.erl          | 2 +-
+ src/mod_private_sql.erl           | 2 +-
+ src/mod_privilege.erl             | 2 +-
+ src/mod_proxy65_service.erl       | 2 +-
+ src/mod_pubsub.erl                | 2 +-
+ src/mod_push.erl                  | 2 +-
+ src/mod_push_keepalive.erl        | 2 +-
+ src/mod_push_mnesia.erl           | 2 +-
+ src/mod_push_sql.erl              | 2 +-
+ src/mod_register.erl              | 2 +-
+ src/mod_register_web.erl          | 2 +-
+ src/mod_roster.erl                | 2 +-
+ src/mod_s2s_dialback.erl          | 2 +-
+ src/mod_service_log.erl           | 2 +-
+ src/mod_shared_roster.erl         | 2 +-
+ src/mod_shared_roster_ldap.erl    | 2 +-
+ src/mod_shared_roster_mnesia.erl  | 2 +-
+ src/mod_shared_roster_riak.erl    | 2 +-
+ src/mod_shared_roster_sql.erl     | 2 +-
+ src/mod_sic.erl                   | 2 +-
+ src/mod_sip.erl                   | 2 +-
+ src/mod_sip_proxy.erl             | 2 +-
+ src/mod_sip_registrar.erl         | 2 +-
+ src/mod_stats.erl                 | 2 +-
+ src/mod_stream_mgmt.erl           | 2 +-
+ src/mod_time.erl                  | 2 +-
+ src/mod_vcard.erl                 | 2 +-
+ src/mod_vcard_ldap.erl            | 2 +-
+ src/mod_vcard_mnesia.erl          | 2 +-
+ src/mod_vcard_riak.erl            | 2 +-
+ src/mod_vcard_sql.erl             | 2 +-
+ src/mod_vcard_xupdate.erl         | 2 +-
+ src/mod_version.erl               | 2 +-
+ src/node_dag.erl                  | 2 +-
+ src/node_dispatch.erl             | 2 +-
+ src/node_flat.erl                 | 2 +-
+ src/node_flat_sql.erl             | 2 +-
+ src/node_online.erl               | 2 +-
+ src/nodetree_dag.erl              | 2 +-
+ src/nodetree_tree.erl             | 2 +-
+ src/nodetree_tree_sql.erl         | 2 +-
+ src/prosody2ejabberd.erl          | 2 +-
+ src/pubsub_subscription.erl       | 2 +-
+ src/pubsub_subscription_sql.erl   | 2 +-
+ src/xmpp_stream_in.erl            | 2 +-
+ src/xmpp_stream_out.erl           | 2 +-
+ src/xmpp_stream_pkix.erl          | 2 +-
+ 135 files changed, 136 insertions(+), 136 deletions(-)
+
+diff --git a/include/jlib.hrl b/include/jlib.hrl
+index cd5fedbf..293fcc0e 100644
+--- a/include/jlib.hrl
++++ b/include/jlib.hrl
+@@ -18,8 +18,8 @@
+ %%%
+ %%%----------------------------------------------------------------------
+ 
+--include("ns.hrl").
+--include("fxml.hrl").
++-include_lib("p1_xmpp/include/ns.hrl").
++-include_lib("p1_xml/include/fxml.hrl").
+ 
+ -define(STANZA_ERROR(Code, Type, Condition),
+ 	#xmlel{name = <<"error">>,
+diff --git a/src/acl.erl b/src/acl.erl
+index 2d848b99..88df4625 100644
+--- a/src/acl.erl
++++ b/src/acl.erl
+@@ -45,7 +45,7 @@
+ 
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+--include("jid.hrl").
++-include_lib("p1_xmpp/include/jid.hrl").
+ 
+ -record(acl, {aclname, aclspec}).
+ -record(access, {name       :: aclname(),
+diff --git a/src/acme_challenge.erl b/src/acme_challenge.erl
+index f4fde4e7..45fc6d8f 100644
+--- a/src/acme_challenge.erl
++++ b/src/acme_challenge.erl
+@@ -16,7 +16,7 @@
+ 
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("ejabberd_http.hrl").
+ -include("ejabberd_acme.hrl").
+ 
+diff --git a/src/ejabberd_acme.erl b/src/ejabberd_acme.erl
+index a5166b45..eee74092 100644
+--- a/src/ejabberd_acme.erl
++++ b/src/ejabberd_acme.erl
+@@ -21,7 +21,7 @@
+ 
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("ejabberd_commands.hrl").
+ -include("ejabberd_acme.hrl").
+ -include_lib("public_key/include/public_key.hrl").
+diff --git a/src/ejabberd_acme_comm.erl b/src/ejabberd_acme_comm.erl
+index a5668d08..02acd1c4 100644
+--- a/src/ejabberd_acme_comm.erl
++++ b/src/ejabberd_acme_comm.erl
+@@ -24,7 +24,7 @@
+ 
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -include("ejabberd_acme.hrl").
+ -include_lib("public_key/include/public_key.hrl").
+diff --git a/src/ejabberd_auth_anonymous.erl b/src/ejabberd_auth_anonymous.erl
+index a4f3ac1c..697b3e08 100644
+--- a/src/ejabberd_auth_anonymous.erl
++++ b/src/ejabberd_auth_anonymous.erl
+@@ -46,7 +46,7 @@
+ 
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+--include("jid.hrl").
++-include_lib("p1_xmpp/include/jid.hrl").
+ 
+ start(Host) ->
+     ejabberd_hooks:add(sm_register_connection_hook, Host,
+diff --git a/src/ejabberd_bosh.erl b/src/ejabberd_bosh.erl
+index 1df6681f..e8cc5f9b 100644
+--- a/src/ejabberd_bosh.erl
++++ b/src/ejabberd_bosh.erl
+@@ -47,7 +47,7 @@
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -include("ejabberd_http.hrl").
+ 
+diff --git a/src/ejabberd_c2s.erl b/src/ejabberd_c2s.erl
+index a94d065f..a56d9041 100644
+--- a/src/ejabberd_c2s.erl
++++ b/src/ejabberd_c2s.erl
+@@ -52,7 +52,7 @@
+ 	 host_up/1, host_down/1]).
+ 
+ -include("ejabberd.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("logger.hrl").
+ -include("mod_roster.hrl").
+ 
+diff --git a/src/ejabberd_captcha.erl b/src/ejabberd_captcha.erl
+index 76af5278..3a950786 100644
+--- a/src/ejabberd_captcha.erl
++++ b/src/ejabberd_captcha.erl
+@@ -43,7 +43,7 @@
+ 	 is_feature_available/0, create_captcha_x/5,
+ 	 opt_type/1]).
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+ -include("ejabberd_http.hrl").
+diff --git a/src/ejabberd_http.erl b/src/ejabberd_http.erl
+index 0bc0d8fc..d39a585d 100644
+--- a/src/ejabberd_http.erl
++++ b/src/ejabberd_http.erl
+@@ -39,7 +39,7 @@
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -include("ejabberd_http.hrl").
+ 
+diff --git a/src/ejabberd_http_ws.erl b/src/ejabberd_http_ws.erl
+index f9f7b07e..5c0e6ea1 100644
+--- a/src/ejabberd_http_ws.erl
++++ b/src/ejabberd_http_ws.erl
+@@ -39,7 +39,7 @@
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -include("ejabberd_http.hrl").
+ 
+diff --git a/src/ejabberd_iq.erl b/src/ejabberd_iq.erl
+index 7d2751dc..76a6b056 100644
+--- a/src/ejabberd_iq.erl
++++ b/src/ejabberd_iq.erl
+@@ -34,7 +34,7 @@
+ -export([init/1, handle_call/3, handle_cast/2, handle_info/2,
+ 	 terminate/2, code_change/3]).
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("logger.hrl").
+ 
+ -record(state, {expire = infinity :: timeout()}).
+diff --git a/src/ejabberd_local.erl b/src/ejabberd_local.erl
+index cc1d6a2e..f72fd43b 100644
+--- a/src/ejabberd_local.erl
++++ b/src/ejabberd_local.erl
+@@ -50,7 +50,7 @@
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+ -include_lib("stdlib/include/ms_transform.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -record(state, {}).
+ 
+diff --git a/src/ejabberd_oauth.erl b/src/ejabberd_oauth.erl
+index df4e4bc2..34bf24f8 100644
+--- a/src/ejabberd_oauth.erl
++++ b/src/ejabberd_oauth.erl
+@@ -52,7 +52,7 @@
+ 
+ -export([oauth_issue_token/3, oauth_list_tokens/0, oauth_revoke_token/1]).
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+diff --git a/src/ejabberd_oauth_rest.erl b/src/ejabberd_oauth_rest.erl
+index 206fab43..1a7287ee 100644
+--- a/src/ejabberd_oauth_rest.erl
++++ b/src/ejabberd_oauth_rest.erl
+@@ -37,7 +37,7 @@
+ -include("ejabberd.hrl").
+ -include("ejabberd_oauth.hrl").
+ -include("logger.hrl").
+--include("jid.hrl").
++-include_lib("p1_xmpp/include/jid.hrl").
+ 
+ init() ->
+     rest:start(?MYNAME),
+diff --git a/src/ejabberd_oauth_sql.erl b/src/ejabberd_oauth_sql.erl
+index 14eaca6a..fcd105ba 100644
+--- a/src/ejabberd_oauth_sql.erl
++++ b/src/ejabberd_oauth_sql.erl
+@@ -36,7 +36,7 @@
+ -include("ejabberd_oauth.hrl").
+ -include("ejabberd.hrl").
+ -include("ejabberd_sql_pt.hrl").
+--include("jid.hrl").
++-include_lib("p1_xmpp/include/jid.hrl").
+ -include("logger.hrl").
+ 
+ init() ->
+diff --git a/src/ejabberd_piefxis.erl b/src/ejabberd_piefxis.erl
+index ecb4908a..7331f442 100644
+--- a/src/ejabberd_piefxis.erl
++++ b/src/ejabberd_piefxis.erl
+@@ -42,7 +42,7 @@
+ 
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_privacy.hrl").
+ -include("mod_roster.hrl").
+ 
+diff --git a/src/ejabberd_router.erl b/src/ejabberd_router.erl
+index e2901483..315505ec 100644
+--- a/src/ejabberd_router.erl
++++ b/src/ejabberd_router.erl
+@@ -71,7 +71,7 @@
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+ -include("ejabberd_router.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -callback init() -> any().
+ -callback register_route(binary(), binary(), local_hint(),
+diff --git a/src/ejabberd_router_multicast.erl b/src/ejabberd_router_multicast.erl
+index 5d5acfca..3f206ef2 100644
+--- a/src/ejabberd_router_multicast.erl
++++ b/src/ejabberd_router_multicast.erl
+@@ -43,7 +43,7 @@
+ 
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -record(route_multicast, {domain = <<"">> :: binary() | '_',
+ 			  pid = self() :: pid()}).
+diff --git a/src/ejabberd_s2s.erl b/src/ejabberd_s2s.erl
+index 0626d62f..e2fc34c9 100644
+--- a/src/ejabberd_s2s.erl
++++ b/src/ejabberd_s2s.erl
+@@ -57,7 +57,7 @@
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -include("ejabberd_commands.hrl").
+ 
+diff --git a/src/ejabberd_s2s_in.erl b/src/ejabberd_s2s_in.erl
+index a949e83d..3d8e100e 100644
+--- a/src/ejabberd_s2s_in.erl
++++ b/src/ejabberd_s2s_in.erl
+@@ -45,7 +45,7 @@
+ 	 host_up/1, host_down/1]).
+ 
+ -include("ejabberd.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("logger.hrl").
+ 
+ -type state() :: map().
+diff --git a/src/ejabberd_s2s_out.erl b/src/ejabberd_s2s_out.erl
+index fea5d816..c035731f 100644
+--- a/src/ejabberd_s2s_out.erl
++++ b/src/ejabberd_s2s_out.erl
+@@ -43,7 +43,7 @@
+ 	 route/2, establish/1, update_state/2, host_up/1, host_down/1]).
+ 
+ -include("ejabberd.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("logger.hrl").
+ 
+ -type state() :: map().
+diff --git a/src/ejabberd_service.erl b/src/ejabberd_service.erl
+index 7b5f945d..895fed09 100644
+--- a/src/ejabberd_service.erl
++++ b/src/ejabberd_service.erl
+@@ -37,7 +37,7 @@
+ -export([send/2]).
+ 
+ -include("ejabberd.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("logger.hrl").
+ 
+ -type state() :: map().
+diff --git a/src/ejabberd_sm.erl b/src/ejabberd_sm.erl
+index 3df1d88e..e8087c48 100644
+--- a/src/ejabberd_sm.erl
++++ b/src/ejabberd_sm.erl
+@@ -89,7 +89,7 @@
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -include("ejabberd_commands.hrl").
+ -include("ejabberd_sm.hrl").
+diff --git a/src/ejabberd_socket.erl b/src/ejabberd_socket.erl
+index 9953a76a..0dd1c4ff 100644
+--- a/src/ejabberd_socket.erl
++++ b/src/ejabberd_socket.erl
+@@ -52,7 +52,7 @@
+ 	 sockname/1, peername/1]).
+ 
+ -include("ejabberd.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("logger.hrl").
+ 
+ -type sockmod() :: ejabberd_bosh |
+diff --git a/src/ejabberd_system_monitor.erl b/src/ejabberd_system_monitor.erl
+index 773104f9..46e641b7 100644
+--- a/src/ejabberd_system_monitor.erl
++++ b/src/ejabberd_system_monitor.erl
+@@ -41,7 +41,7 @@
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -record(state, {}).
+ 
+diff --git a/src/ejabberd_web.erl b/src/ejabberd_web.erl
+index 7a40d2c7..aa1abc9b 100644
+--- a/src/ejabberd_web.erl
++++ b/src/ejabberd_web.erl
+@@ -34,7 +34,7 @@
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -include("ejabberd_http.hrl").
+ 
+diff --git a/src/ejabberd_web_admin.erl b/src/ejabberd_web_admin.erl
+index b3d72c19..cdd951b6 100644
+--- a/src/ejabberd_web_admin.erl
++++ b/src/ejabberd_web_admin.erl
+@@ -38,7 +38,7 @@
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -include("ejabberd_http.hrl").
+ 
+diff --git a/src/ejabberd_websocket.erl b/src/ejabberd_websocket.erl
+index 9926c20c..fabf2293 100644
+--- a/src/ejabberd_websocket.erl
++++ b/src/ejabberd_websocket.erl
+@@ -47,7 +47,7 @@
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -include("ejabberd_http.hrl").
+ 
+diff --git a/src/ejabberd_xmlrpc.erl b/src/ejabberd_xmlrpc.erl
+index 213aef7a..f5b51894 100644
+--- a/src/ejabberd_xmlrpc.erl
++++ b/src/ejabberd_xmlrpc.erl
+@@ -42,7 +42,7 @@
+ -include("ejabberd_http.hrl").
+ -include("mod_roster.hrl").
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -record(state,
+ 	{access_commands = [] :: list(),
+diff --git a/src/gen_iq_handler.erl b/src/gen_iq_handler.erl
+index d34db358..ab04a252 100644
+--- a/src/gen_iq_handler.erl
++++ b/src/gen_iq_handler.erl
+@@ -45,7 +45,7 @@
+ 
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -record(state, {host, module, function}).
+ 
+diff --git a/src/gen_pubsub_node.erl b/src/gen_pubsub_node.erl
+index 4f516bd5..83de80a8 100644
+--- a/src/gen_pubsub_node.erl
++++ b/src/gen_pubsub_node.erl
+@@ -25,7 +25,7 @@
+ 
+ -module(gen_pubsub_node).
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -type(host() :: mod_pubsub:host()).
+ -type(nodeId() :: mod_pubsub:nodeId()).
+diff --git a/src/gen_pubsub_nodetree.erl b/src/gen_pubsub_nodetree.erl
+index bf7140aa..4267b9a1 100644
+--- a/src/gen_pubsub_nodetree.erl
++++ b/src/gen_pubsub_nodetree.erl
+@@ -36,7 +36,7 @@
+ 	ServerHost :: binary(),
+ 	Opts :: [any()]) -> atom().
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -callback terminate(Host :: host(), ServerHost :: binary()) -> atom().
+ 
+diff --git a/src/jd2ejd.erl b/src/jd2ejd.erl
+index ae293698..bbe9bc6d 100644
+--- a/src/jd2ejd.erl
++++ b/src/jd2ejd.erl
+@@ -32,7 +32,7 @@
+ 
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ %%%----------------------------------------------------------------------
+ %%% API
+diff --git a/src/mod_adhoc.erl b/src/mod_adhoc.erl
+index e6df3904..0f3ada11 100644
+--- a/src/mod_adhoc.erl
++++ b/src/mod_adhoc.erl
+@@ -39,7 +39,7 @@
+ 
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ start(Host, Opts) ->
+     IQDisc = gen_mod:get_opt(iqdisc, Opts, gen_iq_handler:iqdisc(Host)),
+diff --git a/src/mod_admin_extra.erl b/src/mod_admin_extra.erl
+index 799f0079..9fd8531b 100644
+--- a/src/mod_admin_extra.erl
++++ b/src/mod_admin_extra.erl
+@@ -84,7 +84,7 @@
+ -include("mod_roster.hrl").
+ -include("mod_privacy.hrl").
+ -include("ejabberd_sm.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ %%%
+ %%% gen_mod
+diff --git a/src/mod_admin_update_sql.erl b/src/mod_admin_update_sql.erl
+index 2f105d97..cace1b94 100644
+--- a/src/mod_admin_update_sql.erl
++++ b/src/mod_admin_update_sql.erl
+@@ -38,7 +38,7 @@
+ -include("logger.hrl").
+ -include("ejabberd.hrl").
+ -include("ejabberd_commands.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("ejabberd_sql_pt.hrl").
+ 
+ %%%
+diff --git a/src/mod_announce.erl b/src/mod_announce.erl
+index b259aced..146b6a35 100644
+--- a/src/mod_announce.erl
++++ b/src/mod_announce.erl
+@@ -52,7 +52,7 @@
+ 
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_announce.hrl").
+ 
+ -callback init(binary(), gen_mod:opts()) -> any().
+diff --git a/src/mod_announce_mnesia.erl b/src/mod_announce_mnesia.erl
+index f2e5c1c4..cecd68cc 100644
+--- a/src/mod_announce_mnesia.erl
++++ b/src/mod_announce_mnesia.erl
+@@ -31,7 +31,7 @@
+ 	 get_motd/1, is_motd_user/2, set_motd_user/2, import/3]).
+ -export([need_transform/1, transform/1]).
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_announce.hrl").
+ -include("logger.hrl").
+ 
+diff --git a/src/mod_announce_riak.erl b/src/mod_announce_riak.erl
+index 04a29a68..a3dac3e9 100644
+--- a/src/mod_announce_riak.erl
++++ b/src/mod_announce_riak.erl
+@@ -30,7 +30,7 @@
+ -export([init/2, set_motd_users/2, set_motd/2, delete_motd/1,
+ 	 get_motd/1, is_motd_user/2, set_motd_user/2, import/3]).
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_announce.hrl").
+ 
+ %%%===================================================================
+diff --git a/src/mod_announce_sql.erl b/src/mod_announce_sql.erl
+index c5c9eb58..b243d05d 100644
+--- a/src/mod_announce_sql.erl
++++ b/src/mod_announce_sql.erl
+@@ -33,7 +33,7 @@
+ 	 get_motd/1, is_motd_user/2, set_motd_user/2, import/3,
+ 	 export/1]).
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_announce.hrl").
+ -include("ejabberd_sql_pt.hrl").
+ -include("logger.hrl").
+diff --git a/src/mod_avatar.erl b/src/mod_avatar.erl
+index dde58abf..ffc31c94 100644
+--- a/src/mod_avatar.erl
++++ b/src/mod_avatar.erl
+@@ -28,7 +28,7 @@
+ %% Hooks
+ -export([pubsub_publish_item/6, vcard_iq_convert/1, vcard_iq_publish/1]).
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("logger.hrl").
+ -include("pubsub.hrl").
+ 
+diff --git a/src/mod_block_strangers.erl b/src/mod_block_strangers.erl
+index b2c56f36..429c0ab2 100644
+--- a/src/mod_block_strangers.erl
++++ b/src/mod_block_strangers.erl
+@@ -34,7 +34,7 @@
+ 
+ -export([filter_packet/1, filter_offline_msg/1]).
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+ 
+diff --git a/src/mod_blocking.erl b/src/mod_blocking.erl
+index 738c5e16..479b34ea 100644
+--- a/src/mod_blocking.erl
++++ b/src/mod_blocking.erl
+@@ -35,7 +35,7 @@
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -include("mod_privacy.hrl").
+ 
+diff --git a/src/mod_bosh.erl b/src/mod_bosh.erl
+index 6ee58047..e49ab960 100644
+--- a/src/mod_bosh.erl
++++ b/src/mod_bosh.erl
+@@ -41,7 +41,7 @@
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+ -include_lib("stdlib/include/ms_transform.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("ejabberd_http.hrl").
+ -include("bosh.hrl").
+ 
+diff --git a/src/mod_caps.erl b/src/mod_caps.erl
+index edc93bbf..6ead4230 100644
+--- a/src/mod_caps.erl
++++ b/src/mod_caps.erl
+@@ -53,7 +53,7 @@
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_caps.hrl").
+ 
+ -define(BAD_HASH_LIFETIME, 600).
+diff --git a/src/mod_carboncopy.erl b/src/mod_carboncopy.erl
+index 307d6154..c3a998d8 100644
+--- a/src/mod_carboncopy.erl
++++ b/src/mod_carboncopy.erl
+@@ -40,7 +40,7 @@
+ 
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_carboncopy.hrl").
+ 
+ -type direction() :: sent | received.
+diff --git a/src/mod_client_state.erl b/src/mod_client_state.erl
+index f7adb1c6..09507b73 100644
+--- a/src/mod_client_state.erl
++++ b/src/mod_client_state.erl
+@@ -42,7 +42,7 @@
+ 
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -define(CSI_QUEUE_MAX, 100).
+ 
+diff --git a/src/mod_configure.erl b/src/mod_configure.erl
+index 31f7a9c8..6ea5bd37 100644
+--- a/src/mod_configure.erl
++++ b/src/mod_configure.erl
+@@ -40,7 +40,7 @@
+ 
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("ejabberd_sm.hrl").
+ -include_lib("stdlib/include/ms_transform.hrl").
+ 
+diff --git a/src/mod_delegation.erl b/src/mod_delegation.erl
+index 27e00768..c93912d6 100644
+--- a/src/mod_delegation.erl
++++ b/src/mod_delegation.erl
+@@ -42,7 +42,7 @@
+ 
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -type disco_acc() :: {error, stanza_error()} | {result, [binary()]} | empty.
+ -record(state, {server_host = <<"">> :: binary(),
+diff --git a/src/mod_disco.erl b/src/mod_disco.erl
+index 76be408f..5bea1fb7 100644
+--- a/src/mod_disco.erl
++++ b/src/mod_disco.erl
+@@ -42,7 +42,7 @@
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include_lib("stdlib/include/ms_transform.hrl").
+ -include("mod_roster.hrl").
+ 
+diff --git a/src/mod_echo.erl b/src/mod_echo.erl
+index 79dd5996..38199d3c 100644
+--- a/src/mod_echo.erl
++++ b/src/mod_echo.erl
+@@ -41,7 +41,7 @@
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -record(state, {hosts = [] :: [binary()]}).
+ 
+diff --git a/src/mod_fail2ban.erl b/src/mod_fail2ban.erl
+index 5e931853..01bdfe2f 100644
+--- a/src/mod_fail2ban.erl
++++ b/src/mod_fail2ban.erl
+@@ -39,7 +39,7 @@
+ -include_lib("stdlib/include/ms_transform.hrl").
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -define(C2S_AUTH_BAN_LIFETIME, 3600). %% 1 hour
+ -define(C2S_MAX_AUTH_FAILURES, 20).
+diff --git a/src/mod_http_api.erl b/src/mod_http_api.erl
+index ef881d14..f7cd10bf 100644
+--- a/src/mod_http_api.erl
++++ b/src/mod_http_api.erl
+@@ -77,7 +77,7 @@
+ -export([start/2, stop/1, reload/3, process/2, mod_opt_type/1, depends/2]).
+ 
+ -include("ejabberd.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("logger.hrl").
+ -include("ejabberd_http.hrl").
+ 
+diff --git a/src/mod_http_upload.erl b/src/mod_http_upload.erl
+index c3c295f6..d3bd4e84 100644
+--- a/src/mod_http_upload.erl
++++ b/src/mod_http_upload.erl
+@@ -89,7 +89,7 @@
+ 
+ -include("ejabberd.hrl").
+ -include("ejabberd_http.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("logger.hrl").
+ 
+ -record(state,
+diff --git a/src/mod_http_upload_quota.erl b/src/mod_http_upload_quota.erl
+index 10243ac0..cda5c563 100644
+--- a/src/mod_http_upload_quota.erl
++++ b/src/mod_http_upload_quota.erl
+@@ -50,7 +50,7 @@
+ %% ejabberd_hooks callback.
+ -export([handle_slot_request/5]).
+ 
+--include("jid.hrl").
++-include_lib("p1_xmpp/include/jid.hrl").
+ -include("logger.hrl").
+ -include_lib("kernel/include/file.hrl").
+ 
+diff --git a/src/mod_irc.erl b/src/mod_irc.erl
+index 92093507..9b9becc8 100644
+--- a/src/mod_irc.erl
++++ b/src/mod_irc.erl
+@@ -43,7 +43,7 @@
+ 
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_irc.hrl").
+ 
+ -define(DEFAULT_IRC_ENCODING, <<"iso8859-15">>).
+diff --git a/src/mod_irc_connection.erl b/src/mod_irc_connection.erl
+index 59336591..ca81358f 100644
+--- a/src/mod_irc_connection.erl
++++ b/src/mod_irc_connection.erl
+@@ -41,7 +41,7 @@
+ 
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -define(SETS, gb_sets).
+ 
+diff --git a/src/mod_irc_mnesia.erl b/src/mod_irc_mnesia.erl
+index eb982e1f..510ce09d 100644
+--- a/src/mod_irc_mnesia.erl
++++ b/src/mod_irc_mnesia.erl
+@@ -30,7 +30,7 @@
+ -export([init/2, get_data/3, set_data/4, import/2]).
+ -export([need_transform/1, transform/1]).
+ 
+--include("jid.hrl").
++-include_lib("p1_xmpp/include/jid.hrl").
+ -include("mod_irc.hrl").
+ -include("logger.hrl").
+ 
+diff --git a/src/mod_irc_riak.erl b/src/mod_irc_riak.erl
+index 23f2a2c3..d236bfa7 100644
+--- a/src/mod_irc_riak.erl
++++ b/src/mod_irc_riak.erl
+@@ -29,7 +29,7 @@
+ %% API
+ -export([init/2, get_data/3, set_data/4, import/2]).
+ 
+--include("jid.hrl").
++-include_lib("p1_xmpp/include/jid.hrl").
+ -include("mod_irc.hrl").
+ 
+ %%%===================================================================
+diff --git a/src/mod_irc_sql.erl b/src/mod_irc_sql.erl
+index 1f8d7d16..5f784fdc 100644
+--- a/src/mod_irc_sql.erl
++++ b/src/mod_irc_sql.erl
+@@ -31,7 +31,7 @@
+ %% API
+ -export([init/2, get_data/3, set_data/4, import/1, import/2, export/1]).
+ 
+--include("jid.hrl").
++-include_lib("p1_xmpp/include/jid.hrl").
+ -include("mod_irc.hrl").
+ -include("ejabberd_sql_pt.hrl").
+ 
+diff --git a/src/mod_last.erl b/src/mod_last.erl
+index e97ef43f..34498e26 100644
+--- a/src/mod_last.erl
++++ b/src/mod_last.erl
+@@ -40,7 +40,7 @@
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -include("mod_privacy.hrl").
+ -include("mod_last.hrl").
+diff --git a/src/mod_legacy_auth.erl b/src/mod_legacy_auth.erl
+index 722a0573..c6644386 100644
+--- a/src/mod_legacy_auth.erl
++++ b/src/mod_legacy_auth.erl
+@@ -29,7 +29,7 @@
+ %% hooks
+ -export([c2s_unauthenticated_packet/2, c2s_stream_features/2]).
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -type c2s_state() :: ejabberd_c2s:state().
+ 
+diff --git a/src/mod_mam.erl b/src/mod_mam.erl
+index eb839ea1..abc461db 100644
+--- a/src/mod_mam.erl
++++ b/src/mod_mam.erl
+@@ -41,7 +41,7 @@
+ 	 delete_old_messages/2, get_commands_spec/0, msg_to_el/4,
+ 	 get_room_config/4, set_room_option/3, offline_message/1, export/1]).
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("logger.hrl").
+ -include("mod_muc_room.hrl").
+ -include("ejabberd_commands.hrl").
+diff --git a/src/mod_mam_mnesia.erl b/src/mod_mam_mnesia.erl
+index 71f1f701..a3a7eb5f 100644
+--- a/src/mod_mam_mnesia.erl
++++ b/src/mod_mam_mnesia.erl
+@@ -31,7 +31,7 @@
+ 	 extended_fields/0, store/8, write_prefs/4, get_prefs/2, select/6]).
+ 
+ -include_lib("stdlib/include/ms_transform.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("logger.hrl").
+ -include("mod_mam.hrl").
+ 
+diff --git a/src/mod_mam_sql.erl b/src/mod_mam_sql.erl
+index 40aa9836..b4fab39b 100644
+--- a/src/mod_mam_sql.erl
++++ b/src/mod_mam_sql.erl
+@@ -33,7 +33,7 @@
+ 	 extended_fields/0, store/8, write_prefs/4, get_prefs/2, select/6, export/1]).
+ 
+ -include_lib("stdlib/include/ms_transform.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_mam.hrl").
+ -include("logger.hrl").
+ -include("ejabberd_sql_pt.hrl").
+diff --git a/src/mod_metrics.erl b/src/mod_metrics.erl
+index 73a68a8d..1b0d2e1b 100644
+--- a/src/mod_metrics.erl
++++ b/src/mod_metrics.erl
+@@ -30,7 +30,7 @@
+ 
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -export([start/2, stop/1, mod_opt_type/1, depends/2, reload/3]).
+ 
+diff --git a/src/mod_mix.erl b/src/mod_mix.erl
+index 90507665..627363f3 100644
+--- a/src/mod_mix.erl
++++ b/src/mod_mix.erl
+@@ -37,7 +37,7 @@
+ 	 terminate/2, code_change/3]).
+ 
+ -include("logger.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -define(NODES, [?NS_MIX_NODES_MESSAGES,
+ 		?NS_MIX_NODES_PRESENCE,
+diff --git a/src/mod_muc.erl b/src/mod_muc.erl
+index f7d5303f..f01cde16 100644
+--- a/src/mod_muc.erl
++++ b/src/mod_muc.erl
+@@ -73,7 +73,7 @@
+ 
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_muc.hrl").
+ 
+ -record(state,
+diff --git a/src/mod_muc_admin.erl b/src/mod_muc_admin.erl
+index e41f62b5..4d18d068 100644
+--- a/src/mod_muc_admin.erl
++++ b/src/mod_muc_admin.erl
+@@ -43,7 +43,7 @@
+ 
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_muc.hrl").
+ -include("mod_muc_room.hrl").
+ -include("ejabberd_http.hrl").
+diff --git a/src/mod_muc_log.erl b/src/mod_muc_log.erl
+index f2685aaa..abb55c42 100644
+--- a/src/mod_muc_log.erl
++++ b/src/mod_muc_log.erl
+@@ -44,7 +44,7 @@
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_muc_room.hrl").
+ 
+ -define(T(Text), translate:translate(Lang, Text)).
+diff --git a/src/mod_muc_mnesia.erl b/src/mod_muc_mnesia.erl
+index aa59038c..7334aca4 100644
+--- a/src/mod_muc_mnesia.erl
++++ b/src/mod_muc_mnesia.erl
+@@ -44,7 +44,7 @@
+ 
+ -include("mod_muc.hrl").
+ -include("logger.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include_lib("stdlib/include/ms_transform.hrl").
+ 
+ -record(state, {}).
+diff --git a/src/mod_muc_riak.erl b/src/mod_muc_riak.erl
+index 57d9666b..4ebd2949 100644
+--- a/src/mod_muc_riak.erl
++++ b/src/mod_muc_riak.erl
+@@ -38,7 +38,7 @@
+ -export([set_affiliation/6, set_affiliations/4, get_affiliation/5,
+ 	 get_affiliations/3, search_affiliation/4]).
+ 
+--include("jid.hrl").
++-include_lib("p1_xmpp/include/jid.hrl").
+ -include("mod_muc.hrl").
+ 
+ %%%===================================================================
+diff --git a/src/mod_muc_room.erl b/src/mod_muc_room.erl
+index bafa938d..d8b5e288 100644
+--- a/src/mod_muc_room.erl
++++ b/src/mod_muc_room.erl
+@@ -51,7 +51,7 @@
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -include("mod_muc_room.hrl").
+ 
+diff --git a/src/mod_muc_sql.erl b/src/mod_muc_sql.erl
+index 8aa6071c..71d79b02 100644
+--- a/src/mod_muc_sql.erl
++++ b/src/mod_muc_sql.erl
+@@ -41,7 +41,7 @@
+ -export([set_affiliation/6, set_affiliations/4, get_affiliation/5,
+ 	 get_affiliations/3, search_affiliation/4]).
+ 
+--include("jid.hrl").
++-include_lib("p1_xmpp/include/jid.hrl").
+ -include("mod_muc.hrl").
+ -include("logger.hrl").
+ -include("ejabberd_sql_pt.hrl").
+diff --git a/src/mod_multicast.erl b/src/mod_multicast.erl
+index 7b772521..7c1cab3b 100644
+--- a/src/mod_multicast.erl
++++ b/src/mod_multicast.erl
+@@ -45,7 +45,7 @@
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -record(state,
+ 	{lserver, lservice, access, service_limits}).
+diff --git a/src/mod_offline.erl b/src/mod_offline.erl
+index 5b95fe4b..8146ffdc 100644
+--- a/src/mod_offline.erl
++++ b/src/mod_offline.erl
+@@ -70,7 +70,7 @@
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -include("ejabberd_http.hrl").
+ 
+diff --git a/src/mod_offline_mnesia.erl b/src/mod_offline_mnesia.erl
+index a725ab00..126fd1bb 100644
+--- a/src/mod_offline_mnesia.erl
++++ b/src/mod_offline_mnesia.erl
+@@ -32,7 +32,7 @@
+ 	 remove_all_messages/2, count_messages/2, import/1]).
+ -export([need_transform/1, transform/1]).
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_offline.hrl").
+ -include("logger.hrl").
+ 
+diff --git a/src/mod_offline_riak.erl b/src/mod_offline_riak.erl
+index 5d0fd1af..607a78ba 100644
+--- a/src/mod_offline_riak.erl
++++ b/src/mod_offline_riak.erl
+@@ -31,7 +31,7 @@
+ 	 read_message/3, remove_message/3, read_all_messages/2,
+ 	 remove_all_messages/2, count_messages/2, import/1]).
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_offline.hrl").
+ 
+ %%%===================================================================
+diff --git a/src/mod_offline_sql.erl b/src/mod_offline_sql.erl
+index 53a0d345..50fa83bc 100644
+--- a/src/mod_offline_sql.erl
++++ b/src/mod_offline_sql.erl
+@@ -33,7 +33,7 @@
+ 	 read_message/3, remove_message/3, read_all_messages/2,
+ 	 remove_all_messages/2, count_messages/2, import/1, export/1]).
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_offline.hrl").
+ -include("logger.hrl").
+ -include("ejabberd_sql_pt.hrl").
+diff --git a/src/mod_ping.erl b/src/mod_ping.erl
+index 02357181..7d51f4dc 100644
+--- a/src/mod_ping.erl
++++ b/src/mod_ping.erl
+@@ -36,7 +36,7 @@
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -define(DEFAULT_SEND_PINGS, false).
+ 
+diff --git a/src/mod_pres_counter.erl b/src/mod_pres_counter.erl
+index 875aeef3..ffa95576 100644
+--- a/src/mod_pres_counter.erl
++++ b/src/mod_pres_counter.erl
+@@ -33,7 +33,7 @@
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -record(pres_counter,
+ 	{dir, start, count, logged = false}).
+diff --git a/src/mod_privacy.erl b/src/mod_privacy.erl
+index 64ae9620..034a56e4 100644
+--- a/src/mod_privacy.erl
++++ b/src/mod_privacy.erl
+@@ -42,7 +42,7 @@
+ 
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_privacy.hrl").
+ 
+ -define(PRIVACY_CACHE, privacy_cache).
+diff --git a/src/mod_privacy_mnesia.erl b/src/mod_privacy_mnesia.erl
+index 7449262b..201b92ec 100644
+--- a/src/mod_privacy_mnesia.erl
++++ b/src/mod_privacy_mnesia.erl
+@@ -32,7 +32,7 @@
+ 	 remove_list/3, use_cache/1, import/1]).
+ -export([need_transform/1, transform/1]).
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_privacy.hrl").
+ -include("logger.hrl").
+ 
+diff --git a/src/mod_privacy_riak.erl b/src/mod_privacy_riak.erl
+index 0cd39c11..88f294f8 100644
+--- a/src/mod_privacy_riak.erl
++++ b/src/mod_privacy_riak.erl
+@@ -33,7 +33,7 @@
+ 
+ -export([privacy_schema/0]).
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_privacy.hrl").
+ 
+ %%%===================================================================
+diff --git a/src/mod_privacy_sql.erl b/src/mod_privacy_sql.erl
+index 7939cbb2..6141feda 100644
+--- a/src/mod_privacy_sql.erl
++++ b/src/mod_privacy_sql.erl
+@@ -35,7 +35,7 @@
+ 
+ -export([item_to_raw/1, raw_to_item/1]).
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_privacy.hrl").
+ -include("logger.hrl").
+ -include("ejabberd_sql_pt.hrl").
+diff --git a/src/mod_private.erl b/src/mod_private.erl
+index cb167468..0b84d071 100644
+--- a/src/mod_private.erl
++++ b/src/mod_private.erl
+@@ -37,7 +37,7 @@
+ 
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_private.hrl").
+ 
+ -define(PRIVATE_CACHE, private_cache).
+diff --git a/src/mod_private_mnesia.erl b/src/mod_private_mnesia.erl
+index 04c1a04a..6a9dee68 100644
+--- a/src/mod_private_mnesia.erl
++++ b/src/mod_private_mnesia.erl
+@@ -31,7 +31,7 @@
+ 	 use_cache/1, import/3]).
+ -export([need_transform/1, transform/1]).
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_private.hrl").
+ -include("logger.hrl").
+ 
+diff --git a/src/mod_private_riak.erl b/src/mod_private_riak.erl
+index be175f07..f97c2dd8 100644
+--- a/src/mod_private_riak.erl
++++ b/src/mod_private_riak.erl
+@@ -30,7 +30,7 @@
+ -export([init/2, set_data/3, get_data/3, get_all_data/2, del_data/2,
+ 	 import/3]).
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_private.hrl").
+ 
+ %%%===================================================================
+diff --git a/src/mod_private_sql.erl b/src/mod_private_sql.erl
+index 5ed584c3..da4974ce 100644
+--- a/src/mod_private_sql.erl
++++ b/src/mod_private_sql.erl
+@@ -30,7 +30,7 @@
+ -export([init/2, set_data/3, get_data/3, get_all_data/2, del_data/2,
+ 	 import/3, export/1]).
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_private.hrl").
+ -include("ejabberd_sql_pt.hrl").
+ -include("logger.hrl").
+diff --git a/src/mod_privilege.erl b/src/mod_privilege.erl
+index dab7a619..695c8acf 100644
+--- a/src/mod_privilege.erl
++++ b/src/mod_privilege.erl
+@@ -41,7 +41,7 @@
+ 
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -record(state, {server_host = <<"">> :: binary(),
+ 		permissions = dict:new() :: ?TDICT}).
+diff --git a/src/mod_proxy65_service.erl b/src/mod_proxy65_service.erl
+index fb34ba55..f42aa461 100644
+--- a/src/mod_proxy65_service.erl
++++ b/src/mod_proxy65_service.erl
+@@ -39,7 +39,7 @@
+ 
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -define(PROCNAME, ejabberd_mod_proxy65_service).
+ 
+diff --git a/src/mod_pubsub.erl b/src/mod_pubsub.erl
+index d2e1f6c5..b7cd6644 100644
+--- a/src/mod_pubsub.erl
++++ b/src/mod_pubsub.erl
+@@ -41,7 +41,7 @@
+ 
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("pubsub.hrl").
+ -include("mod_roster.hrl").
+ 
+diff --git a/src/mod_push.erl b/src/mod_push.erl
+index 1eaec6ad..ac4ed89e 100644
+--- a/src/mod_push.erl
++++ b/src/mod_push.erl
+@@ -52,7 +52,7 @@
+ -include("ejabberd.hrl").
+ -include("ejabberd_commands.hrl").
+ -include("logger.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -define(PUSH_CACHE, push_cache).
+ 
+diff --git a/src/mod_push_keepalive.erl b/src/mod_push_keepalive.erl
+index bcdc0c25..d979eaec 100644
+--- a/src/mod_push_keepalive.erl
++++ b/src/mod_push_keepalive.erl
+@@ -36,7 +36,7 @@
+ 	 c2s_handle_cast/2, c2s_handle_info/2, c2s_stanza/3]).
+ 
+ -include("logger.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -define(PUSH_BEFORE_TIMEOUT_SECS, 120).
+ 
+diff --git a/src/mod_push_mnesia.erl b/src/mod_push_mnesia.erl
+index ff12150f..866b5630 100644
+--- a/src/mod_push_mnesia.erl
++++ b/src/mod_push_mnesia.erl
+@@ -35,7 +35,7 @@
+ 
+ -include_lib("stdlib/include/ms_transform.hrl").
+ -include("logger.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_push.hrl").
+ 
+ %%%-------------------------------------------------------------------
+diff --git a/src/mod_push_sql.erl b/src/mod_push_sql.erl
+index c82d9fc0..79fedba4 100644
+--- a/src/mod_push_sql.erl
++++ b/src/mod_push_sql.erl
+@@ -32,7 +32,7 @@
+ 	 lookup_sessions/3, lookup_sessions/2, lookup_sessions/1,
+ 	 delete_session/3, delete_old_sessions/2, export/1]).
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("logger.hrl").
+ -include("ejabberd_sql_pt.hrl").
+ -include("mod_push.hrl").
+diff --git a/src/mod_register.erl b/src/mod_register.erl
+index 77557ee0..8ad27fcf 100644
+--- a/src/mod_register.erl
++++ b/src/mod_register.erl
+@@ -41,7 +41,7 @@
+ 
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ start(Host, Opts) ->
+     IQDisc = gen_mod:get_opt(iqdisc, Opts, gen_iq_handler:iqdisc(Host)),
+diff --git a/src/mod_register_web.erl b/src/mod_register_web.erl
+index b7bc2edc..a7bb83f5 100644
+--- a/src/mod_register_web.erl
++++ b/src/mod_register_web.erl
+@@ -60,7 +60,7 @@
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -include("ejabberd_http.hrl").
+ 
+diff --git a/src/mod_roster.erl b/src/mod_roster.erl
+index a86b50d9..57f5fdce 100644
+--- a/src/mod_roster.erl
++++ b/src/mod_roster.erl
+@@ -54,7 +54,7 @@
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -include("mod_roster.hrl").
+ 
+diff --git a/src/mod_s2s_dialback.erl b/src/mod_s2s_dialback.erl
+index b4c2ed9d..645ab37f 100644
+--- a/src/mod_s2s_dialback.erl
++++ b/src/mod_s2s_dialback.erl
+@@ -33,7 +33,7 @@
+ 	 s2s_in_features/2, s2s_out_init/2, s2s_out_closed/2]).
+ 
+ -include("ejabberd.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("logger.hrl").
+ 
+ %%%===================================================================
+diff --git a/src/mod_service_log.erl b/src/mod_service_log.erl
+index 1c6e5fe8..c295aa45 100644
+--- a/src/mod_service_log.erl
++++ b/src/mod_service_log.erl
+@@ -35,7 +35,7 @@
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ start(Host, _Opts) ->
+     ejabberd_hooks:add(user_send_packet, Host, ?MODULE,
+diff --git a/src/mod_shared_roster.erl b/src/mod_shared_roster.erl
+index 5f95266b..db641dbb 100644
+--- a/src/mod_shared_roster.erl
++++ b/src/mod_shared_roster.erl
+@@ -44,7 +44,7 @@
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -include("mod_roster.hrl").
+ 
+diff --git a/src/mod_shared_roster_ldap.erl b/src/mod_shared_roster_ldap.erl
+index 66cbebd9..4b431fc4 100644
+--- a/src/mod_shared_roster_ldap.erl
++++ b/src/mod_shared_roster_ldap.erl
+@@ -46,7 +46,7 @@
+ 
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_roster.hrl").
+ -include("eldap.hrl").
+ 
+diff --git a/src/mod_shared_roster_mnesia.erl b/src/mod_shared_roster_mnesia.erl
+index adfbac68..bdd87030 100644
+--- a/src/mod_shared_roster_mnesia.erl
++++ b/src/mod_shared_roster_mnesia.erl
+@@ -37,7 +37,7 @@
+ -include("mod_roster.hrl").
+ -include("mod_shared_roster.hrl").
+ -include("logger.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ %%%===================================================================
+ %%% API
+diff --git a/src/mod_shared_roster_riak.erl b/src/mod_shared_roster_riak.erl
+index 441aafd0..d5545eb1 100644
+--- a/src/mod_shared_roster_riak.erl
++++ b/src/mod_shared_roster_riak.erl
+@@ -35,7 +35,7 @@
+ 
+ -include("mod_roster.hrl").
+ -include("mod_shared_roster.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ %%%===================================================================
+ %%% API
+diff --git a/src/mod_shared_roster_sql.erl b/src/mod_shared_roster_sql.erl
+index 488e0ec7..f952347a 100644
+--- a/src/mod_shared_roster_sql.erl
++++ b/src/mod_shared_roster_sql.erl
+@@ -36,7 +36,7 @@
+ 	 add_user_to_group/3, remove_user_from_group/3, import/3,
+ 	 export/1]).
+ 
+--include("jid.hrl").
++-include_lib("p1_xmpp/include/jid.hrl").
+ -include("mod_roster.hrl").
+ -include("mod_shared_roster.hrl").
+ -include("ejabberd_sql_pt.hrl").
+diff --git a/src/mod_sic.erl b/src/mod_sic.erl
+index a2b3256e..da61b2c2 100644
+--- a/src/mod_sic.erl
++++ b/src/mod_sic.erl
+@@ -36,7 +36,7 @@
+ 
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ start(Host, Opts) ->
+     IQDisc = gen_mod:get_opt(iqdisc, Opts, gen_iq_handler:iqdisc(Host)),
+diff --git a/src/mod_sip.erl b/src/mod_sip.erl
+index 01327c77..70159d17 100644
+--- a/src/mod_sip.erl
++++ b/src/mod_sip.erl
+@@ -52,7 +52,7 @@ mod_opt_type(_) ->
+ 	 locate/1, mod_opt_type/1, depends/2]).
+ 
+ -include("ejabberd.hrl").
+--include_lib("esip/include/esip.hrl").
++-include_lib("s1_sip/include/esip.hrl").
+ 
+ %%%===================================================================
+ %%% API
+diff --git a/src/mod_sip_proxy.erl b/src/mod_sip_proxy.erl
+index d600da3d..c3dfe874 100644
+--- a/src/mod_sip_proxy.erl
++++ b/src/mod_sip_proxy.erl
+@@ -40,7 +40,7 @@
+ 
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+--include_lib("esip/include/esip.hrl").
++-include_lib("s1_sip/include/esip.hrl").
+ 
+ -define(SIGN_LIFETIME, 300). %% in seconds.
+ 
+diff --git a/src/mod_sip_registrar.erl b/src/mod_sip_registrar.erl
+index a47de697..f89d3cab 100644
+--- a/src/mod_sip_registrar.erl
++++ b/src/mod_sip_registrar.erl
+@@ -42,7 +42,7 @@
+ 
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+--include_lib("esip/include/esip.hrl").
++-include_lib("s1_sip/include/esip.hrl").
+ 
+ -define(CALL_TIMEOUT, timer:seconds(30)).
+ -define(DEFAULT_EXPIRES, 3600).
+diff --git a/src/mod_stats.erl b/src/mod_stats.erl
+index 2bdbdbd3..2969fbd2 100644
+--- a/src/mod_stats.erl
++++ b/src/mod_stats.erl
+@@ -35,7 +35,7 @@
+ 
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ start(Host, Opts) ->
+     IQDisc = gen_mod:get_opt(iqdisc, Opts, gen_iq_handler:iqdisc(Host)),
+diff --git a/src/mod_stream_mgmt.erl b/src/mod_stream_mgmt.erl
+index 658bd504..46b00993 100644
+--- a/src/mod_stream_mgmt.erl
++++ b/src/mod_stream_mgmt.erl
+@@ -37,7 +37,7 @@
+ -export([get_resume_timeout/1, set_resume_timeout/2]).
+ 
+ -include("ejabberd.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("logger.hrl").
+ -include("p1_queue.hrl").
+ 
+diff --git a/src/mod_time.erl b/src/mod_time.erl
+index c54f3d27..20321d36 100644
+--- a/src/mod_time.erl
++++ b/src/mod_time.erl
+@@ -38,7 +38,7 @@
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ start(Host, Opts) ->
+     IQDisc = gen_mod:get_opt(iqdisc, Opts, gen_iq_handler:iqdisc(Host)),
+diff --git a/src/mod_vcard.erl b/src/mod_vcard.erl
+index 378b9430..10618c96 100644
+--- a/src/mod_vcard.erl
++++ b/src/mod_vcard.erl
+@@ -44,7 +44,7 @@
+ 
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_vcard.hrl").
+ 
+ -define(JUD_MATCHES, 30).
+diff --git a/src/mod_vcard_ldap.erl b/src/mod_vcard_ldap.erl
+index 88621fc0..e2c741c5 100644
+--- a/src/mod_vcard_ldap.erl
++++ b/src/mod_vcard_ldap.erl
+@@ -41,7 +41,7 @@
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+ -include("eldap.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("translate.hrl").
+ 
+ -define(PROCNAME, ejabberd_mod_vcard_ldap).
+diff --git a/src/mod_vcard_mnesia.erl b/src/mod_vcard_mnesia.erl
+index 3e742ec1..6e9e0e50 100644
+--- a/src/mod_vcard_mnesia.erl
++++ b/src/mod_vcard_mnesia.erl
+@@ -33,7 +33,7 @@
+ -export([need_transform/1, transform/1]).
+ 
+ -include("ejabberd.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_vcard.hrl").
+ -include("logger.hrl").
+ -include("translate.hrl").
+diff --git a/src/mod_vcard_riak.erl b/src/mod_vcard_riak.erl
+index e5ad1b3d..5427ec7f 100644
+--- a/src/mod_vcard_riak.erl
++++ b/src/mod_vcard_riak.erl
+@@ -31,7 +31,7 @@
+ 	 search_fields/1, search_reported/1, import/3, stop/1]).
+ -export([is_search_supported/1]).
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_vcard.hrl").
+ 
+ %%%===================================================================
+diff --git a/src/mod_vcard_sql.erl b/src/mod_vcard_sql.erl
+index 07d90b69..1dc5d40f 100644
+--- a/src/mod_vcard_sql.erl
++++ b/src/mod_vcard_sql.erl
+@@ -33,7 +33,7 @@
+ 	 search_fields/1, search_reported/1, import/3, export/1]).
+ -export([is_search_supported/1]).
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("mod_vcard.hrl").
+ -include("logger.hrl").
+ -include("ejabberd_sql_pt.hrl").
+diff --git a/src/mod_vcard_xupdate.erl b/src/mod_vcard_xupdate.erl
+index 7643fed4..19148654 100644
+--- a/src/mod_vcard_xupdate.erl
++++ b/src/mod_vcard_xupdate.erl
+@@ -35,7 +35,7 @@
+ 
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -define(VCARD_XUPDATE_CACHE, vcard_xupdate_cache).
+ 
+diff --git a/src/mod_version.erl b/src/mod_version.erl
+index 5f613e02..23ac02cd 100644
+--- a/src/mod_version.erl
++++ b/src/mod_version.erl
+@@ -37,7 +37,7 @@
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ start(Host, Opts) ->
+     IQDisc = gen_mod:get_opt(iqdisc, Opts, gen_iq_handler:iqdisc(Host)),
+diff --git a/src/node_dag.erl b/src/node_dag.erl
+index 9829c27c..5f399357 100644
+--- a/src/node_dag.erl
++++ b/src/node_dag.erl
+@@ -28,7 +28,7 @@
+ -author('bjc at kublai.com').
+ 
+ -include("pubsub.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -export([init/3, terminate/2, options/0, features/0,
+     create_node_permission/6, create_node/2, delete_node/1,
+diff --git a/src/node_dispatch.erl b/src/node_dispatch.erl
+index 92a655b8..00eb55d9 100644
+--- a/src/node_dispatch.erl
++++ b/src/node_dispatch.erl
+@@ -34,7 +34,7 @@
+ -author('christophe.romain at process-one.net').
+ 
+ -include("pubsub.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -export([init/3, terminate/2, options/0, features/0,
+     create_node_permission/6, create_node/2, delete_node/1,
+diff --git a/src/node_flat.erl b/src/node_flat.erl
+index bc529e14..571b1b16 100644
+--- a/src/node_flat.erl
++++ b/src/node_flat.erl
+@@ -34,7 +34,7 @@
+ -author('christophe.romain at process-one.net').
+ 
+ -include("pubsub.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -export([init/3, terminate/2, options/0, features/0,
+     create_node_permission/6, create_node/2, delete_node/1,
+diff --git a/src/node_flat_sql.erl b/src/node_flat_sql.erl
+index afbc050a..ae279c4c 100644
+--- a/src/node_flat_sql.erl
++++ b/src/node_flat_sql.erl
+@@ -36,7 +36,7 @@
+ -compile([{parse_transform, ejabberd_sql_pt}]).
+ 
+ -include("pubsub.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("ejabberd_sql_pt.hrl").
+ 
+ -export([init/3, terminate/2, options/0, features/0,
+diff --git a/src/node_online.erl b/src/node_online.erl
+index 39b08d99..ce71fdb0 100644
+--- a/src/node_online.erl
++++ b/src/node_online.erl
+@@ -28,7 +28,7 @@
+ -author('christophe.romain at process-one.net').
+ 
+ -include("pubsub.hrl").
+--include("jid.hrl").
++-include_lib("p1_xmpp/include/jid.hrl").
+ 
+ -export([init/3, terminate/2, options/0, features/0,
+     create_node_permission/6, create_node/2, delete_node/1,
+diff --git a/src/nodetree_dag.erl b/src/nodetree_dag.erl
+index a44e7155..0c5609c4 100644
+--- a/src/nodetree_dag.erl
++++ b/src/nodetree_dag.erl
+@@ -30,7 +30,7 @@
+ -include_lib("stdlib/include/qlc.hrl").
+ 
+ -include("pubsub.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -export([init/3, terminate/2, options/0, set_node/1,
+     get_node/3, get_node/2, get_node/1, get_nodes/2,
+diff --git a/src/nodetree_tree.erl b/src/nodetree_tree.erl
+index 31724036..0fe1f5e0 100644
+--- a/src/nodetree_tree.erl
++++ b/src/nodetree_tree.erl
+@@ -40,7 +40,7 @@
+ -include_lib("stdlib/include/qlc.hrl").
+ 
+ -include("pubsub.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -export([init/3, terminate/2, options/0, set_node/1,
+     get_node/3, get_node/2, get_node/1, get_nodes/2,
+diff --git a/src/nodetree_tree_sql.erl b/src/nodetree_tree_sql.erl
+index b310dd2d..19ff1786 100644
+--- a/src/nodetree_tree_sql.erl
++++ b/src/nodetree_tree_sql.erl
+@@ -40,7 +40,7 @@
+ -compile([{parse_transform, ejabberd_sql_pt}]).
+ 
+ -include("pubsub.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("ejabberd_sql_pt.hrl").
+ 
+ -export([init/3, terminate/2, options/0, set_node/1,
+diff --git a/src/prosody2ejabberd.erl b/src/prosody2ejabberd.erl
+index 2c7dabb4..b6ba864c 100644
+--- a/src/prosody2ejabberd.erl
++++ b/src/prosody2ejabberd.erl
+@@ -28,7 +28,7 @@
+ -export([from_dir/1]).
+ 
+ -include("ejabberd.hrl").
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include("logger.hrl").
+ -include("mod_roster.hrl").
+ -include("mod_offline.hrl").
+diff --git a/src/pubsub_subscription.erl b/src/pubsub_subscription.erl
+index 746e39e3..59ee734b 100644
+--- a/src/pubsub_subscription.erl
++++ b/src/pubsub_subscription.erl
+@@ -39,7 +39,7 @@
+ 
+ -include("pubsub.hrl").
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -define(PUBSUB_DELIVER, <<"pubsub#deliver">>).
+ -define(PUBSUB_DIGEST, <<"pubsub#digest">>).
+diff --git a/src/pubsub_subscription_sql.erl b/src/pubsub_subscription_sql.erl
+index 3315748c..5700c100 100644
+--- a/src/pubsub_subscription_sql.erl
++++ b/src/pubsub_subscription_sql.erl
+@@ -35,7 +35,7 @@
+ 
+ -include("pubsub.hrl").
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ 
+ -define(PUBSUB_DELIVER, <<"pubsub#deliver">>).
+ -define(PUBSUB_DIGEST, <<"pubsub#digest">>).
+diff --git a/src/xmpp_stream_in.erl b/src/xmpp_stream_in.erl
+index 329ebad6..4ce8760c 100644
+--- a/src/xmpp_stream_in.erl
++++ b/src/xmpp_stream_in.erl
+@@ -42,7 +42,7 @@
+ -define(FSMOPTS, []).
+ -endif.
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -type state() :: map().
+ -type stop_reason() :: {stream, reset | {in | out, stream_error()}} |
+ 		       {tls, inet:posix() | atom() | binary()} |
+diff --git a/src/xmpp_stream_out.erl b/src/xmpp_stream_out.erl
+index 7ddc183b..8095bd86 100644
+--- a/src/xmpp_stream_out.erl
++++ b/src/xmpp_stream_out.erl
+@@ -44,7 +44,7 @@
+ 
+ -define(TCP_SEND_TIMEOUT, 15000).
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include_lib("kernel/include/inet.hrl").
+ 
+ -type state() :: map().
+diff --git a/src/xmpp_stream_pkix.erl b/src/xmpp_stream_pkix.erl
+index 8361999f..a6fe728c 100644
+--- a/src/xmpp_stream_pkix.erl
++++ b/src/xmpp_stream_pkix.erl
+@@ -24,7 +24,7 @@
+ %% API
+ -export([authenticate/1, authenticate/2, get_cert_domains/1, format_error/1]).
+ 
+--include("xmpp.hrl").
++-include_lib("p1_xmpp/include/xmpp.hrl").
+ -include_lib("public_key/include/public_key.hrl").
+ -include("XmppAddr.hrl").
+ 
+-- 
+2.14.1
+
diff --git a/package/ejabberd/0007-fix-ejabberdctl.patch b/package/ejabberd/0007-fix-ejabberdctl.patch
index ab70d8900a..090fcc52d2 100644
--- a/package/ejabberd/0007-fix-ejabberdctl.patch
+++ b/package/ejabberd/0007-fix-ejabberdctl.patch
@@ -1,28 +1,32 @@
-From 53d7d654026afa163a55b860e33c6901129e8dc1 Mon Sep 17 00:00:00 2001
+From 168d5840dc2a541ec16385e666c1932cf02907e9 Mon Sep 17 00:00:00 2001
 From: Johan Oudinet <johan.oudinet@gmail.com>
-Date: Wed, 20 Jan 2016 09:35:07 -0500
+Date: Wed, 10 Jan 2018 15:00:07 +0100
 Subject: [PATCH] fix ejabberdctl
 
-Change default values so ejabberdctl run commands as ejabberd user
+Change default values so ejabberdctl run commands as ejabberd user.
 Also add a way for the user to change default values.
 
 Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
+---
+ ejabberdctl.template | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/ejabberdctl.template b/ejabberdctl.template
-index 5b34ebee..51acaca8 100755
+index 83637766..5a8a8795 100755
 --- a/ejabberdctl.template
 +++ b/ejabberdctl.template
-@@ -14,9 +14,12 @@ SCRIPT_DIR=`cd ${0%/*} && pwd`
- ERL={{erl}}
- IEX={{bindir}}/iex
- EPMD={{epmd}}
--INSTALLUSER={{installuser}}
+@@ -15,7 +15,10 @@ SCRIPT_DIR=$(cd "${0%/*}" && pwd)
+ ERL="{{erl}}"
+ IEX="{{bindir}}/iex"
+ EPMD="{{epmd}}"
+-INSTALLUSER="{{installuser}}"
 +INSTALLUSER=ejabberd
- ERL_LIBS={{libdir}}
-
++
 +# Read default configuration file if present
 +[ ! -r /etc/default/ejabberd ] || . /etc/default/ejabberd
-+
- # check the proper system user is used if defined
- if [ "$INSTALLUSER" != "" ] ; then
-     EXEC_CMD="false"
+ 
+ # check the proper system user is used
+ case $(id -un) in
+-- 
+2.14.1
+
diff --git a/package/ejabberd/0008-handle-error-case-from-lib_dir.patch b/package/ejabberd/0008-handle-error-case-from-lib_dir.patch
new file mode 100644
index 0000000000..f7931b4edc
--- /dev/null
+++ b/package/ejabberd/0008-handle-error-case-from-lib_dir.patch
@@ -0,0 +1,32 @@
+From d0bfcbbfd8a6e7ee6213112e4078b020e4e1d15d Mon Sep 17 00:00:00 2001
+From: Pawe? Chmielowski <pchmielowski@process-one.net>
+Date: Wed, 10 Jan 2018 16:34:01 +0100
+Subject: [PATCH] Handle error case from code:lib_dir in ResolveDepPath in
+ rebar.config.script
+
+This patch have already been applied in upstream/master.
+
+Signed-off-by: Pawe? Chmielowski <pchmielowski@process-one.net>
+
+---
+ rebar.config.script | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/rebar.config.script b/rebar.config.script
+index 85f918fffd..ba374e5c5f 100644
+--- a/rebar.config.script
++++ b/rebar.config.script
+@@ -233,9 +233,10 @@ ResolveDepPath = case {SystemDeps, IsRebar3} of
+ 		     {true, _} ->
+ 			 fun("deps/" ++ Rest) ->
+ 				 Slash = string:str(Rest, "/"),
+-				 code:lib_dir(
+-				   string:sub_string(Rest, 1, Slash -1)) ++
+-				     string:sub_string(Rest, Slash);
++				 case code:lib_dir(string:sub_string(Rest, 1, Slash -1)) of
++				     {error, _} -> Rest;
++				     V -> V ++ string:sub_string(Rest, Slash)
++				 end;
+ 			    (Path) ->
+ 				 Path
+ 			 end;
diff --git a/package/ejabberd/0008-rebar-uses-host-dependencies.patch b/package/ejabberd/0008-rebar-uses-host-dependencies.patch
deleted file mode 100644
index 45f387993e..0000000000
--- a/package/ejabberd/0008-rebar-uses-host-dependencies.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Fix location of rebar dependencies.
-
-Signed-off-by: Christophe Romain <cromain@process-one.net>
-
-diff --git a/rebar.config.script b/rebar.config.script
-index 19142b9e..9107af26 100644
---- a/rebar.config.script
-+++ b/rebar.config.script
-@@ -218,20 +218,10 @@ TestConfig = case file:read_file_info(TestConfigFile) of
- 		     ""
- 	     end,
-
--ResolveDepPath = case IsRebar3 of
--		     true ->
--			 fun("deps/" ++ Rest) ->
--				 Slash = string:str(Rest, "/"),
--				 Dir = "_build/default/lib/" ++
--				     string:sub_string(Rest, 1, Slash - 1),
--				 Dir ++ string:sub_string(Rest, Slash);
--			    (Path) ->
--				 Path
--			 end;
--		     _ ->
--			 fun(P) ->
--				 P
--			 end
-+ResolveDepPath = fun("deps/fast_xml/include") -> code:lib_dir(p1_xml) ++ "/include";
-+		    ("deps/xmpp/include") -> code:lib_dir(p1_xmpp) ++ "/include";
-+		    ("deps/p1_utils/include") -> code:lib_dir(p1_utils) ++ "/include";
-+		    (Path) -> Path
- 		 end,
-
- CtParams = fun(CompileOpts) ->
diff --git a/package/ejabberd/0009-disable-mod_avatar.patch b/package/ejabberd/0009-disable-mod_avatar.patch
new file mode 100644
index 0000000000..ab89ba1a29
--- /dev/null
+++ b/package/ejabberd/0009-disable-mod_avatar.patch
@@ -0,0 +1,32 @@
+From e6eac74e82975e7d87b1f59c50eb007ab04c1392 Mon Sep 17 00:00:00 2001
+From: Johan Oudinet <johan.oudinet@gmail.com>
+Date: Tue, 16 Jan 2018 14:29:56 +0100
+Subject: [PATCH] disable mod_avatar
+
+This module requires to compile with graphics enabled.
+
+Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
+---
+ ejabberd.yml.example | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/ejabberd.yml.example b/ejabberd.yml.example
+index e178e956..7c12b76c 100644
+--- a/ejabberd.yml.example
++++ b/ejabberd.yml.example
+@@ -796,9 +796,9 @@ modules:
+     search: false
+   mod_vcard_xupdate: {}
+   ## Convert all avatars posted by Android clients from WebP to JPEG
+-  mod_avatar:
+-    convert:
+-      webp: jpeg
++  ## mod_avatar:
++  ##   convert:
++  ##     webp: jpeg
+   mod_version: {}
+   mod_stream_mgmt: {}
+   ##   Non-SASL Authentication (XEP-0078) is now disabled by default
+-- 
+2.14.1
+
diff --git a/package/ejabberd/ejabberd.hash b/package/ejabberd/ejabberd.hash
index 24a26d21d9..6fb90a2300 100644
--- a/package/ejabberd/ejabberd.hash
+++ b/package/ejabberd/ejabberd.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 b8395bc65b09f135a60320b62338258acd6056cc241e9e245fde267fb18dd3c9 ejabberd-17.04.tgz
+sha256 bd16b33a2f1345e5847fd05b70a5fa992181bac756cd6d5d621de9c18cb76801 ejabberd-17.11.tgz
diff --git a/package/ejabberd/ejabberd.mk b/package/ejabberd/ejabberd.mk
index 35a1027efb..0f7af9b83e 100644
--- a/package/ejabberd/ejabberd.mk
+++ b/package/ejabberd/ejabberd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EJABBERD_VERSION = 17.04
+EJABBERD_VERSION = 17.11
 EJABBERD_SOURCE = ejabberd-$(EJABBERD_VERSION).tgz
 EJABBERD_SITE = https://www.process-one.net/downloads/ejabberd/$(EJABBERD_VERSION)
 EJABBERD_LICENSE = GPL-2.0+ with OpenSSL exception
@@ -23,22 +23,38 @@ ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 EJABBERD_DEPENDENCIES += linux-pam
 endif
 
-EJABBERD_ERLANG_LIBS = sasl crypto public_key ssl mnesia inets compiler
+# Install check-erlang-lib script to the directory in which the
+# package has been uncompressed, so it is available during the
+# configure step.
+define EJABBERD_INSTALL_CHECK_ERLANG_LIB
+	$(INSTALL) -m 0755 $(EJABBERD_PKGDIR)/check-erlang-lib \
+		$(@D)/check-erlang-lib
+endef
+
+EJABBERD_POST_EXTRACT_HOOKS += EJABBERD_INSTALL_CHECK_ERLANG_LIB
+
+EJABBERD_ERLANG_LIBS = sasl public_key mnesia inets compiler
 
 # Guess answers for these tests, configure will bail out otherwise
 # saying error: cannot run test program while cross compiling.
 EJABBERD_CONF_ENV = \
 	ac_cv_erlang_root_dir="$(HOST_DIR)/lib/erlang" \
 	$(foreach lib,$(EJABBERD_ERLANG_LIBS), \
-		ac_cv_erlang_lib_dir_$(lib)="`package/ejabberd/check-erlang-lib $(lib)`")
+		ac_cv_erlang_lib_dir_$(lib)="`./check-erlang-lib $(lib)`")
+
+EJABBERD_CONF_OPTS = \
+	--enable-system-deps \
+	--disable-erlang-version-check \
+	--disable-graphics
 
 define EJABBERD_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) install -C $(@D)
 endef
 
-# Replace HOST_DIR prefix to /usr in ERL path of ejabberctl script.
+# Replace HOST_DIR prefix to /usr in environment variables of
+# ejabberctl script.
 define EJABBERD_FIX_EJABBERDCTL
-	$(SED) 's,ERL=$(HOST_DIR),ERL=/usr,' '$(TARGET_DIR)/usr/sbin/ejabberdctl'
+	$(SED) 's,="$(HOST_DIR),="/usr,' '$(TARGET_DIR)/usr/sbin/ejabberdctl'
 endef
 
 EJABBERD_POST_INSTALL_TARGET_HOOKS += EJABBERD_FIX_EJABBERDCTL
-- 
2.14.1
