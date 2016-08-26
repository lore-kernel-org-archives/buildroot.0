From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 27 Aug 2016 01:29:40 +0200
Subject: [Buildroot] [PATCH] package/lshw: add patches for musl build
Message-ID: <20160826232940.23592-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixing one issue exposed a second one.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...02-Fix-musl-build-basename-is-in-libgen.h.patch | 78 ++++++++++++++++++++++
 package/lshw/0003-Fix-use-of-LONG_BIT.patch        | 36 ++++++++++
 2 files changed, 114 insertions(+)
 create mode 100644 package/lshw/0002-Fix-musl-build-basename-is-in-libgen.h.patch
 create mode 100644 package/lshw/0003-Fix-use-of-LONG_BIT.patch

diff --git a/package/lshw/0002-Fix-musl-build-basename-is-in-libgen.h.patch b/package/lshw/0002-Fix-musl-build-basename-is-in-libgen.h.patch
new file mode 100644
index 0000000..d80c62a
--- /dev/null
+++ b/package/lshw/0002-Fix-musl-build-basename-is-in-libgen.h.patch
@@ -0,0 +1,78 @@
+From 016bdb133a44bdf42c268ff72ee7aa04af19cfd3 Mon Sep 17 00:00:00 2001
+From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
+Date: Sat, 27 Aug 2016 01:11:56 +0200
+Subject: [PATCH] Fix musl build: basename() is in libgen.h.
+
+Also, its argument is not const, so add const_cast. This is risky
+because in fact basename() will modify the argument if it ends with /
+but that's not the case here.
+
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ src/core/dasd.cc  | 1 +
+ src/core/sysfs.cc | 9 +++++----
+ 2 files changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/src/core/dasd.cc b/src/core/dasd.cc
+index 626b8a8..6276101 100644
+--- a/src/core/dasd.cc
++++ b/src/core/dasd.cc
+@@ -9,6 +9,7 @@
+ #include <sys/ioctl.h>
+ #include <linux/fs.h>
+ #include <map>
++#include <libgen.h>
+ 
+ using namespace std;
+ 
+diff --git a/src/core/sysfs.cc b/src/core/sysfs.cc
+index acc9d00..bdd69e3 100644
+--- a/src/core/sysfs.cc
++++ b/src/core/sysfs.cc
+@@ -16,6 +16,7 @@
+ #include <sys/stat.h>
+ #include <sys/types.h>
+ #include <sys/mount.h>
++#include <libgen.h>
+ 
+ __ID("@(#) $Id$");
+ 
+@@ -99,7 +100,7 @@ static string sysfs_getbustype(const string & path)
+   {
+     devname =
+       string(fs.path + "/bus/") + string(namelist[i]->d_name) +
+-      "/devices/" + basename(path.c_str());
++      "/devices/" + basename(const_cast<char*>(path.c_str()));
+ 
+     if (samefile(devname, path))
+       return string(namelist[i]->d_name);
+@@ -139,7 +140,7 @@ static string sysfstobusinfo(const string & path)
+ 
+   if (bustype == "virtio")
+   {
+-    string name = basename(path.c_str());
++    string name = basename(const_cast<char*>(path.c_str()));
+     if (name.compare(0, 6, "virtio") == 0)
+       return "virtio@" + name.substr(6);
+     else
+@@ -207,7 +208,7 @@ string entry::driver() const
+   string driverlink = This->devpath + "/driver";
+   if (!exists(driverlink))
+     return "";
+-  return basename(readlink(driverlink).c_str());
++  return basename(const_cast<char*>(readlink(driverlink).c_str()));
+ }
+ 
+ 
+@@ -288,7 +289,7 @@ string entry::name_in_class(const string & classname) const
+ 
+ string entry::name() const
+ {
+-  return basename(This->devpath.c_str());
++  return basename(const_cast<char*>(This->devpath.c_str()));
+ }
+ 
+ 
+-- 
+2.9.3
+
diff --git a/package/lshw/0003-Fix-use-of-LONG_BIT.patch b/package/lshw/0003-Fix-use-of-LONG_BIT.patch
new file mode 100644
index 0000000..7d8d739
--- /dev/null
+++ b/package/lshw/0003-Fix-use-of-LONG_BIT.patch
@@ -0,0 +1,36 @@
+From 50284ac4400ac3d7562f4765726492caee8ff547 Mon Sep 17 00:00:00 2001
+From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
+Date: Sat, 27 Aug 2016 01:15:13 +0200
+Subject: [PATCH] Fix use of LONG_BIT
+
+LONG_BIT is not a sysconf value, it is either 32 or 64. Using it as
+a sysconf value will give weird results.
+
+Originally it was sysconf(_SC_LONG_BIT) (before it was "fixed" by the
+gentoo guys). But this is useless: it will always return a value
+equal to LONG_BIT: it's either compiled 32-bit or 64-bit so a runtime
+lookup doesn't make sense. For this reason, musl has removed the
+definition of _SC_LONG_BIT.
+
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ src/core/abi.cc | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/src/core/abi.cc b/src/core/abi.cc
+index 76e5082..a13daaa 100644
+--- a/src/core/abi.cc
++++ b/src/core/abi.cc
+@@ -19,8 +19,7 @@ __ID("@(#) $Id: mem.cc 1352 2006-05-27 23:54:13Z ezix $");
+ 
+ bool scan_abi(hwNode & system)
+ {
+-  // are we compiled as 32- or 64-bit process ?
+-  system.setWidth(sysconf(LONG_BIT));
++  system.setWidth(LONG_BIT);
+ 
+   pushd(PROC_SYS);
+ 
+-- 
+2.9.3
+
-- 
2.9.3
