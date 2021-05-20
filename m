From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 20 May 2021 10:46:43 -0700
Subject: [Buildroot] [PATCH/NEXT: 05/11] package/policycoreutils: bump to
 version 3.2
In-Reply-To: <20210520174649.1188340-1-aduskett@gmail.com>
References: <20210520174649.1188340-1-aduskett@gmail.com>
Message-ID: <20210520174649.1188340-6-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also refactor patches to apply cleanly.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 ...-all-paths-that-use-an-absolute-path.patch | 11 +++---
 .../0002-Add-PREFIX-to-host-paths.patch       | 36 +++++++++----------
 package/policycoreutils/policycoreutils.hash  |  2 +-
 package/policycoreutils/policycoreutils.mk    |  6 ++--
 4 files changed, 27 insertions(+), 28 deletions(-)

diff --git a/package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch b/package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch
index 57833d8176..aa75ca63c0 100644
--- a/package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch
+++ b/package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch
@@ -12,26 +12,27 @@ accomodate version 2.5
 
 Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
 Signed-off-by: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 [Update for 2.8]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+[Update for 3.2]
 ---
  setfiles/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/setfiles/Makefile b/setfiles/Makefile
-index c08e2dd..36c0638 100644
+index a3bbbe1..df675cf 100644
 --- a/setfiles/Makefile
 +++ b/setfiles/Makefile
-@@ -3,7 +3,7 @@ PREFIX ?= $(DESTDIR)/usr
+@@ -3,7 +3,7 @@ LINGUAS ?= ru
  PREFIX ?= /usr
  SBINDIR ?= /sbin
  MANDIR = $(PREFIX)/share/man
 -AUDITH ?= $(shell test -f /usr/include/libaudit.h && echo y)
 +AUDITH ?= $(shell test -f $(DESTDIR)$(PREFIX)/include/libaudit.h && echo y)
  
- ABORT_ON_ERRORS=$(shell grep "^\#define ABORT_ON_ERRORS" setfiles.c | awk -S '{ print $$3 }')
- 
+ CFLAGS ?= -g -Werror -Wall -W
+ override LDLIBS += -lselinux -lsepol
 -- 
 2.13.6
 
diff --git a/package/policycoreutils/0002-Add-PREFIX-to-host-paths.patch b/package/policycoreutils/0002-Add-PREFIX-to-host-paths.patch
index ffe5fcbd44..2daed57c97 100644
--- a/package/policycoreutils/0002-Add-PREFIX-to-host-paths.patch
+++ b/package/policycoreutils/0002-Add-PREFIX-to-host-paths.patch
@@ -6,41 +6,39 @@ Subject: [PATCH] Add PREFIX to host paths
 Updates the remaining hardcoded host paths used in the build to be
 prefixed with a PREFIX path to allow cross compilation.
 
-Updated to work with version 2.5
+Updated to work with version 3.2
 
 Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
 Signed-off-by: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
-Signed-off-by: Adam Duskett <aduskett@gmail.com>
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 [Update for 2.8]
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
+[Update for 3.2]
 ---
- load_policy/Makefile | 2 +-
- newrole/Makefile     | 6 +++---
- run_init/Makefile    | 6 +++---
- 3 files changed, 7 insertions(+), 7 deletions(-)
+ newrole/Makefile  | 4 ++--
+ run_init/Makefile | 4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/newrole/Makefile b/newrole/Makefile
-index 196af92..896708f 100644
+index 0e7ebce..3188cec 100644
 --- a/newrole/Makefile
 +++ b/newrole/Makefile
-@@ -3,9 +3,9 @@ PREFIX ?= $(DESTDIR)/usr
+@@ -4,8 +4,8 @@ PREFIX ?= /usr
  BINDIR ?= $(PREFIX)/bin
  MANDIR ?= $(PREFIX)/share/man
  ETCDIR ?= /etc
- LOCALEDIR = $(DESTDIR)$(PREFIX)/share/locale
--PAMH ?= $(shell test -f /usr/include/security/pam_appl.h && echo y)
--AUDITH ?= $(shell test -f /usr/include/libaudit.h && echo y)
-+PAMH ?= $(shell test -f $(DESTDIR)$(PREFIX)/include/security/pam_appl.h && echo y)
-+AUDITH ?= $(shell test -f $(DESTDIR)$(PREFIX)/include/libaudit.h && echo y)
+-LOCALEDIR = $(DESTDIR)$(PREFIX)/share/locale
+-INCLUDEDIR ?= $(PREFIX)/include
++LOCALEDIR = $(DESTDIR)$(PREFIX)
++INCLUDEDIR ?= $(LOCALEDIR)/include
+ PAMH ?= $(shell test -f $(INCLUDEDIR)/security/pam_appl.h && echo y)
+ AUDITH ?= $(shell test -f $(INCLUDEDIR)/libaudit.h && echo y)
  # Enable capabilities to permit newrole to generate audit records.
- # This will make newrole a setuid root program.
- # The capabilities used are: CAP_AUDIT_WRITE.
 diff --git a/run_init/Makefile b/run_init/Makefile
-index 921f0b0..e1566fc 100644
+index e86364a..20a64d4 100644
 --- a/run_init/Makefile
 +++ b/run_init/Makefile
-@@ -4,9 +4,9 @@ PREFIX ?= $(DESTDIR)/usr
- SBINDIR ?= $(PREFIX)/sbin
+@@ -6,8 +6,8 @@ SBINDIR ?= $(PREFIX)/sbin
  MANDIR ?= $(PREFIX)/share/man
  ETCDIR ?= /etc
  LOCALEDIR ?= $(DESTDIR)$(PREFIX)/share/locale
@@ -52,5 +50,5 @@ index 921f0b0..e1566fc 100644
  CFLAGS ?= -Werror -Wall -W
  override CFLAGS += -DUSE_NLS -DLOCALEDIR="\"$(LOCALEDIR)\"" -DPACKAGE="\"policycoreutils\""
 -- 
-2.13.6
+2.31.1
 
diff --git a/package/policycoreutils/policycoreutils.hash b/package/policycoreutils/policycoreutils.hash
index 5dae18f17d..7d08636370 100644
--- a/package/policycoreutils/policycoreutils.hash
+++ b/package/policycoreutils/policycoreutils.hash
@@ -1,3 +1,3 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 c889f62ee80f8b6a369469a9b8af51f5b797975aeaa291f5c5960cc12eed1934 policycoreutils-3.1.tar.gz
+sha256 d1331c6fa766c547b071c491de90b9f343c8dbffdb119be8a5a7e491199b93a9 policycoreutils-3.2.tar.gz
 sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994 COPYING
diff --git a/package/policycoreutils/policycoreutils.mk b/package/policycoreutils/policycoreutils.mk
index 0dfdc7af03..a486f8ddc3 100644
--- a/package/policycoreutils/policycoreutils.mk
+++ b/package/policycoreutils/policycoreutils.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-POLICYCOREUTILS_VERSION = 3.1
-POLICYCOREUTILS_SITE = https://github.com/SELinuxProject/selinux/releases/download/20200710
+POLICYCOREUTILS_VERSION = 3.2
+POLICYCOREUTILS_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(POLICYCOREUTILS_VERSION)
 POLICYCOREUTILS_LICENSE = GPL-2.0
 POLICYCOREUTILS_LICENSE_FILES = COPYING
 POLICYCOREUTILS_CPE_ID_VENDOR = selinuxproject
@@ -24,7 +24,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_AUDIT),y)
 POLICYCOREUTILS_DEPENDENCIES += audit
-POLICYCOREUTILS_MAKE_OPTS += AUDIT_LOG_PRIV=y
+POLICYCOREUTILS_MAKE_OPTS += AUDIT_LOG_PRIV=y USE_AUDIT=y
 endif
 
 # Enable LSPP_PRIV if both audit and linux pam are enabled
-- 
2.31.1
