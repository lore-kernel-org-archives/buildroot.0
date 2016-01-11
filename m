From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon, 11 Jan 2016 17:26:15 +0100
Subject: [Buildroot] [PATCH 1/1] ejabberd: Bump to version 15.11
Message-ID: <1452529575-21493-1-git-send-email-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/ejabberd/0002-disable-rebar-deps.patch     | 62 +++++++++++-----------
 .../ejabberd/0007-fix-install-permissions.patch    | 26 ++++-----
 package/ejabberd/0008-fix-ejabberdctl.patch        | 14 +++--
 package/ejabberd/ejabberd.hash                     |  6 +--
 package/ejabberd/ejabberd.mk                       |  2 +-
 5 files changed, 55 insertions(+), 55 deletions(-)

diff --git a/package/ejabberd/0002-disable-rebar-deps.patch b/package/ejabberd/0002-disable-rebar-deps.patch
index d1602e2..e76b8a2 100644
--- a/package/ejabberd/0002-disable-rebar-deps.patch
+++ b/package/ejabberd/0002-disable-rebar-deps.patch
@@ -6,10 +6,10 @@ Author: Philipp Huebner <debalance@debian.org>
 Index: ejabberd/Makefile.in
 ===================================================================
 diff --git a/Makefile.in b/Makefile.in
-index f7b30d4..4ca4db3 100644
+index 8dd6bf5..b9d783a 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -74,26 +74,11 @@ else
+@@ -77,26 +77,11 @@ else
    INIT_USER=$(INSTALLUSER)
  endif
  
@@ -38,37 +38,39 @@ index f7b30d4..4ca4db3 100644
  xref: all
  	$(REBAR) skip_deps=true xref
  
-@@ -109,8 +94,6 @@ spec:
- 	$(ERL) -noinput +B -pa ebin -pa deps/*/ebin -eval \
- 	'case xml_gen:compile("tools/xmpp_codec.spec") of ok -> halt(0); _ -> halt(1) end.'
+@@ -129,13 +114,10 @@ endef
  
--DLLs := $(wildcard deps/*/priv/*.so) $(wildcard deps/*/priv/lib/*.so)
+ $(foreach file,$(DEPS_FILES_FILTERED) $(MAIN_FILES),$(eval $(call COPY_template,$(file))))
+ 
+-$(call TO_DEST,$(MAIN_DIRS) $(DEPS_DIRS)):
++$(call TO_DEST,$(MAIN_DIRS)):
+ 	$(INSTALL) -d $@
+ 
+-$(call TO_DEST,deps/p1_pam/priv/bin/epam): $(LIBDIR)/%: deps/% $(call TO_DEST,deps/p1_pam/priv/bin/)
+-	$(INSTALL) -m 750 $(O_USER) $< $@
 -
- install: all
+-copy-files: $(call TO_DEST,$(DEPS_FILES) $(MAIN_FILES))
++copy-files: $(call TO_DEST,$(MAIN_FILES))
+ 
+ install: all copy-files
  	#
- 	# Configuration files
-@@ -151,8 +134,6 @@ install: all
- 	$(INSTALL) -d $(BEAMDIR)
- 	$(INSTALL) -m 644 ebin/*.app $(BEAMDIR)
- 	$(INSTALL) -m 644 ebin/*.beam $(BEAMDIR)
--	$(INSTALL) -m 644 deps/*/ebin/*.app $(BEAMDIR)
--	$(INSTALL) -m 644 deps/*/ebin/*.beam $(BEAMDIR)
- 	# Install Elixir and Elixir dependancies
- 	-$(INSTALL) -m 644 deps/*/lib/*/ebin/*.app $(BEAMDIR)
- 	-$(INSTALL) -m 644 deps/*/lib/*/ebin/*.beam $(BEAMDIR)
-@@ -161,7 +142,6 @@ install: all
- 	# ejabberd header files
- 	$(INSTALL) -d $(INCLUDEDIR)
- 	$(INSTALL) -m 644 include/*.hrl $(INCLUDEDIR)
--	$(INSTALL) -m 644 deps/*/include/*.hrl $(INCLUDEDIR)
+@@ -172,10 +154,6 @@ install: all copy-files
+ 		-e "s*@installuser@*$(INIT_USER)*" ejabberd.init.template \
+ 		> ejabberd.init
+ 	chmod 755 ejabberd.init
+-	# Install Elixir and Elixir dependancies
+-	-$(INSTALL) -m 644 deps/*/lib/*/ebin/*.app $(BEAMDIR)
+-	-$(INSTALL) -m 644 deps/*/lib/*/ebin/*.beam $(BEAMDIR)
+-	rm -f $(BEAMDIR)/configure.beam
  	#
  	# Binary C programs
  	$(INSTALL) -d $(PBINDIR)
-@@ -174,7 +154,6 @@ install: all
- 	#
- 	# Binary system libraries
- 	$(INSTALL) -d $(SODIR)
--	$(INSTALL) -m 644 $(DLLs) $(SODIR)
- 	[ -f $(SODIR)/jiffy.so ] && (cd $(PRIVDIR); ln -s lib/jiffy.so; true) || true
- 	[ -f $(SODIR)/sqlite3_drv.so ] && (cd $(PRIVDIR); ln -s lib/sqlite3_drv.so; true) || true
- 	#
+@@ -266,8 +244,6 @@ TAGS:
+ 
+ Makefile: Makefile.in
+ 
+-deps := $(wildcard deps/*/ebin)
+-
+ dialyzer/erlang.plt:
+ 	@mkdir -p dialyzer
+ 	@dialyzer --build_plt --output_plt dialyzer/erlang.plt \
diff --git a/package/ejabberd/0007-fix-install-permissions.patch b/package/ejabberd/0007-fix-install-permissions.patch
index 89e3379..2ad8453 100644
--- a/package/ejabberd/0007-fix-install-permissions.patch
+++ b/package/ejabberd/0007-fix-install-permissions.patch
@@ -7,11 +7,11 @@ Author: Johan Oudinet <johan.oudinet@gmail.com>
 Index: ejabberd/Makefile.in
 ===================================================================
 diff --git a/Makefile.in b/Makefile.in
-index f7b30d4..84098a6 100644
+index b9d783a..6ec805a 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -114,10 +114,8 @@ DLLs := $(wildcard deps/*/priv/*.so) $(wildcard deps/*/priv/lib/*.so)
- install: all
+@@ -122,10 +122,8 @@ copy-files: $(call TO_DEST,$(MAIN_FILES))
+ install: all copy-files
  	#
  	# Configuration files
 -	$(INSTALL) -d -m 750 $(G_USER) $(ETCDIR)
@@ -19,19 +19,20 @@ index f7b30d4..84098a6 100644
 -		&& $(INSTALL) -b -m 640 $(G_USER) ejabberd.yml.example $(ETCDIR)/ejabberd.yml-new \
 -		|| $(INSTALL) -b -m 640 $(G_USER) ejabberd.yml.example $(ETCDIR)/ejabberd.yml
 +	$(INSTALL) -d $(ETCDIR)
-+	$(INSTALL) -b -m 644 $(G_USER) ejabberd.yml.example $(ETCDIR)/ejabberd.yml
++	$(INSTALL) -b -m 644 ejabberd.yml.example $(ETCDIR)/ejabberd.yml
  	$(SED) -e "s*{{rootdir}}*@prefix@*" \
  		-e "s*{{installuser}}*@INSTALLUSER@*" \
  		-e "s*{{bindir}}*@bindir@*" \
-@@ -127,14 +125,11 @@ install: all
+@@ -135,14 +133,11 @@ install: all copy-files
  		-e "s*{{docdir}}*@docdir@*" \
  		-e "s*{{erl}}*@ERL@*" ejabberdctl.template \
  		> ejabberdctl.example
 -	[ -f $(ETCDIR)/ejabberdctl.cfg ] \
 -		&& $(INSTALL) -b -m 640 $(G_USER) ejabberdctl.cfg.example $(ETCDIR)/ejabberdctl.cfg-new \
 -		|| $(INSTALL) -b -m 640 $(G_USER) ejabberdctl.cfg.example $(ETCDIR)/ejabberdctl.cfg
-+	$(INSTALL) -b -m 644 $(G_USER) ejabberdctl.cfg.example $(ETCDIR)/ejabberdctl.cfg
- 	$(INSTALL) -b -m 644 $(G_USER) inetrc $(ETCDIR)/inetrc
+-	$(INSTALL) -b -m 644 $(G_USER) inetrc $(ETCDIR)/inetrc
++	$(INSTALL) -b -m 644 ejabberdctl.cfg.example $(ETCDIR)/ejabberdctl.cfg
++	$(INSTALL) -b -m 644 inetrc $(ETCDIR)/inetrc
  	#
  	# Administration script
 -	[ -d $(SBINDIR) ] || $(INSTALL) -d -m 755 $(SBINDIR)
@@ -40,20 +41,13 @@ index f7b30d4..84098a6 100644
  	# Elixir binaries
  	[ -d $(BINDIR) ] || $(INSTALL) -d -m 755 $(BINDIR)
  	[ -f deps/elixir/bin/iex ] && $(INSTALL) -m 550 $(G_USER) deps/elixir/bin/iex $(BINDIR)/iex || true
-@@ -165,9 +160,9 @@ install: all
+@@ -157,34 +152,11 @@ install: all copy-files
  	#
  	# Binary C programs
  	$(INSTALL) -d $(PBINDIR)
 -	$(INSTALL) -m 750 $(O_USER) tools/captcha.sh $(PBINDIR)
--	$(INSTALL) -m 750 $(O_USER) tools/joincluster $(PBINDIR)
--	$(INSTALL) -m 750 $(O_USER) tools/leavecluster $(PBINDIR)
 +	$(INSTALL) tools/captcha.sh $(PBINDIR)
-+	$(INSTALL) tools/joincluster $(PBINDIR)
-+	$(INSTALL) tools/leavecluster $(PBINDIR)
- 	[ -f deps/p1_pam/priv/bin/epam ] \
- 		&& $(INSTALL) -m 750 $(O_USER) deps/p1_pam/priv/bin/epam $(PBINDIR) \
- 		|| true
-@@ -185,29 +180,6 @@ install: all
+ 	#
  	# Copy lite.sql
  	[ -d deps/sqlite3 ] && $(INSTALL) -d $(SQLDIR) || true
  	[ -d deps/sqlite3 ] && $(INSTALL) -m 644 sql/lite.sql $(SQLDIR) || true
diff --git a/package/ejabberd/0008-fix-ejabberdctl.patch b/package/ejabberd/0008-fix-ejabberdctl.patch
index 9ae23ac..af0b6ee 100644
--- a/package/ejabberd/0008-fix-ejabberdctl.patch
+++ b/package/ejabberd/0008-fix-ejabberdctl.patch
@@ -3,19 +3,23 @@ Description: fix ejabberdctl
  Also add a way for the user to change default values.
 Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
 
+Index: ejabberd/ejabberdctl.template
+===================================================================
 diff --git a/ejabberdctl.template b/ejabberdctl.template
-index 79f4438..df0abba 100755
+index c7d76ef..a7afce1 100755
 --- a/ejabberdctl.template
 +++ b/ejabberdctl.template
-@@ -14,7 +14,10 @@ SCRIPT_DIR=`cd ${0%/*} && pwd`
+@@ -14,9 +14,12 @@ SCRIPT_DIR=`cd ${0%/*} && pwd`
  ERL={{erl}}
  IEX={{bindir}}/iex
  EPMD={{bindir}}/epmd
 -INSTALLUSER={{installuser}}
 +INSTALLUSER=ejabberd
-+
-+# Read default configuration file if present.
-+[ ! -r /etc/default/ejabberd ] || . /etc/default/ejabberd
+ ERL_LIBS={{libdir}}
  
++# Read default configuration file if present
++[ ! -r /etc/default/ejabberd ] || . /etc/default/ejabberd
++
  # check the proper system user is used if defined
  if [ "$INSTALLUSER" != "" ] ; then
+     EXEC_CMD="false"
diff --git a/package/ejabberd/ejabberd.hash b/package/ejabberd/ejabberd.hash
index 20a4e50..b027183 100644
--- a/package/ejabberd/ejabberd.hash
+++ b/package/ejabberd/ejabberd.hash
@@ -1,4 +1,4 @@
-# From https://www.process-one.net/downloads/ejabberd/15.09/ejabberd-15.09.tgz.md5
-md5 616a2fa06064e53ef0130260116dbb68 ejabberd-15.09.tgz
+# From https://www.process-one.net/downloads/ejabberd/15.11/ejabberd-15.11.tgz.md5
+md5 a6997b88d44c5a5acff45bb1d938d0f3 ejabberd-15.11.tgz
 # Locally computed
-sha256 6b6bc3dba5de946927b25cf1f85b44650f9ded4923a782f21a1c9010bb58884d ejabberd-15.09.tgz
+sha256 01044b5a25f9f8dda8c60726698bd27d650751b810e5bfa23f9bb49ba20e946a ejabberd-15.11.tgz
diff --git a/package/ejabberd/ejabberd.mk b/package/ejabberd/ejabberd.mk
index fe7e1ce..841c911 100644
--- a/package/ejabberd/ejabberd.mk
+++ b/package/ejabberd/ejabberd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EJABBERD_VERSION = 15.09
+EJABBERD_VERSION = 15.11
 EJABBERD_SOURCE = ejabberd-$(EJABBERD_VERSION).tgz
 EJABBERD_SITE = https://www.process-one.net/downloads/ejabberd/$(EJABBERD_VERSION)
 EJABBERD_LICENSE = GPLv2+ with OpenSSL exception
-- 
2.5.0
