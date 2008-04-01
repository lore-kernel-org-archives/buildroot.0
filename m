From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  1 Apr 2008 02:53:15 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/scripts
Message-ID: <20080401095315.649A53C3BD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-04-01 02:53:14 -0700 (Tue, 01 Apr 2008)
New Revision: 21606

Log:
setlocalversion: add git-svn support


Modified:
   trunk/buildroot/scripts/setlocalversion


Changeset:
Modified: trunk/buildroot/scripts/setlocalversion
===================================================================
--- trunk/buildroot/scripts/setlocalversion	2008-04-01 07:03:07 UTC (rev 21605)
+++ trunk/buildroot/scripts/setlocalversion	2008-04-01 09:53:14 UTC (rev 21606)
@@ -12,9 +12,14 @@
 if head=`git rev-parse --verify HEAD 2>/dev/null`; then
 	# Do we have an untagged version?
 	if git name-rev --tags HEAD | grep -E '^HEAD[[:space:]]+(.*~[0-9]*|undefined)$' > /dev/null; then
-	        git describe | awk -F- '{printf("-%05d-%s", $(NF-1),$(NF))}'
+	        git describe 2>/dev/null | awk -F- '{printf("-%05d-%s", $(NF-1),$(NF))}'
 	fi
 
+	# Is this git on svn?
+	if git config --get svn-remote.svn.url >/dev/null; then
+	        printf -- '-svn%s' "`git-svn find-rev $head`"
+	fi
+
 	# Are there uncommitted changes?
 	git update-index --refresh --unmerged > /dev/null
 	if git diff-index --name-only HEAD | grep -v "^scripts/package" \
