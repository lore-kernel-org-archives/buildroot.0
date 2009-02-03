From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  3 Feb 2009 16:24:13 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/scripts
Message-ID: <20090203162414.08B4976272@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-03 16:24:13 +0000 (Tue, 03 Feb 2009)
New Revision: 25228

Log:
setlocalversion: sync with HEAD of kernel git

Outputs correct svn revision (latest change, not repo version).

Modified:
   trunk/buildroot/scripts/setlocalversion


Changeset:
Modified: trunk/buildroot/scripts/setlocalversion
===================================================================
--- trunk/buildroot/scripts/setlocalversion	2009-02-03 14:30:44 UTC (rev 25227)
+++ trunk/buildroot/scripts/setlocalversion	2009-02-03 16:24:13 UTC (rev 25228)
@@ -9,15 +9,19 @@
 cd "${1:-.}" || usage
 
 # Check for git and a git repo.
-if head=`git rev-parse --verify HEAD 2>/dev/null`; then
+if head=`git rev-parse --verify --short HEAD 2>/dev/null`; then
 	# Do we have an untagged version?
 	if git name-rev --tags HEAD | grep -E '^HEAD[[:space:]]+(.*~[0-9]*|undefined)$' > /dev/null; then
-	        git describe 2>/dev/null | awk -F- '{printf("-%05d-%s", $(NF-1),$(NF))}'
+		if tag=`git describe 2>/dev/null`; then
+			echo $tag | awk -F- '{printf("-%05d-%s", $(NF-1),$(NF))}'
+		else
+			printf '%s%s' -g $head
+		fi
 	fi
 
 	# Is this git on svn?
 	if git config --get svn-remote.svn.url >/dev/null; then
-	        printf -- '-svn%s' "`git svn find-rev $head`"
+	        printf -- '-svn%s' "`git-svn find-rev $head`"
 	fi
 
 	# Are there uncommitted changes?
@@ -52,13 +56,13 @@
 fi
 
 # Check for svn and a svn repo.
-if rev=`svn info 2>/dev/null | grep '^Revision'`; then
+if rev=`svn info 2>/dev/null | grep '^Last Changed Rev'`; then
 	rev=`echo $rev | awk '{print $NF}'`
 	changes=`svn status 2>/dev/null | grep '^[AMD]' | wc -l`
 
 	# Are there uncommitted changes?
 	if [ $changes != 0 ]; then
-		printf -- '-svn%s%s%s' "$rev" -dirty "$changes"
+		printf -- '-svn%s%s' "$rev" -dirty
 	else
 		printf -- '-svn%s' "$rev"
 	fi
