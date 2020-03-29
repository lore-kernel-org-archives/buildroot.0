From: unixmania at gmail.com <unixmania@gmail.com>
Date: Sun, 29 Mar 2020 20:49:23 -0300
Subject: [Buildroot] [PATCH 2/3] package/procps-ng: add busybox-related
 comments to S02sysctl
In-Reply-To: <20200329234924.14505-1-unixmania@gmail.com>
References: <20200329234924.14505-1-unixmania@gmail.com>
Message-ID: <20200329234924.14505-3-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Explain the busybox peculiarities and how the script works with both
versions of the sysctl utility.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 package/procps-ng/S02sysctl | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/package/procps-ng/S02sysctl b/package/procps-ng/S02sysctl
index 3a58578de4..fed64e91a6 100644
--- a/package/procps-ng/S02sysctl
+++ b/package/procps-ng/S02sysctl
@@ -1,4 +1,17 @@
 #!/bin/sh
+#
+# This script is used by busybox and procps-ng.
+#
+# With procps-ng, the "--system" option of sysctl also enables "--ignore", so
+# errors are not reported via syslog. Use the run_logger function to mimic the
+# --system behavior, still reporting errors via syslog. Users not interested
+# on error reports can add "-e" to SYSCTL_ARGS.
+#
+# busybox does not have a "--system" option neither reports errors via syslog,
+# so the scripting provides a consistent behavior between the implementations.
+# Testing the busybox sysctl exit code is fruitless, as at the moment, since
+# its exit status is zero even if errors happen. Hopefully this will be fixed
+# in a future busybox version.
 
 PROGRAM="sysctl"
 
@@ -12,12 +25,6 @@ SYSCTL_ARGS=""
 # symlinks to it. No attempt is made to prevent this.
 SYSCTL_SOURCES="/etc/sysctl.d/ /usr/local/lib/sysctl.d/ /usr/lib/sysctl.d/ /lib/sysctl.d/ /etc/sysctl.conf"
 
-# The "--system" option activates "--ignore", which is bad because invalid
-# variable settings in the configuration files will not be reported on the
-# system log. Use some scripting to mimic the --system behavior but still
-# reporting errors. Users not interested on error report can put "-e" in
-# SYSCTL_ARGS.
-#
 # The file redirections do the following:
 #
 # - stdout is redirected to syslog with facility.level "kern.info"
-- 
2.18.2
