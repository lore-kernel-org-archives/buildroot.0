From: Karl Krach <mailinglists@blueSpirit.la>
Date: Fri, 09 Jul 2010 16:26:57 +0200
Subject: [Buildroot] libQt3Support.so missing in image on target
Message-ID: <l5ao4x.2pwoka@webmail.variomedia.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard <jacmet@uclibc.org> schrieb:
>  Karl> Second, I run from time to time in the problem, that I
>  Karl> remove the build
>  Karl> directory on reconfigure/recompile but not the libraries
>  Karl> from the STATING_DIR
>  Karl> - this would be a tiny (but nice) feature.
> 
>  Karl> Thanks a lot,
> 
> Isn't that what the qt-clean target is for? What is the use case exactly?
>


No, the clean just cleans the build directory. But a target qt-uninstall would
be nice - it would remove all libraries, header files etc. from the
staging_dir (toolchain dir). This would be a better idea, than my previous
patch - in the case that we document it :)


--- Makefile_original	2010-07-09 16:16:48.000000000 +0200
+++ Makefile	2010-07-09 16:23:45.000000000 +0200
@@ -324,6 +324,7 @@
 
 TARGETS+=erase-fakeroots
 
+TARGETS_UNINSTALL:=$(patsubst %,%-uninstall,$(TARGETS))
 TARGETS_CLEAN:=$(patsubst %,%-clean,$(TARGETS))
 TARGETS_SOURCE:=$(patsubst %,%-source,$(TARGETS) $(BASE_TARGETS))
 TARGETS_DIRCLEAN:=$(patsubst %,%-dirclean,$(TARGETS))
@@ -346,7 +347,7 @@
 
 .PHONY: all world dirs clean distclean source \
 	$(BASE_TARGETS) $(TARGETS) $(TARGETS_ALL) \
-	$(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) \
+	$(TARGETS_UNINSTALL) $(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE)
\
 	$(DL_DIR) $(TOOLCHAIN_DIR) $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
 	$(HOST_DIR) $(BR2_DEPENDS_DIR) $(BINARIES_DIR) $(STAMP_DIR)
 
@@ -601,6 +602,8 @@
 	@echo 'Cleaning:'
 	@echo '  clean                  - delete all files created by build'
 	@echo '  distclean              - delete all non-source files (including
.config)'
+	@echo '  <package>-clean        - delete all files created by build of
<package>'
+	@echo '  <package>-uninstall    - remove installation files of <package>'
 	@echo
 	@echo 'Build:'
 	@echo '  all                    - make world'
