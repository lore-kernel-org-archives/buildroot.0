From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  4 Feb 2012 15:48:44 +0100
Subject: [Buildroot] [PATCH 3/7] lttng-babeltrace: make sure WCHAR and
	LARGEFILE are enabled
In-Reply-To: <cover.1328366921.git.thomas.petazzoni@free-electrons.com>
References: <cover.1328366921.git.thomas.petazzoni@free-electrons.com>
Message-ID: <31d67f92d3e86811ef403486a84a4afb8c6257f5.1328366921.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since lttng-babeltrace depends on util-linux and libglib2, we need to
make sure WCHAR and LARGEFILE are enabled.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lttng-babeltrace/Config.in |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/lttng-babeltrace/Config.in b/package/lttng-babeltrace/Config.in
index e6f3845..6f47304 100644
--- a/package/lttng-babeltrace/Config.in
+++ b/package/lttng-babeltrace/Config.in
@@ -4,6 +4,11 @@ config BR2_PACKAGE_LTTNG_BABELTRACE
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_LIBGLIB2
+	# libglib2 needs gettext which needs wchar support, and we
+	# also depends on util-linux which needs wchar
+	depends on BR2_USE_WCHAR
+	# util-linux depends on largefile support
+	depends on BR2_LARGEFILE
 	help
 	  Babeltrace is part of the LTTng 2.x project.
 
@@ -20,3 +25,6 @@ config BR2_PACKAGE_LTTNG_BABELTRACE
 	  lttng-tools package.
 
 	  http://lttng.org
+
+comment "lttng-babeltrace needs WCHAR and LARGEFILE support"
+	depends on BR2_PACKAGE_LTTNG_TOOLS && !(BR2_USE_WCHAR || BR2_LARGEFILE)
-- 
1.7.4.1
