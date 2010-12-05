From: heiko at zuerker.org <heiko@zuerker.org>
Date: Sun,  5 Dec 2010 09:03:51 -0600
Subject: [Buildroot] [PATCH] add zisofs-tools to support compressed iso
	images
In-Reply-To: <53a3d1a63baa70d2c39832718ebed3bc8ffcbe3f.1291561405.git.smiley73@users.sourceforge.net>
References: <53a3d1a63baa70d2c39832718ebed3bc8ffcbe3f.1291561405.git.smiley73@users.sourceforge.net>
Message-ID: <1291561433-5719-2-git-send-email-heiko@zuerker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 	  if test -n "$inst_prefix_dir"; then
 	    # Stick the inst_prefix_dir data into the link command.
@@ -5412,8 +5415,14 @@ func_mode_link ()
 	    absdir="$abs_ladir"
 	    libdir="$abs_ladir"
 	  else
-	    dir="$libdir"
-	    absdir="$libdir"
+            # Adding 'libdir' from the .la file to our library search paths
+            # breaks crosscompilation horribly.  We cheat here and don't add
+            # it, instead adding the path where we found the .la.  -CL
+	    dir="$abs_ladir"
+	    absdir="$abs_ladir"
+	    libdir="$abs_ladir"
+	    #dir="$libdir"
+	    #absdir="$libdir"
 	  fi
 	  test "X$hardcode_automatic" = Xyes && avoidtemprpath=yes
 	else
@@ -5564,7 +5573,7 @@ func_mode_link ()
 	  *)
 	    if test "$installed" = no; then
 	      notinst_deplibs="$notinst_deplibs $lib"
-	      need_relink=yes
+	      need_relink=no
 	    fi
 	    ;;
 	  esac
@@ -8052,6 +8061,10 @@ EOF
 	    # Replace all uninstalled libtool libraries with the installed ones
 	    newdependency_libs=
 	    for deplib in $dependency_libs; do
+              # Replacing uninstalled with installed can easily break crosscompilation,
+              # since the installed path is generally the wrong architecture.  -CL
+              newdependency_libs="$newdependency_libs $deplib"
+              continue
 	      case $deplib in
 	      *.la)
 		func_basename "$deplib"
