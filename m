From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 31 Mar 2008 12:50:05 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: project scripts
Message-ID: <20080331195005.C0B1B3C488@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-31 12:50:05 -0700 (Mon, 31 Mar 2008)
New Revision: 21600

Log:
buildroot: add /etc/br-version with version info to target dir


Added:
   trunk/buildroot/scripts/setlocalversion

Modified:
   trunk/buildroot/project/project.mk


Changeset:
Modified: trunk/buildroot/project/project.mk
===================================================================
--- trunk/buildroot/project/project.mk	2008-03-31 19:43:50 UTC (rev 21599)
+++ trunk/buildroot/project/project.mk	2008-03-31 19:50:05 UTC (rev 21600)
@@ -3,18 +3,22 @@
 
 .PHONY: target-host-info saveconfig getconfig
 
-target-host-info: $(TARGET_DIR)/etc/issue $(TARGET_DIR)/etc/hostname
+target-host-info: $(TARGET_DIR)/etc/issue $(TARGET_DIR)/etc/hostname $(TARGET_DIR)/etc/br-version
 
 $(TARGET_DIR)/etc/issue: .config
 	mkdir -p $(TARGET_DIR)/etc
-	echo "" > $(TARGET_DIR)/etc/issue
-	echo "" >> $(TARGET_DIR)/etc/issue
-	echo "$(BANNER)" >> $(TARGET_DIR)/etc/issue
+	echo "" > $@
+	echo "" >> $@
+	echo "$(BANNER)" >> $@
 
 $(TARGET_DIR)/etc/hostname: .config
 	mkdir -p $(TARGET_DIR)/etc
-	echo "$(TARGET_HOSTNAME)" > $(TARGET_DIR)/etc/hostname
+	echo "$(TARGET_HOSTNAME)" > $@
 
+$(TARGET_DIR)/etc/br-version: .config
+	mkdir -p $(TARGET_DIR)/etc
+	echo $(BR2_VERSION)$(shell $(TOPDIR)/scripts/setlocalversion) >$@
+
 saveconfig: $(CONFIG)/conf
 	mkdir -p $(LOCAL)/$(PROJECT)
 	-cp .config $(PROJECT_FILE)

Added: trunk/buildroot/scripts/setlocalversion
===================================================================
--- trunk/buildroot/scripts/setlocalversion	                        (rev 0)
+++ trunk/buildroot/scripts/setlocalversion	2008-03-31 19:50:05 UTC (rev 21600)
@@ -0,0 +1,63 @@
+#!/bin/sh
+# Print additional version information for non-release trees.
+
+usage() {
+	echo "Usage: $0 [srctree]" >&2
+	exit 1
+}
+
+cd "${1:-.}" || usage
+
+# Check for git and a git repo.
+if head=`git rev-parse --verify HEAD 2>/dev/null`; then
+	# Do we have an untagged version?
+	if git name-rev --tags HEAD | grep -E '^HEAD[[:space:]]+(.*~[0-9]*|undefined)$' > /dev/null; then
+	        git describe | awk -F- '{printf("-%05d-%s", $(NF-1),$(NF))}'
+	fi
+
+	# Are there uncommitted changes?
+	git update-index --refresh --unmerged > /dev/null
+	if git diff-index --name-only HEAD | grep -v "^scripts/package" \
+	    | read dummy; then
+		printf '%s' -dirty
+	fi
+
+	# All done with git
+	exit
+fi
+
+# Check for mercurial and a mercurial repo.
+if hgid=`hg id 2>/dev/null`; then
+	tag=`printf '%s' "$hgid" | cut -d' ' -f2`
+
+	# Do we have an untagged version?
+	if [ -z "$tag" -o "$tag" = tip ]; then
+		id=`printf '%s' "$hgid" | sed 's/[+ ].*//'`
+		printf '%s%s' -hg "$id"
+	fi
+
+	# Are there uncommitted changes?
+	# These are represented by + after the changeset id.
+	case "$hgid" in
+		*+|*+\ *) printf '%s' -dirty ;;
+	esac
+
+	# All done with mercurial
+	exit
+fi
+
+# Check for svn and a svn repo.
+if rev=`svn info 2>/dev/null | grep '^Revision'`; then
+	rev=`echo $rev | awk '{print $NF}'`
+	changes=`svn status 2>/dev/null | grep '^[AMD]' | wc -l`
+
+	# Are there uncommitted changes?
+	if [ $changes != 0 ]; then
+		printf -- '-svn%s%s%s' "$rev" -dirty "$changes"
+	else
+		printf -- '-svn%s' "$rev"
+	fi
+
+	# All done with svn
+	exit
+fi


Property changes on: trunk/buildroot/scripts/setlocalversion
___________________________________________________________________
Name: svn:executable
   + *
