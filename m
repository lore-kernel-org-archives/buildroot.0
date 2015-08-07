From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Aug 2015 11:40:35 +0200
Subject: [Buildroot] [git commit] libpfm4: fix static-only build
Message-ID: <20150807094326.1B87A81E7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=305beebb74c75744fccb25963f9e35511b7804a2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By default, libpfm4 tries to build a shared library. However, by
passing CONFIG_PFMLIB_SHARED=n, we can convince it to build only a
static library. Therefore, this commit uses that to fix the
static-only build, therefore fixing:

  http://autobuild.buildroot.net/results/efa/efae782912face7c36417dfb1023228d6b137654/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libpfm4/libpfm4.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/libpfm4/libpfm4.mk b/package/libpfm4/libpfm4.mk
index 1110672..e2fff80 100644
--- a/package/libpfm4/libpfm4.mk
+++ b/package/libpfm4/libpfm4.mk
@@ -11,7 +11,9 @@ LIBPFM4_LICENSE = libpfm4 license
 LIBPFM4_LICENSE_FILES = COPYING
 LIBPFM4_INSTALL_STAGING = YES
 
-LIBPFM4_FLAGS = SYS=Linux ARCH=$(BR2_ARCH) CC="$(TARGET_CC)" LDCONFIG=true
+LIBPFM4_FLAGS = SYS=Linux ARCH=$(BR2_ARCH) \
+	CC="$(TARGET_CC)" LDCONFIG=true \
+	CONFIG_PFMLIB_SHARED=$(if $(BR2_STATIC_LIBS),n,y)
 
 define LIBPFM4_BUILD_CMDS
 	$(MAKE) -C $(@D) $(LIBPFM4_FLAGS)
