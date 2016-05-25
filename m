From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 May 2016 22:45:46 +0200
Subject: [Buildroot] [git commit] cups: fix static linking problem
Message-ID: <20160525205523.1B46381EE3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=da4264210f14259961352b9be39a4e1b10e6ed28
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In static linking configurations, cups fails to build due to the lack of
Scrt1.o from uClibc toolchains. This Scrt1.o is only needed for PIE
binaries. Since we don't really care about PIE binaries in the context
of Buildroot, this commit solves the problem by patching cups to not
generate a PIE binary.

Fixes:

  http://autobuild.buildroot.net/results/445a401da2f63a6c43d7c166516287db6cc977ab/

Cc: Olivier Schonken <olivier.schonken@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cups/0004-remove-pie.patch | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

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
