From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sat,  4 Jul 2020 20:50:45 -0300
Subject: [Buildroot] [PATCH] package/lshw: bump version to 02.19.2
Message-ID: <20200704235045.24559-1-sergio.prado@e-labworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove patch 0001 (changes already upstream) and rework patches 0002 and
0003 (merge request sent upstream [1])

[1] https://github.com/lyonel/lshw/pull/56

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
---
 ...x-musl-build-basename-is-in-libgen.h.patch | 101 ++++++++++++++++++
 ...kefile-allow-to-pass-additional-LIBS.patch |  44 --------
 ...x-musl-build-basename-is-in-libgen.h.patch |  78 --------------
 ...-musl-build-wrong-usage-of-LONG_BIT.patch} |  26 ++---
 package/lshw/lshw.hash                        |   2 +-
 package/lshw/lshw.mk                          |   2 +-
 6 files changed, 117 insertions(+), 136 deletions(-)
 create mode 100644 package/lshw/0001-Fix-musl-build-basename-is-in-libgen.h.patch
 delete mode 100644 package/lshw/0001-Makefile-allow-to-pass-additional-LIBS.patch
 delete mode 100644 package/lshw/0002-Fix-musl-build-basename-is-in-libgen.h.patch
 rename package/lshw/{0003-Fix-use-of-LONG_BIT.patch => 0002-Fix-musl-build-wrong-usage-of-LONG_BIT.patch} (53%)

diff --git a/package/lshw/0001-Fix-musl-build-basename-is-in-libgen.h.patch b/package/lshw/0001-Fix-musl-build-basename-is-in-libgen.h.patch
new file mode 100644
index 000000000000..0917260d4c9b
--- /dev/null
+++ b/package/lshw/0001-Fix-musl-build-basename-is-in-libgen.h.patch
@@ -0,0 +1,101 @@
+From 6bc5abf99ef01e5aeea4f5bce5f5bff7f1b8ddd9 Mon Sep 17 00:00:00 2001
+From: Sergio Prado <sergio.prado@e-labworks.com>
+Date: Sat, 4 Jul 2020 20:02:53 -0300
+Subject: [PATCH] Fix musl build: basename() is in libgen.h.
+
+Also, its argument is not const, so add const_cast.
+
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
+---
+ src/core/sysfs.cc | 19 ++++++++++---------
+ 1 file changed, 10 insertions(+), 9 deletions(-)
+
+diff --git a/src/core/sysfs.cc b/src/core/sysfs.cc
+index 32d65642f157..c2fa84fe8d0f 100644
+--- a/src/core/sysfs.cc
++++ b/src/core/sysfs.cc
+@@ -16,6 +16,7 @@
+ #include <sys/stat.h>
+ #include <sys/types.h>
+ #include <sys/mount.h>
++#include <libgen.h>
+ 
+ 
+ __ID("@(#) $Id$");
+@@ -100,7 +101,7 @@ static string sysfs_getbustype(const string & path)
+   {
+     devname =
+       string(fs.path + "/bus/") + string(namelist[i]->d_name) +
+-      "/devices/" + basename(path.c_str());
++      "/devices/" + basename(const_cast<char*>(path.c_str()));
+ 
+     if (samefile(devname, path))
+       return string(namelist[i]->d_name);
+@@ -140,7 +141,7 @@ static string sysfstobusinfo(const string & path)
+ 
+   if (bustype == "usb")
+   {
+-    string name = basename(path.c_str());
++    string name = basename(const_cast<char*>(path.c_str()));
+     if (matches(name, "^[0-9]+-[0-9]+(\\.[0-9]+)*:[0-9]+\\.[0-9]+$"))
+     {
+       size_t colon = name.rfind(":");
+@@ -151,7 +152,7 @@ static string sysfstobusinfo(const string & path)
+ 
+   if (bustype == "virtio")
+   {
+-    string name = basename(path.c_str());
++    string name = basename(const_cast<char*>(path.c_str()));
+     if (name.compare(0, 6, "virtio") == 0)
+       return "virtio@" + name.substr(6);
+     else
+@@ -159,10 +160,10 @@ static string sysfstobusinfo(const string & path)
+   }
+ 
+   if (bustype == "vio")
+-    return string("vio@") + basename(path.c_str());
++    return string("vio@") + basename(const_cast<char*>(path.c_str()));
+ 
+   if (bustype == "ccw")
+-    return string("ccw@") + basename(path.c_str());
++    return string("ccw@") + basename(const_cast<char*>(path.c_str()));
+ 
+   if (bustype == "ccwgroup")
+   {
+@@ -240,7 +241,7 @@ string entry::driver() const
+   string driverlink = This->devpath + "/driver";
+   if (!exists(driverlink))
+     return "";
+-  return basename(readlink(driverlink).c_str());
++  return basename(const_cast<char*>(readlink(driverlink).c_str()));
+ }
+ 
+ 
+@@ -328,7 +329,7 @@ string entry::name_in_class(const string & classname) const
+ 
+ string entry::name() const
+ {
+-  return basename(This->devpath.c_str());
++  return basename(const_cast<char*>(This->devpath.c_str()));
+ }
+ 
+ 
+@@ -340,12 +341,12 @@ entry entry::parent() const
+ 
+ string entry::classname() const
+ {
+-  return basename(dirname(This->devpath).c_str());
++  return basename(const_cast<char*>(dirname(This->devpath).c_str()));
+ }
+ 
+ bool entry::isvirtual() const
+ {
+-  return string(basename(dirname(dirname(This->devpath)).c_str())) == "virtual";
++  return string(basename(const_cast<char*>(dirname(dirname(This->devpath)).c_str()))) == "virtual";
+ }
+ 
+ string entry::string_attr(const string & name, const string & def) const
+-- 
+2.17.1
+
diff --git a/package/lshw/0001-Makefile-allow-to-pass-additional-LIBS.patch b/package/lshw/0001-Makefile-allow-to-pass-additional-LIBS.patch
deleted file mode 100644
index 7720124369f2..000000000000
--- a/package/lshw/0001-Makefile-allow-to-pass-additional-LIBS.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 5af98ca8135ac411364b16720d795224a9b4a178 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Sat, 30 Jul 2016 15:15:14 +0200
-Subject: [PATCH] Makefile: allow to pass additional LIBS
-
-We need to be able to pass extra LIBS when our toolchain lacks NLS
-support, this way we can build libintl and link to it.  A good example
-is uClibc with locale support disabled.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- src/Makefile     | 2 +-
- src/gui/Makefile | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/Makefile b/src/Makefile
-index b50586b..acbdbfa 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -30,7 +30,7 @@ ifneq ($(shell $(LD) --help 2| grep -- --as-needed), )
- 	LDFLAGS+= -Wl,--as-needed
- endif
- LDSTATIC=-static
--LIBS=-llshw -lresolv
-+LIBS+=-llshw -lresolv
- ifeq ($(SQLITE), 1)
- 	LIBS+= $(shell pkg-config --libs sqlite3)
- endif
-diff --git a/src/gui/Makefile b/src/gui/Makefile
-index 332ce57..7f72e3f 100644
---- a/src/gui/Makefile
-+++ b/src/gui/Makefile
-@@ -11,7 +11,7 @@ INCLUDES=-I../core $(GTKINCLUDES)
- CXXFLAGS=-g -Wall $(INCLUDES) $(DEFINES) $(RPM_OPT_FLAGS)
- CFLAGS=$(CXXFLAGS) $(DEFINES)
- GTKLIBS=$(shell pkg-config gtk+-2.0 gmodule-2.0 --libs)
--LIBS=-L../core -llshw -lresolv $(GTKLIBS)
-+LIBS+=-L../core -llshw -lresolv $(GTKLIBS)
- LDFLAGS=
- ifneq ($(shell $(LD) --help 2| grep -- --as-needed), )
- 	LDFLAGS+= -Wl,--as-needed
--- 
-2.7.4
-
diff --git a/package/lshw/0002-Fix-musl-build-basename-is-in-libgen.h.patch b/package/lshw/0002-Fix-musl-build-basename-is-in-libgen.h.patch
deleted file mode 100644
index d80c62a120ce..000000000000
--- a/package/lshw/0002-Fix-musl-build-basename-is-in-libgen.h.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From 016bdb133a44bdf42c268ff72ee7aa04af19cfd3 Mon Sep 17 00:00:00 2001
-From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
-Date: Sat, 27 Aug 2016 01:11:56 +0200
-Subject: [PATCH] Fix musl build: basename() is in libgen.h.
-
-Also, its argument is not const, so add const_cast. This is risky
-because in fact basename() will modify the argument if it ends with /
-but that's not the case here.
-
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
----
- src/core/dasd.cc  | 1 +
- src/core/sysfs.cc | 9 +++++----
- 2 files changed, 6 insertions(+), 4 deletions(-)
-
-diff --git a/src/core/dasd.cc b/src/core/dasd.cc
-index 626b8a8..6276101 100644
---- a/src/core/dasd.cc
-+++ b/src/core/dasd.cc
-@@ -9,6 +9,7 @@
- #include <sys/ioctl.h>
- #include <linux/fs.h>
- #include <map>
-+#include <libgen.h>
- 
- using namespace std;
- 
-diff --git a/src/core/sysfs.cc b/src/core/sysfs.cc
-index acc9d00..bdd69e3 100644
---- a/src/core/sysfs.cc
-+++ b/src/core/sysfs.cc
-@@ -16,6 +16,7 @@
- #include <sys/stat.h>
- #include <sys/types.h>
- #include <sys/mount.h>
-+#include <libgen.h>
- 
- __ID("@(#) $Id$");
- 
-@@ -99,7 +100,7 @@ static string sysfs_getbustype(const string & path)
-   {
-     devname =
-       string(fs.path + "/bus/") + string(namelist[i]->d_name) +
--      "/devices/" + basename(path.c_str());
-+      "/devices/" + basename(const_cast<char*>(path.c_str()));
- 
-     if (samefile(devname, path))
-       return string(namelist[i]->d_name);
-@@ -139,7 +140,7 @@ static string sysfstobusinfo(const string & path)
- 
-   if (bustype == "virtio")
-   {
--    string name = basename(path.c_str());
-+    string name = basename(const_cast<char*>(path.c_str()));
-     if (name.compare(0, 6, "virtio") == 0)
-       return "virtio@" + name.substr(6);
-     else
-@@ -207,7 +208,7 @@ string entry::driver() const
-   string driverlink = This->devpath + "/driver";
-   if (!exists(driverlink))
-     return "";
--  return basename(readlink(driverlink).c_str());
-+  return basename(const_cast<char*>(readlink(driverlink).c_str()));
- }
- 
- 
-@@ -288,7 +289,7 @@ string entry::name_in_class(const string & classname) const
- 
- string entry::name() const
- {
--  return basename(This->devpath.c_str());
-+  return basename(const_cast<char*>(This->devpath.c_str()));
- }
- 
- 
--- 
-2.9.3
-
diff --git a/package/lshw/0003-Fix-use-of-LONG_BIT.patch b/package/lshw/0002-Fix-musl-build-wrong-usage-of-LONG_BIT.patch
similarity index 53%
rename from package/lshw/0003-Fix-use-of-LONG_BIT.patch
rename to package/lshw/0002-Fix-musl-build-wrong-usage-of-LONG_BIT.patch
index 7d8d73945282..dd8bdb5beb60 100644
--- a/package/lshw/0003-Fix-use-of-LONG_BIT.patch
+++ b/package/lshw/0002-Fix-musl-build-wrong-usage-of-LONG_BIT.patch
@@ -1,7 +1,7 @@
-From 50284ac4400ac3d7562f4765726492caee8ff547 Mon Sep 17 00:00:00 2001
-From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
-Date: Sat, 27 Aug 2016 01:15:13 +0200
-Subject: [PATCH] Fix use of LONG_BIT
+From 246b9e07f22d551fae0718315273760c087b79ca Mon Sep 17 00:00:00 2001
+From: Sergio Prado <sergio.prado@e-labworks.com>
+Date: Sat, 4 Jul 2020 20:28:26 -0300
+Subject: [PATCH] Fix musl build: wrong usage of LONG_BIT
 
 LONG_BIT is not a sysconf value, it is either 32 or 64. Using it as
 a sysconf value will give weird results.
@@ -12,25 +12,27 @@ equal to LONG_BIT: it's either compiled 32-bit or 64-bit so a runtime
 lookup doesn't make sense. For this reason, musl has removed the
 definition of _SC_LONG_BIT.
 
+Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
 Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 ---
- src/core/abi.cc | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
+ src/core/abi.cc | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
 
 diff --git a/src/core/abi.cc b/src/core/abi.cc
-index 76e5082..a13daaa 100644
+index adff7b55acfa..76c664c03ce7 100644
 --- a/src/core/abi.cc
 +++ b/src/core/abi.cc
-@@ -19,8 +19,7 @@ __ID("@(#) $Id: mem.cc 1352 2006-05-27 23:54:13Z ezix $");
- 
+@@ -20,9 +20,7 @@ __ID("@(#) $Id: mem.cc 1352 2006-05-27 23:54:13Z ezix $");
  bool scan_abi(hwNode & system)
  {
--  // are we compiled as 32- or 64-bit process ?
--  system.setWidth(sysconf(LONG_BIT));
+   // are we compiled as 32- or 64-bit process ?
+-  long sc = sysconf(LONG_BIT);
+-  if(sc==-1) sc = sysconf(_SC_LONG_BIT);
+-  if(sc!=-1) system.setWidth(sc);
 +  system.setWidth(LONG_BIT);
  
    pushd(PROC_SYS);
  
 -- 
-2.9.3
+2.17.1
 
diff --git a/package/lshw/lshw.hash b/package/lshw/lshw.hash
index a8352d4283d0..0b60b3b5722e 100644
--- a/package/lshw/lshw.hash
+++ b/package/lshw/lshw.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ae22ef11c934364be4fd2a0a1a7aadf4495a0251ec6979da280d342a89ca3c2f  lshw-B.02.18.tar.gz
+sha256  9bb347ac87142339a366a1759ac845e3dbb337ec000aa1b99b50ac6758a80f80  lshw-B.02.19.2.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/lshw/lshw.mk b/package/lshw/lshw.mk
index 3e8cee2e2ede..9f1ff8938a7b 100644
--- a/package/lshw/lshw.mk
+++ b/package/lshw/lshw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LSHW_VERSION = 02.18
+LSHW_VERSION = 02.19.2
 LSHW_SITE = http://ezix.org/software/files
 LSHW_SOURCE = lshw-B.$(LSHW_VERSION).tar.gz
 LSHW_LICENSE = GPL-2.0
-- 
2.17.1
