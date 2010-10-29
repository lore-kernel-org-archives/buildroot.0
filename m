From: Martin Banky <martin.banky@gmail.com>
Date: Fri, 29 Oct 2010 20:06:24 +0200
Subject: [Buildroot] [git commit master 1/1] Removed
	freetype-2.3.9-libdir-la.patch
Message-ID: <20101029181142.52CCB8D41D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c9da538f7621c32d34cee452d22a16db8b4b8ee4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that freetype.mk has been converted to autotools infrastructure, the patch
is no longer needed. Autotools will automatically apply the needed patch.

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/freetype/freetype-2.3.9-libdir-la.patch |   81 -----------------------
 package/freetype/freetype.mk                    |    1 -
 2 files changed, 0 insertions(+), 82 deletions(-)
 delete mode 100644 package/freetype/freetype-2.3.9-libdir-la.patch

diff --git a/package/freetype/freetype-2.3.9-libdir-la.patch b/package/freetype/freetype-2.3.9-libdir-la.patch
deleted file mode 100644
index 76287ef..0000000
--- a/package/freetype/freetype-2.3.9-libdir-la.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-diff -urN freetype-2.3.7.orig/builds/unix/ltmain.sh freetype-2.3.7/builds/unix/ltmain.sh
---- freetype-2.3.7.orig/builds/unix/ltmain.sh	2008-09-16 15:55:36.000000000 +0100
-+++ freetype-2.3.7/builds/unix/ltmain.sh	2008-09-22 09:18:36.000000000 +0100
-@@ -1047,8 +1047,9 @@
- 	# was found and let the user know that the "--tag" command
- 	# line option must be used.
- 	if test -z "$tagname"; then
--	  func_echo "unable to infer tagged configuration"
--	  func_fatal_error "specify a tag with \`--tag'"
-+          func_echo "unable to infer tagged configuration"
-+	  func_echo "$modename: defaulting to \`CC'"
-+	  func_echo "$modename: if this is not correct, specify a tag with \`--tag'"
- #	else
- #	  func_verbose "using $tagname tagged configuration"
- 	fi
-@@ -2017,8 +2018,11 @@
- 	  # At present, this check doesn't affect windows .dll's that
- 	  # are installed into $libdir/../bin (currently, that works fine)
- 	  # but it's something to keep an eye on.
--	  test "$inst_prefix_dir" = "$destdir" && \
--	    func_fatal_error "error: cannot install \`$file' to a directory not ending in $libdir"
-+	  #
-+	  # This breaks install into our staging area.  -PB
-+	  #
-+	  #test "$inst_prefix_dir" = "$destdir" && \
-+	  #  func_fatal_error "error: cannot install \`$file' to a directory not ending in $libdir"
- 
- 	  if test -n "$inst_prefix_dir"; then
- 	    # Stick the inst_prefix_dir data into the link command.
-@@ -4885,8 +4889,14 @@
- 	    absdir="$abs_ladir"
- 	    libdir="$abs_ladir"
- 	  else
--	    dir="$libdir"
--	    absdir="$libdir"
-+            # Adding 'libdir' from the .la file to our library search paths
-+            # breaks crosscompilation horribly.  We cheat here and don't add
-+            # it, instead adding the path where we found the .la.  -CL
-+	    dir="$abs_ladir"
-+	    absdir="$abs_ladir"
-+	    libdir="$abs_ladir"
-+	    #dir="$libdir"
-+	    #absdir="$libdir"
- 	  fi
- 	  test "X$hardcode_automatic" = Xyes && avoidtemprpath=yes
- 	else
-@@ -5408,13 +5418,16 @@
- 		  ;;
- 		esac
- 		else
--		  eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p' $deplib`
--		  test -z "$libdir" && \
--		    func_fatal_error "\`$deplib' is not a valid libtool archive"
--		  test "$absdir" != "$libdir" && \
--		    func_warning "\`$deplib' seems to be moved"
--
--		  path="-L$absdir"
-+#       	  This interferes with crosscompilation. -CL
-+#		  eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p' $deplib`
-+#		  test -z "$libdir" && \
-+#		    func_fatal_error "\`$deplib' is not a valid libtool archive"
-+#		  test "$absdir" != "$libdir" && \
-+#		    func_warning "\`$deplib' seems to be moved"
-+#
-+#		  path="-L$absdir"
-+        	  path="-L$absdir/$objdir"
-+        	  eval libdir=`${SED} -n -e 's/^libdir=\(.*\)$/\1/p' $deplib`
- 		fi
- 		;;
- 	      esac
-@@ -7520,6 +7533,10 @@
- 	    # Replace all uninstalled libtool libraries with the installed ones
- 	    newdependency_libs=
- 	    for deplib in $dependency_libs; do
-+              # Replacing uninstalled with installed can easily break crosscompilation,
-+              # since the installed path is generally the wrong architecture.  -CL
-+              newdependency_libs="$newdependency_libs $deplib"
-+              continue
- 	      case $deplib in
- 	      *.la)
- 		func_basename "$deplib"
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index a2df1d8..c7e5c32 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -6,7 +6,6 @@
 FREETYPE_VERSION = 2.3.12
 FREETYPE_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/freetype
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
-FREETYPE_LIBTOOL_PATCH = NO
 FREETYPE_INSTALL_STAGING = YES
 FREETYPE_INSTALL_TARGET = YES
 FREETYPE_MAKE_OPT = CCexe="$(HOSTCC)"
-- 
1.7.1
