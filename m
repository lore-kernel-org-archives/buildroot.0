From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Oct 2016 23:26:21 +0200
Subject: [Buildroot] [git commit] qemu: fix build of target variant
Message-ID: <20161020212813.712FC7FF73@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=630708155498a4a4c4e1f90e25eabd23951982d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to what was done in commit
524b6b85595274ca13bd7d01adb61ce2dddd786c for the host variant, this
commit fixes the build of qemu's host variant. Qemu expects that the
cpp it is passed behave like cc: it passes the -c option, which is not
allowed by cpp, but is allowed for cc.

Fix that by overriding CPP when calling configure.

Fixes:

  http://autobuild.buildroot.net/results/0850e80ba62294397b44d8adea197a244a9a8205/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qemu/qemu.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 9815f76..cf23f16 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -196,11 +196,14 @@ else
 QEMU_OPTS += --disable-fdt
 endif
 
+# Override CPP, as it expects to be able to call it like it'd
+# call the compiler.
 define QEMU_CONFIGURE_CMDS
 	( cd $(@D);                                     \
 		LIBS='$(QEMU_LIBS)'                     \
 		$(TARGET_CONFIGURE_OPTS)                \
 		$(TARGET_CONFIGURE_ARGS)                \
+		CPP="$(TARGET_CC) -E"			\
 		$(QEMU_VARS)                            \
 		./configure                             \
 			--prefix=/usr                   \
