From: Adrian Perez de Castro <aperez@igalia.com>
Date: Sat, 16 Feb 2019 15:45:28 +0200
Subject: [Buildroot] [PATCH 1/3] package/brotli: disable for microblaze
In-Reply-To: <20190216134530.14717-1-aperez@igalia.com>
References: <20190216134530.14717-1-aperez@igalia.com>
Message-ID: <20190216134530.14717-2-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The brotli package cannot be currently built due to a compiler bug. Not
many packages use it so the impact of disabling it for Microblaze will
be small: only libcurl and woff2 use it; and woff2 is used by webkitgtk
which itself can be built without the woff2 support.

This fixes the following autobuilder failure:

  http://autobuild.buildroot.net/results/1b6e6c5fddf3538ed7f150294c3d8fa94b3e4c59/

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/brotli/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/brotli/Config.in b/package/brotli/Config.in
index e40f5b6b9f..f2a4bdd8e9 100644
--- a/package/brotli/Config.in
+++ b/package/brotli/Config.in
@@ -1,5 +1,10 @@
 config BR2_PACKAGE_BROTLI
 	bool "brotli"
+	# Building on Microblaze is currently broken due to the following
+	# GCC bugs, which affect all versions currently available:
+	#   - https://gcc.gnu.org/bugzilla/show_bug.cgi?id=78380
+	#   - https://gcc.gnu.org/bugzilla/show_bug.cgi?id=69401
+	depends on !BR2_microblaze
 	help
 	  Generic-purpose lossless compression library. The algorithm
 	  compresses data using a combination of a modern variant of
-- 
2.20.1
