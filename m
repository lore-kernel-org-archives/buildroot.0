From: Markus Mayer <mmayer@broadcom.com>
Date: Fri, 15 Feb 2019 15:20:06 -0800
Subject: [Buildroot] [PATCH] tar: add Config.in.host
Message-ID: <20190215232006.4990-1-mmayer@broadcom.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a config option to build tar for the host, so the user can choose
to build it, even if Buildroot wouldn't do so ordinarily.

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---

Since Buildroot can only work with three tar version (1.27-1.29), the
likelihood that system tar is too old or too new is quite high -- and
increasing. Ubuntu 16.04 and 18.04 ship with an acceptabe version of
tar. As of Ubuntu 18.10, system tar is already too recent.

Our main build machines are Ubuntu 16.04, but we need to support other
platforms. We need build machines of different flavours to be able to
build buildroot without requiring an Internet connection, using only
pre-downloaded package tar-balls (downloaded during the master build).

We can't rely that the tar sources have been downloaded automatically
based on what was detected on the master build machine, because it may
not require host-tar while a different build machine might.

A manual config option will give us the choice to build and bundle
host-tar regardless of what Buildroot finds on the master.

 package/Config.in.host     | 1 +
 package/tar/Config.in.host | 8 ++++++++
 2 files changed, 9 insertions(+)
 create mode 100644 package/tar/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index b4c501a33b32..6fa37c33732b 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -60,6 +60,7 @@ menu "Host utilities"
 	source "package/squashfs/Config.in.host"
 	source "package/sunxi-tools/Config.in.host"
 	source "package/swig/Config.in.host"
+	source "package/tar/Config.in.host"
 	source "package/tegrarcm/Config.in.host"
 	source "package/ti-cgt-pru/Config.in.host"
 	source "package/uboot-tools/Config.in.host"
diff --git a/package/tar/Config.in.host b/package/tar/Config.in.host
new file mode 100644
index 000000000000..ef3bdf30de89
--- /dev/null
+++ b/package/tar/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_TAR
+	bool "host tar"
+	help
+	  A program that saves many files together into a single tape
+	  or disk archive, and can restore individual files from the
+	  archive.
+
+	  http://www.gnu.org/software/tar/
-- 
2.17.1
