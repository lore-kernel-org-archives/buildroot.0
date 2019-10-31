From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 31 Oct 2019 22:19:34 +0100
Subject: [Buildroot] [git commit] package/sysrepo: link with libatomic when
 needed
Message-ID: <20191031211254.036BD81438@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=933cf85aa6a7e0ed916acd21a9564df851cb2051
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On some architectures, atomic binutils are provided by the libatomic
library from gcc. Linking with libatomic is therefore necessary,
otherwise the build fails with:

/home/buildroot/autobuild/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/7.4.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: libsysrepo.so.0.7.8: undefined reference to `__atomic_fetch_add_4'

This is often for example the case on sparcv8 32 bit.

Fixes:
 - http://autobuild.buildroot.org/results/d807f3dc922a61e099a66de3bc340c018a86e150

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sysrepo/sysrepo.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk
index 31317d6236..72c380768d 100644
--- a/package/sysrepo/sysrepo.mk
+++ b/package/sysrepo/sysrepo.mk
@@ -29,6 +29,10 @@ SYSREPO_CONF_OPTS = \
 # build .. https://github.com/sysrepo/sysrepo/issues/947
 SYSREPO_CONF_OPTS += -DUSE_SR_MEM_MGMT=OFF
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+SYSREPO_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
+endif
+
 define SYSREPO_INSTALL_INIT_SYSV
 	$(INSTALL) -m 755 -D package/sysrepo/S50sysrepod \
 		$(TARGET_DIR)/etc/init.d/S50sysrepod
