From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu,  5 Oct 2017 17:06:21 +0200
Subject: [Buildroot] [PATCH 2/2] cryptsetup: add host variant
In-Reply-To: <20171005150621.19570-1-peter@korsgaard.com>
References: <20171005150621.19570-1-peter@korsgaard.com>
Message-ID: <20171005150621.19570-2-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

E.G. for generating dm-verity hashes or dm-crypt data at build time in a
post-image script.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in.host            |  1 +
 package/cryptsetup/Config.in.host |  8 ++++++++
 package/cryptsetup/cryptsetup.mk  | 10 ++++++++++
 3 files changed, 19 insertions(+)
 create mode 100644 package/cryptsetup/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 679fe22a52..3755310de4 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -6,6 +6,7 @@ menu "Host utilities"
 	source "package/checkpolicy/Config.in.host"
 	source "package/cmake/Config.in.host"
 	source "package/cramfs/Config.in.host"
+	source "package/cryptsetup/Config.in.host"
 	source "package/dfu-util/Config.in.host"
 	source "package/dos2unix/Config.in.host"
 	source "package/dosfstools/Config.in.host"
diff --git a/package/cryptsetup/Config.in.host b/package/cryptsetup/Config.in.host
new file mode 100644
index 0000000000..7060ed16a9
--- /dev/null
+++ b/package/cryptsetup/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_CRYPTSETUP
+	bool "host-cryptsetup"
+	select BR2_PACKAGE_HOST_UTIL_LINUX
+	help
+	  This tool helps manipulate dm-crypt and luks partitions for
+	  on-disk encryption.
+
+	  https://gitlab.com/cryptsetup/cryptsetup
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 5496583028..6b0fa318aa 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -28,4 +28,14 @@ else
 CRYPTSETUP_CONF_OPTS += --with-crypto_backend=kernel
 endif
 
+HOST_CRYPTSETUP_DEPENDENCIES = \
+	host-pkgconf \
+	host-lvm2 \
+	host-popt \
+	host-util-linux \
+	host-openssl
+
+HOST_CRYPTSETUP_CONF_OPTS = --with-crypto-backend=openssl
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.11.0
