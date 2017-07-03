From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon,  3 Jul 2017 18:58:27 +0200
Subject: [Buildroot] [PATCH] libpwquality: select cracklib
Message-ID: <20170703165827.19052-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libpwquality adds cracklib to its _DEPENDENCIES, but forgot to select it in
Config.in, leading to build failures if cracklib isn't explicitly enabled:

Makefile:536: *** cracklib is in the dependency chain of libpwquality that
has added it to its _DEPENDENCIES variable without selecting it or depending
on it from Config.in.  Stop.

No autobuilder references as this error happens before build-time.log is
written, causing the autobuilder to ignore the build result.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpwquality/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libpwquality/Config.in b/package/libpwquality/Config.in
index 4e855254a6..23e15157d1 100644
--- a/package/libpwquality/Config.in
+++ b/package/libpwquality/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBPWQUALITY
 	bool "libpwquality"
+	select BR2_PACKAGE_CRACKLIB
 	help
 	  This is a library for password quality checks and generation
 	  of random passwords that pass the checks.  This library uses
-- 
2.11.0
