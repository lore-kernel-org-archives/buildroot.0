From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Wed,  8 Jul 2015 11:54:14 +0200
Subject: [Buildroot] [PATCH 01/11] ejabberd: bump to version 15.06
In-Reply-To: <1436349264-11797-1-git-send-email-johan.oudinet@gmail.com>
References: <1436349264-11797-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <1436349264-11797-2-git-send-email-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adapt patches accordingly and add a dependency to getent.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/ejabberd/0001-remove-deps.patch            | 20 ++++---
 package/ejabberd/0002-disable-rebar-deps.patch     | 28 ++++++----
 package/ejabberd/0003-disable-test.patch           | 14 +++--
 ...006-disable-erlang-deprecated-types-check.patch | 20 +++++++
 package/ejabberd/0006-remove-doc.patch             | 26 ---------
 .../ejabberd/0007-fix-install-permissions.patch    | 64 ++++++++++++----------
 .../ejabberd/0008-add-ac_config_macro_dir.patch    | 30 ++++++++++
 package/ejabberd/Config.in                         |  1 +
 package/ejabberd/ejabberd.mk                       |  4 +-
 9 files changed, 126 insertions(+), 81 deletions(-)
 create mode 100644 package/ejabberd/0006-disable-erlang-deprecated-types-check.patch
 delete mode 100644 package/ejabberd/0006-remove-doc.patch
 create mode 100644 package/ejabberd/0008-add-ac_config_macro_dir.patch

diff --git a/package/ejabberd/0001-remove-deps.patch b/package/ejabberd/0001-remove-deps.patch
index 1982ca8..ffe2106 100644
--- a/package/ejabberd/0001-remove-deps.patch
+++ b/package/ejabberd/0001-remove-deps.patch
@@ -5,16 +5,18 @@ Author: Philipp Huebner <debalance@debian.org>
 
 Index: ejabberd/rebar.config.script
 ===================================================================
---- ejabberd.orig/rebar.config.script
-+++ ejabberd/rebar.config.script
-@@ -126,9 +126,7 @@ Config = [{erl_opts, Macros ++ HiPE ++ D
-           {sub_dirs, ["rel"]},
-           {keep_build_info, true},
-           {ct_extra_params, "-include "
--           ++ filename:join([Cwd, "tools"])},
+diff --git a/rebar.config.script b/rebar.config.script
+index b4dfaa3..9152c12 100644
+--- a/rebar.config.script
++++ b/rebar.config.script
+@@ -183,9 +183,7 @@ Config = [{erl_opts, Macros ++ HiPE ++ DebugInfo ++
+           {xref_checks, []},
+ 	  {xref_queries,
+ 	   [{"(XC - UC) || (XU - X - B - "
+-	     ++ string:join(CfgXrefs, " - ") ++ ")", []}]},
 -          {post_hooks, PostHooks ++ CfgPostHooks},
--          {deps, Deps ++ CfgDeps}],
-+           ++ filename:join([Cwd, "tools"])}],
+-          {deps, Deps ++ CfgDeps}] ++ ElixirConfig,
++	     ++ string:join(CfgXrefs, " - ") ++ ")", []}]}],
  %%io:format("ejabberd configuration:~n  ~p~n", [Config]),
  Config.
  
diff --git a/package/ejabberd/0002-disable-rebar-deps.patch b/package/ejabberd/0002-disable-rebar-deps.patch
index 80217ca..1ea40de 100644
--- a/package/ejabberd/0002-disable-rebar-deps.patch
+++ b/package/ejabberd/0002-disable-rebar-deps.patch
@@ -5,9 +5,11 @@ Author: Philipp Huebner <debalance@debian.org>
 
 Index: ejabberd/Makefile.in
 ===================================================================
---- ejabberd.orig/Makefile.in
-+++ ejabberd/Makefile.in
-@@ -68,26 +68,11 @@ else
+diff --git a/Makefile.in b/Makefile.in
+index ffd1d30..09cb8d7 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -74,26 +74,11 @@ else
    INIT_USER=$(INSTALLUSER)
  endif
  
@@ -33,10 +35,10 @@ Index: ejabberd/Makefile.in
 -	rm -rf deps/.built
 -	$(REBAR) update-deps && :> deps/.got
 -
- translations:
- 	contrib/extract_translations/prepare-translation.sh -updateall
+ xref: all
+ 	$(REBAR) skip_deps=true xref
  
-@@ -103,8 +88,6 @@ spec:
+@@ -109,8 +94,6 @@ spec:
  	$(ERL) -noinput +B -pa ebin -pa deps/*/ebin -eval \
  	'case xml_gen:compile("tools/xmpp_codec.spec") of ok -> halt(0); _ -> halt(1) end.'
  
@@ -45,14 +47,16 @@ Index: ejabberd/Makefile.in
  install: all
  	#
  	# Configuration files
-@@ -139,14 +122,11 @@ install: all
+@@ -151,8 +134,6 @@ install: all
  	$(INSTALL) -d $(BEAMDIR)
  	$(INSTALL) -m 644 ebin/*.app $(BEAMDIR)
  	$(INSTALL) -m 644 ebin/*.beam $(BEAMDIR)
 -	$(INSTALL) -m 644 deps/*/ebin/*.app $(BEAMDIR)
 -	$(INSTALL) -m 644 deps/*/ebin/*.beam $(BEAMDIR)
- 	rm -f $(BEAMDIR)/configure.beam
- 	#
+ 	# Install Elixir and Elixir dependancies
+ 	-$(INSTALL) -m 644 deps/*/lib/*/ebin/*.app $(BEAMDIR)
+ 	-$(INSTALL) -m 644 deps/*/lib/*/ebin/*.beam $(BEAMDIR)
+@@ -161,7 +142,6 @@ install: all
  	# ejabberd header files
  	$(INSTALL) -d $(INCLUDEDIR)
  	$(INSTALL) -m 644 include/*.hrl $(INCLUDEDIR)
@@ -60,11 +64,11 @@ Index: ejabberd/Makefile.in
  	#
  	# Binary C programs
  	$(INSTALL) -d $(PBINDIR)
-@@ -156,7 +136,6 @@ install: all
+@@ -173,7 +153,6 @@ install: all
  	#
  	# Binary system libraries
  	$(INSTALL) -d $(SODIR)
 -	$(INSTALL) -m 644 $(DLLs) $(SODIR)
+ 	-[ -f $(SODIR)/jiffy.so ] && (cd $(PRIVDIR); ln -s lib/jiffy.so; true)
+ 	-[ -f $(SODIR)/sqlite3_drv.so ] && (cd $(PRIVDIR); ln -s lib/sqlite3_drv.so; true)
  	#
- 	# Translated strings
- 	$(INSTALL) -d $(MSGSDIR)
diff --git a/package/ejabberd/0003-disable-test.patch b/package/ejabberd/0003-disable-test.patch
index 4354ab6..1b28957 100644
--- a/package/ejabberd/0003-disable-test.patch
+++ b/package/ejabberd/0003-disable-test.patch
@@ -6,16 +6,22 @@ Author: Philipp Huebner <debalance@debian.org>
 
 Index: ejabberd/Makefile.in
 ===================================================================
---- ejabberd.orig/Makefile.in
-+++ ejabberd/Makefile.in
-@@ -260,10 +260,6 @@ dialyzer: erlang_plt deps_plt ejabberd_p
+diff --git a/Makefile.in b/Makefile.in
+index ffd1d30..835d611 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -306,14 +306,8 @@ dialyzer: erlang_plt deps_plt ejabberd_plt
  	status=$$? ; if [ $$status -ne 2 ]; then exit $$status; else exit 0; fi
  
  test:
 -	@echo "************************** NOTICE ***************************************"
 -	@cat test/README
 -	@echo "*************************************************************************"
+-	@cd priv && ln -sf ../sql
 -	$(REBAR) skip_deps=true ct
  
- .PHONY: src doc edoc dialyzer Makefile TAGS clean clean-rel distclean rel \
+ quicktest:
+-	$(REBAR) skip_deps=true ct suites=elixir
+ 
+ .PHONY: src edoc dialyzer Makefile TAGS clean clean-rel distclean rel \
  	install uninstall uninstall-binary uninstall-all translations deps test spec \
diff --git a/package/ejabberd/0006-disable-erlang-deprecated-types-check.patch b/package/ejabberd/0006-disable-erlang-deprecated-types-check.patch
new file mode 100644
index 0000000..1b70953
--- /dev/null
+++ b/package/ejabberd/0006-disable-erlang-deprecated-types-check.patch
@@ -0,0 +1,20 @@
+Description: disable ERLANG_DEPRECATED_CHECK
+ Without this patch, the configure will try to execute erlang to check
+ if it uses deprecated types. Assume the answer is false.
+Author: Johan Oudinet <johan.oudinet@gmail.com>
+
+Index: ejabberd/configure.ac
+====================================================================
+diff --git a/configure.ac b/configure.ac
+index 6ae0a24..e5498df 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -252,7 +252,7 @@ if test "$ENABLEUSER" != ""; then
+   AC_SUBST([INSTALLUSER], [$ENABLEUSER])
+ fi
+ 
+-ERLANG_DEPRECATED_TYPES_CHECK
++AC_SUBST(erlang_deprecated_types, false)
+ 
+ if test "$sqlite" = "true"; then
+    AX_LIB_SQLITE3([3.6.19])
diff --git a/package/ejabberd/0006-remove-doc.patch b/package/ejabberd/0006-remove-doc.patch
deleted file mode 100644
index 0c0a21b..0000000
--- a/package/ejabberd/0006-remove-doc.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Description: remove installing documentation
- Without this patch, the Makefile will try to install ejabberd
- documentation even if it is not generated, which will fail.
-Author: Johan Oudinet <johan.oudinet@gmail.com>
-
-Index: ejabberd/Makefile.in
-===================================================================
---- ejabberd.orig/Makefile.in	2014-10-21 16:43:42.604972005 +0200
-+++ ejabberd/Makefile.in	2014-10-21 16:45:12.419989667 +0200
-@@ -156,16 +156,6 @@ install: all
- 	$(INSTALL) -d -m 750 $(O_USER) $(LOGDIR)
- 	$(CHOWN_COMMAND) -R @INSTALLUSER@ $(LOGDIR) >$(CHOWN_OUTPUT)
- 	chmod -R 750 $(LOGDIR)
--	#
--	# Documentation
--	$(INSTALL) -d $(DOCDIR)
--	$(INSTALL) -m 644 doc/dev.html $(DOCDIR)
--	$(INSTALL) -m 644 doc/guide.html $(DOCDIR)
--	$(INSTALL) -m 644 doc/*.png $(DOCDIR)
--	[ -f doc/guide.pdf ] \
--		&& $(INSTALL) -m 644 doc/guide.pdf $(DOCDIR) \
--		|| echo "No doc/guide.pdf was built"
--	$(INSTALL) -m 644 COPYING $(DOCDIR)
- 
- uninstall: uninstall-binary
- 
diff --git a/package/ejabberd/0007-fix-install-permissions.patch b/package/ejabberd/0007-fix-install-permissions.patch
index b4633aa..452025d 100644
--- a/package/ejabberd/0007-fix-install-permissions.patch
+++ b/package/ejabberd/0007-fix-install-permissions.patch
@@ -6,55 +6,57 @@ Author: Johan Oudinet <johan.oudinet@gmail.com>
 
 Index: ejabberd/Makefile.in
 ===================================================================
---- ejabberd.orig/Makefile.in	2014-10-28 12:36:49.228713322 +0100
-+++ ejabberd/Makefile.in	2014-10-28 13:53:13.538888807 +0100
-@@ -91,10 +91,10 @@ spec:
+diff --git a/Makefile.in b/Makefile.in
+index ffd1d30..a60c5b7 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -114,10 +114,8 @@ DLLs := $(wildcard deps/*/priv/*.so) $(wildcard deps/*/priv/lib/*.so)
  install: all
  	#
  	# Configuration files
 -	$(INSTALL) -d -m 750 $(G_USER) $(ETCDIR)
-+	$(INSTALL) -d $(ETCDIR)
- 	[ -f $(ETCDIR)/ejabberd.yml ] \
+-	[ -f $(ETCDIR)/ejabberd.yml ] \
 -		&& $(INSTALL) -b -m 640 $(G_USER) ejabberd.yml.example $(ETCDIR)/ejabberd.yml-new \
 -		|| $(INSTALL) -b -m 640 $(G_USER) ejabberd.yml.example $(ETCDIR)/ejabberd.yml
-+		&& $(INSTALL) -b -m 644 $(G_USER) ejabberd.yml.example $(ETCDIR)/ejabberd.yml-new \
-+		|| $(INSTALL) -b -m 644 $(G_USER) ejabberd.yml.example $(ETCDIR)/ejabberd.yml
++	$(INSTALL) -d $(ETCDIR)
++	$(INSTALL) -b -m 644 $(G_USER) ejabberd.yml.example $(ETCDIR)/ejabberd.yml
  	$(SED) -e "s*{{rootdir}}*@prefix@*" \
  		-e "s*{{installuser}}*@INSTALLUSER@*" \
- 		-e "s*{{libdir}}*@libdir@*" \
-@@ -104,13 +104,12 @@ install: all
+ 		-e "s*{{bindir}}*@bindir@*" \
+@@ -127,14 +125,11 @@ install: all
+ 		-e "s*{{docdir}}*@docdir@*" \
  		-e "s*{{erl}}*@ERL@*" ejabberdctl.template \
  		> ejabberdctl.example
- 	[ -f $(ETCDIR)/ejabberdctl.cfg ] \
+-	[ -f $(ETCDIR)/ejabberdctl.cfg ] \
 -		&& $(INSTALL) -b -m 640 $(G_USER) ejabberdctl.cfg.example $(ETCDIR)/ejabberdctl.cfg-new \
 -		|| $(INSTALL) -b -m 640 $(G_USER) ejabberdctl.cfg.example $(ETCDIR)/ejabberdctl.cfg
-+		&& $(INSTALL) -b -m 644 $(G_USER) ejabberdctl.cfg.example $(ETCDIR)/ejabberdctl.cfg-new \
-+		|| $(INSTALL) -b -m 644 $(G_USER) ejabberdctl.cfg.example $(ETCDIR)/ejabberdctl.cfg
++	$(INSTALL) -b -m 644 $(G_USER) ejabberdctl.cfg.example $(ETCDIR)/ejabberdctl.cfg
  	$(INSTALL) -b -m 644 $(G_USER) inetrc $(ETCDIR)/inetrc
  	#
  	# Administration script
 -	[ -d $(SBINDIR) ] || $(INSTALL) -d -m 755 $(SBINDIR)
 -	$(INSTALL) -m 550 $(G_USER) ejabberdctl.example $(SBINDIR)/ejabberdctl
 +	$(INSTALL) -D ejabberdctl.example $(SBINDIR)/ejabberdctl
- 	#
- 	# Init script
- 	$(SED) -e "s*@ctlscriptpath@*$(SBINDIR)*" \
-@@ -129,10 +128,7 @@ install: all
- 	$(INSTALL) -m 644 include/*.hrl $(INCLUDEDIR)
+ 	# Elixir binaries
+ 	[ -d $(BINDIR) ] || $(INSTALL) -d -m 755 $(BINDIR)
+ 	-[ -f deps/elixir/bin/iex ] && $(INSTALL) -m 550 $(G_USER) deps/elixir/bin/iex $(BINDIR)/iex
+@@ -165,9 +160,9 @@ install: all
  	#
  	# Binary C programs
--	$(INSTALL) -d $(PBINDIR)
+ 	$(INSTALL) -d $(PBINDIR)
 -	$(INSTALL) -m 750 $(O_USER) tools/captcha.sh $(PBINDIR)
--	-[ -f deps/p1_pam/priv/bin/epam ] \
--		&& $(INSTALL) -m 750 $(O_USER) deps/p1_pam/priv/bin/epam $(PBINDIR)
-+	$(INSTALL) -D tools/captcha.sh $(PBINDIR)/captcha.sh
+-	$(INSTALL) -m 750 $(O_USER) tools/joincluster $(PBINDIR)
+-	$(INSTALL) -m 750 $(O_USER) tools/leavecluster $(PBINDIR)
++	$(INSTALL) tools/captcha.sh $(PBINDIR)
++	$(INSTALL) tools/joincluster $(PBINDIR)
++	$(INSTALL) tools/leavecluster $(PBINDIR)
+ 	-[ -f deps/p1_pam/priv/bin/epam ] \
+ 		&& $(INSTALL) -m 750 $(O_USER) deps/p1_pam/priv/bin/epam $(PBINDIR)
  	#
- 	# Binary system libraries
- 	$(INSTALL) -d $(SODIR)
-@@ -140,22 +136,6 @@ install: all
- 	# Translated strings
- 	$(INSTALL) -d $(MSGSDIR)
- 	$(INSTALL) -m 644 priv/msgs/*.msg $(MSGSDIR)
+@@ -184,29 +179,6 @@ install: all
+ 	# Copy lite.sql
+ 	-[ -d deps/sqlite3 ] && $(INSTALL) -d $(SQLDIR)
+ 	-[ -d deps/sqlite3 ] && $(INSTALL) -m 644 sql/lite.sql $(SQLDIR)
 -	#
 -	# Spool directory
 -	$(INSTALL) -d -m 750 $(O_USER) $(SPOOLDIR)
@@ -71,6 +73,12 @@ Index: ejabberd/Makefile.in
 -	$(INSTALL) -d -m 750 $(O_USER) $(LOGDIR)
 -	$(CHOWN_COMMAND) -R @INSTALLUSER@ $(LOGDIR) >$(CHOWN_OUTPUT)
 -	chmod -R 750 $(LOGDIR)
+-	#
+-	# Documentation
+-	$(INSTALL) -d $(DOCDIR)
+-	[ -f doc/guide.html ] \
+-		&& $(INSTALL) -m 644 doc/guide.html $(DOCDIR) \
+-		|| echo "Documentation not included in sources"
+-	$(INSTALL) -m 644 COPYING $(DOCDIR)
  
  uninstall: uninstall-binary
-
diff --git a/package/ejabberd/0008-add-ac_config_macro_dir.patch b/package/ejabberd/0008-add-ac_config_macro_dir.patch
new file mode 100644
index 0000000..007e694
--- /dev/null
+++ b/package/ejabberd/0008-add-ac_config_macro_dir.patch
@@ -0,0 +1,30 @@
+upstream: https://github.com/processone/ejabberd/pull/628
+Author: Johan Oudinet <johan.oudinet@gmail.com>
+
+From 0e7d2b73be335353e9938668a699b3dbb7011c56 Mon Sep 17 00:00:00 2001
+From: Johan Oudinet <johan.oudinet@gmail.com>
+Date: Tue, 30 Jun 2015 10:53:45 +0200
+Subject: [PATCH] configure.ac: add AC_CONFIG_MACRO_DIR
+
+Otherwise, autoconf fails to find extra macros defined in the m4
+directory.
+---
+ configure.ac | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index a3e2638..0a60de0 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -6,6 +6,8 @@ AC_INIT(ejabberd, m4_esyscmd([echo `git describe --tags 2>/dev/null || echo 0.0`
+ REQUIRE_ERLANG_MIN="5.9.1 (Erlang/OTP R15B01)"
+ REQUIRE_ERLANG_MAX="9.0.0 (No Max)"
+ 
++AC_CONFIG_MACRO_DIR([m4])
++
+ # Checks for programs.
+ AC_PROG_MAKE_SET
+ AC_PROG_INSTALL
+-- 
+2.1.4
+
diff --git a/package/ejabberd/Config.in b/package/ejabberd/Config.in
index 1a27ef2..7b4e99b 100644
--- a/package/ejabberd/Config.in
+++ b/package/ejabberd/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_EJABBERD
 	select BR2_PACKAGE_ERLANG_P1_XML
 	select BR2_PACKAGE_ERLANG_P1_YAML
 	select BR2_PACKAGE_ERLANG_P1_ZLIB
+	select BR2_PACKAGE_GETENT
 	select BR2_PACKAGE_OPENSSL
 	help
 	  Ejabberd is a Jabber/XMPP instant messaging server, written
diff --git a/package/ejabberd/ejabberd.mk b/package/ejabberd/ejabberd.mk
index 650dc0e..b413c8b 100644
--- a/package/ejabberd/ejabberd.mk
+++ b/package/ejabberd/ejabberd.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-EJABBERD_VERSION = 14.07
+EJABBERD_VERSION = 15.06
 EJABBERD_SITE = $(call github,processone,ejabberd,$(EJABBERD_VERSION))
 EJABBERD_LICENSE = GPLv2+ with OpenSSL exception
 EJABBERD_LICENSE_FILES = COPYING
-EJABBERD_DEPENDENCIES = openssl host-erlang-lager erlang-lager \
+EJABBERD_DEPENDENCIES = getent openssl host-erlang-lager erlang-lager \
 	erlang-p1-cache-tab erlang-p1-iconv erlang-p1-sip \
 	erlang-p1-stringprep erlang-p1-xml erlang-p1-yaml erlang-p1-zlib
 
-- 
2.1.4
