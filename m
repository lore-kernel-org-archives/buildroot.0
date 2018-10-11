From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Oct 2018 22:02:33 +0200
Subject: [Buildroot] [git commit] policycoreutils: bump to version 2.8
Message-ID: <20181011200602.43AF583460@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=78023992784727e5fa86f2dc84bbaf9d02f78286
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update first and second patch

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...IR-to-all-paths-that-use-an-absolute-path.patch |  8 ++++--
 .../0002-Add-PREFIX-to-host-paths.patch            | 33 +++++++---------------
 package/policycoreutils/policycoreutils.hash       |  2 +-
 package/policycoreutils/policycoreutils.mk         |  4 +--
 4 files changed, 18 insertions(+), 29 deletions(-)

diff --git a/package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch b/package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch
index 3c0ddcc54b..4cfe969a40 100644
--- a/package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch
+++ b/package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch
@@ -13,6 +13,8 @@ accomodate version 2.5
 Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
 Signed-off-by: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
 Signed-off-by: Adam Duskett <AdamDuskett@outlook.com>
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Update for 2.8]
 ---
  setfiles/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -22,11 +24,11 @@ index c08e2dd..36c0638 100644
 --- a/setfiles/Makefile
 +++ b/setfiles/Makefile
 @@ -3,7 +3,7 @@ PREFIX ?= $(DESTDIR)/usr
- SBINDIR ?= $(DESTDIR)/sbin
+ PREFIX ?= /usr
+ SBINDIR ?= /sbin
  MANDIR = $(PREFIX)/share/man
- LIBDIR ?= $(PREFIX)/lib
 -AUDITH ?= $(shell test -f /usr/include/libaudit.h && echo y)
-+AUDITH ?= $(shell test -f $(DESTDIR)/include/libaudit.h && echo y)
++AUDITH ?= $(shell test -f $(DESTDIR)$(PREFIX)/include/libaudit.h && echo y)
  
  ABORT_ON_ERRORS=$(shell grep "^\#define ABORT_ON_ERRORS" setfiles.c | awk -S '{ print $$3 }')
  
diff --git a/package/policycoreutils/0002-Add-PREFIX-to-host-paths.patch b/package/policycoreutils/0002-Add-PREFIX-to-host-paths.patch
index 32d2ae92e6..0b53044180 100644
--- a/package/policycoreutils/0002-Add-PREFIX-to-host-paths.patch
+++ b/package/policycoreutils/0002-Add-PREFIX-to-host-paths.patch
@@ -11,25 +11,14 @@ Updated to work with version 2.5
 Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
 Signed-off-by: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
 Signed-off-by: Adam Duskett <AdamDuskett@outlook.com>
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Update for 2.8]
 ---
  load_policy/Makefile | 2 +-
  newrole/Makefile     | 6 +++---
  run_init/Makefile    | 6 +++---
  3 files changed, 7 insertions(+), 7 deletions(-)
 
-diff --git a/load_policy/Makefile b/load_policy/Makefile
-index b85833c..6a45f31 100644
---- a/load_policy/Makefile
-+++ b/load_policy/Makefile
-@@ -2,7 +2,7 @@
- PREFIX ?= $(DESTDIR)/usr
- SBINDIR ?= $(DESTDIR)/sbin
- MANDIR ?= $(PREFIX)/share/man
--LOCALEDIR ?= /usr/share/locale
-+LOCALEDIR ?= $(PREFIX)/share/locale
- 
- CFLAGS ?= -Werror -Wall -W
- override CFLAGS += $(LDFLAGS) -DUSE_NLS -DLOCALEDIR="\"$(LOCALEDIR)\"" -DPACKAGE="\"policycoreutils\""
 diff --git a/newrole/Makefile b/newrole/Makefile
 index 196af92..896708f 100644
 --- a/newrole/Makefile
@@ -37,13 +26,12 @@ index 196af92..896708f 100644
 @@ -3,9 +3,9 @@ PREFIX ?= $(DESTDIR)/usr
  BINDIR ?= $(PREFIX)/bin
  MANDIR ?= $(PREFIX)/share/man
- ETCDIR ?= $(DESTDIR)/etc
--LOCALEDIR = /usr/share/locale
+ ETCDIR ?= /etc
+ LOCALEDIR = $(DESTDIR)$(PREFIX)/share/locale
 -PAMH ?= $(shell test -f /usr/include/security/pam_appl.h && echo y)
 -AUDITH ?= $(shell test -f /usr/include/libaudit.h && echo y)
-+LOCALEDIR = $(PREFIX)/share/locale
-+PAMH ?= $(shell test -f $(PREFIX)/include/security/pam_appl.h && echo y)
-+AUDITH ?= $(shell test -f $(PREFIX)/include/libaudit.h && echo y)
++PAMH ?= $(shell test -f $(DESTDIR)$(PREFIX)/include/security/pam_appl.h && echo y)
++AUDITH ?= $(shell test -f $(DESTDIR)$(PREFIX)/include/libaudit.h && echo y)
  # Enable capabilities to permit newrole to generate audit records.
  # This will make newrole a setuid root program.
  # The capabilities used are: CAP_AUDIT_WRITE.
@@ -54,13 +42,12 @@ index 921f0b0..e1566fc 100644
 @@ -4,9 +4,9 @@ PREFIX ?= $(DESTDIR)/usr
  SBINDIR ?= $(PREFIX)/sbin
  MANDIR ?= $(PREFIX)/share/man
- ETCDIR ?= $(DESTDIR)/etc
--LOCALEDIR ?= /usr/share/locale
+ ETCDIR ?= /etc
+ LOCALEDIR ?= $(DESTDIR)$(PREFIX)/share/locale
 -PAMH ?= $(shell test -f /usr/include/security/pam_appl.h && echo y)
 -AUDITH ?= $(shell test -f /usr/include/libaudit.h && echo y)
-+LOCALEDIR ?= $(PREFIX)/share/locale
-+PAMH ?= $(shell test -f $(PREFIX)/include/security/pam_appl.h && echo y)
-+AUDITH ?= $(shell test -f $(PREFIX)/include/libaudit.h && echo y)
++PAMH ?= $(shell test -f $(DESTDIR)$(PREFIX)/include/security/pam_appl.h && echo y)
++AUDITH ?= $(shell test -f $(DESTDIR)$(PREFIX)/include/libaudit.h && echo y)
  
  CFLAGS ?= -Werror -Wall -W
  override CFLAGS += -DUSE_NLS -DLOCALEDIR="\"$(LOCALEDIR)\"" -DPACKAGE="\"policycoreutils\""
diff --git a/package/policycoreutils/policycoreutils.hash b/package/policycoreutils/policycoreutils.hash
index 241905ca22..b6367b4bf4 100644
--- a/package/policycoreutils/policycoreutils.hash
+++ b/package/policycoreutils/policycoreutils.hash
@@ -1,3 +1,3 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256 0a1b8a4a323b854981c6755ff025fe98a0f1cff307f109abb260f0490f13e4f4 policycoreutils-2.7.tar.gz
+sha256 986553a235f27bee7ad7c2b7c35ea51eb2ee68e2cf03b661b1585de101bc1099 policycoreutils-2.8.tar.gz
 sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994 COPYING
diff --git a/package/policycoreutils/policycoreutils.mk b/package/policycoreutils/policycoreutils.mk
index 21c5470cec..abd70e16c8 100644
--- a/package/policycoreutils/policycoreutils.mk
+++ b/package/policycoreutils/policycoreutils.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-POLICYCOREUTILS_VERSION = 2.7
-POLICYCOREUTILS_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20170804
+POLICYCOREUTILS_VERSION = 2.8
+POLICYCOREUTILS_SITE = https://raw.githubusercontent.com/wiki/SELinuxProject/selinux/files/releases/20180524
 POLICYCOREUTILS_LICENSE = GPL-2.0
 POLICYCOREUTILS_LICENSE_FILES = COPYING
 
