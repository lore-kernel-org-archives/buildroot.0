From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Nov 2013 21:55:17 +0100
Subject: [Buildroot] [git commit] ngrep: fix static linking issue with
	libpcre
Message-ID: <20131104211055.2FFF29BC99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6d3b4faca914cde10e4238b3cca45f680eaa41b9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adding -lpcre in LDFLAGS place the library before object files:
gcc ... -lpcre -L.../sysroot/usr/lib -s -o ngrep ngrep.o -lpcap

Makefile.in is patched to use @LIBS@ for adding -lpcre in the right place.

Fixes:
http://autobuild.buildroot.net/results/684/684a3bed28d13ef5e5156257aade3b9aff32f180

[Peter: fixup patch description]
Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ngrep/ngrep-0003-fix-static-link.patch |   25 ++++++++++++++++++++++++
 package/ngrep/ngrep.mk                         |    2 +-
 2 files changed, 26 insertions(+), 1 deletions(-)

diff --git a/package/ngrep/ngrep-0003-fix-static-link.patch b/package/ngrep/ngrep-0003-fix-static-link.patch
new file mode 100644
index 0000000..98c2626
--- /dev/null
+++ b/package/ngrep/ngrep-0003-fix-static-link.patch
@@ -0,0 +1,25 @@
+ngrep: fix static link with pcre
+
+Libraries must be placed after object files.
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
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
