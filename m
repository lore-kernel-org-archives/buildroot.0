From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Mar 2013 13:51:21 +0100
Subject: [Buildroot] [git commit] dependencies: remove a few useless
	mandatory dependencies
Message-ID: <20130324130052.815959B258@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d8f9237553e4f839de32eb5e82805017fc758cd9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

awk, bison, flex, makeinfo, gettext should be built as dependencies of
packages when needed. In practice, even the toolchain build doesn't
need any of these, and only a few packages do require them.

It is not needed to list gzip and bzip2 since they are already checked
through ${DL_TOOLS}: whenever a package needs gzip or bzip2 for its
extraction, the dependency is added.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/prerequisite.txt         |    5 -----
 support/dependencies/dependencies.sh |    8 ++------
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
index 5a9d049..9d36402 100644
--- a/docs/manual/prerequisite.txt
+++ b/docs/manual/prerequisite.txt
@@ -30,10 +30,6 @@ Mandatory packages
 ** +gcc+ (version 2.95 or any later)
 ** `g++` (version 2.95 or any later)
 ** +bash+
-** +gawk+
-** +bison+
-** +flex+
-** +gettext+
 ** +patch+
 ** +gzip+
 ** +bzip2+
@@ -43,7 +39,6 @@ Mandatory packages
 ** +python+ (version 2.6 or 2.7)
 ** +unzip+
 ** +rsync+
-** +texinfo+ (required for internal Buildroot toolchain backend)
 
 * Source fetching tools:
 ** +wget+
diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index acba57c..cd3c839 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -131,14 +131,10 @@ if ! $SHELL --version 2>&1 | grep -q '^GNU bash'; then
 fi;
 
 # Check that a few mandatory programs are installed
-for prog in awk bison flex msgfmt makeinfo patch gzip bzip2 perl tar wget cpio python unzip rsync ${DL_TOOLS} ; do
+for prog in patch perl tar wget cpio python unzip rsync ${DL_TOOLS} ; do
     if ! which $prog > /dev/null ; then
 	/bin/echo -e "\nYou must install '$prog' on your build machine";
-	if test $prog = "makeinfo" ; then
-	    /bin/echo -e "makeinfo is usually part of the texinfo package in your distribution\n"
-	elif test $prog = "msgfmt" ; then
-	    /bin/echo -e "msgfmt is usually part of the gettext package in your distribution\n"
-	elif test $prog = "svn" ; then
+	if test $prog = "svn" ; then
 	    /bin/echo -e "svn is usually part of the subversion package in your distribution\n"
 	else
 	    /bin/echo -e "\n"
