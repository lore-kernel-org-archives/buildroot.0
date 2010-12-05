From: heiko at zuerker.org <heiko@zuerker.org>
Date: Sun,  5 Dec 2010 09:03:50 -0600
Subject: [Buildroot] [PATCH] add zisofs-tools to support compressed iso
	images
In-Reply-To: <53a3d1a63baa70d2c39832718ebed3bc8ffcbe3f.1291561405.git.smiley73@users.sourceforge.net>
References: <53a3d1a63baa70d2c39832718ebed3bc8ffcbe3f.1291561405.git.smiley73@users.sourceforge.net>
Message-ID: <1291561433-5719-1-git-send-email-heiko@zuerker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

@@ -5606,6 +5623,10 @@ fi\
 	    # Replace all uninstalled libtool libraries with the installed ones
 	    newdependency_libs=
 	    for deplib in $dependency_libs; do
+              # Replacing uninstalled with installed can easily break crosscompilation,
+              # since the installed path is generally the wrong architecture.  -CL
+              newdependency_libs="$newdependency_libs $deplib"
+              continue
 	      case $deplib in
 	      *.la)
 		name=`$echo "X$deplib" | $Xsed -e 's%^.*/%%'`
@@ -5927,10 +5948,13 @@ relink_command=\"$relink_command\""
 	  # At present, this check doesn't affect windows .dll's that
 	  # are installed into $libdir/../bin (currently, that works fine)
 	  # but it's something to keep an eye on.
-	  if test "$inst_prefix_dir" = "$destdir"; then
-	    $echo "$modename: error: cannot install \`$file' to a directory not ending in $libdir" 1>&2
-	    exit $EXIT_FAILURE
-	  fi
+	  #
+	  # This breaks install into our staging area.  -PB
+	  # 
+	  # if test "$inst_prefix_dir" = "$destdir"; then
+	  #   $echo "$modename: error: cannot install \`$file' to a directory not ending in $libdir" 1>&2
+	  #   exit $EXIT_FAILURE
+	  # fi
 
 	  if test -n "$inst_prefix_dir"; then
 	    # Stick the inst_prefix_dir data into the link command.
