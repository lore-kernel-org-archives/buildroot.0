From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Nov 2018 23:00:26 +0100
Subject: [Buildroot] [git commit] package/pkg-generic: ensure absolute paths
 in config-script fixups
Message-ID: <20181202071601.6578F7F917@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c43f28de450adeae998d0e0d974777441510c76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In case a config script is called from a relative path, the $(dirname
$0) would return a relative path too.

Those paths are usually parts of includes or libraries search
directories, and the packagfes buildsystems may chdir() anywhere, and
thus the relative path will no longer be valid. For example:

  $ ./host/powerpc-buildroot-linux-uclibc/sysroot/usr/bin/net-snmp-config --cflags
  [...] -I./host/powerpc-buildroot-linux-uclibc/sysroot/usr/bin/../../.././bin/../powerpc-buildroot-linux-uclibc/sysroot/usr/include/libnl3 [...]

Canonicalise the path to be sure we use absolute paths.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-generic.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 887dc838a4..649a7ad187 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -280,8 +280,8 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
 				-e "s,^\(exec_\)\?prefix=.*,\1prefix=@STAGING_DIR@/usr,g" \
 				-e "s,-I/usr/,-I at STAGING_DIR@/usr/,g" \
 				-e "s,-L/usr/,-L at STAGING_DIR@/usr/,g" \
-				-e 's, at STAGING_DIR@,$$(dirname $$0)/../..,g' \
-				-e 's, at HOST_DIR@,$$(dirname $$0)/../../../..,g' \
+				-e 's, at STAGING_DIR@,$$(dirname $$(realpath -e $$0))/../..,g' \
+				-e 's, at HOST_DIR@,$$(dirname $$(realpath -e $$0))/../../../..,g' \
 				-e "s, at BASE_DIR@,$(BASE_DIR),g" \
 				$(addprefix $(STAGING_DIR)/usr/bin/,$($(PKG)_CONFIG_SCRIPTS)) ;\
 	fi
