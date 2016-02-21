From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Sun, 21 Feb 2016 17:00:08 -0500
Subject: [Buildroot] [PATCH v4 1/3] ejabberd: convert patches to git format
Message-ID: <1456092010-16504-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
Changes v3 -> v4:
  - Specify -N to git format-patch for patches (suggested by
    Thomas Petazzoni)

Changes v2 -> v3:
  - Split out of large patch set that was mostly merged
  - Convert existing patches to git format. This makes it
    somewhat easier to see the changes to the patches in the
    version bump

Changes v1 -> v2:
  - None

 package/ejabberd/0001-remove-deps.patch            | 22 ---------
 .../0001-remove-make-targets-for-deps.patch        | 29 +++++++++++
 ...tch => 0002-remove-make-targets-for-deps.patch} | 19 +++++---
 ...remove-testing-with-MySQL-and-PostgreSQL.patch} | 25 ++++++----
 package/ejabberd/0004-disable-version-check.patch  | 20 --------
 .../0004-remove-checking-erlang-version.patch      | 30 ++++++++++++
 package/ejabberd/0005-correct-include.patch        | 56 ++++++++++++++++++++++
 package/ejabberd/0005-fix-includes.patch           | 45 -----------------
 .../0006-disable-ERLANG_DEPRECATED_CHECK.patch     | 27 +++++++++++
 ...006-disable-erlang-deprecated-types-check.patch | 20 --------
 .../ejabberd/0007-fix-install-permissions.patch    | 23 +++++----
 package/ejabberd/0008-fix-ejabberdctl.patch        | 19 ++++++--
 12 files changed, 200 insertions(+), 135 deletions(-)
 delete mode 100644 package/ejabberd/0001-remove-deps.patch
 create mode 100644 package/ejabberd/0001-remove-make-targets-for-deps.patch
 rename package/ejabberd/{0002-disable-rebar-deps.patch => 0002-remove-make-targets-for-deps.patch} (79%)
 rename package/ejabberd/{0003-disable-test.patch => 0003-remove-testing-with-MySQL-and-PostgreSQL.patch} (53%)
 delete mode 100644 package/ejabberd/0004-disable-version-check.patch
 create mode 100644 package/ejabberd/0004-remove-checking-erlang-version.patch
 create mode 100644 package/ejabberd/0005-correct-include.patch
 delete mode 100644 package/ejabberd/0005-fix-includes.patch
 create mode 100644 package/ejabberd/0006-disable-ERLANG_DEPRECATED_CHECK.patch
 delete mode 100644 package/ejabberd/0006-disable-erlang-deprecated-types-check.patch

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
diff --git a/package/ejabberd/0001-remove-make-targets-for-deps.patch b/package/ejabberd/0001-remove-make-targets-for-deps.patch
new file mode 100644
index 0000000..060c407
--- /dev/null
+++ b/package/ejabberd/0001-remove-make-targets-for-deps.patch
@@ -0,0 +1,29 @@
+From a4910ec9257d0743e42c4b1650b6ef60196a013d Mon Sep 17 00:00:00 2001
+From: Philipp Huebner <debalance@debian.org>
+Date: Sun, 21 Feb 2016 10:52:53 -0500
+Subject: [PATCH] remove make targets for deps
+
+Without this patch, dependencies would be downloaded and compiled
+using rebar at build time.
+---
+ rebar.config.script | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/rebar.config.script b/rebar.config.script
+index 833595d..1b6177d 100644
+--- a/rebar.config.script
++++ b/rebar.config.script
+@@ -192,9 +192,7 @@ Config = [{erl_opts, Macros ++ HiPE ++ DebugInfo ++
+           {xref_checks, []},
+ 	  {xref_queries,
+ 	   [{"(XC - UC) || (XU - X - B - "
+-	     ++ string:join(CfgXrefs, " - ") ++ ")", []}]},
+-          {post_hooks, PostHooks ++ CfgPostHooks},
+-          {deps, AllDeps}] ++ ElixirConfig,
++	     ++ string:join(CfgXrefs, " - ") ++ ")", []}]}],
+ %%io:format("ejabberd configuration:~n  ~p~n", [Config]),
+ Config.
+ 
+-- 
+2.5.0
+
diff --git a/package/ejabberd/0002-disable-rebar-deps.patch b/package/ejabberd/0002-remove-make-targets-for-deps.patch
similarity index 79%
rename from package/ejabberd/0002-disable-rebar-deps.patch
rename to package/ejabberd/0002-remove-make-targets-for-deps.patch
index e76b8a2..757ae38 100644
--- a/package/ejabberd/0002-disable-rebar-deps.patch
+++ b/package/ejabberd/0002-remove-make-targets-for-deps.patch
@@ -1,10 +1,14 @@
-Description: remove make targets for deps
- Without this patch, dependencies would be downloaded and compiled
- using rebar at build time.
-Author: Philipp Huebner <debalance@debian.org>
+From 9ab065047fab913b7250525a51b9c9ad6f3a3478 Mon Sep 17 00:00:00 2001
+From: Philipp Huebner <debalance@debian.org>
+Date: Sun, 21 Feb 2016 10:55:14 -0500
+Subject: [PATCH] remove make targets for deps
+
+Without this patch, dependencies would be downloaded and compiled
+using rebar at build time.
+---
+ Makefile.in | 32 ++++----------------------------
+ 1 file changed, 4 insertions(+), 28 deletions(-)
 
-Index: ejabberd/Makefile.in
-===================================================================
 diff --git a/Makefile.in b/Makefile.in
 index 8dd6bf5..b9d783a 100644
 --- a/Makefile.in
@@ -74,3 +78,6 @@ index 8dd6bf5..b9d783a 100644
  dialyzer/erlang.plt:
  	@mkdir -p dialyzer
  	@dialyzer --build_plt --output_plt dialyzer/erlang.plt \
+-- 
+2.5.0
+
diff --git a/package/ejabberd/0003-disable-test.patch b/package/ejabberd/0003-remove-testing-with-MySQL-and-PostgreSQL.patch
similarity index 53%
rename from package/ejabberd/0003-disable-test.patch
rename to package/ejabberd/0003-remove-testing-with-MySQL-and-PostgreSQL.patch
index 1b28957..316406a 100644
--- a/package/ejabberd/0003-disable-test.patch
+++ b/package/ejabberd/0003-remove-testing-with-MySQL-and-PostgreSQL.patch
@@ -1,16 +1,20 @@
-Description: remove testing with MySQL and PostgreSQL
- Without this patch a test would be initiated after building ejabberd that
- requires specially configured instances of MySQL and PostgreSQL to be up
- and running.
-Author: Philipp Huebner <debalance@debian.org>
+From a4192bbd52250bd52d80b05f81cd5645abc650dc Mon Sep 17 00:00:00 2001
+From: Philipp Huebner <debalance@debian.org>
+Date: Sun, 21 Feb 2016 10:59:14 -0500
+Subject: [PATCH] remove testing with MySQL and PostgreSQL
+
+Without this patch a test would be initiated after building ejabberd
+that requires specially configured instances of MySQL and PostgreSQL
+to be up and running.
+---
+ Makefile.in | 6 ------
+ 1 file changed, 6 deletions(-)
 
-Index: ejabberd/Makefile.in
-===================================================================
 diff --git a/Makefile.in b/Makefile.in
-index ffd1d30..835d611 100644
+index b9d783a..9cd905f 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -306,14 +306,8 @@ dialyzer: erlang_plt deps_plt ejabberd_plt
+@@ -282,14 +282,8 @@ dialyzer: erlang_plt deps_plt ejabberd_plt
  	status=$$? ; if [ $$status -ne 2 ]; then exit $$status; else exit 0; fi
  
  test:
@@ -25,3 +29,6 @@ index ffd1d30..835d611 100644
  
  .PHONY: src edoc dialyzer Makefile TAGS clean clean-rel distclean rel \
  	install uninstall uninstall-binary uninstall-all translations deps test spec \
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
diff --git a/package/ejabberd/0004-remove-checking-erlang-version.patch b/package/ejabberd/0004-remove-checking-erlang-version.patch
new file mode 100644
index 0000000..8997cca
--- /dev/null
+++ b/package/ejabberd/0004-remove-checking-erlang-version.patch
@@ -0,0 +1,30 @@
+From bec405139144c8901b7d3771f5f658a3fed64b8a Mon Sep 17 00:00:00 2001
+From: Johan Oudinet <johan.oudinet@gmail.com>
+Date: Sun, 21 Feb 2016 11:00:24 -0500
+Subject: [PATCH] remove checking erlang version
+
+Without this patch, the configure will try to run erlang to simply
+check if the version is supported by ejabberd. Instead, we do this test
+statically.
+---
+ configure.ac | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index d5f313e..4b35d57 100644
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
diff --git a/package/ejabberd/0005-correct-include.patch b/package/ejabberd/0005-correct-include.patch
new file mode 100644
index 0000000..dc2d1c3
--- /dev/null
+++ b/package/ejabberd/0005-correct-include.patch
@@ -0,0 +1,56 @@
+From 9878a2cfb1a927f4b42f1c4d08df434084739626 Mon Sep 17 00:00:00 2001
+From: Philipp Huebner <debalance@debian.org>
+Date: Sun, 21 Feb 2016 11:01:42 -0500
+Subject: [PATCH] correct include
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
+index 1e4044b..4279b64 100644
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
+index a0dff12..b5794fa 100644
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
+index f6b3103..1061c88 100644
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
diff --git a/package/ejabberd/0006-disable-ERLANG_DEPRECATED_CHECK.patch b/package/ejabberd/0006-disable-ERLANG_DEPRECATED_CHECK.patch
new file mode 100644
index 0000000..ea52b3e
--- /dev/null
+++ b/package/ejabberd/0006-disable-ERLANG_DEPRECATED_CHECK.patch
@@ -0,0 +1,27 @@
+From 615eae56cabd7d15a8f62b6f50e598818932c9ca Mon Sep 17 00:00:00 2001
+From: Johan Oudinet <johan.oudinet@gmail.com>
+Date: Sun, 21 Feb 2016 11:02:33 -0500
+Subject: [PATCH] disable ERLANG_DEPRECATED_CHECK
+
+Without this patch, the configure will try to execute erlang to check
+if it uses deprecated types. Assume the answer is false.
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 4b35d57..da87585 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -243,7 +243,7 @@ if test "$ENABLEUSER" != ""; then
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
diff --git a/package/ejabberd/0007-fix-install-permissions.patch b/package/ejabberd/0007-fix-install-permissions.patch
index 2ad8453..e30b49e 100644
--- a/package/ejabberd/0007-fix-install-permissions.patch
+++ b/package/ejabberd/0007-fix-install-permissions.patch
@@ -1,13 +1,17 @@
-Description: fix install permissions
- Without this patch, the makefile will try to install directories and
- files with incompatible permissions for ejabberd, which run as an
- ejabberd user.
-Author: Johan Oudinet <johan.oudinet@gmail.com>
+From 0f4db8755263c0825b02b4197cdb64b11fb8c638 Mon Sep 17 00:00:00 2001
+From: Johan Oudinet <johan.oudinet@gmail.com>
+Date: Sun, 21 Feb 2016 11:03:16 -0500
+Subject: [PATCH] fix install permissions
+
+Without this patch, the makefile will try to install directories and
+files with incompatible permissions for ejabberd, which run as an
+ejabberd user.
+---
+ Makefile.in | 40 ++++++----------------------------------
+ 1 file changed, 6 insertions(+), 34 deletions(-)
 
-Index: ejabberd/Makefile.in
-===================================================================
 diff --git a/Makefile.in b/Makefile.in
-index b9d783a..6ec805a 100644
+index 9cd905f..442b851 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -122,10 +122,8 @@ copy-files: $(call TO_DEST,$(MAIN_FILES))
@@ -77,3 +81,6 @@ index b9d783a..6ec805a 100644
  
  uninstall: uninstall-binary
  
+-- 
+2.5.0
+
diff --git a/package/ejabberd/0008-fix-ejabberdctl.patch b/package/ejabberd/0008-fix-ejabberdctl.patch
index af0b6ee..fc23fff 100644
--- a/package/ejabberd/0008-fix-ejabberdctl.patch
+++ b/package/ejabberd/0008-fix-ejabberdctl.patch
@@ -1,10 +1,16 @@
-Description: fix ejabberdctl
- Change default values so ejabberdctl run commands as ejabberd user
- Also add a way for the user to change default values.
+From dc6046d9eaef16dc4e9fcda2021219910bfea0de Mon Sep 17 00:00:00 2001
+From: Johan Oudinet <johan.oudinet@gmail.com>
+Date: Sun, 21 Feb 2016 11:03:58 -0500
+Subject: [PATCH] fix ejabberdctl
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
 index c7d76ef..a7afce1 100755
 --- a/ejabberdctl.template
@@ -23,3 +29,6 @@ index c7d76ef..a7afce1 100755
  # check the proper system user is used if defined
  if [ "$INSTALLUSER" != "" ] ; then
      EXEC_CMD="false"
+-- 
+2.5.0
+
-- 
2.5.0
