From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 14:39:59 +0200
Subject: [Buildroot] [git commit] gcc-final: install libatomic
Message-ID: <20150419124107.5A41881915@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5b9f64e4200a4eeb20173df885d6ab27359f0aa4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's required in some 32-bit architectures for the extended (64-bit)
atomic operations, like __sync_add_and_fetch_8.
These arches are at least: i386, mips & mipsel.

Target size growth is ~15 KiB for ARM.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc-final/gcc-final.mk |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index d76eb31..8fda883 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -118,6 +118,15 @@ endef
 
 HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_INSTALL_LIBGCC
 
+define HOST_GCC_FINAL_INSTALL_LIBATOMIC
+	-cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/libatomic* \
+		$(STAGING_DIR)/lib/
+	-cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/libatomic* \
+		$(TARGET_DIR)/lib/
+endef
+
+HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_INSTALL_LIBATOMIC
+
 # Handle the installation of libraries in /usr/lib
 HOST_GCC_FINAL_USR_LIBS =
 
