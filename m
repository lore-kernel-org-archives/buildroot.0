From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 5 Jan 2013 22:51:30 +0100
Subject: [Buildroot] [git commit] xorg-release: ignore some X.org packages
Message-ID: <20130105215230.B80659A5BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d7dde090f4a9b20ae25cf3743d364f24bc8f1c9f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following Gustavo's removal of two X.org drivers for old hardware
unlikely to be used in embedded contexts, the xorg-release script now
reports those two X.org packages as "to be added": they exist in
X.org, but not in Buildroot.

So, we add a small list, XORG_EXCEPTIONS, in our xorg-release script,
to list the X.org packages we don't want to hear about. Of course,
packages that exist in X.org, and that are not part of this exception
list, and are not packaged in Buildroot are still listed as "to be
added".

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/scripts/xorg-release |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/support/scripts/xorg-release b/support/scripts/xorg-release
index 8055658..70ba41c 100755
--- a/support/scripts/xorg-release
+++ b/support/scripts/xorg-release
@@ -18,6 +18,14 @@ XORG_VERSION_KEY = "xorg-version"
 BR_VERSION_KEY = "br-version"
 BR_NAME_KEY = "br-name"
 
+# Packages part of X.org releases that we do not want to package in
+# Buildroot (old drivers for hardware unlikely to be used in embedded
+# contexts).
+XORG_EXCEPTIONS = [
+    'xf86-video-suncg6',
+    'xf86-video-sunffb',
+]
+
 # Get the list of tarballs of a X.org release, parse it, and return a
 # dictionary of dictionaries, of the form:
 #
@@ -43,6 +51,9 @@ def get_xorg_release_pkgs():
             continue
         name = groups.group(1)
         version = groups.group(2)
+        # Skip packages we don't want to hear about
+        if name in XORG_EXCEPTIONS:
+            continue
         packages[name] = { XORG_VERSION_KEY : version }
     return packages
 
