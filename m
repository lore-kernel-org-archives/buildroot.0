From: Martin Banky <martin.banky@gmail.com>
Date: Mon,  4 Oct 2010 17:47:01 -0700
Subject: [Buildroot] [PATCH 2/2] host-libpng: Symbols creation fails with
	ccache
In-Reply-To: <1286239621-31904-1-git-send-email-Martin.Banky@gmail.com>
References: <1286239621-31904-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1286239621-31904-3-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Makefile assumes the output from $(CPP) will be to stdout, but ccache does not
pass the output of $(CPP) to stdout. The Makefile creates an empty symbols
file, which causes the version file to be incorrect. This causes ld to exit
with the error 'libpng.vers:2: syntax error in VERSION script'.

See:
https://sourceforge.net/tracker/?func=detail&aid=3081199&group_id=5624&atid=105624
Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 package/libpng/libpng-1.4.4-ccache-version.patch |   25 ++++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 package/libpng/libpng-1.4.4-ccache-version.patch

diff --git a/package/libpng/libpng-1.4.4-ccache-version.patch b/package/libpng/libpng-1.4.4-ccache-version.patch
new file mode 100644
index 0000000..e1f61e6
--- /dev/null
+++ b/package/libpng/libpng-1.4.4-ccache-version.patch
@@ -0,0 +1,25 @@
+--- a/Makefile.am	2010-09-23 05:18:36.000000000 -0700
++++ b/Makefile.am	2010-10-04 15:51:29.000000000 -0700
+@@ -88,7 +88,8 @@ $(PNGLIB_BASENAME)-config: libpng-config
+ 
+ libpng.sym: png.h pngconf.h
+ 	rm -f $@ $@.new
+-	$(CPP) @LIBPNG_DEFINES@ $(CPPFLAGS) -DPNG_BUILDSYMS $(srcdir)/png.h | \
++	$(CPP) @LIBPNG_DEFINES@ $(CPPFLAGS) -DPNG_BUILDSYMS $(srcdir)/png.h $(srcdir)/$@
++	cat $(srcdir)/$@ | \
+ 		$(SED) -n -e \
+ 		's|^.*PNG_FUNCTION_EXPORT[ 	]*\([$(AN)]*\).*$$|$(SYMBOL_PREFIX)\1|p' \
+ 		-e 's|^.*PNG_DATA_EXPORT[ 	]*\([$(AN)]*\).*$$|$(SYMBOL_PREFIX)\1|p' \
+
+--- a/Makefile.in	2010-09-23 05:18:43.000000000 -0700
++++ b/Makefile.in	2010-10-04 15:51:29.000000000 -0700
+@@ -1213,7 +1213,8 @@ $(PNGLIB_BASENAME)-config: libpng-config
+ 
+ libpng.sym: png.h pngconf.h
+ 	rm -f $@ $@.new
+-	$(CPP) @LIBPNG_DEFINES@ $(CPPFLAGS) -DPNG_BUILDSYMS $(srcdir)/png.h | \
++	$(CPP) @LIBPNG_DEFINES@ $(CPPFLAGS) -DPNG_BUILDSYMS $(srcdir)/png.h $(srcdir)/$@
++	cat $(srcdir)/$@ | \
+ 		$(SED) -n -e \
+ 		's|^.*PNG_FUNCTION_EXPORT[ 	]*\([$(AN)]*\).*$$|$(SYMBOL_PREFIX)\1|p' \
+ 		-e 's|^.*PNG_DATA_EXPORT[ 	]*\([$(AN)]*\).*$$|$(SYMBOL_PREFIX)\1|p' \
-- 
1.7.3.1
