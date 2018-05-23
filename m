From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 23 May 2018 16:53:46 -0500
Subject: [Buildroot] [PATCH] utils/genrandconfig: filter microblaze GCC < 8
 bug
Message-ID: <1527112426-21842-1-git-send-email-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Works around https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180
which is an issue where the Microblaze archtecture had code that
caused a infinite recursion while optimizing in versions of GCC
less then 8.x.  More BR discussion can be found on this thread.
http://buildroot-busybox.2317881.n4.nabble.com/autobuild-buildroot-net-Build-results-for-2018-04-25-td192721.html

CC: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---

Note: I do not have a good way to test this.

---
 utils/genrandconfig | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 06701ce..bf7c4bc 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -320,6 +320,21 @@ def fixup_config(configfile):
     if 'BR2_or1k=y\n' in configlines and \
        'BR2_PACKAGE_QT_GUI_MODULE=y\n' in configlines:
         return False
+    # The microblaze uclibc build hangs on GCC < 8.x (https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180)
+    # http://autobuild.buildroot.net/results/40d/40d33ff9e3367a22253c58b388c77d9858981bff/
+    if 'BR2_PACKAGE_BOOST=y\n' in configlines and \
+       BR2_TOOLCHAIN_EXTERNAL_URL + 'br-microblaze-full-2018.02-891-g046c5e2.tar.bz2"\n' in configlines:
+        return False
+    # The microblaze uclibc build hangs on GCC < 8.x (https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180)
+    # http://autobuild.buildroot.net/results/424/42480ee672497a600b87e8d983e2d427befc62af/
+    if 'BR2_PACKAGE_FLARE_ENGINE=y\n' in configlines and \
+       BR2_TOOLCHAIN_EXTERNAL_URL + 'br-microblaze-full-2018.02-891-g046c5e2.tar.bz2"\n' in configlines:
+        return False
+    # The microblaze uclibc build hangs on GCC < 8.x (https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180)
+    # http://autobuild.buildroot.net/results/d20/d20700bd538ba1e9d45ab8a61ecbbba1a320ef38/
+    if 'BR2_PACKAGE_GST_FFMPEG=y\n' in configlines and \
+       BR2_TOOLCHAIN_EXTERNAL_URL + 'br-microblaze-full-2018.02-891-g046c5e2.tar.bz2"\n' in configlines:
+        return False
 
     with open(configfile, "w+") as configf:
         configf.writelines(configlines)
-- 
1.9.1
