From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 8 Oct 2011 23:06:43 +0200
Subject: [Buildroot] [git commit] poco: unbreak mysql support
Message-ID: <20111008211014.617EE8E24C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=610d64b4b934caff1772ce3d30546b53cba53d34
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update patch to also pass include directory for mysql headers, and get
rid of host directories in -L / -I arguments. Finally look in
staging rather than target for libmysqlclient.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../poco-1.4.2p1-add-staging-search-path.patch     |    9 +++++----
 package/poco/poco.mk                               |    3 ++-
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/poco/poco-1.4.2p1-add-staging-search-path.patch b/package/poco/poco-1.4.2p1-add-staging-search-path.patch
index 18ee076..638ee2a 100644
--- a/package/poco/poco-1.4.2p1-add-staging-search-path.patch
+++ b/package/poco/poco-1.4.2p1-add-staging-search-path.patch
@@ -2,9 +2,10 @@ From: Baruch Siach <baruch@tkos.co.il>
 Subject: [PATCH] poco: add the staging path to search path
 
 Add the mysql headers and client libraries to the search path of the
-preprocessor and the linker. The $MYSQL_LIBDIR variable must be set from the
-make command line.
+preprocessor and the linker. The $MYSQL_LIBDIR / $MYSQL_INCIDR variables
+must be set from the make command line.
 
+[Peter: Remove host dirs, add MYSQL_INCDIR]
 Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 --- 
 --- poco-1.4.1p1-all-dist/Data/MySQL/Makefile	2011-02-09 11:13:00.000000000 +0200
@@ -15,8 +16,8 @@ Signed-off-by: Baruch Siach <baruch@tkos.co.il>
  
 -SYSLIBS += -L/usr/local/lib/mysql -L/usr/lib/mysql -L/usr/mysql/lib/mysql -L/usr/local/mysql/lib -lmysqlclient
 -INCLUDE += -I/usr/local/include/mysql/ -I/usr/include/mysql -I/usr/mysql/include/mysql -I/usr/local/mysql/include
-+SYSLIBS += -L$(MYSQL_LIBDIR) -L/usr/local/lib/mysql -L/usr/lib/mysql -L/usr/mysql/lib/mysql -L/usr/local/mysql/lib -lmysqlclient
-+INCLUDE += -I/usr/local/include/mysql/ -I/usr/include/mysql -I/usr/mysql/include/mysql -I/usr/local/mysql/include -I=/mysql
++SYSLIBS += -L$(MYSQL_LIBDIR) -lmysqlclient
++INCLUDE += -I$(MYSQL_INCDIR)
  SYSFLAGS += -DTHREADSAFE -DNO_TCL
  
  objects = Binder Extractor SessionImpl Connector \
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 4823935..5d07972 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -43,7 +43,8 @@ endef
 
 define POCO_BUILD_CMDS
 	$(MAKE) POCO_TARGET_OSARCH=$(ARCH) CROSSENV=$(TARGET_CROSS) \
-		MYSQL_LIBDIR=$(TARGET_DIR)/usr/lib/mysql -C $(@D)
+		MYSQL_LIBDIR=$(STAGING_DIR)/usr/lib/mysql \
+		MYSQL_INCDIR=$(STAGING_DIR)/usr/include/mysql -C $(@D)
 endef
 
 define POCO_INSTALL_STAGING_CMDS
