From: Romain Naour <romain.naour@openwide.fr>
Date: Thu,  9 Apr 2015 22:21:33 +0200
Subject: [Buildroot] [PATCH: buildroot-test 2/2] autobuild-run: do not build
	boost package with logging option enabled.
In-Reply-To: <1428610893-9224-1-git-send-email-romain.naour@openwide.fr>
References: <1428610893-9224-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1428610893-9224-2-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

pthread_spin_* functions are not implemented in the uClibc used by this toolchain.

Fixes:
http://autobuild.buildroot.net/results/ba5/ba5836e9a77e1b48e24ace46ca1611c22524261d

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 scripts/autobuild-run | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 35f38ce..f2f239f 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -447,6 +447,11 @@ def fixup_config(**kwargs):
     if 'BR2_PACKAGE_BOOST_LOG=y\n' in configlines and \
        'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-xtensa-full-2015.02.tar.bz2"\n' in configlines:
         return False
+    # This arc uClibc toolchain fails to build boost package with logging option enabled
+    if 'BR2_PACKAGE_BOOST_LOG=y\n' in configlines and \
+       'BR2_UCLIBC_VERSION_ARC_GIT=y\n' in configlines and \
+       'BR2_UCLIBC_VERSION_STRING="arc-2014.12"\n' in configlines:
+        return False
 
     with open(os.path.join(outputdir, ".config"), "w+") as configf:
         configf.writelines(configlines)
-- 
1.9.3
