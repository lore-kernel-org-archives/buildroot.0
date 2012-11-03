From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 3 Nov 2012 09:21:25 +0100
Subject: [Buildroot] [git commit] iproute2: fix build with toolchains
	providing setns(2)
Message-ID: <20121103082553.B5A6B99A6E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=102f79865e21158c9153148bef189f810aad5814
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/b2f28621bc9d6048057c406048b3f7d665cef165

ipnetns.c contains a replacement setns implementation, which is used
if the toolchain doesn't provide any (HAVE_SETNS not set).

We don't have any knowledge of toolchain setns support on buildroot
level, but the (handwritten) configure script contains a test for it,
so run the configure script before building.

The configure script isn't written for cross compilation, so it needs
to be massaged slightly to use the cross compiler / flags.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/iproute2/iproute2.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 62328ab..03767cc 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -27,6 +27,8 @@ endef
 endif
 
 define IPROUTE2_CONFIGURE_CMDS
+	$(SED) 's/gcc/$$CC $$CFLAGS/g' $(@D)/configure
+	cd $(@D) && $(TARGET_CONFIGURE_OPTS) ./configure
 	# arpd needs berkeleydb
 	$(SED) "/^TARGETS=/s: arpd : :" $(IPROUTE2_DIR)/misc/Makefile
 	echo "IPT_LIB_DIR:=/usr/lib/xtables" >>$(IPROUTE2_DIR)/Config
