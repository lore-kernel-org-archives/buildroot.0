From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 15:00:55 +0100
Subject: [Buildroot] [git commit] package/gpm: Install libgpm.so to fix gpm
	detection in package links
Message-ID: <20160221140100.005457FD16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2b1bbbb7cce458aefdf4c4b7779e7dcddbda5bb8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The unversioned library was missing in the build system, part of the fix
was backported from upstream, the final patch was sent upstream.

Fixes linking against gpm by the links package which fails to detect
gpm support when libgpm.so is not present.

Configure log from links without this patch:
checking for gpm.h... yes
checking for Gpm_Open in -lgpm... no
checking for Gpm_GetLibVersion... no

Configure log from links with this patch:
checking for gpm.h... yes
checking for Gpm_Open in -lgpm... yes
checking for Gpm_GetLibVersion... yes
checking for Gpm_Event wdx and wdy... yes

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../gpm/0002-Install-unversioned-solibrary.patch   | 41 ++++++++++++++++++++++
 ...e.in-Really-install-unversioned-solibrary.patch | 31 ++++++++++++++++
 2 files changed, 72 insertions(+)

diff --git a/package/gpm/0002-Install-unversioned-solibrary.patch b/package/gpm/0002-Install-unversioned-solibrary.patch
new file mode 100644
index 0000000..27e97ac
--- /dev/null
+++ b/package/gpm/0002-Install-unversioned-solibrary.patch
@@ -0,0 +1,41 @@
+From 06b00d53d8bd513ad5d262dc94a016c6fbf2d3aa Mon Sep 17 00:00:00 2001
+From: Kamil Rytarowski <n54@gmx.com>
+Date: Sat, 4 May 2013 01:30:17 +0200
+Subject: [PATCH] Install unversioned solibrary
+
+Unversioned solibraries are shipped with -devel packages in Linux
+distros. Generate and install it for the consistency.
+
+[Upstream patch backported from the github repository,
+https://github.com/telmich/gpm/commit/06b00d53d8bd513ad5d262dc94a016c6fbf2d3aa]
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/Makefile.in | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/src/Makefile.in b/src/Makefile.in
+index 6b60ad3..7e9e2ef 100644
+--- a/src/Makefile.in
++++ b/src/Makefile.in
+@@ -79,7 +79,7 @@ prog/%:	prog/%.o
+ #		| $(SED) '\''s/\($*\)\.o\([ :]*\)/\1.o \1.lo\2/g'\'' > $(DEPDIR)/$@'
+ 
+ # Do it all!
+-all:	gpm lib/libgpm.so. at abi_lev@ @LIBGPM_A@ $(PROG)
++all:	gpm lib/libgpm.so. at abi_lev@ lib/libgpm.so @LIBGPM_A@ $(PROG)
+ 
+ gpm:	$(GOBJ)
+ 	$(CC) @LDFLAGS@ $(LDFLAGS) -o $@ $(GOBJ) @LIBS@ $(LIBS) -lm
+@@ -168,9 +168,8 @@ lib/libgpm.so. at abi_full@:	$(PICS)
+ 	@LDFLAGS@ $(LDFLAGS) -o lib/libgpm.so. at abi_full@ $^ @LIBS@ @SHARED_LIBS@ $(LIBS)	
+ lib/libgpm.so. at abi_lev@:	lib/libgpm.so. at abi_full@
+ 	$(LN_S) -f libgpm.so. at abi_full@ lib/libgpm.so. at abi_lev@
+-# unneeded, isn't it?
+-#lib/libgpm.so:	lib/libgpm.so. at abi_full@
+-#	$(LN_S) -f libgpm.so. at abi_full@ lib/libgpm.so
++lib/libgpm.so:	lib/libgpm.so. at abi_full@
++	$(LN_S) -f libgpm.so. at abi_full@ lib/libgpm.so
+ 
+ include $(DEPFILE)
+ 
diff --git a/package/gpm/0003-src-Makefile.in-Really-install-unversioned-solibrary.patch b/package/gpm/0003-src-Makefile.in-Really-install-unversioned-solibrary.patch
new file mode 100644
index 0000000..58b260c
--- /dev/null
+++ b/package/gpm/0003-src-Makefile.in-Really-install-unversioned-solibrary.patch
@@ -0,0 +1,31 @@
+From 445be05fba32c512fd87a0c98b4e9936629ef95e Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sat, 20 Feb 2016 17:59:52 +0100
+Subject: [PATCH 1/1] src/Makefile.in: Really install unversioned solibrary
+
+This commit is a follow-up to
+https://github.com/telmich/gpm/commit/06b00d53d8bd513ad5d262dc94a016c6fbf2d3aa
+which created libgpm.so but failed to include it in the install target.
+
+Patch sent upstream: https://github.com/telmich/gpm/pull/11
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/Makefile.in | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/Makefile.in b/src/Makefile.in
+index 7e9e2ef..bca226f 100644
+--- a/src/Makefile.in
++++ b/src/Makefile.in
+@@ -115,6 +115,7 @@ install:	check
+ 	if test "x at SHLIB@" != "x" ; then \
+ 		$(INSTALL_DATA) -m 755 lib/libgpm.so. at abi_full@ $(libdir)/libgpm.so. at abi_full@	;	\
+ 		cd $(libdir) && $(LN_S) -f libgpm.so. at abi_full@ libgpm.so. at abi_lev@ 					;	\
++		cd $(libdir) && $(LN_S) -f libgpm.so. at abi_full@ libgpm.so 					;	\
+       echo "WARNING: We installed a lib, you should now call ldconfig" 						; 	\
+       echo "f.i.: ldconfig -n -l $(libdir)/libgpm.so. at abi_full@" 								;	\
+       echo "Or to update everything just type ldconfig"											;	\
+-- 
+2.7.0
+
