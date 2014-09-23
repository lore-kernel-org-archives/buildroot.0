From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 23 Sep 2014 10:33:11 +0100
Subject: [Buildroot] [PATCH] ncurses: Add libcurses symlink to libncurses
Message-ID: <1411464791-8023-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some packages use -lcurses when they are linking, so they try to link to
a library called libcurses. The library provided by our ncurses package
is called libncurses, so those packages fail to link with a message like
this one:

/bin/ld: cannot find -lcurses

Installing a libcurses symlink to libncurses fixes the problem.

Fixes:
  http://autobuild.buildroot.net/results/466/466995f9534447a4f54327a14c44ef9e16dd1123/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Markos Chandras <Markos.Chandras@imgtec.com>
---
 package/ncurses/ncurses.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 81a3998..3f57407 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -46,6 +46,8 @@ define NCURSES_LINK_LIBS
 		ln -sf $${lib}$(NCURSES_LIB_SUFFIX).a \
 			$(1)/usr/lib/$${lib}.a; \
 	done
+	ln -sf libncurses$(NCURSES_LIB_SUFFIX).a \
+		$(1)/usr/lib/libcurses.a
 endef
 else
 define NCURSES_LINK_LIBS
@@ -55,6 +57,10 @@ define NCURSES_LINK_LIBS
 		ln -sf $${lib}$(NCURSES_LIB_SUFFIX).so \
 			$(1)/usr/lib/$${lib}.so; \
 	done
+	ln -sf libncurses$(NCURSES_LIB_SUFFIX).a \
+		$(1)/usr/lib/libcurses.a
+	ln -sf libncurses$(NCURSES_LIB_SUFFIX).so \
+		$(1)/usr/lib/libcurses.so
 endef
 endif
 
-- 
1.7.1
