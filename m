From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 11 May 2013 21:13:38 +0200
Subject: [Buildroot] [git commit] Disable building of cups driver in
	host-gutenprint
Message-ID: <20130511192253.9C09F9A094@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e074805b5c1c96788e001869936d8fcc8b9b9edb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This should fix http://autobuild.buildroot.org/results/d2e386b50744aeda7257a0b78aafe90ba4da697c/
Because there is no host-cups package, host-gutenprint cant build the
host-cups drivers - missing includes and libs.  Host gutenprint only
built to get the xml. Thus not a loss.

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gutenprint/gutenprint.mk |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/package/gutenprint/gutenprint.mk b/package/gutenprint/gutenprint.mk
index 0463771..a598ea9 100644
--- a/package/gutenprint/gutenprint.mk
+++ b/package/gutenprint/gutenprint.mk
@@ -41,6 +41,13 @@ HOST_GUTENPRINT_DEPENDENCIES =
 # The host-gutenprint shall create the required header
 HOST_GUTENPRINT_MAKE_ENV =
 
+# Even with --without-cups, gutenprint will still add the output of
+# cups-config --cflags / --ldflags to it's compiler/linker flags if
+# available on host.
+# Notice: Because of the configure logic, it needs to be set to the
+# empty string to to disable this, not just to /bin/false like elsewhere.
+HOST_GUTENPRINT_CONF_ENV = ac_cv_path_CUPS_CONFIG=''
+
 HOST_GUTENPRINT_CONF_OPT = --disable-libgutenprintui2 \
                            --disable-samples \
                            --without-gimp2 \
@@ -51,7 +58,8 @@ HOST_GUTENPRINT_CONF_OPT = --disable-libgutenprintui2 \
                            --without-foomatic3 \
                            --disable-escputil \
                            --disable-test \
-                           --disable-testpattern
+                           --disable-testpattern \
+                           --without-cups
 
 # Needed by autoreconf
 define GUTENPRINT_CREATE_M4_DIR
