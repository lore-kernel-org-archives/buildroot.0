From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Jun 2012 12:14:56 +0200
Subject: [Buildroot] [PATCH] dependencies: ensure that DESTDIR isn't set
	when running Buildroot
Message-ID: <1340964896-12899-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Having DESTDIR set in the environment before running Buildroot creates
some funky problems in the build process. Prevent users from running
into this kind of troubles.

Cc: Michael Opdenacker <michael.opdenacker@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/dependencies/dependencies.sh |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index c47ffcf..43ec3cc 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -48,6 +48,12 @@ if test -n "$PERL_MM_OPT" ; then
     exit 1
 fi
 
+if test -n "$DESTDIR" ; then
+    /bin/echo -e "\nYou have the DESTDIR environment variable set. Please"
+    /bin/echo -e "unset it so that Buildroot can work properly."
+    exit 1
+fi
+
 # Verify that which is installed
 if ! which which > /dev/null ; then
 	/bin/echo -e "\nYou must install 'which' on your build machine\n";
-- 
1.7.9.5
