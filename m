From: Romain Naour <romain.naour@openwide.fr>
Date: Sat,  2 Nov 2013 16:51:12 +0100
Subject: [Buildroot] [PATCH v3 2/2] ngrep: fix static linking issue with
	libpcre
Message-ID: <1383407472-2898-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adding -lpcre in LDFLAGS place the library before object files:
gcc ... -lpcre -L.../sysroot/usr/lib -s -o ngrep ngrep.o -lpcap

Makefile.in is patched to use @LIBS@ for adding -lpcre in the right place.

Fixes:
http://autobuild.buildroot.net/results/684/684a3bed28d13ef5e5156257aade3b9aff32f180

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/ngrep/ngrep-0003-fix-static-link.patch | 22 ++++++++++++++++++++++
 package/ngrep/ngrep.mk                         |  2 +-
 2 files changed, 23 insertions(+), 1 deletion(-)
 create mode 100644 package/ngrep/ngrep-0003-fix-static-link.patch

diff --git a/package/ngrep/ngrep-0003-fix-static-link.patch b/package/ngrep/ngrep-0003-fix-static-link.patch
new file mode 100644
index 0000000..6d70778
--- /dev/null
+++ b/package/ngrep/ngrep-0003-fix-static-link.patch
@@ -0,0 +1,22 @@
+fix static link
+Libraries must be placed before object files.
+---
+ Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 2ae4506..761d7d9 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -11,7 +11,7 @@ CFLAGS=@CFLAGS@ -D at OS@ @DEFS@ @EXTRA_DEFINES@
+ INCLUDES=-I at srcdir@ @PCAP_INCLUDE@ @EXTRA_INCLUDES@
+ 
+ LDFLAGS=@LDFLAGS@ @PCAP_LINK@
+-LIBS=-lpcap @EXTRA_LIBS@ 
++LIBS=@LIBS@ @EXTRA_LIBS@
+ 
+ STRIPFLAG=@STRIPFLAG@
+ 
+-- 
+1.8.1.4
+
diff --git a/package/ngrep/ngrep.mk b/package/ngrep/ngrep.mk
index 6a9b42f..0bb5d7e 100644
--- a/package/ngrep/ngrep.mk
+++ b/package/ngrep/ngrep.mk
@@ -10,7 +10,7 @@ NGREP_SITE = http://downloads.sourceforge.net/project/ngrep/ngrep/$(NGREP_VERSIO
 NGREP_LICENSE = BSD-4c-like
 NGREP_LICENSE_FILES = LICENSE.txt
 NGREP_INSTALL_STAGING = YES
-NGREP_CONF_ENV = LDFLAGS="-lpcre"
+NGREP_CONF_ENV = LIBS="-lpcre"
 NGREP_CONF_OPT =  \
 	--with-pcap-includes=$(STAGING_DIR)/usr/include \
 	--enable-pcre \
-- 
1.8.1.4
