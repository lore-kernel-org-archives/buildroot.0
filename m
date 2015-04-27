From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Apr 2015 22:03:12 +0200
Subject: [Buildroot] [git commit] civetweb: unbreak static linking builds
Message-ID: <20150427203640.8AF09819D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fc882cf2adbdcb5258312fc8410af929821f5945
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/0a5/0a555a4ad0d100a7d402908b1f26d213de0ec127/
http://autobuild.buildroot.net/results/97b/97b014b2a611ba2528dda86bb05d6ffbec51c21d/
http://autobuild.buildroot.net/results/c2e/c2e314127be74a41bcdb78f04bc51fe2edef0b0f/
http://autobuild.buildroot.net/results/734/7346a89b5e7dd3633ecf9ac5292379ec9e832b2e/

And many more.

It is only the lua suboption that needs dlopen support, so adjust the
toolchain dependencies and CIVETWEB_LIBS handling to match.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/civetweb/Config.in   |    4 ++++
 package/civetweb/civetweb.mk |    3 ++-
 2 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/package/civetweb/Config.in b/package/civetweb/Config.in
index f964ac1..6eed00d 100644
--- a/package/civetweb/Config.in
+++ b/package/civetweb/Config.in
@@ -12,11 +12,15 @@ if BR2_PACKAGE_CIVETWEB
 config BR2_CIVETWEB_WITH_LUA
 	bool "enable Lua support"
 	# required by the bundled Sqlite3 and Lua code
+	depends on !BR2_STATIC_LIBS
 	help
 	  Enable Lua support in Civetweb. Note that this will use a
 	  version of Lua and Sqlite bundled within the Civetweb
 	  sources, and not the packages from Buildroot.
 
+comment "lua support needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 endif
 
 comment "civetweb needs a toolchain w/ threads"
diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
index 048c91f..eee5cbf 100644
--- a/package/civetweb/civetweb.mk
+++ b/package/civetweb/civetweb.mk
@@ -11,12 +11,13 @@ CIVETWEB_LICENSE_FILES = LICENSE.md
 
 CIVETWEB_CONF_OPTS = TARGET_OS=LINUX WITH_IPV6=1
 CIVETWEB_COPT = $(TARGET_CFLAGS) -DHAVE_POSIX_FALLOCATE=0
-CIVETWEB_LIBS = -lpthread -lm -ldl
+CIVETWEB_LIBS = -lpthread -lm
 CIVETWEB_SYSCONFDIR = /etc
 CIVETWEB_HTMLDIR = /var/www
 
 ifeq ($(BR2_CIVETWEB_WITH_LUA),y)
 CIVETWEB_CONF_OPTS += WITH_LUA=1
+CIVETWEB_LIBS += -ldl
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
