From: Romain Naour <romain.naour@gmail.com>
Date: Thu,  4 Aug 2016 18:24:46 +0200
Subject: [Buildroot] [PATCH] package/lshw: fix musl build
Message-ID: <1470327886-29273-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The upstream commit adding musl support was not enough to build lshw
with musl.

dasd.cc: In function 'bool scan_dasd(hwNode&)':
dasd.cc:45:52: error: 'basename' was not declared in this scope
       dev_name = basename(devices.gl_pathv[dev_num]);

Use the same fix.

Upstream status: pending
https://github.com/lyonel/lshw/pull/17

Fixes:
http://autobuild.buildroot.net/results/aa1/aa1c20866fda025167b0d220b316c7d85a1b9663

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/lshw/0002-dasd-sysfs-fix-musl-build.patch | 95 +++++++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 package/lshw/0002-dasd-sysfs-fix-musl-build.patch

diff --git a/package/lshw/0002-dasd-sysfs-fix-musl-build.patch b/package/lshw/0002-dasd-sysfs-fix-musl-build.patch
new file mode 100644
index 0000000..c35d83b
--- /dev/null
+++ b/package/lshw/0002-dasd-sysfs-fix-musl-build.patch
@@ -0,0 +1,95 @@
+From 8245b8812ee7729927a7755e9c1f69f089182fac Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Thu, 4 Aug 2016 17:58:04 +0200
+Subject: [PATCH] dasd,sysfs: fix musl build
+
+The commit cd690bff1516b40fecd5ec4a7f6619e5bffc3cf0 adding musl support
+was not enough to build lshw with musl.
+
+dasd.cc: In function 'bool scan_dasd(hwNode&)':
+dasd.cc:45:52: error: 'basename' was not declared in this scope
+       dev_name = basename(devices.gl_pathv[dev_num]);
+
+Use the same fix.
+
+Fixes:
+http://autobuild.buildroot.net/results/aa1/aa1c20866fda025167b0d220b316c7d85a1b9663
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ src/core/dasd.cc  | 3 ++-
+ src/core/sysfs.cc | 9 +++++----
+ 2 files changed, 7 insertions(+), 5 deletions(-)
+
+diff --git a/src/core/dasd.cc b/src/core/dasd.cc
+index 626b8a8..18d19c3 100644
+--- a/src/core/dasd.cc
++++ b/src/core/dasd.cc
+@@ -4,6 +4,7 @@
+ #include <glob.h>
+ #include <string.h>
+ #include <fcntl.h>
++#include <libgen.h>
+ #include <unistd.h>
+ #include <inttypes.h>
+ #include <sys/ioctl.h>
+@@ -42,7 +43,7 @@ bool scan_dasd(hwNode & n)
+   {
+     for(dev_num=0;dev_num<devices.gl_pathc;dev_num++)
+     {
+-      dev_name = basename(devices.gl_pathv[dev_num]);
++      dev_name = basename(const_cast<char *>(devices.gl_pathv[dev_num]));
+       for (std::vector<std::string>::iterator it = sysfs_attribs.begin(); it != sysfs_attribs.end(); ++it)
+       {
+         std::string attrib_fname = std::string(SYSFS_PREFIX) + dev_name + "/device/" + *it;
+diff --git a/src/core/sysfs.cc b/src/core/sysfs.cc
+index acc9d00..ad55d11 100644
+--- a/src/core/sysfs.cc
++++ b/src/core/sysfs.cc
+@@ -8,6 +8,7 @@
+ #include "sysfs.h"
+ #include "osutils.h"
+ #include <limits.h>
++#include <libgen.h>
+ #include <unistd.h>
+ #include <stdlib.h>
+ #include <stdio.h>
+@@ -99,7 +100,7 @@ static string sysfs_getbustype(const string & path)
+   {
+     devname =
+       string(fs.path + "/bus/") + string(namelist[i]->d_name) +
+-      "/devices/" + basename(path.c_str());
++      "/devices/" + basename(const_cast<char *>(path.c_str()));
+ 
+     if (samefile(devname, path))
+       return string(namelist[i]->d_name);
+@@ -139,7 +140,7 @@ static string sysfstobusinfo(const string & path)
+ 
+   if (bustype == "virtio")
+   {
+-    string name = basename(path.c_str());
++    string name = basename(const_cast<char *>(path.c_str()));
+     if (name.compare(0, 6, "virtio") == 0)
+       return "virtio@" + name.substr(6);
+     else
+@@ -207,7 +208,7 @@ string entry::driver() const
+   string driverlink = This->devpath + "/driver";
+   if (!exists(driverlink))
+     return "";
+-  return basename(readlink(driverlink).c_str());
++  return basename(const_cast<char *>(readlink(driverlink).c_str()));
+ }
+ 
+ 
+@@ -288,7 +289,7 @@ string entry::name_in_class(const string & classname) const
+ 
+ string entry::name() const
+ {
+-  return basename(This->devpath.c_str());
++  return basename(const_cast<char *>(This->devpath.c_str()));
+ }
+ 
+ 
+-- 
+2.5.5
+
-- 
2.5.5
