From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Feb 2014 17:09:17 +0100
Subject: [Buildroot] [git commit] jimtcl: don't attempt to handle ccache
	internally
Message-ID: <20140215161045.3F7CA7FDC2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=40f7068f11bdb9c80b8c39cd992fdddd889a12dd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

jimtcl tries to use 'ccache' (a non-buildroot host version) which may not
exist on the host system. If ccache is enabled in buildroot, the compiler
used by jimtcl is:
ccache <buildroot>/.../ccache <buildroot>/.../<tuple>-gcc

If ccache is not present on the host, this results in the build error:

ccache <buildroot>/.../ccache <buildroot>/.../<tuple>-gcc
-D_GNU_SOURCE -Wall  -I. -fpic -pipe -Os    -c -o jim-subcmd.o jim-subcmd.c
make[1]: ccache: Command not found

This patch passes 'CCACHE=none' to the 'configure' script, disabling the
internal handling of ccache, so that ccache can be transparently passed
through CC.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jimtcl/jimtcl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/jimtcl/jimtcl.mk b/package/jimtcl/jimtcl.mk
index 53cddf9..1f2ea82 100644
--- a/package/jimtcl/jimtcl.mk
+++ b/package/jimtcl/jimtcl.mk
@@ -38,7 +38,7 @@ endif
 
 define JIMTCL_CONFIGURE_CMDS
 	(cd $(@D); \
-		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_OPTS) CCACHE=none \
 		./configure --prefix=/usr \
 		$(JIMTCL_SHARED) \
 	)
