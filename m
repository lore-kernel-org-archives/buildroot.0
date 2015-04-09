From: Romain Naour <romain.naour@openwide.fr>
Date: Thu,  9 Apr 2015 22:21:32 +0200
Subject: [Buildroot] [PATCH: buildroot-test 1/2] autobuild-run: do not build
	boost package with logging option enabled.
Message-ID: <1428610893-9224-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

pthread_spin_* functions are not implemented in the uClibc used by this toolchain.

Fixes:
http://autobuild.buildroot.net/results/664/6642dc9c569b2820a9d0e273fc2fb1d5a635ba0a/build-end.log

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 scripts/autobuild-run | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 0e12080..35f38ce 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -443,6 +443,10 @@ def fixup_config(**kwargs):
     if 'BR2_PACKAGE_WESTON=y\n' in configlines and \
        'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
         return False
+    # This xtensa uClibc toolchain fails to build boost package with logging option enabled
+    if 'BR2_PACKAGE_BOOST_LOG=y\n' in configlines and \
+       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-xtensa-full-2015.02.tar.bz2"\n' in configlines:
+        return False
 
     with open(os.path.join(outputdir, ".config"), "w+") as configf:
         configf.writelines(configlines)
-- 
1.9.3
