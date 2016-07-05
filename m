From: Joel Stanley <joel@jms.id.au>
Date: Tue,  5 Jul 2016 21:57:25 +0930
Subject: [Buildroot] [PATCH] binutils: Fix 2.26 build failures if makeinfo
	is missing
Message-ID: <1467721645-19613-1-git-send-email-joel@jms.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch was introduced for the ARC toolchain in caf515e25e699eb. From
that commit message:

    Build failed when "makeinfo" was missing on the build host.
    This was happening because "makeinfo" is required to build .info targets
    and make exited with error. The issue hadn't appeared before as there was
    prebuilt documentation in ARC binutils tarballs, so no attempts had been
    made to build docs.

    Missing "makeinfo" only stops us from building docs
    ("missing" script already throws a warning on that regard).
    Let's continue to build other targets.

    Now exit code of the script called "missing" is checked.
    The value 127 means that "makeinfo" is not available on the build host.

    So when such value occurs, 0 is returned to the top level makefile.
    Documentation is not being built but further build of binutils continues.

This was first discovered when building the OpenPower firmware:

 https://github.com/open-power/op-build/issues/507#issuecomment-230390711

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 ...t-build-failures-when-makeinfo-is-missing.patch | 159 +++++++++++++++++++++
 1 file changed, 159 insertions(+)
 create mode 100644 package/binutils/2.26.1/0800-Docs-Prevent-build-failures-when-makeinfo-is-missing.patch

diff --git a/package/binutils/2.26.1/0800-Docs-Prevent-build-failures-when-makeinfo-is-missing.patch b/package/binutils/2.26.1/0800-Docs-Prevent-build-failures-when-makeinfo-is-missing.patch
new file mode 100644
index 000000000000..3f072decaafb
--- /dev/null
+++ b/package/binutils/2.26.1/0800-Docs-Prevent-build-failures-when-makeinfo-is-missing.patch
@@ -0,0 +1,159 @@
+From 5bd39e24e4903e49a0c301de4013c6b720862da1 Mon Sep 17 00:00:00 2001
+From: Zakharov Vlad <vzakhar@synopsys.com>
+Date: Fri, 3 Jun 2016 21:33:43 +0300
+Subject: [PATCH] Docs: Prevent build failures when "makeinfo" is missing
+
+Build failed when "makeinfo" was missing on the build host.
+This was happenning because "makeinfo" is required to build .info targets
+and make exited with error. But missing "makeinfo" only stops us from
+building docs ("missing" script already throws a warning on that regard).
+Let's continue to build other targets.
+
+Now exit code of the script called "missing" is checked.
+The value 127 means that "makeinfo" is not available on the build host.
+
+So when such value occurs 0 is returned to the top level makefile.
+Documentation is not being built but further build of binutils continues.
+
+Signed-off-by: Zakharov Vlad <vzakhar@synopsys.com>
+---
+ bfd/doc/Makefile.in      | 8 +++++++-
+ binutils/doc/Makefile.in | 8 +++++++-
+ gas/doc/Makefile.in      | 8 +++++++-
+ gprof/Makefile.in        | 8 +++++++-
+ ld/Makefile.in           | 8 +++++++-
+ 5 files changed, 35 insertions(+), 5 deletions(-)
+
+diff --git a/bfd/doc/Makefile.in b/bfd/doc/Makefile.in
+index be737f6..6c1eaf7 100644
+--- a/bfd/doc/Makefile.in
++++ b/bfd/doc/Makefile.in
+@@ -468,6 +468,8 @@ mostlyclean-libtool:
+ clean-libtool:
+ 	-rm -rf .libs _libs
+ 
++# Exit code 127 means that "makeinfo" is missing. So let's skip .info target
++# but return 0 to top level Makefile to build all other targets.
+ bfd.info: bfd.texinfo $(bfd_TEXINFOS)
+ 	restore=: && backupdir="$(am__leading_dot)am$$$$" && \
+ 	rm -rf $$backupdir && mkdir $$backupdir && \
+@@ -481,7 +483,11 @@ bfd.info: bfd.texinfo $(bfd_TEXINFOS)
+ 	then \
+ 	  rc=0; \
+ 	else \
+-	  rc=$$?; \
++	  if test $$? -eq 127; then \
++		rc=0; \
++	  else \
++	  	rc=$$?; \
++	  fi; \
+ 	  $$restore $$backupdir/* `echo "./$@" | sed 's|[^/]*$$||'`; \
+ 	fi; \
+ 	rm -rf $$backupdir; exit $$rc
+diff --git a/binutils/doc/Makefile.in b/binutils/doc/Makefile.in
+index ea3f938..8ed7884 100644
+--- a/binutils/doc/Makefile.in
++++ b/binutils/doc/Makefile.in
+@@ -397,6 +397,8 @@ mostlyclean-libtool:
+ clean-libtool:
+ 	-rm -rf .libs _libs
+ 
++# Exit code 127 means that "makeinfo" is missing. So let's skip .info target
++# but return 0 to top level Makefile to build all other targets.
+ binutils.info: binutils.texi 
+ 	restore=: && backupdir="$(am__leading_dot)am$$$$" && \
+ 	rm -rf $$backupdir && mkdir $$backupdir && \
+@@ -410,7 +412,11 @@ binutils.info: binutils.texi
+ 	then \
+ 	  rc=0; \
+ 	else \
+-	  rc=$$?; \
++	  if test $$? -eq 127; then \
++		rc=0; \
++	  else \
++		rc=$$?; \
++	  fi; \
+ 	  $$restore $$backupdir/* `echo "./$@" | sed 's|[^/]*$$||'`; \
+ 	fi; \
+ 	rm -rf $$backupdir; exit $$rc
+diff --git a/gas/doc/Makefile.in b/gas/doc/Makefile.in
+index 9ca5e8e..3159bc3 100644
+--- a/gas/doc/Makefile.in
++++ b/gas/doc/Makefile.in
+@@ -425,6 +425,8 @@ mostlyclean-libtool:
+ clean-libtool:
+ 	-rm -rf .libs _libs
+ 
++# Exit code 127 means that "makeinfo" is missing. So let's skip .info target
++# but return 0 to top level Makefile to build all other targets.
+ as.info: as.texinfo $(as_TEXINFOS)
+ 	restore=: && backupdir="$(am__leading_dot)am$$$$" && \
+ 	rm -rf $$backupdir && mkdir $$backupdir && \
+@@ -438,7 +440,11 @@ as.info: as.texinfo $(as_TEXINFOS)
+ 	then \
+ 	  rc=0; \
+ 	else \
+-	  rc=$$?; \
++	  if test $$? -eq 127; then \
++		rc=0; \
++	  else \
++	    rc=$$?; \
++	  fi; \
+ 	  $$restore $$backupdir/* `echo "./$@" | sed 's|[^/]*$$||'`; \
+ 	fi; \
+ 	rm -rf $$backupdir; exit $$rc
+diff --git a/gprof/Makefile.in b/gprof/Makefile.in
+index 67e85cd..c4040eb 100644
+--- a/gprof/Makefile.in
++++ b/gprof/Makefile.in
+@@ -538,6 +538,8 @@ clean-libtool:
+ distclean-libtool:
+ 	-rm -f libtool config.lt
+ 
++# Exit code 127 means that "makeinfo" is missing. So let's skip .info target
++# but return 0 to top level Makefile to build all other targets.
+ gprof.info: gprof.texi $(gprof_TEXINFOS)
+ 	restore=: && backupdir="$(am__leading_dot)am$$$$" && \
+ 	rm -rf $$backupdir && mkdir $$backupdir && \
+@@ -551,7 +553,11 @@ gprof.info: gprof.texi $(gprof_TEXINFOS)
+ 	then \
+ 	  rc=0; \
+ 	else \
+-	  rc=$$?; \
++	  if test $$? -eq 127; then \
++		rc=0; \
++	  else \
++		rc=$$?; \
++	  fi; \
+ 	  $$restore $$backupdir/* `echo "./$@" | sed 's|[^/]*$$||'`; \
+ 	fi; \
+ 	rm -rf $$backupdir; exit $$rc
+diff --git a/ld/Makefile.in b/ld/Makefile.in
+index 7c78198..08950a8 100644
+--- a/ld/Makefile.in
++++ b/ld/Makefile.in
+@@ -1591,6 +1591,8 @@ clean-libtool:
+ distclean-libtool:
+ 	-rm -f libtool config.lt
+ 
++# Exit code 127 means that "makeinfo" is missing. So let's skip .info target
++# but return 0 to top level Makefile to build all other targets.
+ ld.info: ld.texinfo $(ld_TEXINFOS)
+ 	restore=: && backupdir="$(am__leading_dot)am$$$$" && \
+ 	rm -rf $$backupdir && mkdir $$backupdir && \
+@@ -1604,7 +1606,11 @@ ld.info: ld.texinfo $(ld_TEXINFOS)
+ 	then \
+ 	  rc=0; \
+ 	else \
+-	  rc=$$?; \
++	  if test $$? -eq 127; then \
++		rc=0; \
++	  else \
++		rc=$$?; \
++	  fi; \
+ 	  $$restore $$backupdir/* `echo "./$@" | sed 's|[^/]*$$||'`; \
+ 	fi; \
+ 	rm -rf $$backupdir; exit $$rc
+-- 
+2.5.5
+
-- 
2.8.1
