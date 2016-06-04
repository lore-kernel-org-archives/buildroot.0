From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  4 Jun 2016 18:30:54 +0200
Subject: [Buildroot] [PATCH 8/8 v3] core: use the print-help macro to print
	the main help
In-Reply-To: <cover.1465056706.git.yann.morin.1998@free.fr>
References: <cover.1465056706.git.yann.morin.1998@free.fr>
Message-ID: <f6bb545ede1f4e8692e031f48393991b0303f835.1465056706.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The formatting of the main help is not consistent. We have most lines
that are wrapped below 80-chars, while a few are larger than that.

Use the new print-help macro for all entries in the help text, to ensure
consistency in the formatting.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile | 109 ++++++++++++++++++++++++++++++++++++---------------------------
 1 file changed, 62 insertions(+), 47 deletions(-)

diff --git a/Makefile b/Makefile
index 3f5c3d3..2885469 100644
--- a/Makefile
+++ b/Makefile
@@ -900,68 +900,83 @@ endif
 
 help:
 	@echo 'Cleaning:'
-	@echo '  clean                  - delete all files created by build'
-	@echo '  distclean              - delete all non-source files (including .config)'
+	$(call print-help,clean,Delete all files created by build)
+	$(call print-help,distclean,Delete all non-source files (including .config))
 	@echo
 	@echo 'Build:'
-	@echo '  all                    - make world'
-	@echo '  toolchain              - build toolchain'
+	$(call print-help,all,Make world)
+	$(call print-help,toolchain,Build toolchain)
 	@echo
 	@echo 'Configuration:'
-	@echo '  menuconfig             - interactive curses-based configurator'
-	@echo '  nconfig                - interactive ncurses-based configurator'
-	@echo '  xconfig                - interactive Qt-based configurator'
-	@echo '  gconfig                - interactive GTK-based configurator'
-	@echo '  oldconfig              - resolve any unresolved symbols in .config'
-	@echo '  silentoldconfig        - Same as oldconfig, but quietly, additionally update deps'
-	@echo '  olddefconfig           - Same as silentoldconfig but sets new symbols to their default value'
-	@echo '  randconfig             - New config with random answer to all options'
-	@echo '  defconfig              - New config with default answer to all options'
-	@echo '                             BR2_DEFCONFIG, if set, is used as input'
-	@echo '  savedefconfig          - Save current config to BR2_DEFCONFIG (minimal config)'
-	@echo '  allyesconfig           - New config where all options are accepted with yes'
-	@echo '  allnoconfig            - New config where all options are answered with no'
-	@echo '  randpackageconfig      - New config with random answer to package options'
-	@echo '  allyespackageconfig    - New config where pkg options are accepted with yes'
-	@echo '  allnopackageconfig     - New config where package options are answered with no'
+	$(call print-help,menuconfig,Interactive curses-based configurator)
+	$(call print-help,nconfig,Interactive ncurses-based configurator)
+	$(call print-help,xconfig,Interactive Qt-based configurator)
+	$(call print-help,gconfig,Interactive GTK-based configurator)
+	$(call print-help,oldconfig,Resolve any unresolved symbols in .config)
+	$(call print-help,silentoldconfig,Same as oldconfig but quiet)
+	$(call print-help,olddefconfig, \
+		Same as silentoldconfig but sets new \
+		symbols to their default value)
+	$(call print-help,randconfig, \
+		New config with random answer to all options)
+	$(call print-help,defconfig, \
+		New config with default answer to all options; \
+		BR2_DEFCONFIG if set is used as input)
+	$(call print-help,savedefconfig, \
+		Save current config to BR2_DEFCONFIG (minimal config))
+	$(call print-help,allyesconfig, \
+		New config where all options are accepted with yes)
+	$(call print-help,allnoconfig, \
+		New config where all options are answered with no)
+	$(call print-help,randpackageconfig, \
+		New config with random answer to package options)
+	$(call print-help,allyespackageconfig, \
+		New config where pkg options are accepted with yes)
+	$(call print-help,allnopackageconfig, \
+		New config where pkg options are answered with no)
 	@echo
 	@echo 'Package-specific:'
-	@echo '  <pkg>                  - Build and install <pkg> and all its dependencies'
-	@echo '  <pkg>-source           - Only download the source files for <pkg>'
-	@echo '  <pkg>-extract          - Extract <pkg> sources'
-	@echo '  <pkg>-patch            - Apply patches to <pkg>'
-	@echo '  <pkg>-depends          - Build <pkg>'\''s dependencies'
-	@echo '  <pkg>-configure        - Build <pkg> up to the configure step'
-	@echo '  <pkg>-build            - Build <pkg> up to the build step'
-	@echo '  <pkg>-graph-depends    - Generate a graph of <pkg>'\''s dependencies'
-	@echo '  <pkg>-dirclean         - Remove <pkg> build directory'
-	@echo '  <pkg>-reconfigure      - Restart the build from the configure step'
-	@echo '  <pkg>-rebuild          - Restart the build from the build step'
+	$(call print-help,<pkg>,Build and install <pkg> and all its dependencies)
+	$(call print-help,<pkg>-source,Only download the source files for <pkg>)
+	$(call print-help,<pkg>-extract,Extract <pkg> sources)
+	$(call print-help,<pkg>-patch,Apply patches to <pkg>)
+	$(call print-help,<pkg>-depends,Build the dependencies of <pkg>)
+	$(call print-help,<pkg>-configure,Build <pkg> up to the configure step)
+	$(call print-help,<pkg>-build,Build <pkg> up to the build step)
+	$(call print-help,<pkg>-graph-depends,Generate a dependency graph of <pkg>)
+	$(call print-help,<pkg>-dirclean,Remove the build directory for <pkg>)
+	$(call print-help,<pkg>-reconfigure,Restart the build from the configure step)
+	$(call print-help,<pkg>-rebuild,Restart the build from the build step)
 	$(foreach p,$(HELP_PACKAGES), \
 		@echo $(sep) \
 		@echo '$($(p)_NAME):' $(sep) \
 		$($(p)_HELP_CMDS)$(sep))
 	@echo
 	@echo 'Documentation:'
-	@echo '  manual                 - build manual in all formats'
-	@echo '  manual-html            - build manual in HTML'
-	@echo '  manual-split-html      - build manual in split HTML'
-	@echo '  manual-pdf             - build manual in PDF'
-	@echo '  manual-text            - build manual in text'
-	@echo '  manual-epub            - build manual in ePub'
-	@echo '  graph-build            - generate graphs of the build times'
-	@echo '  graph-depends          - generate graph of the dependency tree'
-	@echo '  graph-size             - generate stats of the filesystem size'
-	@echo '  list-defconfigs        - list all defconfigs (pre-configured minimal systems)'
+	$(call print-help,manual,Build manual in all formats)
+	$(call print-help,manual-html,Build manual in HTML)
+	$(call print-help,manual-split-html,Build manual in split HTML)
+	$(call print-help,manual-pdf,Build manual in PDF)
+	$(call print-help,manual-text,Build manual in text)
+	$(call print-help,manual-epub,Build manual in ePub)
+	$(call print-help,graph-build,Generate graphs of the build times)
+	$(call print-help,graph-depends,Generate graph of the dependency tree)
+	$(call print-help,graph-size,Generate stats of the filesystem size)
+	$(call print-help,list-defconfigs, \
+		List all defconfigs (pre-configured minimal systems))
 	@echo
 	@echo 'Miscellaneous:'
-	@echo '  source                 - download all sources needed for offline-build'
-	@echo '  source-check           - check selected packages for valid download URLs'
-	@echo '  external-deps          - list external packages used'
-	@echo '  legal-info             - generate info about license compliance'
+	$(call print-help,source, \
+		Download all sources needed for offline-build)
+	$(call print-help,source-check, \
+		Check selected packages for valid download URLs)
+	$(call print-help,external-deps,List external packages used)
+	$(call print-help,legal-info,Generate info about license compliance)
 	@echo
-	@echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
-	@echo '  make O=dir             - Locate all output files in "dir", including .config'
+	$(call print-help,make V=0|1, \
+		0 => quiet build (default); 1 => verbose build)
+	$(call print-help,make O=dir, \
+		Locate all output files in 'dir' (including .config))
 	@echo
 	@echo 'For further details, see README, generate the Buildroot manual, or consult'
 	@echo 'it on-line at http://buildroot.org/docs.html'
-- 
2.7.4
