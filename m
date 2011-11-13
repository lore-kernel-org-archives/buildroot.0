From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 13 Nov 2011 21:32:38 +0100
Subject: [Buildroot] [git commit] crosstool-ng: add patch to use wget
	instead of curl
Message-ID: <20111113203426.F1EE48F314@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0d2a03cc5a682266e1a00c3eb312dcf089e2323d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../crosstool-ng-001-wget-instead-of-curl.patch    |   52 ++++++++++++++++++++
 1 files changed, 52 insertions(+), 0 deletions(-)

diff --git a/package/crosstool-ng/crosstool-ng-001-wget-instead-of-curl.patch b/package/crosstool-ng/crosstool-ng-001-wget-instead-of-curl.patch
new file mode 100644
index 0000000..d40f178
--- /dev/null
+++ b/package/crosstool-ng/crosstool-ng-001-wget-instead-of-curl.patch
@@ -0,0 +1,52 @@
+Use wget instead of curl
+
+While crosstool-NG did support either curl or wget in the past, it now
+only supports curl. Unfortunately, Buildroot uses wget for all its
+downloads, so wget is a hard dependency of Buildroot, while curl
+isn't.
+
+Instead of adding curl as a new Buildroot dependency, or building curl
+for the host, we simply tweak crosstool-NG to use wget instead of
+curl.
+
+The script/functions change has been provided by Yann E. Morin.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: crosstool-ng-1.13.0/configure
+===================================================================
+--- crosstool-ng-1.13.0.orig/configure
++++ crosstool-ng-1.13.0/configure
+@@ -496,7 +496,7 @@
+              ver='\(GNU libtool.*\) (2[[:digit:]]*\.|1\.6[[:digit:]]*\.|1\.5\.[2-9][[:digit:]]+)'   \
+              err="'libtoolize' 1.5.26 or above was not found"
+ has_or_abort prog=stat
+-has_or_abort prog="curl"
++has_or_abort prog="wget"
+ has_or_abort prog=patch
+ has_or_abort prog=tar
+ has_or_abort prog=gzip
+Index: crosstool-ng-1.13.0/scripts/functions
+===================================================================
+--- crosstool-ng-1.13.0.orig/scripts/functions
++++ crosstool-ng-1.13.0/scripts/functions
+@@ -456,13 +456,12 @@
+     # Some company networks have firewalls to connect to the internet, but it's
+     # not easy to detect them, so force a global ${CT_CONNECT_TIMEOUT}-second
+     # timeout.
+-    # For curl, no good progress indicator is available. So, be silent.
+-    if CT_DoExecLog ALL curl --ftp-pasv                                 \
+-                             --retry 3                                  \
+-                             --connect-timeout ${CT_CONNECT_TIMEOUT}    \
+-                             --location --fail --silent                 \
+-                             --output "${tmp}"                          \
+-                             "${url}"
++    if CT_DoExecLog ALL wget --passive-ftp --tries=3 -nc    \
++                             -T ${CT_CONNECT_TIMEOUT}       \
++                             -O "${tmp}"                    \
++                              "${url}"
++
++
+     then
+         # Success, we got it, good!
+         mv "${tmp}" "${dest}"
