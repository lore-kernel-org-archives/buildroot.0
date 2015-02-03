From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Feb 2015 10:23:39 +0100
Subject: [Buildroot] [git commit] ejabberd: new package.
Message-ID: <20150203092418.223197FCCA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8290f2ea112dac347e52a4e0ae8a71a6bb2dc86e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - Adjust the comment about the dependency on erlang
 - Fix license to be 'GPLv2+ with OpenSSL exception' and not just 'GPLv2+'
 - Use double quotes instead of simple quotes in the .mk file.
 - Don't use the EJABBERD_MAKE_ENV variable, since it's not defined
   anywhere.
 - Remove the 0007-fix-init.patch patch, since we're not using the
   init script provided by ejabberd, and rename
   0008-fix-install-permissions.patch to
   0007-fix-install-permissions.patch.]

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 package/ejabberd/0001-remove-deps.patch            |   20 +++++
 package/ejabberd/0002-disable-rebar-deps.patch     |   70 ++++++++++++++++++
 package/ejabberd/0003-disable-test.patch           |   21 ++++++
 package/ejabberd/0004-disable-version-check.patch  |   20 +++++
 package/ejabberd/0005-fix-includes.patch           |   45 ++++++++++++
 package/ejabberd/0006-remove-doc.patch             |   26 +++++++
 .../ejabberd/0007-fix-install-permissions.patch    |   76 ++++++++++++++++++++
 package/ejabberd/Config.in                         |   21 ++++++
 package/ejabberd/S50ejabberd                       |   35 +++++++++
 package/ejabberd/check-erlang-lib                  |   55 ++++++++++++++
 package/ejabberd/ejabberd.mk                       |   51 +++++++++++++
 12 files changed, 441 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index aa46590..d19b37f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1078,6 +1078,7 @@ endif
 	source "package/dnsmasq/Config.in"
 	source "package/dropbear/Config.in"
 	source "package/ebtables/Config.in"
+	source "package/ejabberd/Config.in"
 	source "package/ethtool/Config.in"
 	source "package/faifa/Config.in"
 	source "package/fmc/Config.in"
diff --git a/package/ejabberd/0001-remove-deps.patch b/package/ejabberd/0001-remove-deps.patch
new file mode 100644
index 0000000..1982ca8
--- /dev/null
+++ b/package/ejabberd/0001-remove-deps.patch
@@ -0,0 +1,20 @@
+Description: remove make targets for deps
+ Without this patch, dependencies would be downloaded and compiled
+ using rebar at build time.
+Author: Philipp Huebner <debalance@debian.org>
+
+Index: ejabberd/rebar.config.script
+===================================================================
+--- ejabberd.orig/rebar.config.script
++++ ejabberd/rebar.config.script
+@@ -126,9 +126,7 @@ Config = [{erl_opts, Macros ++ HiPE ++ D
+           {sub_dirs, ["rel"]},
+           {keep_build_info, true},
+           {ct_extra_params, "-include "
+-           ++ filename:join([Cwd, "tools"])},
+-          {post_hooks, PostHooks ++ CfgPostHooks},
+-          {deps, Deps ++ CfgDeps}],
++           ++ filename:join([Cwd, "tools"])}],
+ %%io:format("ejabberd configuration:~n  ~p~n", [Config]),
+ Config.
+ 
diff --git a/package/ejabberd/0002-disable-rebar-deps.patch b/package/ejabberd/0002-disable-rebar-deps.patch
new file mode 100644
index 0000000..80217ca
--- /dev/null
+++ b/package/ejabberd/0002-disable-rebar-deps.patch
@@ -0,0 +1,70 @@
+Description: remove make targets for deps
+ Without this patch, dependencies would be downloaded and compiled
+ using rebar at build time.
+Author: Philipp Huebner <debalance@debian.org>
+
+Index: ejabberd/Makefile.in
+===================================================================
+--- ejabberd.orig/Makefile.in
++++ ejabberd/Makefile.in
+@@ -68,26 +68,11 @@ else
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
+ translations:
+ 	contrib/extract_translations/prepare-translation.sh -updateall
+ 
+@@ -103,8 +88,6 @@ spec:
+ 	$(ERL) -noinput +B -pa ebin -pa deps/*/ebin -eval \
+ 	'case xml_gen:compile("tools/xmpp_codec.spec") of ok -> halt(0); _ -> halt(1) end.'
+ 
+-DLLs := $(wildcard deps/*/priv/*.so) $(wildcard deps/*/priv/lib/*.so)
+-
+ install: all
+ 	#
+ 	# Configuration files
+@@ -139,14 +122,11 @@ install: all
+ 	$(INSTALL) -d $(BEAMDIR)
+ 	$(INSTALL) -m 644 ebin/*.app $(BEAMDIR)
+ 	$(INSTALL) -m 644 ebin/*.beam $(BEAMDIR)
+-	$(INSTALL) -m 644 deps/*/ebin/*.app $(BEAMDIR)
+-	$(INSTALL) -m 644 deps/*/ebin/*.beam $(BEAMDIR)
+ 	rm -f $(BEAMDIR)/configure.beam
+ 	#
+ 	# ejabberd header files
+ 	$(INSTALL) -d $(INCLUDEDIR)
+ 	$(INSTALL) -m 644 include/*.hrl $(INCLUDEDIR)
+-	$(INSTALL) -m 644 deps/*/include/*.hrl $(INCLUDEDIR)
+ 	#
+ 	# Binary C programs
+ 	$(INSTALL) -d $(PBINDIR)
+@@ -156,7 +136,6 @@ install: all
+ 	#
+ 	# Binary system libraries
+ 	$(INSTALL) -d $(SODIR)
+-	$(INSTALL) -m 644 $(DLLs) $(SODIR)
+ 	#
+ 	# Translated strings
+ 	$(INSTALL) -d $(MSGSDIR)
diff --git a/package/ejabberd/0003-disable-test.patch b/package/ejabberd/0003-disable-test.patch
new file mode 100644
index 0000000..4354ab6
--- /dev/null
+++ b/package/ejabberd/0003-disable-test.patch
@@ -0,0 +1,21 @@
+Description: remove testing with MySQL and PostgreSQL
+ Without this patch a test would be initiated after building ejabberd that
+ requires specially configured instances of MySQL and PostgreSQL to be up
+ and running.
+Author: Philipp Huebner <debalance@debian.org>
+
+Index: ejabberd/Makefile.in
+===================================================================
+--- ejabberd.orig/Makefile.in
++++ ejabberd/Makefile.in
+@@ -260,10 +260,6 @@ dialyzer: erlang_plt deps_plt ejabberd_p
+ 	status=$$? ; if [ $$status -ne 2 ]; then exit $$status; else exit 0; fi
+ 
+ test:
+-	@echo "************************** NOTICE ***************************************"
+-	@cat test/README
+-	@echo "*************************************************************************"
+-	$(REBAR) skip_deps=true ct
+ 
+ .PHONY: src doc edoc dialyzer Makefile TAGS clean clean-rel distclean rel \
+ 	install uninstall uninstall-binary uninstall-all translations deps test spec \
diff --git a/package/ejabberd/0004-disable-version-check.patch b/package/ejabberd/0004-disable-version-check.patch
new file mode 100644
index 0000000..f2f1e81
--- /dev/null
+++ b/package/ejabberd/0004-disable-version-check.patch
@@ -0,0 +1,20 @@
+Description: remove checking erlang version
+ Without this patch, the configure will try to run erlang to simply check if
+ the version is supported by ejabberd. Instead, we do this test statically.
+Author: Johan Oudinet <johan.oudinet@gmail.com>
+
+Index: ejabberd/configure.ac
+===================================================================
+--- ejabberd.orig/configure.ac	2014-10-20 11:04:14.751256865 +0200
++++ ejabberd/configure.ac	2014-10-20 11:03:47.983578623 +0200
+@@ -37,10 +37,8 @@ AC_ARG_ENABLE(erlang-version-check,
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
diff --git a/package/ejabberd/0005-fix-includes.patch b/package/ejabberd/0005-fix-includes.patch
new file mode 100644
index 0000000..27ad761
--- /dev/null
+++ b/package/ejabberd/0005-fix-includes.patch
@@ -0,0 +1,45 @@
+Description: correct include
+ This part of the code was moved into it's own project and was packaged
+ separately by me. To make the build process work, this small fix is
+ necessary.
+Author: Philipp Huebner <debalance@debian.org>
+
+Index: ejabberd/src/mod_sip_proxy.erl
+===================================================================
+--- ejabberd.orig/src/mod_sip_proxy.erl
++++ ejabberd/src/mod_sip_proxy.erl
+@@ -21,7 +21,7 @@
+ 
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+--include_lib("esip/include/esip.hrl").
++-include_lib("p1_sip/include/esip.hrl").
+ 
+ -define(SIGN_LIFETIME, 300). %% in seconds.
+ 
+Index: ejabberd/src/mod_sip.erl
+===================================================================
+--- ejabberd.orig/src/mod_sip.erl
++++ ejabberd/src/mod_sip.erl
+@@ -20,7 +20,7 @@
+ 
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+--include_lib("esip/include/esip.hrl").
++-include_lib("p1_sip/include/esip.hrl").
+ 
+ %%%===================================================================
+ %%% API
+Index: ejabberd/src/mod_sip_registrar.erl
+===================================================================
+--- ejabberd.orig/src/mod_sip_registrar.erl
++++ ejabberd/src/mod_sip_registrar.erl
+@@ -20,7 +20,7 @@
+ 
+ -include("ejabberd.hrl").
+ -include("logger.hrl").
+--include_lib("esip/include/esip.hrl").
++-include_lib("p1_sip/include/esip.hrl").
+ 
+ -define(CALL_TIMEOUT, timer:seconds(30)).
+ -define(DEFAULT_EXPIRES, 3600).
diff --git a/package/ejabberd/0006-remove-doc.patch b/package/ejabberd/0006-remove-doc.patch
new file mode 100644
index 0000000..0c0a21b
--- /dev/null
+++ b/package/ejabberd/0006-remove-doc.patch
@@ -0,0 +1,26 @@
+Description: remove installing documentation
+ Without this patch, the Makefile will try to install ejabberd
+ documentation even if it is not generated, which will fail.
+Author: Johan Oudinet <johan.oudinet@gmail.com>
+
+Index: ejabberd/Makefile.in
+===================================================================
+--- ejabberd.orig/Makefile.in	2014-10-21 16:43:42.604972005 +0200
++++ ejabberd/Makefile.in	2014-10-21 16:45:12.419989667 +0200
+@@ -156,16 +156,6 @@ install: all
+ 	$(INSTALL) -d -m 750 $(O_USER) $(LOGDIR)
+ 	$(CHOWN_COMMAND) -R @INSTALLUSER@ $(LOGDIR) >$(CHOWN_OUTPUT)
+ 	chmod -R 750 $(LOGDIR)
+-	#
+-	# Documentation
+-	$(INSTALL) -d $(DOCDIR)
+-	$(INSTALL) -m 644 doc/dev.html $(DOCDIR)
+-	$(INSTALL) -m 644 doc/guide.html $(DOCDIR)
+-	$(INSTALL) -m 644 doc/*.png $(DOCDIR)
+-	[ -f doc/guide.pdf ] \
+-		&& $(INSTALL) -m 644 doc/guide.pdf $(DOCDIR) \
+-		|| echo "No doc/guide.pdf was built"
+-	$(INSTALL) -m 644 COPYING $(DOCDIR)
+ 
+ uninstall: uninstall-binary
+ 
diff --git a/package/ejabberd/0007-fix-install-permissions.patch b/package/ejabberd/0007-fix-install-permissions.patch
new file mode 100644
index 0000000..b4633aa
--- /dev/null
+++ b/package/ejabberd/0007-fix-install-permissions.patch
@@ -0,0 +1,76 @@
+Description: fix install permissions
+ Without this patch, the makefile will try to install directories and
+ files with incompatible permissions for ejabberd, which run as an
+ ejabberd user.
+Author: Johan Oudinet <johan.oudinet@gmail.com>
+
+Index: ejabberd/Makefile.in
+===================================================================
+--- ejabberd.orig/Makefile.in	2014-10-28 12:36:49.228713322 +0100
++++ ejabberd/Makefile.in	2014-10-28 13:53:13.538888807 +0100
+@@ -91,10 +91,10 @@ spec:
+ install: all
+ 	#
+ 	# Configuration files
+-	$(INSTALL) -d -m 750 $(G_USER) $(ETCDIR)
++	$(INSTALL) -d $(ETCDIR)
+ 	[ -f $(ETCDIR)/ejabberd.yml ] \
+-		&& $(INSTALL) -b -m 640 $(G_USER) ejabberd.yml.example $(ETCDIR)/ejabberd.yml-new \
+-		|| $(INSTALL) -b -m 640 $(G_USER) ejabberd.yml.example $(ETCDIR)/ejabberd.yml
++		&& $(INSTALL) -b -m 644 $(G_USER) ejabberd.yml.example $(ETCDIR)/ejabberd.yml-new \
++		|| $(INSTALL) -b -m 644 $(G_USER) ejabberd.yml.example $(ETCDIR)/ejabberd.yml
+ 	$(SED) -e "s*{{rootdir}}*@prefix@*" \
+ 		-e "s*{{installuser}}*@INSTALLUSER@*" \
+ 		-e "s*{{libdir}}*@libdir@*" \
+@@ -104,13 +104,12 @@ install: all
+ 		-e "s*{{erl}}*@ERL@*" ejabberdctl.template \
+ 		> ejabberdctl.example
+ 	[ -f $(ETCDIR)/ejabberdctl.cfg ] \
+-		&& $(INSTALL) -b -m 640 $(G_USER) ejabberdctl.cfg.example $(ETCDIR)/ejabberdctl.cfg-new \
+-		|| $(INSTALL) -b -m 640 $(G_USER) ejabberdctl.cfg.example $(ETCDIR)/ejabberdctl.cfg
++		&& $(INSTALL) -b -m 644 $(G_USER) ejabberdctl.cfg.example $(ETCDIR)/ejabberdctl.cfg-new \
++		|| $(INSTALL) -b -m 644 $(G_USER) ejabberdctl.cfg.example $(ETCDIR)/ejabberdctl.cfg
+ 	$(INSTALL) -b -m 644 $(G_USER) inetrc $(ETCDIR)/inetrc
+ 	#
+ 	# Administration script
+-	[ -d $(SBINDIR) ] || $(INSTALL) -d -m 755 $(SBINDIR)
+-	$(INSTALL) -m 550 $(G_USER) ejabberdctl.example $(SBINDIR)/ejabberdctl
++	$(INSTALL) -D ejabberdctl.example $(SBINDIR)/ejabberdctl
+ 	#
+ 	# Init script
+ 	$(SED) -e "s*@ctlscriptpath@*$(SBINDIR)*" \
+@@ -129,10 +128,7 @@ install: all
+ 	$(INSTALL) -m 644 include/*.hrl $(INCLUDEDIR)
+ 	#
+ 	# Binary C programs
+-	$(INSTALL) -d $(PBINDIR)
+-	$(INSTALL) -m 750 $(O_USER) tools/captcha.sh $(PBINDIR)
+-	-[ -f deps/p1_pam/priv/bin/epam ] \
+-		&& $(INSTALL) -m 750 $(O_USER) deps/p1_pam/priv/bin/epam $(PBINDIR)
++	$(INSTALL) -D tools/captcha.sh $(PBINDIR)/captcha.sh
+ 	#
+ 	# Binary system libraries
+ 	$(INSTALL) -d $(SODIR)
+@@ -140,22 +136,6 @@ install: all
+ 	# Translated strings
+ 	$(INSTALL) -d $(MSGSDIR)
+ 	$(INSTALL) -m 644 priv/msgs/*.msg $(MSGSDIR)
+-	#
+-	# Spool directory
+-	$(INSTALL) -d -m 750 $(O_USER) $(SPOOLDIR)
+-	$(CHOWN_COMMAND) -R @INSTALLUSER@ $(SPOOLDIR) >$(CHOWN_OUTPUT)
+-	chmod -R 750 $(SPOOLDIR)
+-	[ ! -f $(COOKIEFILE) ] || { $(CHOWN_COMMAND) @INSTALLUSER@ $(COOKIEFILE) >$(CHOWN_OUTPUT) ; chmod 400 $(COOKIEFILE) ; }
+-	#
+-	# ejabberdctl lock directory
+-	$(INSTALL) -d -m 750 $(O_USER) $(CTLLOCKDIR)
+-	$(CHOWN_COMMAND) -R @INSTALLUSER@ $(CTLLOCKDIR) >$(CHOWN_OUTPUT)
+-	chmod -R 750 $(CTLLOCKDIR)
+-	#
+-	# Log directory
+-	$(INSTALL) -d -m 750 $(O_USER) $(LOGDIR)
+-	$(CHOWN_COMMAND) -R @INSTALLUSER@ $(LOGDIR) >$(CHOWN_OUTPUT)
+-	chmod -R 750 $(LOGDIR)
+ 
+ uninstall: uninstall-binary
+
diff --git a/package/ejabberd/Config.in b/package/ejabberd/Config.in
new file mode 100644
index 0000000..1a27ef2
--- /dev/null
+++ b/package/ejabberd/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_EJABBERD
+	bool "ejabberd"
+	depends on BR2_PACKAGE_ERLANG
+	select BR2_PACKAGE_ERLANG_LAGER
+	select BR2_PACKAGE_ERLANG_P1_CACHE_TAB
+	select BR2_PACKAGE_ERLANG_P1_ICONV
+	select BR2_PACKAGE_ERLANG_P1_SIP
+	select BR2_PACKAGE_ERLANG_P1_STRINGPREP
+	select BR2_PACKAGE_ERLANG_P1_XML
+	select BR2_PACKAGE_ERLANG_P1_YAML
+	select BR2_PACKAGE_ERLANG_P1_ZLIB
+	select BR2_PACKAGE_OPENSSL
+	help
+	  Ejabberd is a Jabber/XMPP instant messaging server, written
+	  in Erlang/OTP. Among other features, ejabberd is
+	  cross-platform, fault-tolerant, clusterable and modular.
+
+	  http://www.ejabberd.im
+
+comment "ejabberd needs erlang"
+	depends on !BR2_PACKAGE_ERLANG
diff --git a/package/ejabberd/S50ejabberd b/package/ejabberd/S50ejabberd
new file mode 100644
index 0000000..2656307
--- /dev/null
+++ b/package/ejabberd/S50ejabberd
@@ -0,0 +1,35 @@
+#!/bin/sh
+#
+# Start/stop ejabberd
+#
+
+USER=ejabberd
+RUNDIR=/var/run/ejabberd
+
+mkrundir() {
+    install -d -o $USER -g $USER $RUNDIR
+}
+
+case "$1" in
+    start)
+	mkrundir
+        echo "Starting ejabberd..."
+        ejabberdctl start
+        ;;
+    stop)
+        echo -n "Stopping ejabberd... "
+        ejabberdctl stop > /dev/null
+        if [ $? -eq 3 ] || ejabberdctl stopped; then
+            echo "OK"
+        else
+            echo "failed"
+        fi
+        ;;
+    restart|reload)
+        "$0" stop
+        "$0" start
+        ;;
+    *)
+        echo "Usage: $0 {start|stop|restart}"
+        exit 1
+esac
diff --git a/package/ejabberd/check-erlang-lib b/package/ejabberd/check-erlang-lib
new file mode 100755
index 0000000..63f8bf1
--- /dev/null
+++ b/package/ejabberd/check-erlang-lib
@@ -0,0 +1,55 @@
+#!/bin/sh -e
+# Helper to bypass AC_ERLANG_CHECK_LIB
+#
+# Ejabberd releases do not download specific versions of its erlang
+# dependencies.  Instead, it clones the master branch of a git
+# repository and asks erl to provide the library version.  However,
+# the target erl program cannot be called from the host. So, this
+# script aims at finding the library version installed on the target,
+# without calling erlang.
+
+usage() {
+    cat <<EOF
+Usage:
+        $0 library
+Look for Erlang's library in TARGET_DIR/usr/lib/erlang/lib.
+
+If the library is found, it returns the path to the latest version,
+relative to TARGET_DIR. Otherwise, it returns "not found".
+
+If there are several versions, it returns an error because it does not
+know which one Erlang uses.
+
+EOF
+}
+
+die () {
+    echo "$@" >&2
+    exit 1
+}
+
+if [ $# -ne 1 ]; then
+    usage
+    exit 0
+else
+    library="$1"
+fi
+
+target_dir="${TARGET_DIR:-output/target}"
+
+[ -d "$target_dir" ] || die "TARGET_DIR is not a directory. Please \
+specify the TARGET_DIR environment variable."
+
+case "$(ls -1d -- "$target_dir/usr/lib/erlang/lib/$library-"* | wc -l)" in
+    0)
+        echo "not found"
+        ;;
+    1)
+        echo "$target_dir/usr/lib/erlang/lib/$library-"* \
+            | sed -e "s,^$target_dir,,"
+        ;;
+    *)
+        die "Several versions of $library have been found. Please \
+        remove the unused ones."
+        ;;
+esac
diff --git a/package/ejabberd/ejabberd.mk b/package/ejabberd/ejabberd.mk
new file mode 100644
index 0000000..07ce78e
--- /dev/null
+++ b/package/ejabberd/ejabberd.mk
@@ -0,0 +1,51 @@
+################################################################################
+#
+# ejabberd
+#
+################################################################################
+
+EJABBERD_VERSION = 14.07
+EJABBERD_SITE = $(call github,processone,ejabberd,$(EJABBERD_VERSION))
+EJABBERD_LICENSE = GPLv2+ with OpenSSL exception
+EJABBERD_LICENSE_FILES = COPYING
+EJABBERD_DEPENDENCIES = openssl host-erlang-lager erlang-lager \
+	erlang-p1-cache-tab erlang-p1-iconv erlang-p1-sip \
+	erlang-p1-stringprep erlang-p1-xml erlang-p1-yaml erlang-p1-zlib
+
+EJABBERD_USE_AUTOCONF = YES
+EJABBERD_AUTORECONF = YES
+
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+EJABBERD_DEPENDENCIES += linux-pam
+endif
+
+EJABBERD_ERLANG_LIBS = sasl crypto public_key ssl mnesia inets compiler
+
+# Guess answers for these tests, configure will bail out otherwise
+# saying error: cannot run test program while cross compiling.
+EJABBERD_CONF_ENV = \
+	ac_cv_erlang_root_dir="$(HOST_DIR)/usr/lib/erlang" \
+	$(foreach lib,$(EJABBERD_ERLANG_LIBS), \
+		ac_cv_erlang_lib_dir_$(lib)="$(shell package/ejabberd/check-erlang-lib $(lib))")
+
+define EJABBERD_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) install -C $(@D)
+endef
+
+# Delete HOST_DIR prefix from ERL path in ejabberctl script.
+define EJABBERD_FIX_EJABBERDCTL
+	$(SED) 's,ERL=$(HOST_DIR),ERL=,' '$(TARGET_DIR)/usr/sbin/ejabberdctl'
+endef
+
+EJABBERD_POST_INSTALL_TARGET_HOOKS += EJABBERD_FIX_EJABBERDCTL
+
+define EJABBERD_USERS
+ejabberd -1 ejabberd -1 * /var/lib/ejabberd /bin/sh - ejabberd daemon
+endef
+
+define EJABBERD_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/ejabberd/S50ejabberd \
+		$(TARGET_DIR)/etc/init.d/S50ejabberd
+endef
+
+$(eval $(rebar-package))
