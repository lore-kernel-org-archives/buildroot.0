From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 19 Sep 2020 08:56:14 +0200
Subject: [Buildroot] [git commit] package/makedumpfile: fix build for
 powerpc target
Message-ID: <20200919065719.D0F7D81F12@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=060275b6834423bfa76452328264618a4f77e47e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.net/results/e480858d63285e9bf79a4a96dae802ef2ce605c2

Signed-off-by: Alexander Egorenkov <egorenar-dev@posteo.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/makedumpfile/makedumpfile.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/makedumpfile/makedumpfile.mk b/package/makedumpfile/makedumpfile.mk
index 1876e1158a..8077664892 100644
--- a/package/makedumpfile/makedumpfile.mk
+++ b/package/makedumpfile/makedumpfile.mk
@@ -15,9 +15,16 @@ MAKEDUMPFILE_DEPENDENCIES += lzo
 MAKEDUMPFILE_MAKE_OPTS += USELZO=on
 endif
 
+ifeq ($(BR2_powerpc),y)
+MAKEDUMPFILE_TARGET = powerpc32
+else
+MAKEDUMPFILE_TARGET = $(BR2_ARCH)
+endif
+
+
 define MAKEDUMPFILE_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		TARGET=$(BR2_ARCH) LINKTYPE=dynamic
+		TARGET=$(MAKEDUMPFILE_TARGET) LINKTYPE=dynamic
 endef
 
 define MAKEDUMPFILE_INSTALL_TARGET_CMDS
