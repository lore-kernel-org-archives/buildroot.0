From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 24 Jun 2018 21:15:00 +0300
Subject: [Buildroot] [PATCH] dos2unix: fix static build
Message-ID: <b1515512894db829300a9efc2cbc37fb9e029db9.1529864100.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pass the -static flag to the final link command. Otherwise, the
generated executables are not static when the external toolchain
provides both shared and static libraries.

Should also fix:
http://autobuild.buildroot.net/results/a5a/a5a64bc3ff5a91a8680ac52f3505362491923b26/
http://autobuild.buildroot.net/results/ebf/ebfe81e65751d7a5ca3aa4e20cc708a24ba65204/

Cc: David Bachelart <david.bachelart@bbright.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/dos2unix/dos2unix.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/dos2unix/dos2unix.mk b/package/dos2unix/dos2unix.mk
index 9b823405902e..5001397f0571 100644
--- a/package/dos2unix/dos2unix.mk
+++ b/package/dos2unix/dos2unix.mk
@@ -24,6 +24,10 @@ ifeq ($(BR2_USE_WCHAR),)
 DOS2UNIX_MAKE_OPTS += UCS=
 endif
 
+ifeq ($(BR2_STATIC_LIBS),y)
+DOS2UNIX_MAKE_OPTS += LDFLAGS_USER=-static
+endif
+
 define DOS2UNIX_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(DOS2UNIX_MAKE_OPTS)
 endef
-- 
2.18.0
