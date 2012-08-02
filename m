From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:51 -0000
Subject: [Buildroot] [git commit branch/next] dependencies: ensure that
	DESTDIR isn't set when running Buildroot
Message-ID: <20120802195247.3C3618C999@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9910eba33adb2b783b0df5d90a857816e82fbd55
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Having DESTDIR set in the environment before running Buildroot creates
some funky problems in the build process. Prevent users from running
into this kind of troubles.

Cc: Michael Opdenacker <michael.opdenacker@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/dependencies/dependencies.sh |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

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
