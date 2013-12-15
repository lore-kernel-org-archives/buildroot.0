From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2013 21:04:05 +0100
Subject: [Buildroot] [git commit] Remove deprecated package netkitbase and
	netkittelnet
Message-ID: <20131215200518.878579C036@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=560fe85bf7fb81956e80848c8bb28d7a6d00a2a2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: fixup Config.in.legacy indentation]
Signed-off-by: Arnaud Aujon <arnaud.aujon@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                                 |   20 +++
 package/Config.in                                |    2 -
 package/netkitbase/Config.in                     |   13 --
 package/netkitbase/netkitbase-gcc4.patch         |   12 --
 package/netkitbase/netkitbase-remove-bcopy.patch |   31 ----
 package/netkitbase/netkitbase.mk                 |   35 ----
 package/netkittelnet/Config.in                   |   13 --
 package/netkittelnet/netkittelnet-bcopy.patch    |   57 -------
 package/netkittelnet/netkittelnet.mk             |   36 -----
 package/netkittelnet/netkittelnet.patch          |  182 ----------------------
 10 files changed, 20 insertions(+), 381 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 09935f1..c75e25e 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -99,6 +99,26 @@ comment "----------------------------------------------------"
 endif
 
 ###############################################################################
+comment "Legacy options removed in 2014.02"
+
+config BR2_PACKAGE_NETKITBASE
+	bool "netkitbase has been removed"
+	select BR2_LEGACY
+	help
+	  The 'netkitbase' package has been removed since it has been
+	  deprecated since 2012.11. This package provided 'inetd'
+	  which is replaced by 'xinet' and 'ping' which is replaced by
+	  'busybox' or 'fping'.
+
+config BR2_PACKAGE_NETKITTELNET
+	bool "netkittelnet has been removed"
+	select BR2_LEGACY
+	help
+	  The 'netkittelnet' package has been removed since it has
+	  been deprecated since 2012.11. 'busybox' provides a telnet
+	  client and should be used instead.
+
+###############################################################################
 comment "Legacy options removed in 2013.11"
 
 config BR2_PACKAGE_LVM2_DMSETUP_ONLY
diff --git a/package/Config.in b/package/Config.in
index 63ea528..be16714 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -851,8 +851,6 @@ source "package/ndisc6/Config.in"
 source "package/netatalk/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/netcat/Config.in"
-source "package/netkitbase/Config.in"
-source "package/netkittelnet/Config.in"
 endif
 source "package/netplug/Config.in"
 source "package/netsnmp/Config.in"
diff --git a/package/netkitbase/Config.in b/package/netkitbase/Config.in
deleted file mode 100644
index 49d3b2e..0000000
--- a/package/netkitbase/Config.in
+++ /dev/null
@@ -1,13 +0,0 @@
-config BR2_PACKAGE_NETKITBASE
-	bool "netkitbase"
-	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	depends on BR2_USE_MMU # fork()
-	depends on BR2_DEPRECATED
-	help
-	  Old-style inetd.
-
-	  ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/
-
-comment "netkitbase needs a toolchain w/ RPC"
-	depends on BR2_USE_MMU && BR2_DEPRECATED
-	depends on !BR2_TOOLCHAIN_HAS_NATIVE_RPC
diff --git a/package/netkitbase/netkitbase-gcc4.patch b/package/netkitbase/netkitbase-gcc4.patch
deleted file mode 100644
index 41fbce9..0000000
--- a/package/netkitbase/netkitbase-gcc4.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -ur netkit-base-0.17/inetd/servtab.c netkit-base-0.17-patched/inetd/servtab.c
---- netkit-base-0.17/inetd/servtab.c	2000-07-22 15:20:50.000000000 -0500
-+++ netkit-base-0.17-patched/inetd/servtab.c	2005-04-30 21:23:52.649630720 -0500
-@@ -771,7 +771,7 @@
- 			return;
- 		}
- 		
--#define SWAP(type, a, b) {type c=(type)a; (type)a=(type)b; (type)b=(type)c;}
-+#define SWAP(type, a, b) {type c=(type)a; a=(type)b; b=(type)c;}
- 
- 		/*
- 		 * sep->se_wait may be holding the pid of a daemon
diff --git a/package/netkitbase/netkitbase-remove-bcopy.patch b/package/netkitbase/netkitbase-remove-bcopy.patch
deleted file mode 100644
index b74b85b..0000000
--- a/package/netkitbase/netkitbase-remove-bcopy.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-diff -ur netkit-base-0.17/inetd/builtins.c netkit-base-0.17-patched/inetd/builtins.c
---- netkit-base-0.17/inetd/builtins.c	2000-07-22 15:13:07.000000000 -0500
-+++ netkit-base-0.17-patched/inetd/builtins.c	2006-12-02 00:50:05.801209342 -0600
-@@ -140,10 +140,10 @@
- 	text[LINESIZ + 1] = '\n';
- 	for (rs = ring;;) {
- 		if ((len = endring - rs) >= LINESIZ)
--			bcopy(rs, text, LINESIZ);
-+			memcpy(text, rs, LINESIZ);
- 		else {
--			bcopy(rs, text, len);
--			bcopy(ring, text + len, LINESIZ - len);
-+			memcpy(text, rs, len);
-+			memcpy(text + len, ring, LINESIZ - len);
- 		}
- 		if (++rs == endring)
- 			rs = ring;
-@@ -183,10 +183,10 @@
- 		return;
- 
- 	if ((len = endring - rs) >= LINESIZ)
--		bcopy(rs, text, LINESIZ);
-+		memcpy(text, rs, LINESIZ);
- 	else {
--		bcopy(rs, text, len);
--		bcopy(ring, text + len, LINESIZ - len);
-+		memcpy(text, rs, len);
-+		memcpy(text + len, ring, LINESIZ - len);
- 	}
- 	if (++rs == endring)
- 		rs = ring;
diff --git a/package/netkitbase/netkitbase.mk b/package/netkitbase/netkitbase.mk
deleted file mode 100644
index b17ee99..0000000
--- a/package/netkitbase/netkitbase.mk
+++ /dev/null
@@ -1,35 +0,0 @@
-################################################################################
-#
-# netkitbase
-#
-################################################################################
-
-NETKITBASE_VERSION = 0.17
-NETKITBASE_SOURCE  = netkit-base-$(NETKITBASE_VERSION).tar.gz
-NETKITBASE_SITE    = ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/
-NETKITBASE_LICENSE = BSD-4c
-
-define NETKITBASE_CONFIGURE_CMDS
-	# use ANSI syntax
-	$(SED) "s/main()/main(void)/;" $(NETKITBASE_DIR)/configure
-	# don't try to run cross compiled binaries while configuring things
-	$(SED) "s~./__conftest~#./__conftest~;" $(NETKITBASE_DIR)/configure
-	(cd $(@D); \
-		$(TARGET_CONFIGURE_OPTS) \
-		./configure \
-		--installroot=$(TARGET_DIR))
-endef
-
-define NETKITBASE_BUILD_CMDS
-	$(MAKE) -C $(@D)
-endef
-
-define NETKITBASE_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/inetd/inetd $(TARGET_DIR)/usr/sbin/inetd
-	if [ ! -f $(TARGET_DIR)/etc/inetd.conf ]; then \
-		$(INSTALL) -D -m 0644 $(@D)/etc.sample/inetd.conf $(TARGET_DIR)/etc/inetd.conf; \
-		$(SED) "s/^\([a-z]\)/#\1/;" $(TARGET_DIR)/etc/inetd.conf; \
-	fi
-endef
-
-$(eval $(generic-package))
diff --git a/package/netkittelnet/Config.in b/package/netkittelnet/Config.in
deleted file mode 100644
index da1b245..0000000
--- a/package/netkittelnet/Config.in
+++ /dev/null
@@ -1,13 +0,0 @@
-config BR2_PACKAGE_NETKITTELNET
-	bool "netkittelnet"
-	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	depends on BR2_DEPRECATED
-	select BR2_PACKAGE_NETKITBASE
-	help
-	  Standard Linux telnet client and server.
-
-	  ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/
-
-comment "netkittelnet needs a toolchain w/ RPC"
-	depends on BR2_DEPRECATED
-	depends on !BR2_TOOLCHAIN_HAS_NATIVE_RPC
diff --git a/package/netkittelnet/netkittelnet-bcopy.patch b/package/netkittelnet/netkittelnet-bcopy.patch
deleted file mode 100644
index 0b40e9e..0000000
--- a/package/netkittelnet/netkittelnet-bcopy.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-diff -ur netkit-telnet-0.17/telnetd/authenc.c netkit-telnet-0.17-patched/telnetd/authenc.c
---- netkit-telnet-0.17/telnetd/authenc.c	1999-12-12 08:59:44.000000000 -0600
-+++ netkit-telnet-0.17-patched/telnetd/authenc.c	2008-01-23 21:31:45.546793060 -0600
-@@ -35,7 +35,7 @@
-     int len;
- {
-     if (nfrontp + len < netobuf + BUFSIZ) {
--	bcopy((void *)str, (void *)nfrontp, len);
-+	memcpy((void *)nfrontp, (void *)str, len);
- 	nfrontp += len;
- 	return(len);
-     }
-diff -ur netkit-telnet-0.17/telnetd/slc.c netkit-telnet-0.17-patched/telnetd/slc.c
---- netkit-telnet-0.17/telnetd/slc.c	1999-12-12 08:59:44.000000000 -0600
-+++ netkit-telnet-0.17-patched/telnetd/slc.c	2008-01-23 21:32:07.859024619 -0600
-@@ -432,7 +432,7 @@
- 	    def_slclen = len;
- 	    def_slcbuf = malloc((unsigned)len);
- 	    if (def_slcbuf == NULL) return;  /* too bad */
--	    bcopy(ptr, def_slcbuf, len);
-+	    memcpy(def_slcbuf, ptr, len);
- 	}
-     }
- }
-diff -ur netkit-telnet-0.17/telnetd/sys_term.c netkit-telnet-0.17-patched/telnetd/sys_term.c
---- netkit-telnet-0.17/telnetd/sys_term.c	1999-12-17 08:28:47.000000000 -0600
-+++ netkit-telnet-0.17-patched/telnetd/sys_term.c	2008-01-23 21:32:27.583229320 -0600
-@@ -84,7 +84,7 @@
-  */
- void copy_termbuf(char *cp, int len) {
-     if (len > sizeof(termbuf)) len = sizeof(termbuf);
--    bcopy(cp, (char *)&termbuf, len);
-+    memcpy((char *)&termbuf, cp, len);
-     termbuf2 = termbuf;
- }
- #endif /* defined(LINEMODE) && defined(TIOCPKT_IOCTL) */
-diff -ur netkit-telnet-0.17/telnetd/utility.c netkit-telnet-0.17-patched/telnetd/utility.c
---- netkit-telnet-0.17/telnetd/utility.c	1999-12-12 08:59:45.000000000 -0600
-+++ netkit-telnet-0.17-patched/telnetd/utility.c	2008-01-23 21:33:02.087587426 -0600
-@@ -248,7 +248,7 @@
- 		next = nextitem(next);
- 	    } while (wewant(next) && (nfrontp > next));
- 	    length = next-thisitem;
--	    bcopy(thisitem, good, length);
-+	    memcpy(good, thisitem, length);
- 	    good += length;
- 	    thisitem = next;
- 	} else {
-@@ -351,7 +351,7 @@
- 		netflush();
- 	}
- 
--	bcopy(ptr, nfrontp, len);
-+	memcpy(nfrontp, ptr, len);
- 	nfrontp += len;
- 
- }  /* end of writenet */
diff --git a/package/netkittelnet/netkittelnet.mk b/package/netkittelnet/netkittelnet.mk
deleted file mode 100644
index ca3b930..0000000
--- a/package/netkittelnet/netkittelnet.mk
+++ /dev/null
@@ -1,36 +0,0 @@
-################################################################################
-#
-# netkittelnet
-#
-################################################################################
-
-NETKITTELNET_VERSION = 0.17
-NETKITTELNET_SOURCE  = netkit-telnet-$(NETKITTELNET_VERSION).tar.gz
-NETKITTELNET_SITE    = ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/
-NETKITTELNET_LICENSE = BSD-4c
-NETKITTELNET_DEPENDENCIES = netkitbase
-
-define NETKITTELNET_CONFIGURE_CMDS
-	# use ANSI syntax
-	$(SED) "s/main()/main(void)/;" $(@D)/configure
-	# Disable termcap support
-	$(SED) "s~\(.*termcap\.h.*\)~/* \1 */~;" $(@D)/telnetd/telnetd.c
-	# C++ support not needed for telnetd
-	$(SED) 's/CXX/CC/g' -e 's/conftest.cc/conftest.c/g' $(@D)/configure
-	(cd $(@D); \
-		$(TARGET_CONFIGURE_OPTS) \
-		./configure \
-		--installroot=$(TARGET_DIR))
-endef
-
-define NETKITTELNET_BUILD_CMDS
-	$(MAKE) SUB=telnetd -C $(@D)
-endef
-
-define NETKITTELNET_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/telnetd/telnetd $(TARGET_DIR)/usr/sbin/telnetd
-	# Enable telnet in inetd
-	$(SED) "s~^#telnet.*~telnet\tstream\ttcp\tnowait\troot\t/usr/sbin/telnetd\t/usr/sbin/telnetd~;" $(TARGET_DIR)/etc/inetd.conf
-endef
-
-$(eval $(generic-package))
diff --git a/package/netkittelnet/netkittelnet.patch b/package/netkittelnet/netkittelnet.patch
deleted file mode 100644
index ee4f37e..0000000
--- a/package/netkittelnet/netkittelnet.patch
+++ /dev/null
@@ -1,182 +0,0 @@
---- netkit-telnet-0.17/configure	Thu Apr 11 10:40:58 2002
-+++ FIXEDnetkittelnet/configure	Thu Apr 11 10:39:59 2002
-@@ -78,7 +78,6 @@
-     for TRY in egcs gcc g++ CC c++ cc; do
-        (
-            $TRY __conftest.c -o __conftest || exit 1;
--           ./__conftest || exit 1;
-        ) >/dev/null 2>&1 || continue;
-        CC=$TRY
-        break;
-@@ -94,7 +93,6 @@
-     echo -n 'Checking if C compiler works... '
-     if (
-           $CC __conftest.c -o __conftest || exit 1
--          ./__conftest || exit 1
-        ) >/dev/null 2>&1; then
-          echo 'yes'
-      else
-@@ -125,7 +123,6 @@
-     for TRY in egcs gcc g++ CC c++ cc; do
-        (
-            $TRY __conftest.cc -o __conftest || exit 1;
--           ./__conftest || exit 1;
-        ) >/dev/null 2>&1 || continue;
-        CXX=$TRY
-        break;
-@@ -138,18 +135,5 @@
-     fi
-     echo "$CXX"
--else
--    echo -n 'Checking if C++ compiler works... '
--    if (
--          $CXX __conftest.cc -o __conftest || exit 1
--          ./__conftest || exit 1
--       ) >/dev/null 2>&1; then
--         echo 'yes'
--     else
--         echo 'no'
--         echo 'Compiler '"$CXX"' does not exist or cannot compile C++; try another.'
--         rm -f __conftest*
--         exit
--     fi
- fi
- 
- echo -n "Checking if $CXX accepts gcc warnings... "
-@@ -278,13 +274,11 @@
- EOF
- if (
-       $CXX $CXXFLAGS  __conftest.cc  -o __conftest || exit 1
--      ./__conftest || exit 1
-    ) >/dev/null 2>&1; then
-     echo 'yes'
- else
-     if (
-           $CXX $CXXFLAGS -D__USE_BSD_SIGNAL __conftest.cc  -o __conftest || exit 1
--          ./__conftest || exit 1
-        ) >/dev/null 2>&1; then
-         echo '-D__USE_BSD_SIGNAL'
-         CFLAGS="$CFLAGS -D__USE_BSD_SIGNAL"
-@@ -292,6 +286,7 @@
-     else
-         echo 'no'
-         echo 'This package needs BSD signal semantics to run.'
-+		echo "$CXX $CXXFLAGS  -D__USE_BSD_SIGNAL __conftest.cc  -o __conftest failed"
-         rm -f __conftest*
-         exit
-     fi
-@@ -330,31 +325,6 @@
-         echo 'no'
-     fi
- fi
--
--if [ x$NCURSES != x ]; then
--    LIBTERMCAP=-lncurses
--else
--    echo -n 'Checking for traditional termcap... '
--cat <<EOF >__conftest.cc
--#include <stdio.h>
--#include <termcap.h>
--int main() {
--    tgetent(NULL, NULL); return 0;
--}
--
--EOF
--    if (
--          $CXX $CXXFLAGS  __conftest.cc -ltermcap -o __conftest || exit 1
--       ) >/dev/null 2>&1; then
--        echo '-ltermcap'
--        LIBTERMCAP=-ltermcap
--    else
--        echo 'not found'
--        echo 'This package needs termcap to run.'
--        rm -f __conftest*
--        exit
--    fi
--fi
- rm -f __conftest*
- 
- ##################################################
-@@ -468,7 +438,6 @@
- else
-     if (
-           $CXX $CXXFLAGS -D_GNU_SOURCE __conftest.cc  -o __conftest || exit 1
--          ./__conftest || exit 1
-        ) >/dev/null 2>&1; then
-         echo '-D_GNU_SOURCE'
-         CFLAGS="$CFLAGS -D_GNU_SOURCE"
-@@ -501,20 +470,17 @@
- EOF
- if (
-       $CXX $CXXFLAGS  __conftest.cc $LIBBSD -o __conftest || exit 1
--      ./__conftest || exit 1
-    ) >/dev/null 2>&1; then
-     echo 'ok'
- else
-     if (
-           $CXX $CXXFLAGS  __conftest.cc -lsnprintf $LIBBSD -o __conftest || exit 1
--          ./__conftest || exit 1
-        ) >/dev/null 2>&1; then
-         echo '-lsnprintf'
-         LIBS="$LIBS -lsnprintf"
-     else
-         if (
-               $CXX $CXXFLAGS  __conftest.cc -ldb $LIBBSD -o __conftest || exit 1
--              ./__conftest || exit 1
-            ) >/dev/null 2>&1; then
-             echo '-ldb'
-             LIBS="$LIBS -ldb"
-diff -urN netkit-telnet-0.17/telnetd/state.c netkit-telnet-0.17-dm/telnetd/state.c
---- netkit-telnet-0.17/telnetd/state.c	1999-12-12 11:41:44.000000000 -0800
-+++ netkit-telnet-0.17-dm/telnetd/state.c	2003-07-23 19:20:38.000000000 -0700
-@@ -43,10 +43,10 @@
- 
- static int envvarok(char *varp);
- 
--static unsigned char doopt[] = { IAC, DO, '%', 'c', 0 };
--static unsigned char dont[] = { IAC, DONT, '%', 'c', 0 };
--unsigned char	will[] = { IAC, WILL, '%', 'c', 0 };
--unsigned char	wont[] = { IAC, WONT, '%', 'c', 0 };
-+//static unsigned char doopt[] = { IAC, DO, '%', 'c', 0 };
-+//static unsigned char dont[] = { IAC, DONT, '%', 'c', 0 };
-+//unsigned char	will[] = { IAC, WILL, '%', 'c', 0 };
-+//unsigned char	wont[] = { IAC, WONT, '%', 'c', 0 };
- 
- /*
-  * Buffer for sub-options, and macros
-@@ -422,7 +422,7 @@
- 	    set_his_want_state_will(option);
- 	do_dont_resp[option]++;
-     }
--    netoprintf((char *)doopt, option);
-+    netoprintf( "%c%c%c", IAC, DO, option );
-     
-     DIAG(TD_OPTIONS, printoption("td: send do", option));
- }
-@@ -632,7 +632,7 @@
- 	set_his_want_state_wont(option);
- 	do_dont_resp[option]++;
-     }
--    netoprintf((char *) dont, option);
-+    netoprintf ( "%c%c%c", IAC, DONT, option );
- 
-     DIAG(TD_OPTIONS, printoption("td: send dont", option));
- }
-@@ -769,7 +769,7 @@
- 	set_my_want_state_will(option);
- 	will_wont_resp[option]++;
-     }
--    netoprintf((char *) will, option);
-+    netoprintf( "%c%c%c", IAC, WILL, option);
- 
-     DIAG(TD_OPTIONS, printoption("td: send will", option));
- }
-@@ -917,7 +917,7 @@
- 	set_my_want_state_wont(option);
- 	will_wont_resp[option]++;
-     }
--    netoprintf((char *)wont, option);
-+    netoprintf( "%c%c%c", IAC, WONT, option);
-     
-     DIAG(TD_OPTIONS, printoption("td: send wont", option));
- }
