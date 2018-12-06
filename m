From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Dec 2018 21:10:33 +0100
Subject: [Buildroot] [git commit] package/qt5base: fix build when system awk
 is mawk, not gawk
Message-ID: <20181206200653.B81B1865A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8dc548905f786ea9bb39945eaa268751d716d6f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit c2ea056a1b (package/qt5/qt5base: use ccache for building host
code) introduced a tweak to qt5's mkspec file, to define the compilers
(C and C++) to use to build qmake.

In doing so, it changed the variables in that file, from this layout:
    VAR = value

to this:
    VAR=value

During its configuration phase, qt5 will parse that file using the
system awk.

However, the system awk is not necessarily GNU awk; some systems,
especially Debian ones, use mawk as the default awk implementation.

mawk does not behave the same as GNU awk, and this causes qt5 to extract
empty values, and thus leads to build failures.

Fix that by replacing the variables with similar layout, keeping the
spaces around the equal signs.

Fixes:
    http://autobuild.buildroot.org/results/cb5/cb555a124bb3bdb9c5a3465673c21022d94cf2ca/

Reported-by: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt5/qt5base/qt5base.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index ec3d7042f1..98297d87db 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -273,9 +273,9 @@ endif
 
 # This allows to use ccache when available
 define QT5BASE_CONFIGURE_HOSTCC
-	$(SED) 's,^QMAKE_COMPILER\s*=.*,QMAKE_COMPILER=$(HOSTCC),' $(@D)/mkspecs/common/g++-base.conf
-	$(SED) 's,^QMAKE_CC\s*=.*,QMAKE_CC=$(HOSTCC),' $(@D)/mkspecs/common/g++-base.conf
-	$(SED) 's,^QMAKE_CXX\s*=.*,QMAKE_CXX=$(HOSTCXX),' $(@D)/mkspecs/common/g++-base.conf
+	$(SED) 's,^QMAKE_COMPILER\s*=.*,QMAKE_COMPILER = $(HOSTCC),' $(@D)/mkspecs/common/g++-base.conf
+	$(SED) 's,^QMAKE_CC\s*=.*,QMAKE_CC = $(HOSTCC),' $(@D)/mkspecs/common/g++-base.conf
+	$(SED) 's,^QMAKE_CXX\s*=.*,QMAKE_CXX = $(HOSTCXX),' $(@D)/mkspecs/common/g++-base.conf
 endef
 
 define QT5BASE_CONFIGURE_CMDS
