From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 12 Nov 2014 20:58:34 +0100
Subject: [Buildroot] [PATCH v4 6/9] autobuild-run: set LC_ALL=C to not use
	locale settings of host machine
In-Reply-To: <1415822317-22500-1-git-send-email-patrickdepinguin@gmail.com>
References: <1415822317-22500-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <1415822317-22500-7-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

If the host machine running autobuild-run happens to have set a
non-English locale, the error messages will be displayed in that
language too. For public results like those generated in the Buildroot
autobuilders, this is a problem.

Therefore, set LC_ALL to a fixed locale (C) at the beginning of the script.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 scripts/autobuild-run | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 3f5b4cf..1ef3f8d 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -48,8 +48,6 @@
 #   of just using the last 500 lines of the build log, search the
 #   start of the build of the failing package.
 #
-# - Add LC_ALL=C where appropriate.
-#
 # - Include the config.log file (when it exists) in the tarball for
 #   failed builds when the failure occurs on an autotools package.
 #
@@ -602,6 +600,11 @@ def merge(dict_1, dict_2):
                 for key in set(dict_2) | set(dict_1))
 
 def main():
+
+    # Avoid locale settings of autobuilder machine leaking in, for example
+    # showing error messages in another language.
+    os.environ['LC_ALL'] = 'C'
+
     check_version()
     sysinfo = SystemInfo()
 
-- 
1.8.5.1
