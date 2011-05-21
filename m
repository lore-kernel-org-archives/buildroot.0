From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 May 2011 17:47:49 +0200
Subject: [Buildroot] [PATCH 1/2] psmisc: fix build by linking against
	libintl when needed
In-Reply-To: <cover.1305992862.git.thomas.petazzoni@free-electrons.com>
References: <cover.1305992862.git.thomas.petazzoni@free-electrons.com>
Message-ID: <73ba74dc62634841a358f03b0c03ef1eae204913.1305992862.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/psmisc/psmisc-link-against-libintl.patch |   43 ++++++++++++++++++++++
 1 files changed, 43 insertions(+), 0 deletions(-)
 create mode 100644 package/psmisc/psmisc-link-against-libintl.patch

diff --git a/package/psmisc/psmisc-link-against-libintl.patch b/package/psmisc/psmisc-link-against-libintl.patch
new file mode 100644
index 0000000..985e232
--- /dev/null
+++ b/package/psmisc/psmisc-link-against-libintl.patch
@@ -0,0 +1,43 @@
+Link against libintl if needed
+
+When built against a C library that has locale support, but for which
+intl support is provided by an external libintl library, psmisc
+forgets to link against this library, even though the configure script
+properly checks that.
+
+This patch therefore ensure that we link against libintl when needed,
+thanks to the @INTLLIBS@ variable provided by the configure script.
+
+We do not modify the Makefile.am file, because autoreconfiguring this
+package doesn't work: because of its usage of gettext, it wants to run
+the "autopoint" program, which itself depends on CVS being installed,
+for some strange reasons. That's the reason why we fall back to the
+hacky solution of modifying the Makefile.in file.
+
+It replaces a hack which was mistakenly removed by commit
+542fbe8520c981f9c96705a57e4263f34f2ab2e6.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: psmisc-22.13/src/Makefile.in
+===================================================================
+--- psmisc-22.13.orig/src/Makefile.in	2011-05-21 15:12:17.212412293 +0200
++++ psmisc-22.13/src/Makefile.in	2011-05-21 16:08:50.220326032 +0200
+@@ -216,12 +216,15 @@
+ 	$(am__append_4) $(am__append_6) $(am__append_8) \
+ 	$(am__append_10)
+ fuser_SOURCES = fuser.c comm.h signals.c signals.h i18n.h fuser.h
++fuser_LDADD = @INTLLIBS@
+ killall_SOURCES = killall.c comm.h signals.c signals.h i18n.h
+-killall_LDADD = @SELINUX_LIB@
++killall_LDADD = @SELINUX_LIB@ @INTLLIBS@
+ peekfd_SOURCES = peekfd.c
++peekfd_LDADD = @INTLLIBS@
+ pstree_SOURCES = pstree.c comm.h i18n.h
+-pstree_LDADD = @TERMCAP_LIB@ @SELINUX_LIB@
++pstree_LDADD = @TERMCAP_LIB@ @SELINUX_LIB@ @INTLLIBS@
+ prtstat_SOURCES = prtstat.c prtstat.h
++prtstat_LDADD = @INTLLIBS@
+ BUILT_SOURCES = signames.h
+ EXTRA_DIST = signames.c 
+ CLEANFILES = signames.h
-- 
1.7.1
