From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Sun, 21 Feb 2016 17:00:09 -0500
Subject: [Buildroot] [PATCH v4 2/3] ejabberd: bump to version 16.01
In-Reply-To: <1456092010-16504-1-git-send-email-fhunleth@troodon-software.com>
References: <1456092010-16504-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <1456092010-16504-2-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
Changes v3 -> v4:
  - Specify -N to git format-patch

Changes v2 -> v3:
  - Add SoB to patches that I changed (suggested by Romain Naour)
    If a patch just had line number differences, etc. that were
    handled automatically by git format-patch, I didn't add a
    SoB line.

Changes v1 -> v2:
  - none

 .../0001-remove-make-targets-for-deps.patch        | 83 ++++++++++++++++-----
 ...002-remove-dependencies-from-rebar-config.patch | 85 ++++++++++++++++++++++
 .../0002-remove-make-targets-for-deps.patch        | 83 ---------------------
 ...h => 0003-remove-checking-erlang-version.patch} | 10 +--
 ...-remove-testing-with-MySQL-and-PostgreSQL.patch | 34 ---------
 ...ct-include.patch => 0004-correct-include.patch} | 10 +--
 ... => 0005-disable-ERLANG_DEPRECATED_CHECK.patch} |  8 +-
 ...ns.patch => 0006-fix-install-permissions.patch} | 30 ++++----
 ...jabberdctl.patch => 0007-fix-ejabberdctl.patch} |  6 +-
 package/ejabberd/ejabberd.hash                     |  6 +-
 package/ejabberd/ejabberd.mk                       |  2 +-
 11 files changed, 184 insertions(+), 173 deletions(-)
 create mode 100644 package/ejabberd/0002-remove-dependencies-from-rebar-config.patch
 delete mode 100644 package/ejabberd/0002-remove-make-targets-for-deps.patch
 rename package/ejabberd/{0004-remove-checking-erlang-version.patch => 0003-remove-checking-erlang-version.patch} (75%)
 delete mode 100644 package/ejabberd/0003-remove-testing-with-MySQL-and-PostgreSQL.patch
 rename package/ejabberd/{0005-correct-include.patch => 0004-correct-include.patch} (88%)
 rename package/ejabberd/{0006-disable-ERLANG_DEPRECATED_CHECK.patch => 0005-disable-ERLANG_DEPRECATED_CHECK.patch} (75%)
 rename package/ejabberd/{0007-fix-install-permissions.patch => 0006-fix-install-permissions.patch} (78%)
 rename package/ejabberd/{0008-fix-ejabberdctl.patch => 0007-fix-ejabberdctl.patch} (86%)

diff --git a/package/ejabberd/0001-remove-make-targets-for-deps.patch b/package/ejabberd/0001-remove-make-targets-for-deps.patch
index 060c407..6917f71 100644
--- a/package/ejabberd/0001-remove-make-targets-for-deps.patch
+++ b/package/ejabberd/0001-remove-make-targets-for-deps.patch
@@ -1,29 +1,76 @@
-From a4910ec9257d0743e42c4b1650b6ef60196a013d Mon Sep 17 00:00:00 2001
+From 21d1f05a8882657c151397d0e4723535402f1757 Mon Sep 17 00:00:00 2001
 From: Philipp Huebner <debalance@debian.org>
-Date: Sun, 21 Feb 2016 10:52:53 -0500
+Date: Wed, 20 Jan 2016 10:22:57 -0500
 Subject: [PATCH] remove make targets for deps
 
 Without this patch, dependencies would be downloaded and compiled
 using rebar at build time.
+
+Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
 ---
- rebar.config.script | 4 +---
- 1 file changed, 1 insertion(+), 3 deletions(-)
+ Makefile.in | 26 +++-----------------------
+ 1 file changed, 3 insertions(+), 23 deletions(-)
 
-diff --git a/rebar.config.script b/rebar.config.script
-index 833595d..1b6177d 100644
---- a/rebar.config.script
-+++ b/rebar.config.script
-@@ -192,9 +192,7 @@ Config = [{erl_opts, Macros ++ HiPE ++ DebugInfo ++
-           {xref_checks, []},
- 	  {xref_queries,
- 	   [{"(XC - UC) || (XU - X - B - "
--	     ++ string:join(CfgXrefs, " - ") ++ ")", []}]},
--          {post_hooks, PostHooks ++ CfgPostHooks},
--          {deps, AllDeps}] ++ ElixirConfig,
-+	     ++ string:join(CfgXrefs, " - ") ++ ")", []}]}],
- %%io:format("ejabberd configuration:~n  ~p~n", [Config]),
- Config.
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
  
+-deps := $(wildcard deps/*/ebin)
+-
+ dialyzer/erlang.plt:
+ 	@mkdir -p dialyzer
+ 	@dialyzer --build_plt --output_plt dialyzer/erlang.plt \
 -- 
 2.5.0
 
diff --git a/package/ejabberd/0002-remove-dependencies-from-rebar-config.patch b/package/ejabberd/0002-remove-dependencies-from-rebar-config.patch
new file mode 100644
index 0000000..9dcea1c
--- /dev/null
+++ b/package/ejabberd/0002-remove-dependencies-from-rebar-config.patch
@@ -0,0 +1,85 @@
+From d399ecdd99e62b5554210a3b5c733e738e4d54be Mon Sep 17 00:00:00 2001
+From: Philipp Huebner <debalance@debian.org>
+Date: Wed, 20 Jan 2016 08:08:42 -0500
+Subject: [PATCH] remove dependencies from rebar config
+
+Without this patch, dependencies would be downloaded and compiled
+by rebar at build time.
+
+Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
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
diff --git a/package/ejabberd/0002-remove-make-targets-for-deps.patch b/package/ejabberd/0002-remove-make-targets-for-deps.patch
deleted file mode 100644
index 757ae38..0000000
--- a/package/ejabberd/0002-remove-make-targets-for-deps.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-From 9ab065047fab913b7250525a51b9c9ad6f3a3478 Mon Sep 17 00:00:00 2001
-From: Philipp Huebner <debalance@debian.org>
-Date: Sun, 21 Feb 2016 10:55:14 -0500
-Subject: [PATCH] remove make targets for deps
-
-Without this patch, dependencies would be downloaded and compiled
-using rebar at build time.
----
- Makefile.in | 32 ++++----------------------------
- 1 file changed, 4 insertions(+), 28 deletions(-)
-
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
--- 
-2.5.0
-
diff --git a/package/ejabberd/0004-remove-checking-erlang-version.patch b/package/ejabberd/0003-remove-checking-erlang-version.patch
similarity index 75%
rename from package/ejabberd/0004-remove-checking-erlang-version.patch
rename to package/ejabberd/0003-remove-checking-erlang-version.patch
index 8997cca..ebcdd54 100644
--- a/package/ejabberd/0004-remove-checking-erlang-version.patch
+++ b/package/ejabberd/0003-remove-checking-erlang-version.patch
@@ -1,17 +1,17 @@
-From bec405139144c8901b7d3771f5f658a3fed64b8a Mon Sep 17 00:00:00 2001
+From f384518dedec4ad657ad69d55754076c13c22d96 Mon Sep 17 00:00:00 2001
 From: Johan Oudinet <johan.oudinet@gmail.com>
-Date: Sun, 21 Feb 2016 11:00:24 -0500
+Date: Wed, 20 Jan 2016 08:11:32 -0500
 Subject: [PATCH] remove checking erlang version
 
-Without this patch, the configure will try to run erlang to simply
-check if the version is supported by ejabberd. Instead, we do this test
+Without this patch, the configure will try to run erlang to simply check
+if the version is supported by ejabberd. Instead, we do this test
 statically.
 ---
  configure.ac | 2 --
  1 file changed, 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index d5f313e..4b35d57 100644
+index 97e89a2..cd1ab08 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -39,10 +39,8 @@ AC_ARG_ENABLE(erlang-version-check,
diff --git a/package/ejabberd/0003-remove-testing-with-MySQL-and-PostgreSQL.patch b/package/ejabberd/0003-remove-testing-with-MySQL-and-PostgreSQL.patch
deleted file mode 100644
index 316406a..0000000
--- a/package/ejabberd/0003-remove-testing-with-MySQL-and-PostgreSQL.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From a4192bbd52250bd52d80b05f81cd5645abc650dc Mon Sep 17 00:00:00 2001
-From: Philipp Huebner <debalance@debian.org>
-Date: Sun, 21 Feb 2016 10:59:14 -0500
-Subject: [PATCH] remove testing with MySQL and PostgreSQL
-
-Without this patch a test would be initiated after building ejabberd
-that requires specially configured instances of MySQL and PostgreSQL
-to be up and running.
----
- Makefile.in | 6 ------
- 1 file changed, 6 deletions(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index b9d783a..9cd905f 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -282,14 +282,8 @@ dialyzer: erlang_plt deps_plt ejabberd_plt
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
--- 
-2.5.0
-
diff --git a/package/ejabberd/0005-correct-include.patch b/package/ejabberd/0004-correct-include.patch
similarity index 88%
rename from package/ejabberd/0005-correct-include.patch
rename to package/ejabberd/0004-correct-include.patch
index dc2d1c3..fd1dee2 100644
--- a/package/ejabberd/0005-correct-include.patch
+++ b/package/ejabberd/0004-correct-include.patch
@@ -1,6 +1,6 @@
-From 9878a2cfb1a927f4b42f1c4d08df434084739626 Mon Sep 17 00:00:00 2001
+From 705a9ad229de49cd9cce226a2025716902455663 Mon Sep 17 00:00:00 2001
 From: Philipp Huebner <debalance@debian.org>
-Date: Sun, 21 Feb 2016 11:01:42 -0500
+Date: Wed, 20 Jan 2016 08:13:21 -0500
 Subject: [PATCH] correct include
 
 This part of the code was moved into it's own project and was packaged
@@ -13,7 +13,7 @@ necessary.
  3 files changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/src/mod_sip.erl b/src/mod_sip.erl
-index 1e4044b..4279b64 100644
+index c8c9533..7f188a0 100644
 --- a/src/mod_sip.erl
 +++ b/src/mod_sip.erl
 @@ -38,7 +38,7 @@
@@ -26,7 +26,7 @@ index 1e4044b..4279b64 100644
  %%%===================================================================
  %%% API
 diff --git a/src/mod_sip_proxy.erl b/src/mod_sip_proxy.erl
-index a0dff12..b5794fa 100644
+index bf297bc..d8b65cd 100644
 --- a/src/mod_sip_proxy.erl
 +++ b/src/mod_sip_proxy.erl
 @@ -40,7 +40,7 @@
@@ -39,7 +39,7 @@ index a0dff12..b5794fa 100644
  -define(SIGN_LIFETIME, 300). %% in seconds.
  
 diff --git a/src/mod_sip_registrar.erl b/src/mod_sip_registrar.erl
-index f6b3103..1061c88 100644
+index 44091ed..4d2ec82 100644
 --- a/src/mod_sip_registrar.erl
 +++ b/src/mod_sip_registrar.erl
 @@ -37,7 +37,7 @@
diff --git a/package/ejabberd/0006-disable-ERLANG_DEPRECATED_CHECK.patch b/package/ejabberd/0005-disable-ERLANG_DEPRECATED_CHECK.patch
similarity index 75%
rename from package/ejabberd/0006-disable-ERLANG_DEPRECATED_CHECK.patch
rename to package/ejabberd/0005-disable-ERLANG_DEPRECATED_CHECK.patch
index ea52b3e..4b68f5f 100644
--- a/package/ejabberd/0006-disable-ERLANG_DEPRECATED_CHECK.patch
+++ b/package/ejabberd/0005-disable-ERLANG_DEPRECATED_CHECK.patch
@@ -1,6 +1,6 @@
-From 615eae56cabd7d15a8f62b6f50e598818932c9ca Mon Sep 17 00:00:00 2001
+From d43a65b112ec995a5ee52aca2a16e5cf9699d7c1 Mon Sep 17 00:00:00 2001
 From: Johan Oudinet <johan.oudinet@gmail.com>
-Date: Sun, 21 Feb 2016 11:02:33 -0500
+Date: Wed, 20 Jan 2016 08:16:26 -0500
 Subject: [PATCH] disable ERLANG_DEPRECATED_CHECK
 
 Without this patch, the configure will try to execute erlang to check
@@ -10,10 +10,10 @@ if it uses deprecated types. Assume the answer is false.
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 4b35d57..da87585 100644
+index cd1ab08..a4f1533 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -243,7 +243,7 @@ if test "$ENABLEUSER" != ""; then
+@@ -235,7 +235,7 @@ if test "$ENABLEUSER" != ""; then
    AC_SUBST([INSTALLUSER], [$ENABLEUSER])
  fi
  
diff --git a/package/ejabberd/0007-fix-install-permissions.patch b/package/ejabberd/0006-fix-install-permissions.patch
similarity index 78%
rename from package/ejabberd/0007-fix-install-permissions.patch
rename to package/ejabberd/0006-fix-install-permissions.patch
index e30b49e..4d77044 100644
--- a/package/ejabberd/0007-fix-install-permissions.patch
+++ b/package/ejabberd/0006-fix-install-permissions.patch
@@ -1,20 +1,22 @@
-From 0f4db8755263c0825b02b4197cdb64b11fb8c638 Mon Sep 17 00:00:00 2001
+From ef847479778cc58818e066b87aa1789ba1c4148b Mon Sep 17 00:00:00 2001
 From: Johan Oudinet <johan.oudinet@gmail.com>
-Date: Sun, 21 Feb 2016 11:03:16 -0500
+Date: Wed, 20 Jan 2016 09:34:07 -0500
 Subject: [PATCH] fix install permissions
 
 Without this patch, the makefile will try to install directories and
 files with incompatible permissions for ejabberd, which run as an
 ejabberd user.
+
+Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
 ---
- Makefile.in | 40 ++++++----------------------------------
- 1 file changed, 6 insertions(+), 34 deletions(-)
+ Makefile.in | 38 +++++---------------------------------
+ 1 file changed, 5 insertions(+), 33 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 9cd905f..442b851 100644
+index 2a6457c..0be4c50 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -122,10 +122,8 @@ copy-files: $(call TO_DEST,$(MAIN_FILES))
+@@ -155,10 +155,8 @@ copy-files-sub: copy-files-sub2
  install: all copy-files
  	#
  	# Configuration files
@@ -27,7 +29,7 @@ index 9cd905f..442b851 100644
  	$(SED) -e "s*{{rootdir}}*@prefix@*" \
  		-e "s*{{installuser}}*@INSTALLUSER@*" \
  		-e "s*{{bindir}}*@bindir@*" \
-@@ -135,14 +133,11 @@ install: all copy-files
+@@ -168,14 +166,11 @@ install: all copy-files
  		-e "s*{{docdir}}*@docdir@*" \
  		-e "s*{{erl}}*@ERL@*" ejabberdctl.template \
  		> ejabberdctl.example
@@ -45,16 +47,10 @@ index 9cd905f..442b851 100644
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
diff --git a/package/ejabberd/0008-fix-ejabberdctl.patch b/package/ejabberd/0007-fix-ejabberdctl.patch
similarity index 86%
rename from package/ejabberd/0008-fix-ejabberdctl.patch
rename to package/ejabberd/0007-fix-ejabberdctl.patch
index fc23fff..36aa3a7 100644
--- a/package/ejabberd/0008-fix-ejabberdctl.patch
+++ b/package/ejabberd/0007-fix-ejabberdctl.patch
@@ -1,6 +1,6 @@
-From dc6046d9eaef16dc4e9fcda2021219910bfea0de Mon Sep 17 00:00:00 2001
+From 53d7d654026afa163a55b860e33c6901129e8dc1 Mon Sep 17 00:00:00 2001
 From: Johan Oudinet <johan.oudinet@gmail.com>
-Date: Sun, 21 Feb 2016 11:03:58 -0500
+Date: Wed, 20 Jan 2016 09:35:07 -0500
 Subject: [PATCH] fix ejabberdctl
 
 Change default values so ejabberdctl run commands as ejabberd user
@@ -12,7 +12,7 @@ Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/ejabberdctl.template b/ejabberdctl.template
-index c7d76ef..a7afce1 100755
+index f65c21f..ff9225f 100755
 --- a/ejabberdctl.template
 +++ b/ejabberdctl.template
 @@ -14,9 +14,12 @@ SCRIPT_DIR=`cd ${0%/*} && pwd`
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
