From: Romain Naour <romain.naour@openwide.fr>
Date: Wed, 09 Oct 2013 23:54:22 +0200
Subject: [Buildroot] [PATCH v2 1/1] ngrep: fix static linking issue with
	libpcre
Message-ID: <5255D08E.3000307@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Adding -lpcre in LDFLAGS place the library before object files:
gcc ... -lpcre -L .../sysroot/usr/lib -s -o ngrep ngrep.o -lpcap

Makefile.in is patched to use @LIBS@ for adding -lpcre in the right place.

Fixes:
http://autobuild.buildroot.net/results/684/684a3bed28d13ef5e5156257aade3b9aff32f180

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/ngrep/ngrep-1.45-Makefile.in.patch | 23 +++++++++++++++++++++++
 package/ngrep/ngrep.mk                     |  2 +-
 2 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 package/ngrep/ngrep-1.45-Makefile.in.patch

diff --git a/package/ngrep/ngrep-1.45-Makefile.in.patch b/package/ngrep/ngrep-1.45-Makefile.in.patch
new file mode 100644
index 0000000..698e001
--- /dev/null
+++ b/package/ngrep/ngrep-1.45-Makefile.in.patch
@@ -0,0 +1,23 @@
+Use LIBS for adding libraries.
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 2ae4506..3eefc0a 100644
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
+1.8.4
+
diff --git a/package/ngrep/ngrep.mk b/package/ngrep/ngrep.mk
index 99b8f46..0dc6a36 100644
--- a/package/ngrep/ngrep.mk
+++ b/package/ngrep/ngrep.mk
@@ -8,7 +8,7 @@ NGREP_VERSION = 1.45
 NGREP_SOURCE = ngrep-$(NGREP_VERSION).tar.bz2
 NGREP_SITE = http://downloads.sourceforge.net/project/ngrep/ngrep/$(NGREP_VERSION)
 NGREP_INSTALL_STAGING = YES
-NGREP_CONF_ENV = LDFLAGS="-lpcre"
+NGREP_CONF_ENV = LIBS="-lpcre"
 NGREP_CONF_OPT =  \
 	--with-pcap-includes=$(STAGING_DIR)/usr/include \
 	--enable-pcre \
-- 
1.8.4
