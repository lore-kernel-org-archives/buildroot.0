From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Tue,  2 Feb 2016 14:57:43 -0500
Subject: [Buildroot] [PATCH v2 17/18] ejabberd: bump to version 16.01
In-Reply-To: <1454443064-14269-1-git-send-email-fhunleth@troodon-software.com>
References: <1454443064-14269-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <1454443064-14269-18-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As part of the upgrade, updated patches from Debian were used where
appropriate. All patches were converted to git format.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 ...001-remove-dependencies-from-rebar-config.patch | 83 ++++++++++++++++++++++
 package/ejabberd/0001-remove-deps.patch            | 22 ------
 package/ejabberd/0002-disable-rebar-deps.patch     | 76 --------------------
 .../0002-remove-make-targets-for-deps.patch        | 74 +++++++++++++++++++
 package/ejabberd/0003-disable-test.patch           | 27 -------
 .../0003-remove-checking-erlang-version.patch      | 30 ++++++++
 package/ejabberd/0004-correct-include.patch        | 56 +++++++++++++++
 package/ejabberd/0004-disable-version-check.patch  | 20 ------
 .../0005-disable-ERLANG_DEPRECATED_CHECK.patch     | 27 +++++++
 package/ejabberd/0005-fix-includes.patch           | 45 ------------
 ...006-disable-erlang-deprecated-types-check.patch | 20 ------
 ...ns.patch => 0006-fix-install-permissions.patch} | 41 +++++------
 ...jabberdctl.patch => 0007-fix-ejabberdctl.patch} | 21 ++++--
 package/ejabberd/Config.in                         |  5 +-
 package/ejabberd/ejabberd.hash                     |  6 +-
 package/ejabberd/ejabberd.mk                       |  2 +-
 16 files changed, 313 insertions(+), 242 deletions(-)
 create mode 100644 package/ejabberd/0001-remove-dependencies-from-rebar-config.patch
 delete mode 100644 package/ejabberd/0001-remove-deps.patch
 delete mode 100644 package/ejabberd/0002-disable-rebar-deps.patch
 create mode 100644 package/ejabberd/0002-remove-make-targets-for-deps.patch
 delete mode 100644 package/ejabberd/0003-disable-test.patch
 create mode 100644 package/ejabberd/0003-remove-checking-erlang-version.patch
 create mode 100644 package/ejabberd/0004-correct-include.patch
 delete mode 100644 package/ejabberd/0004-disable-version-check.patch
 create mode 100644 package/ejabberd/0005-disable-ERLANG_DEPRECATED_CHECK.patch
 delete mode 100644 package/ejabberd/0005-fix-includes.patch
 delete mode 100644 package/ejabberd/0006-disable-erlang-deprecated-types-check.patch
 rename package/ejabberd/{0007-fix-install-permissions.patch => 0006-fix-install-permissions.patch} (73%)
 rename package/ejabberd/{0008-fix-ejabberdctl.patch => 0007-fix-ejabberdctl.patch} (56%)

diff --git a/package/ejabberd/0001-remove-dependencies-from-rebar-config.patch b/package/ejabberd/0001-remove-dependencies-from-rebar-config.patch
new file mode 100644
index 0000000..6929c10
--- /dev/null
+++ b/package/ejabberd/0001-remove-dependencies-from-rebar-config.patch
@@ -0,0 +1,83 @@
+From 9bcf7020e348771f16a04abeff2a7cc3a5e87c5b Mon Sep 17 00:00:00 2001
+From: Philipp Huebner <debalance@debian.org>
+Date: Wed, 20 Jan 2016 08:08:42 -0500
+Subject: [PATCH 1/7] remove dependencies from rebar config
+
+Without this patch, dependencies would be downloaded and compiled
+by rebar at build time.
+---
+ rebar.config | 51 ---------------------------------------------------
+ 1 file changed, 51 deletions(-)
+
+diff --git a/rebar.config b/rebar.config
+index 30c0360..d6a5b4d 100644
+--- a/rebar.config
++++ b/rebar.config
+@@ -7,48 +7,6 @@
+ %%% Created :  1 May 2013 by Evgeniy Khramtsov <ekhramtsov@process-one.net>
+ %%%-------------------------------------------------------------------
+ 
+-{deps, [{if_var_true, lager, {lager, ".*", {git, "https://github.com/basho/lager", {tag, "3.0.2"}}}},
+-        {if_var_false, lager, {p1_logger, ".*", {git, "https://github.com/processone/p1_logger", {tag, "1.0.0"}}}},
+-        {p1_utils, ".*", {git, "https://github.com/processone/p1_utils", {tag, "1.0.2"}}},
+-        {cache_tab, ".*", {git, "https://github.com/processone/cache_tab", {tag, "1.0.1"}}},
+-        {p1_tls, ".*", {git, "https://github.com/processone/tls", {tag, "1.0.0"}}},
+-        {p1_stringprep, ".*", {git, "https://github.com/processone/stringprep", {tag, "1.0.0"}}},
+-        {p1_xml, ".*", {git, "https://github.com/processone/xml", {tag, "1.1.1"}}},
+-        {p1_stun, ".*", {git, "https://github.com/processone/stun", "0.9.0"}},
+-        {esip, ".*", {git, "https://github.com/processone/p1_sip", "1.0.0"}},
+-        {p1_yaml, ".*", {git, "https://github.com/processone/p1_yaml", {tag, "1.0.0"}}},
+-        {jiffy, ".*", {git, "https://github.com/davisp/jiffy", {tag, "0.14.5"}}},
+-        {oauth2, ".*", {git, "https://github.com/kivra/oauth2", "8d129fbf8866930b4ffa6dd84e65bd2b32b9acb8"}},
+-        {xmlrpc, ".*", {git, "https://github.com/rds13/xmlrpc", {tag, "1.15"}}},
+-        {if_var_true, mysql, {p1_mysql, ".*", {git, "https://github.com/processone/mysql", {tag, "1.0.0"}}}},
+-        {if_var_true, pgsql, {p1_pgsql, ".*", {git, "https://github.com/processone/pgsql", {tag, "1.0.0"}}}},
+-        {if_var_true, sqlite, {sqlite3, ".*", {git, "https://github.com/alexeyr/erlang-sqlite3", "cbc3505f7a131254265d3ef56191b2581b8cc172"}}},
+-        {if_var_true, pam, {p1_pam, ".*", {git, "https://github.com/processone/epam", {tag, "1.0.0"}}}},
+-        {if_var_true, zlib, {p1_zlib, ".*", {git, "https://github.com/processone/zlib", {tag, "1.0.0"}}}},
+-        {if_var_true, riak, {hamcrest, ".*", {git, "https://github.com/hyperthunk/hamcrest-erlang", "908a24fda4a46776a5135db60ca071e3d783f9f6"}}},  % for riak_pb-2.1.0.7
+-        {if_var_true, riak, {riakc, ".*", {git, "https://github.com/basho/riak-erlang-client", "527722d12d0433b837cdb92a60900c2cb5df8942"}}},
+-        {if_var_true, elixir, {elixir, ".*", {git, "https://github.com/elixir-lang/elixir", {tag, "v1.1.0"}}}},
+-        {if_var_true, elixir, {rebar_elixir_plugin, ".*", {git, "https://github.com/processone/rebar_elixir_plugin", "0.1.0"}}},
+-        {if_var_true, iconv, {p1_iconv, ".*", {git, "https://github.com/processone/eiconv", {tag, "0.9.0"}}}},
+-        {if_var_true, tools, {meck, "0.8.2", {git, "https://github.com/eproxus/meck", {tag, "0.8.2"}}}},
+-        {if_var_true, redis, {eredis, ".*", {git, "https://github.com/wooga/eredis", {tag, "v1.0.8"}}}}]}.
+-
+-{if_var_true, latest_deps,
+- {floating_deps, [p1_logger,
+-                  cache_tab,
+-                  p1_tls,
+-                  p1_stringprep,
+-                  p1_xml,
+-                  esip,
+-                  p1_stun,
+-                  p1_yaml,
+-                  p1_utils,
+-                  p1_mysql,
+-                  p1_pgsql,
+-                  p1_pam,
+-                  p1_zlib,
+-                  p1_iconv]}}.
+-
+ {erl_opts, [nowarn_deprecated_function,
+             {if_var_true, roster_gateway_workaround, {d, 'ROSTER_GATWAY_WORKAROUND'}},
+             {if_var_match, db_type, mssql, {d, 'mssql'}},
+@@ -92,15 +50,6 @@
+ 
+ {eunit_compile_opts, [{i, "tools"}]}.
+ 
+-{post_hook_configure, [{"p1_tls", []},
+-                       {"p1_stringprep", []},
+-                       {"p1_yaml", []},
+-                       {"esip", []},
+-                       {"p1_xml", [{if_var_true, full_xml, "--enable-full-xml"}]},
+-                       {if_var_true, pam, {"p1_pam", []}},
+-                       {if_var_true, zlib, {"p1_zlib", []}},
+-                       {if_var_true, iconv, {"p1_iconv", []}}]}.
+-
+ {port_env, [{"CFLAGS", "-g -O2 -Wall"}]}.
+ 
+ {port_specs, [{"priv/lib/jid.so", ["c_src/jid.c"]}]}.
+-- 
+2.5.0
+
diff --git a/package/ejabberd/0001-remove-deps.patch b/package/ejabberd/0001-remove-deps.patch
deleted file mode 100644
index c5700dd..0000000
--- a/package/ejabberd/0001-remove-deps.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Description: remove make targets for deps
- Without this patch, dependencies would be downloaded and compiled
- using rebar at build time.
-Author: Philipp Huebner <debalance@debian.org>
-
-Index: ejabberd/rebar.config.script
-===================================================================
-diff --git a/rebar.config.script b/rebar.config.script
-index 633433c..646a15a 100644
---- a/rebar.config.script
-+++ b/rebar.config.script
-@@ -187,9 +187,7 @@ Config = [{erl_opts, Macros ++ HiPE ++ DebugInfo ++
-           {xref_checks, []},
- 	  {xref_queries,
- 	   [{"(XC - UC) || (XU - X - B - "
--	     ++ string:join(CfgXrefs, " - ") ++ ")", []}]},
--          {post_hooks, PostHooks ++ CfgPostHooks},
--          {deps, AllDeps}] ++ ElixirConfig,
-+	     ++ string:join(CfgXrefs, " - ") ++ ")", []}]}],
- %%io:format("ejabberd configuration:~n  ~p~n", [Config]),
- Config.
- 
diff --git a/package/ejabberd/0002-disable-rebar-deps.patch b/package/ejabberd/0002-disable-rebar-deps.patch
deleted file mode 100644
index e76b8a2..0000000
--- a/package/ejabberd/0002-disable-rebar-deps.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-Description: remove make targets for deps
- Without this patch, dependencies would be downloaded and compiled
- using rebar at build time.
-Author: Philipp Huebner <debalance@debian.org>
-
-Index: ejabberd/Makefile.in
-===================================================================
-diff --git a/Makefile.in b/Makefile.in
-index 8dd6bf5..b9d783a 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -77,26 +77,11 @@ else
-   INIT_USER=$(INSTALLUSER)
- endif
- 
--all: deps src
-+all: src
- 
--deps: deps/.got
--
--deps/.got:
--	rm -rf deps/.got
--	rm -rf deps/.built
--	$(REBAR) get-deps && :> deps/.got
--
--deps/.built: deps/.got
--	$(REBAR) compile && :> deps/.built
--
--src: deps/.built
-+src:
- 	$(REBAR) skip_deps=true compile
- 
--update:
--	rm -rf deps/.got
--	rm -rf deps/.built
--	$(REBAR) update-deps && :> deps/.got
--
- xref: all
- 	$(REBAR) skip_deps=true xref
- 
-@@ -129,13 +114,10 @@ endef
- 
- $(foreach file,$(DEPS_FILES_FILTERED) $(MAIN_FILES),$(eval $(call COPY_template,$(file))))
- 
--$(call TO_DEST,$(MAIN_DIRS) $(DEPS_DIRS)):
-+$(call TO_DEST,$(MAIN_DIRS)):
- 	$(INSTALL) -d $@
- 
--$(call TO_DEST,deps/p1_pam/priv/bin/epam): $(LIBDIR)/%: deps/% $(call TO_DEST,deps/p1_pam/priv/bin/)
--	$(INSTALL) -m 750 $(O_USER) $< $@
--
--copy-files: $(call TO_DEST,$(DEPS_FILES) $(MAIN_FILES))
-+copy-files: $(call TO_DEST,$(MAIN_FILES))
- 
- install: all copy-files
- 	#
-@@ -172,10 +154,6 @@ install: all copy-files
- 		-e "s*@installuser@*$(INIT_USER)*" ejabberd.init.template \
- 		> ejabberd.init
- 	chmod 755 ejabberd.init
--	# Install Elixir and Elixir dependancies
--	-$(INSTALL) -m 644 deps/*/lib/*/ebin/*.app $(BEAMDIR)
--	-$(INSTALL) -m 644 deps/*/lib/*/ebin/*.beam $(BEAMDIR)
--	rm -f $(BEAMDIR)/configure.beam
- 	#
- 	# Binary C programs
- 	$(INSTALL) -d $(PBINDIR)
-@@ -266,8 +244,6 @@ TAGS:
- 
- Makefile: Makefile.in
- 
--deps := $(wildcard deps/*/ebin)
--
- dialyzer/erlang.plt:
- 	@mkdir -p dialyzer
- 	@dialyzer --build_plt --output_plt dialyzer/erlang.plt \
diff --git a/package/ejabberd/0002-remove-make-targets-for-deps.patch b/package/ejabberd/0002-remove-make-targets-for-deps.patch
new file mode 100644
index 0000000..9e7d833
--- /dev/null
+++ b/package/ejabberd/0002-remove-make-targets-for-deps.patch
@@ -0,0 +1,74 @@
+From fd176d4e9a298fd833aa073cb6413ebbc2cbef81 Mon Sep 17 00:00:00 2001
+From: Philipp Huebner <debalance@debian.org>
+Date: Wed, 20 Jan 2016 10:22:57 -0500
+Subject: [PATCH 2/7] remove make targets for deps
+
+Without this patch, dependencies would be downloaded and compiled
+using rebar at build time.
+---
+ Makefile.in | 26 +++-----------------------
+ 1 file changed, 3 insertions(+), 23 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 08cd837..2a6457c 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -77,26 +77,11 @@ else
+   INIT_USER=$(INSTALLUSER)
+ endif
+ 
+-all: deps src
++all: src
+ 
+-deps: deps/.got
+-
+-deps/.got:
+-	rm -rf deps/.got
+-	rm -rf deps/.built
+-	$(REBAR) get-deps && :> deps/.got
+-
+-deps/.built: deps/.got
+-	$(REBAR) compile && :> deps/.built
+-
+-src: deps/.built
++src:
+ 	$(REBAR) skip_deps=true compile
+ 
+-update:
+-	rm -rf deps/.got
+-	rm -rf deps/.built
+-	$(REBAR) update-deps && :> deps/.got
+-
+ xref: all
+ 	$(REBAR) skip_deps=true xref
+ 
+@@ -152,16 +137,13 @@ $(foreach file,$(DEPS_FILES_FILTERED) $(MAIN_FILES),$(eval $(call COPY_template,
+ $(sort $(call TO_DEST,$(MAIN_DIRS) $(DEPS_DIRS))):
+ 	$(INSTALL) -d $@
+ 
+-$(call TO_DEST,deps/p1_pam/priv/bin/epam): $(LIBDIR)/%: deps/p1_pam/priv/bin/epam $(call TO_DEST,deps/p1_pam/priv/bin/)
+-	$(INSTALL) -m 750 $(O_USER) $< $@
+-
+ $(call TO_DEST,priv/sql/lite.sql): sql/lite.sql $(call TO_DEST,priv/sql)
+ 	$(INSTALL) -m 644 $< $@
+ 
+ $(call TO_DEST,priv/bin/captcha.sh): tools/captcha.sh $(call TO_DEST,priv/bin)
+ 	$(INSTALL) -m 750 $(O_USER) $< $@
+ 
+-copy-files-sub2: $(call TO_DEST,$(DEPS_FILES) $(MAIN_FILES) priv/bin/captcha.sh priv/sql/lite.sql)
++copy-files-sub2: $(call TO_DEST,$(MAIN_FILES) priv/bin/captcha.sh priv/sql/lite.sql)
+ 
+ endif
+ 
+@@ -287,8 +269,6 @@ TAGS:
+ 
+ Makefile: Makefile.in
+ 
+-deps := $(wildcard deps/*/ebin)
+-
+ dialyzer/erlang.plt:
+ 	@mkdir -p dialyzer
+ 	@dialyzer --build_plt --output_plt dialyzer/erlang.plt \
+-- 
+2.5.0
+
diff --git a/package/ejabberd/0003-disable-test.patch b/package/ejabberd/0003-disable-test.patch
deleted file mode 100644
index 1b28957..0000000
--- a/package/ejabberd/0003-disable-test.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Description: remove testing with MySQL and PostgreSQL
- Without this patch a test would be initiated after building ejabberd that
- requires specially configured instances of MySQL and PostgreSQL to be up
- and running.
-Author: Philipp Huebner <debalance@debian.org>
-
-Index: ejabberd/Makefile.in
-===================================================================
-diff --git a/Makefile.in b/Makefile.in
-index ffd1d30..835d611 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -306,14 +306,8 @@ dialyzer: erlang_plt deps_plt ejabberd_plt
- 	status=$$? ; if [ $$status -ne 2 ]; then exit $$status; else exit 0; fi
- 
- test:
--	@echo "************************** NOTICE ***************************************"
--	@cat test/README
--	@echo "*************************************************************************"
--	@cd priv && ln -sf ../sql
--	$(REBAR) skip_deps=true ct
- 
- quicktest:
--	$(REBAR) skip_deps=true ct suites=elixir
- 
- .PHONY: src edoc dialyzer Makefile TAGS clean clean-rel distclean rel \
- 	install uninstall uninstall-binary uninstall-all translations deps test spec \
diff --git a/package/ejabberd/0003-remove-checking-erlang-version.patch b/package/ejabberd/0003-remove-checking-erlang-version.patch
new file mode 100644
index 0000000..1690aae
--- /dev/null
+++ b/package/ejabberd/0003-remove-checking-erlang-version.patch
@@ -0,0 +1,30 @@
+From fa3d9795f5a3cf29866dd09848d57b679bb7aea2 Mon Sep 17 00:00:00 2001
+From: Johan Oudinet <johan.oudinet@gmail.com>
+Date: Wed, 20 Jan 2016 08:11:32 -0500
+Subject: [PATCH 3/7] remove checking erlang version
+
+Without this patch, the configure will try to run erlang to simply check
+if the version is supported by ejabberd. Instead, we do this test
+statically.
+---
+ configure.ac | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 97e89a2..cd1ab08 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -39,10 +39,8 @@ AC_ARG_ENABLE(erlang-version-check,
+ 	[Check Erlang/OTP version @<:@default=yes@:>@])])
+ case "$enable_erlang_version_check" in
+ 	yes|'')
+-		ERLANG_VERSION_CHECK([$REQUIRE_ERLANG_MIN],[$REQUIRE_ERLANG_MAX])
+ 		;;
+ 	no)
+-		ERLANG_VERSION_CHECK([$REQUIRE_ERLANG_MIN],[$REQUIRE_ERLANG_MAX],[warn])
+ 		;;
+ esac
+ 
+-- 
+2.5.0
+
diff --git a/package/ejabberd/0004-correct-include.patch b/package/ejabberd/0004-correct-include.patch
new file mode 100644
index 0000000..01e48a7
--- /dev/null
+++ b/package/ejabberd/0004-correct-include.patch
@@ -0,0 +1,56 @@
+From 8be7e0e65670490a65864d4e08224ec7d9a241c6 Mon Sep 17 00:00:00 2001
+From: Philipp Huebner <debalance@debian.org>
+Date: Wed, 20 Jan 2016 08:13:21 -0500
+Subject: [PATCH 4/7] correct include
+
+This part of the code was moved into it's own project and was packaged
+separately by me. To make the build process work, this small fix is
+necessary.
+---
+ src/mod_sip.erl           | 2 +-
+ src/mod_sip_proxy.erl     | 2 +-
+ src/mod_sip_registrar.erl | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/mod_sip.erl b/src/mod_sip.erl
+index c8c9533..7f188a0 100644
+--- a/src/mod_sip.erl
++++ b/src/mod_sip.erl
+@@ -38,7 +38,7 @@
+ 
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+--include_lib("esip/include/esip.hrl").
++-include_lib("p1_sip/include/esip.hrl").
+ 
+ %%%===================================================================
+ %%% API
+diff --git a/src/mod_sip_proxy.erl b/src/mod_sip_proxy.erl
+index bf297bc..d8b65cd 100644
+--- a/src/mod_sip_proxy.erl
++++ b/src/mod_sip_proxy.erl
+@@ -40,7 +40,7 @@
+ 
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+--include_lib("esip/include/esip.hrl").
++-include_lib("p1_sip/include/esip.hrl").
+ 
+ -define(SIGN_LIFETIME, 300). %% in seconds.
+ 
+diff --git a/src/mod_sip_registrar.erl b/src/mod_sip_registrar.erl
+index 44091ed..4d2ec82 100644
+--- a/src/mod_sip_registrar.erl
++++ b/src/mod_sip_registrar.erl
+@@ -37,7 +37,7 @@
+ 
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+--include_lib("esip/include/esip.hrl").
++-include_lib("p1_sip/include/esip.hrl").
+ 
+ -define(CALL_TIMEOUT, timer:seconds(30)).
+ -define(DEFAULT_EXPIRES, 3600).
+-- 
+2.5.0
+
diff --git a/package/ejabberd/0004-disable-version-check.patch b/package/ejabberd/0004-disable-version-check.patch
deleted file mode 100644
index f2f1e81..0000000
--- a/package/ejabberd/0004-disable-version-check.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Description: remove checking erlang version
- Without this patch, the configure will try to run erlang to simply check if
- the version is supported by ejabberd. Instead, we do this test statically.
-Author: Johan Oudinet <johan.oudinet@gmail.com>
-
-Index: ejabberd/configure.ac
-===================================================================
---- ejabberd.orig/configure.ac	2014-10-20 11:04:14.751256865 +0200
-+++ ejabberd/configure.ac	2014-10-20 11:03:47.983578623 +0200
-@@ -37,10 +37,8 @@ AC_ARG_ENABLE(erlang-version-check,
- 	[Check Erlang/OTP version @<:@default=yes@:>@])])
- case "$enable_erlang_version_check" in
- 	yes|'')
--		ERLANG_VERSION_CHECK([$REQUIRE_ERLANG_MIN],[$REQUIRE_ERLANG_MAX])
- 		;;
- 	no)
--		ERLANG_VERSION_CHECK([$REQUIRE_ERLANG_MIN],[$REQUIRE_ERLANG_MAX],[warn])
- 		;;
- esac
- 
diff --git a/package/ejabberd/0005-disable-ERLANG_DEPRECATED_CHECK.patch b/package/ejabberd/0005-disable-ERLANG_DEPRECATED_CHECK.patch
new file mode 100644
index 0000000..5b5d741
--- /dev/null
+++ b/package/ejabberd/0005-disable-ERLANG_DEPRECATED_CHECK.patch
@@ -0,0 +1,27 @@
+From 7dbb86c84f7dd34c7fdb3c4f78c29381128793ea Mon Sep 17 00:00:00 2001
+From: Johan Oudinet <johan.oudinet@gmail.com>
+Date: Wed, 20 Jan 2016 08:16:26 -0500
+Subject: [PATCH 5/7] disable ERLANG_DEPRECATED_CHECK
+
+Without this patch, the configure will try to execute erlang to check
+if it uses deprecated types. Assume the answer is false.
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index cd1ab08..a4f1533 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -235,7 +235,7 @@ if test "$ENABLEUSER" != ""; then
+   AC_SUBST([INSTALLUSER], [$ENABLEUSER])
+ fi
+ 
+-ERLANG_DEPRECATED_TYPES_CHECK
++AC_SUBST(erlang_deprecated_types, false)
+ 
+ if test "$sqlite" = "true"; then
+    AX_LIB_SQLITE3([3.6.19])
+-- 
+2.5.0
+
diff --git a/package/ejabberd/0005-fix-includes.patch b/package/ejabberd/0005-fix-includes.patch
deleted file mode 100644
index 27ad761..0000000
--- a/package/ejabberd/0005-fix-includes.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-Description: correct include
- This part of the code was moved into it's own project and was packaged
- separately by me. To make the build process work, this small fix is
- necessary.
-Author: Philipp Huebner <debalance@debian.org>
-
-Index: ejabberd/src/mod_sip_proxy.erl
-===================================================================
---- ejabberd.orig/src/mod_sip_proxy.erl
-+++ ejabberd/src/mod_sip_proxy.erl
-@@ -21,7 +21,7 @@
- 
- -include("ejabberd.hrl").
- -include("logger.hrl").
---include_lib("esip/include/esip.hrl").
-+-include_lib("p1_sip/include/esip.hrl").
- 
- -define(SIGN_LIFETIME, 300). %% in seconds.
- 
-Index: ejabberd/src/mod_sip.erl
-===================================================================
---- ejabberd.orig/src/mod_sip.erl
-+++ ejabberd/src/mod_sip.erl
-@@ -20,7 +20,7 @@
- 
- -include("ejabberd.hrl").
- -include("logger.hrl").
---include_lib("esip/include/esip.hrl").
-+-include_lib("p1_sip/include/esip.hrl").
- 
- %%%===================================================================
- %%% API
-Index: ejabberd/src/mod_sip_registrar.erl
-===================================================================
---- ejabberd.orig/src/mod_sip_registrar.erl
-+++ ejabberd/src/mod_sip_registrar.erl
-@@ -20,7 +20,7 @@
- 
- -include("ejabberd.hrl").
- -include("logger.hrl").
---include_lib("esip/include/esip.hrl").
-+-include_lib("p1_sip/include/esip.hrl").
- 
- -define(CALL_TIMEOUT, timer:seconds(30)).
- -define(DEFAULT_EXPIRES, 3600).
diff --git a/package/ejabberd/0006-disable-erlang-deprecated-types-check.patch b/package/ejabberd/0006-disable-erlang-deprecated-types-check.patch
deleted file mode 100644
index 1b70953..0000000
--- a/package/ejabberd/0006-disable-erlang-deprecated-types-check.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Description: disable ERLANG_DEPRECATED_CHECK
- Without this patch, the configure will try to execute erlang to check
- if it uses deprecated types. Assume the answer is false.
-Author: Johan Oudinet <johan.oudinet@gmail.com>
-
-Index: ejabberd/configure.ac
-====================================================================
-diff --git a/configure.ac b/configure.ac
-index 6ae0a24..e5498df 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -252,7 +252,7 @@ if test "$ENABLEUSER" != ""; then
-   AC_SUBST([INSTALLUSER], [$ENABLEUSER])
- fi
- 
--ERLANG_DEPRECATED_TYPES_CHECK
-+AC_SUBST(erlang_deprecated_types, false)
- 
- if test "$sqlite" = "true"; then
-    AX_LIB_SQLITE3([3.6.19])
diff --git a/package/ejabberd/0007-fix-install-permissions.patch b/package/ejabberd/0006-fix-install-permissions.patch
similarity index 73%
rename from package/ejabberd/0007-fix-install-permissions.patch
rename to package/ejabberd/0006-fix-install-permissions.patch
index 2ad8453..5400ab1 100644
--- a/package/ejabberd/0007-fix-install-permissions.patch
+++ b/package/ejabberd/0006-fix-install-permissions.patch
@@ -1,16 +1,20 @@
-Description: fix install permissions
- Without this patch, the makefile will try to install directories and
- files with incompatible permissions for ejabberd, which run as an
- ejabberd user.
-Author: Johan Oudinet <johan.oudinet@gmail.com>
+From 03630a7e7722ae66cbb26e607a3ef931a78f8714 Mon Sep 17 00:00:00 2001
+From: Johan Oudinet <johan.oudinet@gmail.com>
+Date: Wed, 20 Jan 2016 09:34:07 -0500
+Subject: [PATCH 6/7] fix install permissions
+
+Without this patch, the makefile will try to install directories and
+files with incompatible permissions for ejabberd, which run as an
+ejabberd user.
+---
+ Makefile.in | 38 +++++---------------------------------
+ 1 file changed, 5 insertions(+), 33 deletions(-)
 
-Index: ejabberd/Makefile.in
-===================================================================
 diff --git a/Makefile.in b/Makefile.in
-index b9d783a..6ec805a 100644
+index 2a6457c..0be4c50 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -122,10 +122,8 @@ copy-files: $(call TO_DEST,$(MAIN_FILES))
+@@ -155,10 +155,8 @@ copy-files-sub: copy-files-sub2
  install: all copy-files
  	#
  	# Configuration files
@@ -23,7 +27,7 @@ index b9d783a..6ec805a 100644
  	$(SED) -e "s*{{rootdir}}*@prefix@*" \
  		-e "s*{{installuser}}*@INSTALLUSER@*" \
  		-e "s*{{bindir}}*@bindir@*" \
-@@ -135,14 +133,11 @@ install: all copy-files
+@@ -168,14 +166,11 @@ install: all copy-files
  		-e "s*{{docdir}}*@docdir@*" \
  		-e "s*{{erl}}*@ERL@*" ejabberdctl.template \
  		> ejabberdctl.example
@@ -41,16 +45,10 @@ index b9d783a..6ec805a 100644
  	# Elixir binaries
  	[ -d $(BINDIR) ] || $(INSTALL) -d -m 755 $(BINDIR)
  	[ -f deps/elixir/bin/iex ] && $(INSTALL) -m 550 $(G_USER) deps/elixir/bin/iex $(BINDIR)/iex || true
-@@ -157,34 +152,11 @@ install: all copy-files
- 	#
- 	# Binary C programs
- 	$(INSTALL) -d $(PBINDIR)
--	$(INSTALL) -m 750 $(O_USER) tools/captcha.sh $(PBINDIR)
-+	$(INSTALL) tools/captcha.sh $(PBINDIR)
- 	#
- 	# Copy lite.sql
- 	[ -d deps/sqlite3 ] && $(INSTALL) -d $(SQLDIR) || true
- 	[ -d deps/sqlite3 ] && $(INSTALL) -m 644 sql/lite.sql $(SQLDIR) || true
+@@ -187,29 +182,6 @@ install: all copy-files
+ 		-e "s*@installuser@*$(INIT_USER)*" ejabberd.init.template \
+ 		> ejabberd.init
+ 	chmod 755 ejabberd.init
 -	#
 -	# Spool directory
 -	$(INSTALL) -d -m 750 $(O_USER) $(SPOOLDIR)
@@ -77,3 +75,6 @@ index b9d783a..6ec805a 100644
  
  uninstall: uninstall-binary
  
+-- 
+2.5.0
+
diff --git a/package/ejabberd/0008-fix-ejabberdctl.patch b/package/ejabberd/0007-fix-ejabberdctl.patch
similarity index 56%
rename from package/ejabberd/0008-fix-ejabberdctl.patch
rename to package/ejabberd/0007-fix-ejabberdctl.patch
index af0b6ee..bb99624 100644
--- a/package/ejabberd/0008-fix-ejabberdctl.patch
+++ b/package/ejabberd/0007-fix-ejabberdctl.patch
@@ -1,12 +1,18 @@
-Description: fix ejabberdctl
- Change default values so ejabberdctl run commands as ejabberd user
- Also add a way for the user to change default values.
+From 8ed9f378d4a18114f2021969b4f440d34abacc0d Mon Sep 17 00:00:00 2001
+From: Johan Oudinet <johan.oudinet@gmail.com>
+Date: Wed, 20 Jan 2016 09:35:07 -0500
+Subject: [PATCH 7/7] fix ejabberdctl
+
+Change default values so ejabberdctl run commands as ejabberd user
+Also add a way for the user to change default values.
+
 Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
+---
+ ejabberdctl.template | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
 
-Index: ejabberd/ejabberdctl.template
-===================================================================
 diff --git a/ejabberdctl.template b/ejabberdctl.template
-index c7d76ef..a7afce1 100755
+index f65c21f..ff9225f 100755
 --- a/ejabberdctl.template
 +++ b/ejabberdctl.template
 @@ -14,9 +14,12 @@ SCRIPT_DIR=`cd ${0%/*} && pwd`
@@ -23,3 +29,6 @@ index c7d76ef..a7afce1 100755
  # check the proper system user is used if defined
  if [ "$INSTALLUSER" != "" ] ; then
      EXEC_CMD="false"
+-- 
+2.5.0
+
diff --git a/package/ejabberd/Config.in b/package/ejabberd/Config.in
index 7b4e99b..7add8c6 100644
--- a/package/ejabberd/Config.in
+++ b/package/ejabberd/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_EJABBERD
 	bool "ejabberd"
 	depends on BR2_PACKAGE_ERLANG
+	depends on BR2_INSTALL_LIBSTDCPP # required for erlang-p1-stringprep
 	select BR2_PACKAGE_ERLANG_LAGER
 	select BR2_PACKAGE_ERLANG_P1_CACHE_TAB
 	select BR2_PACKAGE_ERLANG_P1_ICONV
@@ -18,5 +19,5 @@ config BR2_PACKAGE_EJABBERD
 
 	  http://www.ejabberd.im
 
-comment "ejabberd needs erlang"
-	depends on !BR2_PACKAGE_ERLANG
+comment "ejabberd needs erlang and a toolchain w/ C++"
+	depends on !BR2_PACKAGE_ERLANG || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/ejabberd/ejabberd.hash b/package/ejabberd/ejabberd.hash
index b027183..ea85d1c 100644
--- a/package/ejabberd/ejabberd.hash
+++ b/package/ejabberd/ejabberd.hash
@@ -1,4 +1,4 @@
-# From https://www.process-one.net/downloads/ejabberd/15.11/ejabberd-15.11.tgz.md5
-md5 a6997b88d44c5a5acff45bb1d938d0f3 ejabberd-15.11.tgz
+# From https://www.process-one.net/downloads/ejabberd/15.11/ejabberd-16.01.tgz.md5
+md5 5e525c25c8f04287217b8a9522d7c942 ejabberd-16.01.tgz
 # Locally computed
-sha256 01044b5a25f9f8dda8c60726698bd27d650751b810e5bfa23f9bb49ba20e946a ejabberd-15.11.tgz
+sha256 e2cc479d5870539b2e6756690b227969c88a541d464d1fc6e1cbf7270ad7d681 ejabberd-16.01.tgz
diff --git a/package/ejabberd/ejabberd.mk b/package/ejabberd/ejabberd.mk
index 841c911..a3aad35 100644
--- a/package/ejabberd/ejabberd.mk
+++ b/package/ejabberd/ejabberd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EJABBERD_VERSION = 15.11
+EJABBERD_VERSION = 16.01
 EJABBERD_SOURCE = ejabberd-$(EJABBERD_VERSION).tgz
 EJABBERD_SITE = https://www.process-one.net/downloads/ejabberd/$(EJABBERD_VERSION)
 EJABBERD_LICENSE = GPLv2+ with OpenSSL exception
-- 
2.5.0
