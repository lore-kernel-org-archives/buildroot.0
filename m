From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Jun 2015 09:50:00 +0200
Subject: [Buildroot] [git commit] package/gdb: gdb+expat build fix
Message-ID: <20150621075005.E46467FA69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=76e176a0752965410ab84598625cee48bd97d9cf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 23413b51b2308225584b65c2fcd800ca8f7c56af added --with-expat
configure option and expat dependency when BR2_PACKAGE_EXPAT is
configured.  When cross-compiling, gdb configure fails because the host
system libexpat is referenced.

Configuring gdb with
	--with-libexpat-prefix=$(STAGING_DIR)/usr
fixes the reference and allows gdb to build successfully.

Tested with arm-buildroot-linux-gnueabihf toolchain.

Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdb/gdb.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 4b9a757..338de20 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -101,6 +101,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_EXPAT),y)
 GDB_CONF_OPTS += --with-expat
+GDB_CONF_OPTS += --with-libexpat-prefix=$(STAGING_DIR)/usr
 GDB_DEPENDENCIES += expat
 else
 GDB_CONF_OPTS += --without-expat
