From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 May 2016 16:17:13 +0200
Subject: [Buildroot] [PATCH 3/4] cups: fix static linking problem
In-Reply-To: <1463235434-31134-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1463235434-31134-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1463235434-31134-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In static linking configurations, cups fails to build due to the lack of
Scrt1.o from uClibc toolchains. This Scrt1.o is only needed for PIE
binaries. Since we don't really care about PIE binaries in the context
of Buildroot, this commit solves the problem by patching cups to not
generate a PIE binary.

Fixes:

  http://autobuild.buildroot.net/results/445a401da2f63a6c43d7c166516287db6cc977ab/

Cc: Olivier Schonken <olivier.schonken@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cups/0004-remove-pie.patch | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 package/cups/0004-remove-pie.patch

diff --git a/package/cups/0004-remove-pie.patch b/package/cups/0004-remove-pie.patch
new file mode 100644
index 0000000..3d81941
--- /dev/null
+++ b/package/cups/0004-remove-pie.patch
@@ -0,0 +1,21 @@
+Remove PIE flags from the build
+
+Generating a statically linked binary built with PIE requires the
+Scrt1.o file, which isn't part of Buildroot uClibc toolchains. To
+solve this, we simply disable the PIE flags.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/Makedefs.in
+===================================================================
+--- a/Makedefs.in
++++ b/Makedefs.in
+@@ -142,7 +142,7 @@
+ IPPFIND_MAN	=	@IPPFIND_MAN@
+ LDFLAGS		=	-L../cgi-bin -L../cups -L../filter -L../ppdc \
+ 			-L../scheduler @LDARCHFLAGS@ \
+-			@LDFLAGS@ @RELROFLAGS@ @PIEFLAGS@ $(OPTIM)
++			@LDFLAGS@ @RELROFLAGS@ $(OPTIM)
+ LINKCUPS	=	@LINKCUPS@ $(LIBGSSAPI) $(DNSSDLIBS) $(LIBZ)
+ LINKCUPSIMAGE	=	@LINKCUPSIMAGE@
+ LIBS		=	$(LINKCUPS) $(COMMONLIBS)
-- 
2.7.4
