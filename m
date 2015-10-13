From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Oct 2015 21:21:05 +0200
Subject: [Buildroot] [git commit] ejabberd: bump to version 15.09
Message-ID: <20151013192304.48DAD81E39@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=274e5f6731ac656dedc308c9757ac97ba1041952
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove patches that have been applied upstream and adapt the other
ones.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ejabberd/0001-remove-deps.patch            |    6 ++--
 package/ejabberd/0002-disable-rebar-deps.patch     |    8 ++--
 .../ejabberd/0007-fix-install-permissions.patch    |   17 ++++++-----
 .../ejabberd/0008-add-ac_config_macro_dir.patch    |   30 --------------------
 ...jabberdctl.patch => 0008-fix-ejabberdctl.patch} |    0
 package/ejabberd/0010-fix-package-version.patch    |   19 ------------
 package/ejabberd/ejabberd.mk                       |    5 ++-
 7 files changed, 19 insertions(+), 66 deletions(-)

diff --git a/package/ejabberd/0001-remove-deps.patch b/package/ejabberd/0001-remove-deps.patch
index ffe2106..c5700dd 100644
--- a/package/ejabberd/0001-remove-deps.patch
+++ b/package/ejabberd/0001-remove-deps.patch
@@ -6,16 +6,16 @@ Author: Philipp Huebner <debalance@debian.org>
 Index: ejabberd/rebar.config.script
 ===================================================================
 diff --git a/rebar.config.script b/rebar.config.script
-index b4dfaa3..9152c12 100644
+index 633433c..646a15a 100644
 --- a/rebar.config.script
 +++ b/rebar.config.script
-@@ -183,9 +183,7 @@ Config = [{erl_opts, Macros ++ HiPE ++ DebugInfo ++
+@@ -187,9 +187,7 @@ Config = [{erl_opts, Macros ++ HiPE ++ DebugInfo ++
            {xref_checks, []},
  	  {xref_queries,
  	   [{"(XC - UC) || (XU - X - B - "
 -	     ++ string:join(CfgXrefs, " - ") ++ ")", []}]},
 -          {post_hooks, PostHooks ++ CfgPostHooks},
--          {deps, Deps ++ CfgDeps}] ++ ElixirConfig,
+-          {deps, AllDeps}] ++ ElixirConfig,
 +	     ++ string:join(CfgXrefs, " - ") ++ ")", []}]}],
  %%io:format("ejabberd configuration:~n  ~p~n", [Config]),
  Config.
diff --git a/package/ejabberd/0002-disable-rebar-deps.patch b/package/ejabberd/0002-disable-rebar-deps.patch
index 1ea40de..d1602e2 100644
--- a/package/ejabberd/0002-disable-rebar-deps.patch
+++ b/package/ejabberd/0002-disable-rebar-deps.patch
@@ -6,7 +6,7 @@ Author: Philipp Huebner <debalance@debian.org>
 Index: ejabberd/Makefile.in
 ===================================================================
 diff --git a/Makefile.in b/Makefile.in
-index ffd1d30..09cb8d7 100644
+index f7b30d4..4ca4db3 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -74,26 +74,11 @@ else
@@ -64,11 +64,11 @@ index ffd1d30..09cb8d7 100644
  	#
  	# Binary C programs
  	$(INSTALL) -d $(PBINDIR)
-@@ -173,7 +153,6 @@ install: all
+@@ -174,7 +154,6 @@ install: all
  	#
  	# Binary system libraries
  	$(INSTALL) -d $(SODIR)
 -	$(INSTALL) -m 644 $(DLLs) $(SODIR)
- 	-[ -f $(SODIR)/jiffy.so ] && (cd $(PRIVDIR); ln -s lib/jiffy.so; true)
- 	-[ -f $(SODIR)/sqlite3_drv.so ] && (cd $(PRIVDIR); ln -s lib/sqlite3_drv.so; true)
+ 	[ -f $(SODIR)/jiffy.so ] && (cd $(PRIVDIR); ln -s lib/jiffy.so; true) || true
+ 	[ -f $(SODIR)/sqlite3_drv.so ] && (cd $(PRIVDIR); ln -s lib/sqlite3_drv.so; true) || true
  	#
diff --git a/package/ejabberd/0007-fix-install-permissions.patch b/package/ejabberd/0007-fix-install-permissions.patch
index 452025d..89e3379 100644
--- a/package/ejabberd/0007-fix-install-permissions.patch
+++ b/package/ejabberd/0007-fix-install-permissions.patch
@@ -7,7 +7,7 @@ Author: Johan Oudinet <johan.oudinet@gmail.com>
 Index: ejabberd/Makefile.in
 ===================================================================
 diff --git a/Makefile.in b/Makefile.in
-index ffd1d30..a60c5b7 100644
+index f7b30d4..84098a6 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -114,10 +114,8 @@ DLLs := $(wildcard deps/*/priv/*.so) $(wildcard deps/*/priv/lib/*.so)
@@ -39,7 +39,7 @@ index ffd1d30..a60c5b7 100644
 +	$(INSTALL) -D ejabberdctl.example $(SBINDIR)/ejabberdctl
  	# Elixir binaries
  	[ -d $(BINDIR) ] || $(INSTALL) -d -m 755 $(BINDIR)
- 	-[ -f deps/elixir/bin/iex ] && $(INSTALL) -m 550 $(G_USER) deps/elixir/bin/iex $(BINDIR)/iex
+ 	[ -f deps/elixir/bin/iex ] && $(INSTALL) -m 550 $(G_USER) deps/elixir/bin/iex $(BINDIR)/iex || true
 @@ -165,9 +160,9 @@ install: all
  	#
  	# Binary C programs
@@ -50,13 +50,13 @@ index ffd1d30..a60c5b7 100644
 +	$(INSTALL) tools/captcha.sh $(PBINDIR)
 +	$(INSTALL) tools/joincluster $(PBINDIR)
 +	$(INSTALL) tools/leavecluster $(PBINDIR)
- 	-[ -f deps/p1_pam/priv/bin/epam ] \
- 		&& $(INSTALL) -m 750 $(O_USER) deps/p1_pam/priv/bin/epam $(PBINDIR)
- 	#
-@@ -184,29 +179,6 @@ install: all
+ 	[ -f deps/p1_pam/priv/bin/epam ] \
+ 		&& $(INSTALL) -m 750 $(O_USER) deps/p1_pam/priv/bin/epam $(PBINDIR) \
+ 		|| true
+@@ -185,29 +180,6 @@ install: all
  	# Copy lite.sql
- 	-[ -d deps/sqlite3 ] && $(INSTALL) -d $(SQLDIR)
- 	-[ -d deps/sqlite3 ] && $(INSTALL) -m 644 sql/lite.sql $(SQLDIR)
+ 	[ -d deps/sqlite3 ] && $(INSTALL) -d $(SQLDIR) || true
+ 	[ -d deps/sqlite3 ] && $(INSTALL) -m 644 sql/lite.sql $(SQLDIR) || true
 -	#
 -	# Spool directory
 -	$(INSTALL) -d -m 750 $(O_USER) $(SPOOLDIR)
@@ -82,3 +82,4 @@ index ffd1d30..a60c5b7 100644
 -	$(INSTALL) -m 644 COPYING $(DOCDIR)
  
  uninstall: uninstall-binary
+ 
diff --git a/package/ejabberd/0008-add-ac_config_macro_dir.patch b/package/ejabberd/0008-add-ac_config_macro_dir.patch
deleted file mode 100644
index 9cff90b..0000000
--- a/package/ejabberd/0008-add-ac_config_macro_dir.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-upstream: https://github.com/processone/ejabberd/pull/628
-Author: Johan Oudinet <johan.oudinet@gmail.com>
-
-From 0e7d2b73be335353e9938668a699b3dbb7011c56 Mon Sep 17 00:00:00 2001
-From: Johan Oudinet <johan.oudinet@gmail.com>
-Date: Tue, 30 Jun 2015 10:53:45 +0200
-Subject: [PATCH] configure.ac: add AC_CONFIG_MACRO_DIR
-
-Otherwise, autoconf fails to find extra macros defined in the m4
-directory.
----
- configure.ac | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index a3e2638..0a60de0 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -6,6 +6,8 @@ AC_INIT(ejabberd, m4_esyscmd([echo `git describe --tags 2>/dev/null || echo 0.0`
- REQUIRE_ERLANG_MIN="5.9.1 (Erlang/OTP R15B01)"
- REQUIRE_ERLANG_MAX="9.0.0 (No Max)"
- 
-+AC_CONFIG_MACRO_DIR([m4])
-+
- # Checks for programs.
- AC_PROG_MAKE_SET
- AC_PROG_INSTALL
--- 
-2.1.4
-
diff --git a/package/ejabberd/0009-fix-ejabberdctl.patch b/package/ejabberd/0008-fix-ejabberdctl.patch
similarity index 100%
rename from package/ejabberd/0009-fix-ejabberdctl.patch
rename to package/ejabberd/0008-fix-ejabberdctl.patch
diff --git a/package/ejabberd/0010-fix-package-version.patch b/package/ejabberd/0010-fix-package-version.patch
deleted file mode 100644
index c8b3c10..0000000
--- a/package/ejabberd/0010-fix-package-version.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Description: fix package version
- Without this patch, the configure tries to guess the version from the
- last git tag, which is incorrect here as we are not inside ejabberd
- git repository.
-Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
-
-diff --git a/configure.ac b/configure.ac
-index e7bb43b..e7faac4 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2,7 +2,7 @@
- # Process this file with autoconf to produce a configure script.
- 
- AC_PREREQ(2.53)
--AC_INIT(ejabberd, m4_esyscmd([echo `git describe --tags 2>/dev/null || echo 0.0` | sed 's/-g.*//;s/-/./' | tr -d '\012']), [ejabberd at process-one.net], [ejabberd])
-+AC_INIT(ejabberd, [15.06], [ejabberd at process-one.net], [ejabberd])
- REQUIRE_ERLANG_MIN="5.9.1 (Erlang/OTP R15B01)"
- REQUIRE_ERLANG_MAX="9.0.0 (No Max)"
- 
diff --git a/package/ejabberd/ejabberd.mk b/package/ejabberd/ejabberd.mk
index 7e22e0c..fe7e1ce 100644
--- a/package/ejabberd/ejabberd.mk
+++ b/package/ejabberd/ejabberd.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-EJABBERD_VERSION = 15.06
-EJABBERD_SITE = $(call github,processone,ejabberd,$(EJABBERD_VERSION))
+EJABBERD_VERSION = 15.09
+EJABBERD_SOURCE = ejabberd-$(EJABBERD_VERSION).tgz
+EJABBERD_SITE = https://www.process-one.net/downloads/ejabberd/$(EJABBERD_VERSION)
 EJABBERD_LICENSE = GPLv2+ with OpenSSL exception
 EJABBERD_LICENSE_FILES = COPYING
 EJABBERD_DEPENDENCIES = getent openssl host-erlang-lager erlang-lager \
