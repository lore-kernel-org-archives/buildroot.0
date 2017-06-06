From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue,  6 Jun 2017 16:33:11 +0200
Subject: [Buildroot] [PATCH v3 2/2] ejabberd: bump to version 17.04
In-Reply-To: <20170606143311.3354-1-johan.oudinet@gmail.com>
References: <20170606143311.3354-1-johan.oudinet@gmail.com>
Message-ID: <20170606143311.3354-2-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There are new dependencies: erlang-p1-jiffy, erlang-p1-oauth2,
erlang-p1-stun, erlang-p1-tls, erlang-p1-utils, erlang-p1-xmpp

as well as two host dependencies on erlang-p1-utils and
erlang-p1-xmpp. Otherwise the compilation via rebar fails.

4 patches have been refreshed and a new patch have been introduced to
tell rebar to use host dependencies instead of trying to download them.
Hopefully this patch could be drop in ejabberd 17.06. Missing SoB in
patches have been added as well.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>

---
Changes v2 -> v3:
 - Add changes to package/ejabberd/Config.in that have been introduced
  to another commit by mistake (suggested by Thomas Petazzoni)
 - Add missing SoB in patches (suggested by the check-package script)

Changes v1 -> v2:
 - Describe in the commit log the new dependencies and patches
---
 .../0001-remove-make-targets-for-deps.patch        |  42 +------
 ...002-remove-dependencies-from-rebar-config.patch | 129 +++++++++++----------
 .../0003-remove-checking-erlang-version.patch      |   2 +
 package/ejabberd/0004-correct-include.patch        |   2 +
 .../0005-disable-ERLANG_DEPRECATED_CHECK.patch     |   2 +
 .../ejabberd/0006-fix-install-permissions.patch    |  42 +++----
 package/ejabberd/0007-fix-ejabberdctl.patch        |  12 +-
 .../0008-rebar-uses-host-dependencies.patch        |  33 ++++++
 package/ejabberd/Config.in                         |   8 +-
 package/ejabberd/ejabberd.hash                     |   4 +-
 package/ejabberd/ejabberd.mk                       |   6 +-
 11 files changed, 149 insertions(+), 133 deletions(-)
 create mode 100644 package/ejabberd/0008-rebar-uses-host-dependencies.patch

diff --git a/package/ejabberd/0001-remove-make-targets-for-deps.patch b/package/ejabberd/0001-remove-make-targets-for-deps.patch
index 6917f71f31..aee09670a1 100644
--- a/package/ejabberd/0001-remove-make-targets-for-deps.patch
+++ b/package/ejabberd/0001-remove-make-targets-for-deps.patch
@@ -7,21 +7,18 @@ Without this patch, dependencies would be downloaded and compiled
 using rebar at build time.
 
 Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
----
- Makefile.in | 26 +++-----------------------
- 1 file changed, 3 insertions(+), 23 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 08cd837..2a6457c 100644
+index a0b4553d..4190a515 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -77,26 +77,11 @@ else
    INIT_USER=$(INSTALLUSER)
  endif
- 
+
 -all: deps src
 +all: src
- 
+
 -deps: deps/.got
 -
 -deps/.got:
@@ -35,7 +32,7 @@ index 08cd837..2a6457c 100644
 -src: deps/.built
 +src:
  	$(REBAR) skip_deps=true compile
- 
+
 -update:
 -	rm -rf deps/.got
 -	rm -rf deps/.built
@@ -43,34 +40,3 @@ index 08cd837..2a6457c 100644
 -
  xref: all
  	$(REBAR) skip_deps=true xref
- 
-@@ -152,16 +137,13 @@ $(foreach file,$(DEPS_FILES_FILTERED) $(MAIN_FILES),$(eval $(call COPY_template,
- $(sort $(call TO_DEST,$(MAIN_DIRS) $(DEPS_DIRS))):
- 	$(INSTALL) -d $@
- 
--$(call TO_DEST,deps/p1_pam/priv/bin/epam): $(LIBDIR)/%: deps/p1_pam/priv/bin/epam $(call TO_DEST,deps/p1_pam/priv/bin/)
--	$(INSTALL) -m 750 $(O_USER) $< $@
--
- $(call TO_DEST,priv/sql/lite.sql): sql/lite.sql $(call TO_DEST,priv/sql)
- 	$(INSTALL) -m 644 $< $@
- 
- $(call TO_DEST,priv/bin/captcha.sh): tools/captcha.sh $(call TO_DEST,priv/bin)
- 	$(INSTALL) -m 750 $(O_USER) $< $@
- 
--copy-files-sub2: $(call TO_DEST,$(DEPS_FILES) $(MAIN_FILES) priv/bin/captcha.sh priv/sql/lite.sql)
-+copy-files-sub2: $(call TO_DEST,$(MAIN_FILES) priv/bin/captcha.sh priv/sql/lite.sql)
- 
- endif
- 
-@@ -287,8 +269,6 @@ TAGS:
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
diff --git a/package/ejabberd/0002-remove-dependencies-from-rebar-config.patch b/package/ejabberd/0002-remove-dependencies-from-rebar-config.patch
index 9dcea1c320..bcf1e8a5ee 100644
--- a/package/ejabberd/0002-remove-dependencies-from-rebar-config.patch
+++ b/package/ejabberd/0002-remove-dependencies-from-rebar-config.patch
@@ -7,79 +7,88 @@ Without this patch, dependencies would be downloaded and compiled
 by rebar at build time.
 
 Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
----
- rebar.config | 51 ---------------------------------------------------
- 1 file changed, 51 deletions(-)
 
 diff --git a/rebar.config b/rebar.config
-index 30c0360..d6a5b4d 100644
+index aef3a017..71937023 100644
 --- a/rebar.config
 +++ b/rebar.config
-@@ -7,48 +7,6 @@
- %%% Created :  1 May 2013 by Evgeniy Khramtsov <ekhramtsov@process-one.net>
- %%%-------------------------------------------------------------------
- 
--{deps, [{if_var_true, lager, {lager, ".*", {git, "https://github.com/basho/lager", {tag, "3.0.2"}}}},
--        {if_var_false, lager, {p1_logger, ".*", {git, "https://github.com/processone/p1_logger", {tag, "1.0.0"}}}},
--        {p1_utils, ".*", {git, "https://github.com/processone/p1_utils", {tag, "1.0.2"}}},
--        {cache_tab, ".*", {git, "https://github.com/processone/cache_tab", {tag, "1.0.1"}}},
--        {p1_tls, ".*", {git, "https://github.com/processone/tls", {tag, "1.0.0"}}},
--        {p1_stringprep, ".*", {git, "https://github.com/processone/stringprep", {tag, "1.0.0"}}},
--        {p1_xml, ".*", {git, "https://github.com/processone/xml", {tag, "1.1.1"}}},
--        {p1_stun, ".*", {git, "https://github.com/processone/stun", "0.9.0"}},
--        {esip, ".*", {git, "https://github.com/processone/p1_sip", "1.0.0"}},
--        {p1_yaml, ".*", {git, "https://github.com/processone/p1_yaml", {tag, "1.0.0"}}},
--        {jiffy, ".*", {git, "https://github.com/davisp/jiffy", {tag, "0.14.5"}}},
--        {oauth2, ".*", {git, "https://github.com/kivra/oauth2", "8d129fbf8866930b4ffa6dd84e65bd2b32b9acb8"}},
--        {xmlrpc, ".*", {git, "https://github.com/rds13/xmlrpc", {tag, "1.15"}}},
--        {if_var_true, mysql, {p1_mysql, ".*", {git, "https://github.com/processone/mysql", {tag, "1.0.0"}}}},
--        {if_var_true, pgsql, {p1_pgsql, ".*", {git, "https://github.com/processone/pgsql", {tag, "1.0.0"}}}},
--        {if_var_true, sqlite, {sqlite3, ".*", {git, "https://github.com/alexeyr/erlang-sqlite3", "cbc3505f7a131254265d3ef56191b2581b8cc172"}}},
--        {if_var_true, pam, {p1_pam, ".*", {git, "https://github.com/processone/epam", {tag, "1.0.0"}}}},
--        {if_var_true, zlib, {p1_zlib, ".*", {git, "https://github.com/processone/zlib", {tag, "1.0.0"}}}},
--        {if_var_true, riak, {hamcrest, ".*", {git, "https://github.com/hyperthunk/hamcrest-erlang", "908a24fda4a46776a5135db60ca071e3d783f9f6"}}},  % for riak_pb-2.1.0.7
--        {if_var_true, riak, {riakc, ".*", {git, "https://github.com/basho/riak-erlang-client", "527722d12d0433b837cdb92a60900c2cb5df8942"}}},
--        {if_var_true, elixir, {elixir, ".*", {git, "https://github.com/elixir-lang/elixir", {tag, "v1.1.0"}}}},
--        {if_var_true, elixir, {rebar_elixir_plugin, ".*", {git, "https://github.com/processone/rebar_elixir_plugin", "0.1.0"}}},
--        {if_var_true, iconv, {p1_iconv, ".*", {git, "https://github.com/processone/eiconv", {tag, "0.9.0"}}}},
--        {if_var_true, tools, {meck, "0.8.2", {git, "https://github.com/eproxus/meck", {tag, "0.8.2"}}}},
--        {if_var_true, redis, {eredis, ".*", {git, "https://github.com/wooga/eredis", {tag, "v1.0.8"}}}}]}.
+@@ -18,63 +18,6 @@
+ %%%
+ %%%----------------------------------------------------------------------
+
+-{deps, [{lager, ".*", {git, "https://github.com/basho/lager", {tag, "3.2.1"}}},
+-        {p1_utils, ".*", {git, "https://github.com/processone/p1_utils", {tag, "1.0.8"}}},
+-        {cache_tab, ".*", {git, "https://github.com/processone/cache_tab", {tag, "1.0.7"}}},
+-        {fast_tls, ".*", {git, "https://github.com/processone/fast_tls", {tag, "1.0.11"}}},
+-        {stringprep, ".*", {git, "https://github.com/processone/stringprep", {tag, "1.0.8"}}},
+-        {fast_xml, ".*", {git, "https://github.com/processone/fast_xml", {tag, "1.1.21"}}},
+-        {xmpp, ".*", {git, "https://github.com/processone/xmpp", {tag, "1.1.9"}}},
+-        {stun, ".*", {git, "https://github.com/processone/stun", {tag, "1.0.10"}}},
+-        {esip, ".*", {git, "https://github.com/processone/esip", {tag, "1.0.11"}}},
+-        {fast_yaml, ".*", {git, "https://github.com/processone/fast_yaml", {tag, "1.0.9"}}},
+-        {jiffy, ".*", {git, "https://github.com/davisp/jiffy", {tag, "0.14.8"}}},
+-        {p1_oauth2, ".*", {git, "https://github.com/processone/p1_oauth2", {tag, "0.6.1"}}},
+-        {luerl, ".*", {git, "https://github.com/rvirding/luerl", {tag, "v0.2"}}},
+-        {if_var_true, mysql, {p1_mysql, ".*", {git, "https://github.com/processone/p1_mysql",
+-                                               {tag, "1.0.2"}}}},
+-        {if_var_true, pgsql, {p1_pgsql, ".*", {git, "https://github.com/processone/p1_pgsql",
+-                                               {tag, "1.1.2"}}}},
+-        {if_var_true, sqlite, {sqlite3, ".*", {git, "https://github.com/processone/erlang-sqlite3",
+-                                               {tag, "1.1.5"}}}},
+-        {if_var_true, pam, {epam, ".*", {git, "https://github.com/processone/epam",
+-                                           {tag, "1.0.2"}}}},
+-        {if_var_true, zlib, {ezlib, ".*", {git, "https://github.com/processone/ezlib",
+-                                           {tag, "1.0.2"}}}},
+-        {if_var_true, riak, {riakc, ".*", {git, "https://github.com/basho/riak-erlang-client",
+-                                           {tag, "2.4.1"}}}},
+-	%% Elixir support, needed to run tests
+-        {if_var_true, elixir, {elixir, ".*", {git, "https://github.com/elixir-lang/elixir",
+-                                              {tag, {if_version_above, "17", "v1.2.6", "v1.1.1"}}}}},
+-        %% TODO: When modules are fully migrated to new structure and mix, we will not need anymore rebar_elixir_plugin
+-	{if_not_rebar3, {if_var_true, elixir, {rebar_elixir_plugin, ".*",
+-					       {git, "https://github.com/processone/rebar_elixir_plugin", "0.1.0"}}}},
+-        {if_var_true, iconv, {iconv, ".*", {git, "https://github.com/processone/iconv",
+-                                            {tag, "1.0.4"}}}},
+-        {if_var_true, tools, {meck, "0.8.*", {git, "https://github.com/eproxus/meck",
+-                                              {tag, "0.8.4"}}}},
+-        {if_var_true, tools, {moka, ".*", {git, "https://github.com/processone/moka.git",
+-                                           {tag, "1.0.5c"}}}},
+-        {if_var_true, redis, {eredis, ".*", {git, "https://github.com/wooga/eredis",
+-                                             {tag, "v1.0.8"}}}}]}.
 -
 -{if_var_true, latest_deps,
-- {floating_deps, [p1_logger,
--                  cache_tab,
--                  p1_tls,
--                  p1_stringprep,
--                  p1_xml,
+- {floating_deps, [cache_tab,
+-                  fast_tls,
+-                  stringprep,
+-                  fast_xml,
 -                  esip,
--                  p1_stun,
--                  p1_yaml,
+-                  luerl,
+-                  stun,
+-                  fast_yaml,
+-		  xmpp,
 -                  p1_utils,
 -                  p1_mysql,
 -                  p1_pgsql,
--                  p1_pam,
--                  p1_zlib,
--                  p1_iconv]}}.
+-                  epam,
+-                  ezlib,
+-                  iconv]}}.
 -
+ {erl_first_files, ["src/ejabberd_config.erl", "src/gen_mod.erl", "src/mod_muc_room.erl"]}.
+
  {erl_opts, [nowarn_deprecated_function,
-             {if_var_true, roster_gateway_workaround, {d, 'ROSTER_GATWAY_WORKAROUND'}},
-             {if_var_match, db_type, mssql, {d, 'mssql'}},
-@@ -92,15 +50,6 @@
- 
- {eunit_compile_opts, [{i, "tools"}]}.
- 
--{post_hook_configure, [{"p1_tls", []},
--                       {"p1_stringprep", []},
--                       {"p1_yaml", []},
+@@ -142,15 +85,6 @@
+ {if_version_above, "17", {cover_enabled, true}}.
+ {cover_export_enabled, true}.
+
+-{post_hook_configure, [{"fast_tls", []},
+-                       {"stringprep", []},
+-                       {"fast_yaml", []},
 -                       {"esip", []},
--                       {"p1_xml", [{if_var_true, full_xml, "--enable-full-xml"}]},
--                       {if_var_true, pam, {"p1_pam", []}},
--                       {if_var_true, zlib, {"p1_zlib", []}},
--                       {if_var_true, iconv, {"p1_iconv", []}}]}.
+-                       {"fast_xml", [{if_var_true, full_xml, "--enable-full-xml"}]},
+-                       {if_var_true, pam, {"epam", []}},
+-                       {if_var_true, zlib, {"ezlib", []}},
+-                       {if_var_true, iconv, {"iconv", []}}]}.
 -
  {port_env, [{"CFLAGS", "-g -O2 -Wall"}]}.
- 
- {port_specs, [{"priv/lib/jid.so", ["c_src/jid.c"]}]}.
--- 
-2.5.0
 
+ {port_specs, [{"priv/lib/jid.so", ["c_src/jid.c"]}]}.
diff --git a/package/ejabberd/0003-remove-checking-erlang-version.patch b/package/ejabberd/0003-remove-checking-erlang-version.patch
index ebcdd54645..da3bf2a89e 100644
--- a/package/ejabberd/0003-remove-checking-erlang-version.patch
+++ b/package/ejabberd/0003-remove-checking-erlang-version.patch
@@ -6,6 +6,8 @@ Subject: [PATCH] remove checking erlang version
 Without this patch, the configure will try to run erlang to simply check
 if the version is supported by ejabberd. Instead, we do this test
 statically.
+
+Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
 ---
  configure.ac | 2 --
  1 file changed, 2 deletions(-)
diff --git a/package/ejabberd/0004-correct-include.patch b/package/ejabberd/0004-correct-include.patch
index fd1dee2850..4db7395f75 100644
--- a/package/ejabberd/0004-correct-include.patch
+++ b/package/ejabberd/0004-correct-include.patch
@@ -6,6 +6,8 @@ Subject: [PATCH] correct include
 This part of the code was moved into it's own project and was packaged
 separately by me. To make the build process work, this small fix is
 necessary.
+
+Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
 ---
  src/mod_sip.erl           | 2 +-
  src/mod_sip_proxy.erl     | 2 +-
diff --git a/package/ejabberd/0005-disable-ERLANG_DEPRECATED_CHECK.patch b/package/ejabberd/0005-disable-ERLANG_DEPRECATED_CHECK.patch
index 4b68f5ff85..09b356219d 100644
--- a/package/ejabberd/0005-disable-ERLANG_DEPRECATED_CHECK.patch
+++ b/package/ejabberd/0005-disable-ERLANG_DEPRECATED_CHECK.patch
@@ -5,6 +5,8 @@ Subject: [PATCH] disable ERLANG_DEPRECATED_CHECK
 
 Without this patch, the configure will try to execute erlang to check
 if it uses deprecated types. Assume the answer is false.
+
+Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/package/ejabberd/0006-fix-install-permissions.patch b/package/ejabberd/0006-fix-install-permissions.patch
index 4d77044902..9a0073f5c2 100644
--- a/package/ejabberd/0006-fix-install-permissions.patch
+++ b/package/ejabberd/0006-fix-install-permissions.patch
@@ -8,15 +8,12 @@ files with incompatible permissions for ejabberd, which run as an
 ejabberd user.
 
 Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
----
- Makefile.in | 38 +++++---------------------------------
- 1 file changed, 5 insertions(+), 33 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 2a6457c..0be4c50 100644
+index a0b4553d..2cae2db4 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -155,10 +155,8 @@ copy-files-sub: copy-files-sub2
+@@ -169,10 +169,8 @@ copy-files-sub: copy-files-sub2
  install: all copy-files
  	#
  	# Configuration files
@@ -26,12 +23,12 @@ index 2a6457c..0be4c50 100644
 -		|| $(INSTALL) -b -m 640 $(G_USER) ejabberd.yml.example $(ETCDIR)/ejabberd.yml
 +	$(INSTALL) -d $(ETCDIR)
 +	$(INSTALL) -b -m 644 ejabberd.yml.example $(ETCDIR)/ejabberd.yml
- 	$(SED) -e "s*{{rootdir}}*@prefix@*" \
- 		-e "s*{{installuser}}*@INSTALLUSER@*" \
- 		-e "s*{{bindir}}*@bindir@*" \
-@@ -168,14 +166,11 @@ install: all copy-files
- 		-e "s*{{docdir}}*@docdir@*" \
- 		-e "s*{{erl}}*@ERL@*" ejabberdctl.template \
+ 	$(SED) -e "s*{{rootdir}}*@prefix@*g" \
+ 		-e "s*{{installuser}}*@INSTALLUSER@*g" \
+ 		-e "s*{{bindir}}*@bindir@*g" \
+@@ -183,53 +181,16 @@ install: all copy-files
+ 		-e "s*{{erl}}*@ERL@*g" \
+ 		-e "s*{{epmd}}*@EPMD@*g" ejabberdctl.template \
  		> ejabberdctl.example
 -	[ -f $(ETCDIR)/ejabberdctl.cfg ] \
 -		&& $(INSTALL) -b -m 640 $(G_USER) ejabberdctl.cfg.example $(ETCDIR)/ejabberdctl.cfg-new \
@@ -47,10 +44,19 @@ index 2a6457c..0be4c50 100644
  	# Elixir binaries
  	[ -d $(BINDIR) ] || $(INSTALL) -d -m 755 $(BINDIR)
  	[ -f deps/elixir/bin/iex ] && $(INSTALL) -m 550 $(G_USER) deps/elixir/bin/iex $(BINDIR)/iex || true
-@@ -187,29 +182,6 @@ install: all copy-files
- 		-e "s*@installuser@*$(INIT_USER)*" ejabberd.init.template \
- 		> ejabberd.init
- 	chmod 755 ejabberd.init
+ 	[ -f deps/elixir/bin/elixir ] && $(INSTALL) -m 550 $(G_USER) deps/elixir/bin/elixir $(BINDIR)/elixir || true
+ 	[ -f deps/elixir/bin/mix ] && $(INSTALL) -m 550 $(G_USER) deps/elixir/bin/mix $(BINDIR)/mix || true
+-	#
+-	# Init script
+-	$(SED) -e "s*@ctlscriptpath@*$(SBINDIR)*g" \
+-		-e "s*@installuser@*$(INIT_USER)*g" ejabberd.init.template \
+-		> ejabberd.init
+-	chmod 755 ejabberd.init
+-	#
+-	# Service script
+-	$(SED) -e "s*@ctlscriptpath@*$(SBINDIR)*g" ejabberd.service.template \
+-		> ejabberd.service
+-	chmod 644 ejabberd.service
 -	#
 -	# Spool directory
 -	$(INSTALL) -d -m 750 $(O_USER) $(SPOOLDIR)
@@ -74,9 +80,5 @@ index 2a6457c..0be4c50 100644
 -		&& $(INSTALL) -m 644 doc/guide.html $(DOCDIR) \
 -		|| echo "Documentation not included in sources"
 -	$(INSTALL) -m 644 COPYING $(DOCDIR)
- 
- uninstall: uninstall-binary
- 
--- 
-2.5.0
 
+ uninstall: uninstall-binary
diff --git a/package/ejabberd/0007-fix-ejabberdctl.patch b/package/ejabberd/0007-fix-ejabberdctl.patch
index 36aa3a707f..ab70d8900a 100644
--- a/package/ejabberd/0007-fix-ejabberdctl.patch
+++ b/package/ejabberd/0007-fix-ejabberdctl.patch
@@ -7,28 +7,22 @@ Change default values so ejabberdctl run commands as ejabberd user
 Also add a way for the user to change default values.
 
 Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
----
- ejabberdctl.template | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/ejabberdctl.template b/ejabberdctl.template
-index f65c21f..ff9225f 100755
+index 5b34ebee..51acaca8 100755
 --- a/ejabberdctl.template
 +++ b/ejabberdctl.template
 @@ -14,9 +14,12 @@ SCRIPT_DIR=`cd ${0%/*} && pwd`
  ERL={{erl}}
  IEX={{bindir}}/iex
- EPMD={{bindir}}/epmd
+ EPMD={{epmd}}
 -INSTALLUSER={{installuser}}
 +INSTALLUSER=ejabberd
  ERL_LIBS={{libdir}}
- 
+
 +# Read default configuration file if present
 +[ ! -r /etc/default/ejabberd ] || . /etc/default/ejabberd
 +
  # check the proper system user is used if defined
  if [ "$INSTALLUSER" != "" ] ; then
      EXEC_CMD="false"
--- 
-2.5.0
-
diff --git a/package/ejabberd/0008-rebar-uses-host-dependencies.patch b/package/ejabberd/0008-rebar-uses-host-dependencies.patch
new file mode 100644
index 0000000000..45f387993e
--- /dev/null
+++ b/package/ejabberd/0008-rebar-uses-host-dependencies.patch
@@ -0,0 +1,33 @@
+Fix location of rebar dependencies.
+
+Signed-off-by: Christophe Romain <cromain@process-one.net>
+
+diff --git a/rebar.config.script b/rebar.config.script
+index 19142b9e..9107af26 100644
+--- a/rebar.config.script
++++ b/rebar.config.script
+@@ -218,20 +218,10 @@ TestConfig = case file:read_file_info(TestConfigFile) of
+ 		     ""
+ 	     end,
+
+-ResolveDepPath = case IsRebar3 of
+-		     true ->
+-			 fun("deps/" ++ Rest) ->
+-				 Slash = string:str(Rest, "/"),
+-				 Dir = "_build/default/lib/" ++
+-				     string:sub_string(Rest, 1, Slash - 1),
+-				 Dir ++ string:sub_string(Rest, Slash);
+-			    (Path) ->
+-				 Path
+-			 end;
+-		     _ ->
+-			 fun(P) ->
+-				 P
+-			 end
++ResolveDepPath = fun("deps/fast_xml/include") -> code:lib_dir(p1_xml) ++ "/include";
++		    ("deps/xmpp/include") -> code:lib_dir(p1_xmpp) ++ "/include";
++		    ("deps/p1_utils/include") -> code:lib_dir(p1_utils) ++ "/include";
++		    (Path) -> Path
+ 		 end,
+
+ CtParams = fun(CompileOpts) ->
diff --git a/package/ejabberd/Config.in b/package/ejabberd/Config.in
index 5d176c3af6..a7542cd12d 100644
--- a/package/ejabberd/Config.in
+++ b/package/ejabberd/Config.in
@@ -1,13 +1,19 @@
 config BR2_PACKAGE_EJABBERD
 	bool "ejabberd"
 	depends on BR2_PACKAGE_ERLANG
-	depends on BR2_INSTALL_LIBSTDCPP # stringprep
+	depends on BR2_INSTALL_LIBSTDCPP # jiffy, stringprep
+	select BR2_PACKAGE_ERLANG_JIFFY
 	select BR2_PACKAGE_ERLANG_LAGER
 	select BR2_PACKAGE_ERLANG_P1_CACHE_TAB
 	select BR2_PACKAGE_ERLANG_P1_ICONV
+	select BR2_PACKAGE_ERLANG_P1_OAUTH2
 	select BR2_PACKAGE_ERLANG_P1_SIP
 	select BR2_PACKAGE_ERLANG_P1_STRINGPREP
+	select BR2_PACKAGE_ERLANG_P1_STUN
+	select BR2_PACKAGE_ERLANG_P1_TLS
+	select BR2_PACKAGE_ERLANG_P1_UTILS
 	select BR2_PACKAGE_ERLANG_P1_XML
+	select BR2_PACKAGE_ERLANG_P1_XMPP
 	select BR2_PACKAGE_ERLANG_P1_YAML
 	select BR2_PACKAGE_ERLANG_P1_ZLIB
 	select BR2_PACKAGE_GETENT
diff --git a/package/ejabberd/ejabberd.hash b/package/ejabberd/ejabberd.hash
index 4284eec8fb..24a26d21d9 100644
--- a/package/ejabberd/ejabberd.hash
+++ b/package/ejabberd/ejabberd.hash
@@ -1,4 +1,2 @@
-# From https://www.process-one.net/downloads/ejabberd/16.01/ejabberd-16.01.tgz.md5
-md5 5e525c25c8f04287217b8a9522d7c942 ejabberd-16.01.tgz
 # Locally computed
-sha256 e2cc479d5870539b2e6756690b227969c88a541d464d1fc6e1cbf7270ad7d681 ejabberd-16.01.tgz
+sha256 b8395bc65b09f135a60320b62338258acd6056cc241e9e245fde267fb18dd3c9 ejabberd-17.04.tgz
diff --git a/package/ejabberd/ejabberd.mk b/package/ejabberd/ejabberd.mk
index 66686616ce..a835bc4549 100644
--- a/package/ejabberd/ejabberd.mk
+++ b/package/ejabberd/ejabberd.mk
@@ -4,14 +4,16 @@
 #
 ################################################################################
 
-EJABBERD_VERSION = 16.01
+EJABBERD_VERSION = 17.04
 EJABBERD_SOURCE = ejabberd-$(EJABBERD_VERSION).tgz
 EJABBERD_SITE = https://www.process-one.net/downloads/ejabberd/$(EJABBERD_VERSION)
 EJABBERD_LICENSE = GPL-2.0+ with OpenSSL exception
 EJABBERD_LICENSE_FILES = COPYING
 EJABBERD_DEPENDENCIES = getent openssl host-erlang-lager erlang-lager \
 	erlang-p1-cache-tab erlang-p1-iconv erlang-p1-sip \
-	erlang-p1-stringprep erlang-p1-xml erlang-p1-yaml erlang-p1-zlib
+	erlang-p1-stringprep erlang-p1-stun erlang-p1-tls \
+	erlang-p1-utils erlang-p1-xml erlang-p1-xmpp erlang-p1-yaml \
+	erlang-p1-zlib host-erlang-p1-utils host-erlang-p1-xmpp
 
 # 0001-remove-make-targets-for-deps.patch updates Makefile.in
 EJABBERD_USE_AUTOCONF = YES
-- 
2.11.0
