From: Michel (BusError) <buildroot.atmel.com@pollet.net>
Date: Tue,  8 Apr 2008 20:41:39 +0100
Subject: [Buildroot] [PATCH] SCREEN: Added support for GNU Screen
Message-ID: <1207683703-14842-1-git-send-email-buildroot.atmel.com@pollet.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Michel <michel.git@pollet.net>

screen is a terminal multiplexor that runs several separate "screens" on a single
physical character-based terminal.  Each virtual terminal emulates a DEC VT100
plus several ANSI X3.64 and ISO 2022 functions.
Screen sessions can be detached and resumed later on a different terminal.
Screen also supports a whole slew of other features.  Some of these are:
configurable input and output translation, serial port support, configurable
logging, multi-user support, and utf8 charset support.
---
 package/Config.in                                  |    1 +
 package/screen/Config.in                           |   17 +
 .../screen/screen-4.0.2-100-cross-compile.patch    |  967 ++++++++++++++++++++
 package/screen/screen.mk                           |   61 ++
 4 files changed, 1046 insertions(+), 0 deletions(-)
 create mode 100644 package/screen/Config.in
 create mode 100644 package/screen/screen-4.0.2-100-cross-compile.patch
 create mode 100644 package/screen/screen.mk

diff --git a/package/Config.in b/package/Config.in
index f3a68ed..3ca06ff 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -313,6 +313,7 @@ source "package/slang/Config.in"
 
 comment "text rendering applications"
 source "package/dialog/Config.in"
+source "package/screen/Config.in"
 
 comment "graphic libraries"
 source "package/directfb/Config.in"
diff --git a/package/screen/Config.in b/package/screen/Config.in
new file mode 100644
index 0000000..da29343
--- /dev/null
+++ b/package/screen/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_SCREEN
+    bool "screen"
+    default n
+    select BR2_PACKAGE_NCURSES
+    help
+	screen - terminal multiplexor with VT100/ANSI terminal emulation
+
+	screen is a terminal multiplexor that runs several separate "screens"
+	on a single physical character-based terminal.  Each virtual terminal
+	emulates a DEC VT100 plus several ANSI X3.64 and ISO 2022 functions. 
+	Screen sessions can be detached and resumed later on a different terminal.
+	
+	Screen also supports a whole slew of other features. 
+	Some of these are: configurable input and output translation, 
+	serial port support, configurable logging, multi-user support,
+	and utf8 charset support.
+
diff --git a/package/screen/screen-4.0.2-100-cross-compile.patch b/package/screen/screen-4.0.2-100-cross-compile.patch
new file mode 100644
index 0000000..4c22bf2
--- /dev/null
+++ b/package/screen/screen-4.0.2-100-cross-compile.patch
@@ -0,0 +1,967 @@
+diff -c screen.orig/configure screen-4.0.2/configure
+*** screen.orig/configure	2003-12-05 13:46:53.000000000 +0000
+--- screen-4.0.2/configure	2008-04-05 18:48:27.000000000 +0100
+***************
+*** 124,130 ****
+    fi
+    if test ! -f "$as_myself"; then
+      { echo "$as_me: error: cannot find myself; rerun with an absolute path" >&2
+!    { (exit 1); exit 1; }; }
+    fi
+    case $CONFIG_SHELL in
+    '')
+--- 124,130 ----
+    fi
+    if test ! -f "$as_myself"; then
+      { echo "$as_me: error: cannot find myself; rerun with an absolute path" >&2
+!     }
+    fi
+    case $CONFIG_SHELL in
+    '')
+***************
+*** 174,180 ****
+      ' >$as_me.lineno &&
+    chmod +x $as_me.lineno ||
+      { echo "$as_me: error: cannot create $as_me.lineno; rerun with a POSIX shell" >&2
+!    { (exit 1); exit 1; }; }
+  
+    # Don't try to exec as it changes $[0], causing all sort of problems
+    # (the dirname of $[0] is not the place where we might find the
+--- 174,180 ----
+      ' >$as_me.lineno &&
+    chmod +x $as_me.lineno ||
+      { echo "$as_me: error: cannot create $as_me.lineno; rerun with a POSIX shell" >&2
+!     }
+  
+    # Don't try to exec as it changes $[0], causing all sort of problems
+    # (the dirname of $[0] is not the place where we might find the
+***************
+*** 397,403 ****
+      # Reject names that are not valid shell variable names.
+      expr "x$ac_feature" : ".*[^-_$as_cr_alnum]" >/dev/null &&
+        { echo "$as_me: error: invalid feature name: $ac_feature" >&2
+!    { (exit 1); exit 1; }; }
+      ac_feature=`echo $ac_feature | sed 's/-/_/g'`
+      eval "enable_$ac_feature=no" ;;
+  
+--- 397,403 ----
+      # Reject names that are not valid shell variable names.
+      expr "x$ac_feature" : ".*[^-_$as_cr_alnum]" >/dev/null &&
+        { echo "$as_me: error: invalid feature name: $ac_feature" >&2
+!     }
+      ac_feature=`echo $ac_feature | sed 's/-/_/g'`
+      eval "enable_$ac_feature=no" ;;
+  
+***************
+*** 406,412 ****
+      # Reject names that are not valid shell variable names.
+      expr "x$ac_feature" : ".*[^-_$as_cr_alnum]" >/dev/null &&
+        { echo "$as_me: error: invalid feature name: $ac_feature" >&2
+!    { (exit 1); exit 1; }; }
+      ac_feature=`echo $ac_feature | sed 's/-/_/g'`
+      case $ac_option in
+        *=*) ac_optarg=`echo "$ac_optarg" | sed "s/'/'\\\\\\\\''/g"`;;
+--- 406,412 ----
+      # Reject names that are not valid shell variable names.
+      expr "x$ac_feature" : ".*[^-_$as_cr_alnum]" >/dev/null &&
+        { echo "$as_me: error: invalid feature name: $ac_feature" >&2
+!     }
+      ac_feature=`echo $ac_feature | sed 's/-/_/g'`
+      case $ac_option in
+        *=*) ac_optarg=`echo "$ac_optarg" | sed "s/'/'\\\\\\\\''/g"`;;
+***************
+*** 588,594 ****
+      # Reject names that are not valid shell variable names.
+      expr "x$ac_package" : ".*[^-_$as_cr_alnum]" >/dev/null &&
+        { echo "$as_me: error: invalid package name: $ac_package" >&2
+!    { (exit 1); exit 1; }; }
+      ac_package=`echo $ac_package| sed 's/-/_/g'`
+      case $ac_option in
+        *=*) ac_optarg=`echo "$ac_optarg" | sed "s/'/'\\\\\\\\''/g"`;;
+--- 588,594 ----
+      # Reject names that are not valid shell variable names.
+      expr "x$ac_package" : ".*[^-_$as_cr_alnum]" >/dev/null &&
+        { echo "$as_me: error: invalid package name: $ac_package" >&2
+!     }
+      ac_package=`echo $ac_package| sed 's/-/_/g'`
+      case $ac_option in
+        *=*) ac_optarg=`echo "$ac_optarg" | sed "s/'/'\\\\\\\\''/g"`;;
+***************
+*** 601,607 ****
+      # Reject names that are not valid shell variable names.
+      expr "x$ac_package" : ".*[^-_$as_cr_alnum]" >/dev/null &&
+        { echo "$as_me: error: invalid package name: $ac_package" >&2
+!    { (exit 1); exit 1; }; }
+      ac_package=`echo $ac_package | sed 's/-/_/g'`
+      eval "with_$ac_package=no" ;;
+  
+--- 601,607 ----
+      # Reject names that are not valid shell variable names.
+      expr "x$ac_package" : ".*[^-_$as_cr_alnum]" >/dev/null &&
+        { echo "$as_me: error: invalid package name: $ac_package" >&2
+!     }
+      ac_package=`echo $ac_package | sed 's/-/_/g'`
+      eval "with_$ac_package=no" ;;
+  
+***************
+*** 625,631 ****
+  
+    -*) { echo "$as_me: error: unrecognized option: $ac_option
+  Try \`$0 --help' for more information." >&2
+!    { (exit 1); exit 1; }; }
+      ;;
+  
+    *=*)
+--- 625,631 ----
+  
+    -*) { echo "$as_me: error: unrecognized option: $ac_option
+  Try \`$0 --help' for more information." >&2
+!     }
+      ;;
+  
+    *=*)
+***************
+*** 633,639 ****
+      # Reject names that are not valid shell variable names.
+      expr "x$ac_envvar" : ".*[^_$as_cr_alnum]" >/dev/null &&
+        { echo "$as_me: error: invalid variable name: $ac_envvar" >&2
+!    { (exit 1); exit 1; }; }
+      ac_optarg=`echo "$ac_optarg" | sed "s/'/'\\\\\\\\''/g"`
+      eval "$ac_envvar='$ac_optarg'"
+      export $ac_envvar ;;
+--- 633,639 ----
+      # Reject names that are not valid shell variable names.
+      expr "x$ac_envvar" : ".*[^_$as_cr_alnum]" >/dev/null &&
+        { echo "$as_me: error: invalid variable name: $ac_envvar" >&2
+!     }
+      ac_optarg=`echo "$ac_optarg" | sed "s/'/'\\\\\\\\''/g"`
+      eval "$ac_envvar='$ac_optarg'"
+      export $ac_envvar ;;
+***************
+*** 652,658 ****
+  if test -n "$ac_prev"; then
+    ac_option=--`echo $ac_prev | sed 's/_/-/g'`
+    { echo "$as_me: error: missing argument to $ac_option" >&2
+!    { (exit 1); exit 1; }; }
+  fi
+  
+  # Be sure to have absolute paths.
+--- 652,658 ----
+  if test -n "$ac_prev"; then
+    ac_option=--`echo $ac_prev | sed 's/_/-/g'`
+    { echo "$as_me: error: missing argument to $ac_option" >&2
+!     }
+  fi
+  
+  # Be sure to have absolute paths.
+***************
+*** 662,668 ****
+    case $ac_val in
+      [\\/$]* | ?:[\\/]* | NONE | '' ) ;;
+      *)  { echo "$as_me: error: expected an absolute directory name for --$ac_var: $ac_val" >&2
+!    { (exit 1); exit 1; }; };;
+    esac
+  done
+  
+--- 662,668 ----
+    case $ac_val in
+      [\\/$]* | ?:[\\/]* | NONE | '' ) ;;
+      *)  { echo "$as_me: error: expected an absolute directory name for --$ac_var: $ac_val" >&2
+!     };;
+    esac
+  done
+  
+***************
+*** 674,680 ****
+    case $ac_val in
+      [\\/$]* | ?:[\\/]* ) ;;
+      *)  { echo "$as_me: error: expected an absolute directory name for --$ac_var: $ac_val" >&2
+!    { (exit 1); exit 1; }; };;
+    esac
+  done
+  
+--- 674,680 ----
+    case $ac_val in
+      [\\/$]* | ?:[\\/]* ) ;;
+      *)  { echo "$as_me: error: expected an absolute directory name for --$ac_var: $ac_val" >&2
+!     };;
+    esac
+  done
+  
+***************
+*** 728,742 ****
+  if test ! -r $srcdir/$ac_unique_file; then
+    if test "$ac_srcdir_defaulted" = yes; then
+      { echo "$as_me: error: cannot find sources ($ac_unique_file) in $ac_confdir or .." >&2
+!    { (exit 1); exit 1; }; }
+    else
+      { echo "$as_me: error: cannot find sources ($ac_unique_file) in $srcdir" >&2
+!    { (exit 1); exit 1; }; }
+    fi
+  fi
+  (cd $srcdir && test -r ./$ac_unique_file) 2>/dev/null ||
+    { echo "$as_me: error: sources are in $srcdir, but \`cd $srcdir' does not work" >&2
+!    { (exit 1); exit 1; }; }
+  srcdir=`echo "$srcdir" | sed 's%\([^\\/]\)[\\/]*$%\1%'`
+  ac_env_build_alias_set=${build_alias+set}
+  ac_env_build_alias_value=$build_alias
+--- 728,742 ----
+  if test ! -r $srcdir/$ac_unique_file; then
+    if test "$ac_srcdir_defaulted" = yes; then
+      { echo "$as_me: error: cannot find sources ($ac_unique_file) in $ac_confdir or .." >&2
+!     }
+    else
+      { echo "$as_me: error: cannot find sources ($ac_unique_file) in $srcdir" >&2
+!     }
+    fi
+  fi
+  (cd $srcdir && test -r ./$ac_unique_file) 2>/dev/null ||
+    { echo "$as_me: error: sources are in $srcdir, but \`cd $srcdir' does not work" >&2
+!     }
+  srcdir=`echo "$srcdir" | sed 's%\([^\\/]\)[\\/]*$%\1%'`
+  ac_env_build_alias_set=${build_alias+set}
+  ac_env_build_alias_value=$build_alias
+***************
+*** 1243,1249 ****
+  echo "$as_me: error: changes in the environment can compromise the build" >&2;}
+    { { echo "$as_me:$LINENO: error: run \`make distclean' and/or \`rm $cache_file' and start over" >&5
+  echo "$as_me: error: run \`make distclean' and/or \`rm $cache_file' and start over" >&2;}
+!    { (exit 1); exit 1; }; }
+  fi
+  
+  ac_ext=c
+--- 1243,1249 ----
+  echo "$as_me: error: changes in the environment can compromise the build" >&2;}
+    { { echo "$as_me:$LINENO: error: run \`make distclean' and/or \`rm $cache_file' and start over" >&5
+  echo "$as_me: error: run \`make distclean' and/or \`rm $cache_file' and start over" >&2;}
+!     }
+  fi
+  
+  ac_ext=c
+***************
+*** 1734,1740 ****
+  See \`config.log' for more details." >&5
+  echo "$as_me: error: no acceptable C compiler found in \$PATH
+  See \`config.log' for more details." >&2;}
+!    { (exit 1); exit 1; }; }
+  
+  # Provide some information about the compiler.
+  echo "$as_me:$LINENO:" \
+--- 1734,1740 ----
+  See \`config.log' for more details." >&5
+  echo "$as_me: error: no acceptable C compiler found in \$PATH
+  See \`config.log' for more details." >&2;}
+!     }
+  
+  # Provide some information about the compiler.
+  echo "$as_me:$LINENO:" \
+***************
+*** 1856,1862 ****
+  echo "$as_me: error: cannot run C compiled programs.
+  If you meant to cross compile, use \`--host'.
+  See \`config.log' for more details." >&2;}
+!    { (exit 1); exit 1; }; }
+      fi
+    fi
+  fi
+--- 1856,1862 ----
+  echo "$as_me: error: cannot run C compiled programs.
+  If you meant to cross compile, use \`--host'.
+  See \`config.log' for more details." >&2;}
+!     }
+      fi
+    fi
+  fi
+***************
+*** 1898,1904 ****
+  See \`config.log' for more details." >&5
+  echo "$as_me: error: cannot compute suffix of executables: cannot compile and link
+  See \`config.log' for more details." >&2;}
+!    { (exit 1); exit 1; }; }
+  fi
+  
+  rm -f conftest$ac_cv_exeext
+--- 1898,1904 ----
+  See \`config.log' for more details." >&5
+  echo "$as_me: error: cannot compute suffix of executables: cannot compile and link
+  See \`config.log' for more details." >&2;}
+!     }
+  fi
+  
+  rm -f conftest$ac_cv_exeext
+***************
+*** 1950,1956 ****
+  See \`config.log' for more details." >&5
+  echo "$as_me: error: cannot compute suffix of object files: cannot compile
+  See \`config.log' for more details." >&2;}
+!    { (exit 1); exit 1; }; }
+  fi
+  
+  rm -f conftest.$ac_cv_objext conftest.$ac_ext
+--- 1950,1956 ----
+  See \`config.log' for more details." >&5
+  echo "$as_me: error: cannot compute suffix of object files: cannot compile
+  See \`config.log' for more details." >&2;}
+!     }
+  fi
+  
+  rm -f conftest.$ac_cv_objext conftest.$ac_ext
+***************
+*** 2514,2520 ****
+  See \`config.log' for more details." >&5
+  echo "$as_me: error: C preprocessor \"$CPP\" fails sanity check
+  See \`config.log' for more details." >&2;}
+!    { (exit 1); exit 1; }; }
+  fi
+  
+  ac_ext=c
+--- 2514,2520 ----
+  See \`config.log' for more details." >&5
+  echo "$as_me: error: C preprocessor \"$CPP\" fails sanity check
+  See \`config.log' for more details." >&2;}
+!     }
+  fi
+  
+  ac_ext=c
+***************
+*** 2704,2710 ****
+  See \`config.log' for more details." >&5
+  echo "$as_me: error: cannot run test program while cross compiling
+  See \`config.log' for more details." >&2;}
+!    { (exit 1); exit 1; }; }
+  else
+    cat >conftest.$ac_ext <<_ACEOF
+  #line $LINENO "configure"
+--- 2704,2710 ----
+  See \`config.log' for more details." >&5
+  echo "$as_me: error: cannot run test program while cross compiling
+  See \`config.log' for more details." >&2;}
+!     }
+  else
+    cat >conftest.$ac_ext <<_ACEOF
+  #line $LINENO "configure"
+***************
+*** 2753,2759 ****
+  See \`config.log' for more details." >&5
+  echo "$as_me: error: cannot run test program while cross compiling
+  See \`config.log' for more details." >&2;}
+!    { (exit 1); exit 1; }; }
+  else
+    cat >conftest.$ac_ext <<_ACEOF
+  #line $LINENO "configure"
+--- 2753,2759 ----
+  See \`config.log' for more details." >&5
+  echo "$as_me: error: cannot run test program while cross compiling
+  See \`config.log' for more details." >&2;}
+!   }
+  else
+    cat >conftest.$ac_ext <<_ACEOF
+  #line $LINENO "configure"
+***************
+*** 2790,2796 ****
+  
+  { { echo "$as_me:$LINENO: error: Can't run the compiler - sorry" >&5
+  echo "$as_me: error: Can't run the compiler - sorry" >&2;}
+!    { (exit 1); exit 1; }; }
+  fi
+  rm -f core core.* *.core gmon.out bb.out conftest$ac_exeext conftest.$ac_objext conftest.$ac_ext
+  fi
+--- 2790,2796 ----
+  
+  { { echo "$as_me:$LINENO: error: Can't run the compiler - sorry" >&5
+  echo "$as_me: error: Can't run the compiler - sorry" >&2;}
+!     }
+  fi
+  rm -f core core.* *.core gmon.out bb.out conftest$ac_exeext conftest.$ac_objext conftest.$ac_ext
+  fi
+***************
+*** 2800,2806 ****
+  See \`config.log' for more details." >&5
+  echo "$as_me: error: cannot run test program while cross compiling
+  See \`config.log' for more details." >&2;}
+!    { (exit 1); exit 1; }; }
+  else
+    cat >conftest.$ac_ext <<_ACEOF
+  #line $LINENO "configure"
+--- 2800,2806 ----
+  See \`config.log' for more details." >&5
+  echo "$as_me: error: cannot run test program while cross compiling
+  See \`config.log' for more details." >&2;}
+!   }
+  else
+    cat >conftest.$ac_ext <<_ACEOF
+  #line $LINENO "configure"
+***************
+*** 2830,2836 ****
+    (exit $ac_status); }; }; then
+    { { echo "$as_me:$LINENO: error: Your compiler does not set the exit status - sorry" >&5
+  echo "$as_me: error: Your compiler does not set the exit status - sorry" >&2;}
+!    { (exit 1); exit 1; }; }
+  else
+    echo "$as_me: program exited with status $ac_status" >&5
+  echo "$as_me: failed program was:" >&5
+--- 2830,2836 ----
+    (exit $ac_status); }; }; then
+    { { echo "$as_me:$LINENO: error: Your compiler does not set the exit status - sorry" >&5
+  echo "$as_me: error: Your compiler does not set the exit status - sorry" >&2;}
+!     }
+  else
+    echo "$as_me: program exited with status $ac_status" >&5
+  echo "$as_me: failed program was:" >&5
+***************
+*** 2900,2906 ****
+  if test -z "$ac_aux_dir"; then
+    { { echo "$as_me:$LINENO: error: cannot find install-sh or install.sh in $srcdir $srcdir/.. $srcdir/../.." >&5
+  echo "$as_me: error: cannot find install-sh or install.sh in $srcdir $srcdir/.. $srcdir/../.." >&2;}
+!    { (exit 1); exit 1; }; }
+  fi
+  ac_config_guess="$SHELL $ac_aux_dir/config.guess"
+  ac_config_sub="$SHELL $ac_aux_dir/config.sub"
+--- 2900,2906 ----
+  if test -z "$ac_aux_dir"; then
+    { { echo "$as_me:$LINENO: error: cannot find install-sh or install.sh in $srcdir $srcdir/.. $srcdir/../.." >&5
+  echo "$as_me: error: cannot find install-sh or install.sh in $srcdir $srcdir/.. $srcdir/../.." >&2;}
+!     }
+  fi
+  ac_config_guess="$SHELL $ac_aux_dir/config.guess"
+  ac_config_sub="$SHELL $ac_aux_dir/config.sub"
+***************
+*** 4149,4155 ****
+  
+  { { echo "$as_me:$LINENO: error: !!! no select - no screen" >&5
+  echo "$as_me: error: !!! no select - no screen" >&2;}
+!    { (exit 1); exit 1; }; }
+  fi
+  rm -f conftest.$ac_objext conftest$ac_exeext conftest.$ac_ext
+  
+--- 4149,4155 ----
+  
+  { { echo "$as_me:$LINENO: error: !!! no select - no screen" >&5
+  echo "$as_me: error: !!! no select - no screen" >&2;}
+!     }
+  fi
+  rm -f conftest.$ac_objext conftest$ac_exeext conftest.$ac_ext
+  
+***************
+*** 4163,4169 ****
+  See \`config.log' for more details." >&5
+  echo "$as_me: error: cannot run test program while cross compiling
+  See \`config.log' for more details." >&2;}
+!    { (exit 1); exit 1; }; }
+  else
+    cat >conftest.$ac_ext <<_ACEOF
+  #line $LINENO "configure"
+--- 4163,4169 ----
+  See \`config.log' for more details." >&5
+  echo "$as_me: error: cannot run test program while cross compiling
+  See \`config.log' for more details." >&2;}
+!   }
+  else
+    cat >conftest.$ac_ext <<_ACEOF
+  #line $LINENO "configure"
+***************
+*** 4272,4278 ****
+  See \`config.log' for more details." >&5
+  echo "$as_me: error: cannot run test program while cross compiling
+  See \`config.log' for more details." >&2;}
+!    { (exit 1); exit 1; }; }
+  else
+    cat >conftest.$ac_ext <<_ACEOF
+  #line $LINENO "configure"
+--- 4272,4278 ----
+  See \`config.log' for more details." >&5
+  echo "$as_me: error: cannot run test program while cross compiling
+  See \`config.log' for more details." >&2;}
+!   }
+  else
+    cat >conftest.$ac_ext <<_ACEOF
+  #line $LINENO "configure"
+***************
+*** 4365,4371 ****
+  See \`config.log' for more details." >&5
+  echo "$as_me: error: cannot run test program while cross compiling
+  See \`config.log' for more details." >&2;}
+!    { (exit 1); exit 1; }; }
+  else
+    cat >conftest.$ac_ext <<_ACEOF
+  #line $LINENO "configure"
+--- 4365,4371 ----
+  See \`config.log' for more details." >&5
+  echo "$as_me: error: cannot run test program while cross compiling
+  See \`config.log' for more details." >&2;}
+!   }
+  else
+    cat >conftest.$ac_ext <<_ACEOF
+  #line $LINENO "configure"
+***************
+*** 4460,4466 ****
+  See \`config.log' for more details." >&5
+  echo "$as_me: error: cannot run test program while cross compiling
+  See \`config.log' for more details." >&2;}
+!    { (exit 1); exit 1; }; }
+  else
+    cat >conftest.$ac_ext <<_ACEOF
+  #line $LINENO "configure"
+--- 4460,4466 ----
+  See \`config.log' for more details." >&5
+  echo "$as_me: error: cannot run test program while cross compiling
+  See \`config.log' for more details." >&2;}
+!   }
+  else
+    cat >conftest.$ac_ext <<_ACEOF
+  #line $LINENO "configure"
+***************
+*** 4562,4568 ****
+  else
+    { { echo "$as_me:$LINENO: error: you have neither usable sockets nor usable pipes -> no screen" >&5
+  echo "$as_me: error: you have neither usable sockets nor usable pipes -> no screen" >&2;}
+!    { (exit 1); exit 1; }; }
+  fi
+  
+  
+--- 4562,4568 ----
+  else
+    { { echo "$as_me:$LINENO: error: you have neither usable sockets nor usable pipes -> no screen" >&5
+  echo "$as_me: error: you have neither usable sockets nor usable pipes -> no screen" >&2;}
+!     }
+  fi
+  
+  
+***************
+*** 4573,4579 ****
+  See \`config.log' for more details." >&5
+  echo "$as_me: error: cannot run test program while cross compiling
+  See \`config.log' for more details." >&2;}
+!    { (exit 1); exit 1; }; }
+  else
+    cat >conftest.$ac_ext <<_ACEOF
+  #line $LINENO "configure"
+--- 4573,4579 ----
+  See \`config.log' for more details." >&5
+  echo "$as_me: error: cannot run test program while cross compiling
+  See \`config.log' for more details." >&2;}
+!     }
+  else
+    cat >conftest.$ac_ext <<_ACEOF
+  #line $LINENO "configure"
+***************
+*** 4898,4904 ****
+  
+  { { echo "$as_me:$LINENO: error: !!! no tgetent - no screen" >&5
+  echo "$as_me: error: !!! no tgetent - no screen" >&2;}
+!    { (exit 1); exit 1; }; }
+  fi
+  rm -f conftest.$ac_objext conftest$ac_exeext conftest.$ac_ext
+  fi
+--- 4898,4904 ----
+  
+  { { echo "$as_me:$LINENO: error: !!! no tgetent - no screen" >&5
+  echo "$as_me: error: !!! no tgetent - no screen" >&2;}
+!     }
+  fi
+  rm -f conftest.$ac_objext conftest$ac_exeext conftest.$ac_ext
+  fi
+***************
+*** 4915,4921 ****
+  See \`config.log' for more details." >&5
+  echo "$as_me: error: cannot run test program while cross compiling
+  See \`config.log' for more details." >&2;}
+!    { (exit 1); exit 1; }; }
+  else
+    cat >conftest.$ac_ext <<_ACEOF
+  #line $LINENO "configure"
+--- 4915,4921 ----
+  See \`config.log' for more details." >&5
+  echo "$as_me: error: cannot run test program while cross compiling
+  See \`config.log' for more details." >&2;}
+!     }
+  else
+    cat >conftest.$ac_ext <<_ACEOF
+  #line $LINENO "configure"
+***************
+*** 5359,5365 ****
+  See \`config.log' for more details." >&5
+  echo "$as_me: error: cannot run test program while cross compiling
+  See \`config.log' for more details." >&2;}
+!    { (exit 1); exit 1; }; }
+  else
+    cat >conftest.$ac_ext <<_ACEOF
+  #line $LINENO "configure"
+--- 5359,5365 ----
+  See \`config.log' for more details." >&5
+  echo "$as_me: error: cannot run test program while cross compiling
+  See \`config.log' for more details." >&2;}
+!     }
+  else
+    cat >conftest.$ac_ext <<_ACEOF
+  #line $LINENO "configure"
+***************
+*** 6206,6212 ****
+  See \`config.log' for more details." >&5
+  echo "$as_me: error: cannot run test program while cross compiling
+  See \`config.log' for more details." >&2;}
+!    { (exit 1); exit 1; }; }
+  else
+    cat >conftest.$ac_ext <<_ACEOF
+  #line $LINENO "configure"
+--- 6206,6212 ----
+  See \`config.log' for more details." >&5
+  echo "$as_me: error: cannot run test program while cross compiling
+  See \`config.log' for more details." >&2;}
+!     }
+  else
+    cat >conftest.$ac_ext <<_ACEOF
+  #line $LINENO "configure"
+***************
+*** 6482,6488 ****
+  See \`config.log' for more details." >&5
+  echo "$as_me: error: cannot run test program while cross compiling
+  See \`config.log' for more details." >&2;}
+!    { (exit 1); exit 1; }; }
+  else
+    cat >conftest.$ac_ext <<_ACEOF
+  #line $LINENO "configure"
+--- 6482,6488 ----
+  See \`config.log' for more details." >&5
+  echo "$as_me: error: cannot run test program while cross compiling
+  See \`config.log' for more details." >&2;}
+!     }
+  else
+    cat >conftest.$ac_ext <<_ACEOF
+  #line $LINENO "configure"
+***************
+*** 6598,6605 ****
+  LIBS="$oldlibs"
+  fi
+  rm -f conftest.$ac_objext conftest$ac_exeext conftest.$ac_ext
+- test -f /lib/libsec.a || test -f /usr/lib/libsec.a && LIBS="$LIBS -lsec"
+- test -f /lib/libshadow.a || test -f /usr/lib/libshadow.a && LIBS="$LIBS -lshadow"
+  oldlibs="$LIBS"
+  LIBS="$LIBS -lsun"
+  { echo "$as_me:$LINENO: checking IRIX sun library..." >&5
+--- 6598,6603 ----
+***************
+*** 7004,7010 ****
+  See \`config.log' for more details." >&5
+  echo "$as_me: error: cannot run test program while cross compiling
+  See \`config.log' for more details." >&2;}
+!    { (exit 1); exit 1; }; }
+  else
+    cat >conftest.$ac_ext <<_ACEOF
+  #line $LINENO "configure"
+--- 7002,7008 ----
+  See \`config.log' for more details." >&5
+  echo "$as_me: error: cannot run test program while cross compiling
+  See \`config.log' for more details." >&2;}
+!     }
+  else
+    cat >conftest.$ac_ext <<_ACEOF
+  #line $LINENO "configure"
+***************
+*** 7056,7062 ****
+  See \`config.log' for more details." >&5
+  echo "$as_me: error: cannot run test program while cross compiling
+  See \`config.log' for more details." >&2;}
+!    { (exit 1); exit 1; }; }
+  else
+    cat >conftest.$ac_ext <<_ACEOF
+  #line $LINENO "configure"
+--- 7054,7060 ----
+  See \`config.log' for more details." >&5
+  echo "$as_me: error: cannot run test program while cross compiling
+  See \`config.log' for more details." >&2;}
+!     }
+  else
+    cat >conftest.$ac_ext <<_ACEOF
+  #line $LINENO "configure"
+***************
+*** 7110,7116 ****
+  See \`config.log' for more details." >&5
+  echo "$as_me: error: cannot run test program while cross compiling
+  See \`config.log' for more details." >&2;}
+!    { (exit 1); exit 1; }; }
+  else
+    cat >conftest.$ac_ext <<_ACEOF
+  #line $LINENO "configure"
+--- 7108,7114 ----
+  See \`config.log' for more details." >&5
+  echo "$as_me: error: cannot run test program while cross compiling
+  See \`config.log' for more details." >&2;}
+!     }
+  else
+    cat >conftest.$ac_ext <<_ACEOF
+  #line $LINENO "configure"
+***************
+*** 7951,7957 ****
+  See \`config.log' for more details." >&5
+  echo "$as_me: error: cannot run test program while cross compiling
+  See \`config.log' for more details." >&2;}
+!    { (exit 1); exit 1; }; }
+  else
+    cat >conftest.$ac_ext <<_ACEOF
+  #line $LINENO "configure"
+--- 7949,7955 ----
+  See \`config.log' for more details." >&5
+  echo "$as_me: error: cannot run test program while cross compiling
+  See \`config.log' for more details." >&2;}
+!     }
+  else
+    cat >conftest.$ac_ext <<_ACEOF
+  #line $LINENO "configure"
+***************
+*** 7982,7988 ****
+  ( exit $ac_status )
+  { { echo "$as_me:$LINENO: error: Can't run the compiler - internal error. Sorry." >&5
+  echo "$as_me: error: Can't run the compiler - internal error. Sorry." >&2;}
+!    { (exit 1); exit 1; }; }
+  fi
+  rm -f core core.* *.core gmon.out bb.out conftest$ac_exeext conftest.$ac_objext conftest.$ac_ext
+  fi
+--- 7980,7986 ----
+  ( exit $ac_status )
+  { { echo "$as_me:$LINENO: error: Can't run the compiler - internal error. Sorry." >&5
+  echo "$as_me: error: Can't run the compiler - internal error. Sorry." >&2;}
+!     }
+  fi
+  rm -f core core.* *.core gmon.out bb.out conftest$ac_exeext conftest.$ac_objext conftest.$ac_ext
+  fi
+***************
+*** 8251,8257 ****
+    if test ! -f "$as_myself"; then
+      { { echo "$as_me:$LINENO: error: cannot find myself; rerun with an absolute path" >&5
+  echo "$as_me: error: cannot find myself; rerun with an absolute path" >&2;}
+!    { (exit 1); exit 1; }; }
+    fi
+    case $CONFIG_SHELL in
+    '')
+--- 8249,8255 ----
+    if test ! -f "$as_myself"; then
+      { { echo "$as_me:$LINENO: error: cannot find myself; rerun with an absolute path" >&5
+  echo "$as_me: error: cannot find myself; rerun with an absolute path" >&2;}
+!     }
+    fi
+    case $CONFIG_SHELL in
+    '')
+***************
+*** 8302,8308 ****
+    chmod +x $as_me.lineno ||
+      { { echo "$as_me:$LINENO: error: cannot create $as_me.lineno; rerun with a POSIX shell" >&5
+  echo "$as_me: error: cannot create $as_me.lineno; rerun with a POSIX shell" >&2;}
+!    { (exit 1); exit 1; }; }
+  
+    # Don't try to exec as it changes $[0], causing all sort of problems
+    # (the dirname of $[0] is not the place where we might find the
+--- 8300,8306 ----
+    chmod +x $as_me.lineno ||
+      { { echo "$as_me:$LINENO: error: cannot create $as_me.lineno; rerun with a POSIX shell" >&5
+  echo "$as_me: error: cannot create $as_me.lineno; rerun with a POSIX shell" >&2;}
+!     }
+  
+    # Don't try to exec as it changes $[0], causing all sort of problems
+    # (the dirname of $[0] is not the place where we might find the
+***************
+*** 8494,8500 ****
+  Try \`$0 --help' for more information." >&5
+  echo "$as_me: error: ambiguous option: $1
+  Try \`$0 --help' for more information." >&2;}
+!    { (exit 1); exit 1; }; };;
+    --help | --hel | -h )
+      echo "$ac_cs_usage"; exit 0 ;;
+    --debug | --d* | -d )
+--- 8492,8498 ----
+  Try \`$0 --help' for more information." >&5
+  echo "$as_me: error: ambiguous option: $1
+  Try \`$0 --help' for more information." >&2;}
+!     };;
+    --help | --hel | -h )
+      echo "$ac_cs_usage"; exit 0 ;;
+    --debug | --d* | -d )
+***************
+*** 8516,8522 ****
+  Try \`$0 --help' for more information." >&5
+  echo "$as_me: error: unrecognized option: $1
+  Try \`$0 --help' for more information." >&2;}
+!    { (exit 1); exit 1; }; } ;;
+  
+    *) ac_config_targets="$ac_config_targets $1" ;;
+  
+--- 8514,8520 ----
+  Try \`$0 --help' for more information." >&5
+  echo "$as_me: error: unrecognized option: $1
+  Try \`$0 --help' for more information." >&2;}
+!     } ;;
+  
+    *) ac_config_targets="$ac_config_targets $1" ;;
+  
+***************
+*** 8555,8561 ****
+    "config.h" ) CONFIG_HEADERS="$CONFIG_HEADERS config.h" ;;
+    *) { { echo "$as_me:$LINENO: error: invalid argument: $ac_config_target" >&5
+  echo "$as_me: error: invalid argument: $ac_config_target" >&2;}
+!    { (exit 1); exit 1; }; };;
+    esac
+  done
+  
+--- 8553,8559 ----
+    "config.h" ) CONFIG_HEADERS="$CONFIG_HEADERS config.h" ;;
+    *) { { echo "$as_me:$LINENO: error: invalid argument: $ac_config_target" >&5
+  echo "$as_me: error: invalid argument: $ac_config_target" >&2;}
+!     };;
+    esac
+  done
+  
+***************
+*** 8750,8756 ****
+      test ! -n "$as_dirs" || mkdir $as_dirs
+    fi || { { echo "$as_me:$LINENO: error: cannot create directory \"$ac_dir\"" >&5
+  echo "$as_me: error: cannot create directory \"$ac_dir\"" >&2;}
+!    { (exit 1); exit 1; }; }; }
+  
+    ac_builddir=.
+  
+--- 8748,8754 ----
+      test ! -n "$as_dirs" || mkdir $as_dirs
+    fi || { { echo "$as_me:$LINENO: error: cannot create directory \"$ac_dir\"" >&5
+  echo "$as_me: error: cannot create directory \"$ac_dir\"" >&2;}
+!     }; }
+  
+    ac_builddir=.
+  
+***************
+*** 8816,8822 ****
+           # Absolute (can't be DOS-style, as IFS=:)
+           test -f "$f" || { { echo "$as_me:$LINENO: error: cannot find input file: $f" >&5
+  echo "$as_me: error: cannot find input file: $f" >&2;}
+!    { (exit 1); exit 1; }; }
+           echo $f;;
+        *) # Relative
+           if test -f "$f"; then
+--- 8814,8820 ----
+           # Absolute (can't be DOS-style, as IFS=:)
+           test -f "$f" || { { echo "$as_me:$LINENO: error: cannot find input file: $f" >&5
+  echo "$as_me: error: cannot find input file: $f" >&2;}
+!     }
+           echo $f;;
+        *) # Relative
+           if test -f "$f"; then
+***************
+*** 8829,8835 ****
+             # /dev/null tree
+             { { echo "$as_me:$LINENO: error: cannot find input file: $f" >&5
+  echo "$as_me: error: cannot find input file: $f" >&2;}
+!    { (exit 1); exit 1; }; }
+           fi;;
+        esac
+      done` || { (exit 1); exit 1; }
+--- 8827,8833 ----
+             # /dev/null tree
+             { { echo "$as_me:$LINENO: error: cannot find input file: $f" >&5
+  echo "$as_me: error: cannot find input file: $f" >&2;}
+!     }
+           fi;;
+        esac
+      done` || { (exit 1); exit 1; }
+***************
+*** 8907,8913 ****
+           # Absolute (can't be DOS-style, as IFS=:)
+           test -f "$f" || { { echo "$as_me:$LINENO: error: cannot find input file: $f" >&5
+  echo "$as_me: error: cannot find input file: $f" >&2;}
+!    { (exit 1); exit 1; }; }
+           echo $f;;
+        *) # Relative
+           if test -f "$f"; then
+--- 8905,8911 ----
+           # Absolute (can't be DOS-style, as IFS=:)
+           test -f "$f" || { { echo "$as_me:$LINENO: error: cannot find input file: $f" >&5
+  echo "$as_me: error: cannot find input file: $f" >&2;}
+!     }
+           echo $f;;
+        *) # Relative
+           if test -f "$f"; then
+***************
+*** 8920,8926 ****
+             # /dev/null tree
+             { { echo "$as_me:$LINENO: error: cannot find input file: $f" >&5
+  echo "$as_me: error: cannot find input file: $f" >&2;}
+!    { (exit 1); exit 1; }; }
+           fi;;
+        esac
+      done` || { (exit 1); exit 1; }
+--- 8918,8924 ----
+             # /dev/null tree
+             { { echo "$as_me:$LINENO: error: cannot find input file: $f" >&5
+  echo "$as_me: error: cannot find input file: $f" >&2;}
+!     }
+           fi;;
+        esac
+      done` || { (exit 1); exit 1; }
+***************
+*** 9073,9079 ****
+      test ! -n "$as_dirs" || mkdir $as_dirs
+    fi || { { echo "$as_me:$LINENO: error: cannot create directory \"$ac_dir\"" >&5
+  echo "$as_me: error: cannot create directory \"$ac_dir\"" >&2;}
+!    { (exit 1); exit 1; }; }; }
+  
+        rm -f $ac_file
+        mv $tmp/config.h $ac_file
+--- 9071,9077 ----
+      test ! -n "$as_dirs" || mkdir $as_dirs
+    fi || { { echo "$as_me:$LINENO: error: cannot create directory \"$ac_dir\"" >&5
+  echo "$as_me: error: cannot create directory \"$ac_dir\"" >&2;}
+!     }; }
+  
+        rm -f $ac_file
+        mv $tmp/config.h $ac_file
+Common subdirectories: screen.orig/doc and screen-4.0.2/doc
+Common subdirectories: screen.orig/etc and screen-4.0.2/etc
+diff -c screen.orig/pty.c screen-4.0.2/pty.c
+*** screen.orig/pty.c	2003-09-08 15:26:18.000000000 +0100
+--- screen-4.0.2/pty.c	2008-04-05 18:48:27.000000000 +0100
+***************
+*** 34,42 ****
+  #endif
+  
+  /* for solaris 2.1, Unixware (SVR4.2) and possibly others */
+! #ifdef HAVE_SVR4_PTYS
+! # include <sys/stropts.h>
+! #endif
+  
+  #if defined(sun) && defined(LOCKPTY) && !defined(TIOCEXCL)
+  # include <sys/ttold.h>
+--- 34,42 ----
+  #endif
+  
+  /* for solaris 2.1, Unixware (SVR4.2) and possibly others */
+! //#ifdef HAVE_SVR4_PTYS
+! //# include <sys/stropts.h>
+! //#endif
+  
+  #if defined(sun) && defined(LOCKPTY) && !defined(TIOCEXCL)
+  # include <sys/ttold.h>
+diff -c screen.orig/sched.h screen-4.0.2/sched.h
+*** screen.orig/sched.h	2002-01-08 15:42:43.000000000 +0000
+--- screen-4.0.2/sched.h	2008-04-05 18:48:27.000000000 +0100
+***************
+*** 22,27 ****
+--- 22,32 ----
+   * $Id: sched.h,v 1.1.1.1 1993/06/16 23:51:13 jnweiger Exp $ FAU
+   */
+  
++ #ifndef __SCHED_H
++ #define __SCHED_H
++ 
++ #include <sys/time.h>
++ 
+  struct event
+  {
+    struct event *next;
+***************
+*** 41,43 ****
+--- 46,50 ----
+  #define EV_READ		1
+  #define EV_WRITE	2
+  #define EV_ALWAYS	3
++ 
++ #endif
+Common subdirectories: screen.orig/terminfo and screen-4.0.2/terminfo
+Common subdirectories: screen.orig/utf8encodings and screen-4.0.2/utf8encodings
diff --git a/package/screen/screen.mk b/package/screen/screen.mk
new file mode 100644
index 0000000..3baab7b
--- /dev/null
+++ b/package/screen/screen.mk
@@ -0,0 +1,61 @@
+#############################################################
+#
+# screen
+#
+#############################################################
+SCREEN_VERSION:=4.0.2
+SCREEN_SOURCE:=screen-$(SCREEN_VERSION).tar.gz
+SCREEN_SITE:=$(BR2_GNU_MIRROR)/screen
+SCREEN_DIR:=$(BUILD_DIR)/screen-$(SCREEN_VERSION)
+SCREEN_BINARY:=screen
+SCREEN_TARGET_BINARY:=usr/bin/screen
+
+$(DL_DIR)/$(SCREEN_SOURCE):
+	$(WGET) -P $(DL_DIR) $(SCREEN_SITE)/$(SCREEN_SOURCE)
+
+$(SCREEN_DIR)/.source: $(DL_DIR)/$(SCREEN_SOURCE)
+	$(ZCAT) $(DL_DIR)/$(SCREEN_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(SCREEN_DIR) package/screen/ screen-$(SCREEN_VERSION)\*.patch
+	$(CONFIG_UPDATE) $(SCREEN_DIR)
+	touch $@
+
+$(SCREEN_DIR)/.configured: $(SCREEN_DIR)/.source
+	(cd $(SCREEN_DIR); rm -f config.cache; echo Force autoconf; \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(TARGET_CONFIGURE_ARGS) \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--disable-socket-dir \
+		--sysconfdir=/etc; \
+	)
+	touch $@
+
+$(SCREEN_DIR)/$(SCREEN_BINARY): $(SCREEN_DIR)/.configured
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(SCREEN_DIR)
+	touch -c $@
+
+$(TARGET_DIR)/$(SCREEN_TARGET_BINARY): $(SCREEN_DIR)/$(SCREEN_BINARY)
+	cp -a $(SCREEN_DIR)/$(SCREEN_BINARY) $(TARGET_DIR)/$(SCREEN_TARGET_BINARY)
+
+screen: uclibc ncurses $(TARGET_DIR)/$(SCREEN_TARGET_BINARY)
+
+screen-source: $(DL_DIR)/$(SCREEN_SOURCE)
+
+screen-clean:
+	$(MAKE) prefix=$(TARGET_DIR)/usr -C $(SCREEN_DIR) uninstall
+	-$(MAKE) -C $(SCREEN_DIR) clean
+
+screen-dirclean:
+	rm -rf $(SCREEN_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_SCREEN)),y)
+TARGETS+=screen
+endif
-- 
1.5.4.3
