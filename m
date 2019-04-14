From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Apr 2019 23:21:35 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/tor: fix static
 build with openssl and atomic
Message-ID: <20190414212510.0AFF28A509@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bc70d3b66dc70e74378773a33e7a8840bb28087e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Update patch so -latomic (provided in LIBS) is added after openssl libs
(provided in $3)

Fixes:
 - http://autobuild.buildroot.org/results/4b90b7d02e354ebf3d8f95023547bf4a18e0165e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 73c04d9448f9172eb2174ed3c891ac2953eff6d5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tor/0001-Fix-static-linking-with-OpenSSL.patch | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/package/tor/0001-Fix-static-linking-with-OpenSSL.patch b/package/tor/0001-Fix-static-linking-with-OpenSSL.patch
index 50ea00af7a..e4cd24e138 100644
--- a/package/tor/0001-Fix-static-linking-with-OpenSSL.patch
+++ b/package/tor/0001-Fix-static-linking-with-OpenSSL.patch
@@ -15,11 +15,25 @@ Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
+ acinclude.m4         | 2 +-
  configure.ac         | 4 ++--
  src/test/include.am  | 8 ++++----
  src/tools/include.am | 4 ++--
- 3 files changed, 8 insertions(+), 8 deletions(-)
+ 4 files changed, 9 insertions(+), 9 deletions(-)
 
+diff --git a/acinclude.m4 b/acinclude.m4
+index 5ecdf1d5c..be5633f4f 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -166,7 +166,7 @@ AC_CACHE_CHECK([for $1 directory], tor_cv_library_$1_dir, [
+
+   for tor_trydir in "$try$1dir" "(system)" "$prefix" /usr/local /usr/pkg $8; do
+     LDFLAGS="$tor_saved_LDFLAGS"
+-    LIBS="$tor_saved_LIBS $3"
++    LIBS="$3 $tor_saved_LIBS"
+     CPPFLAGS="$tor_saved_CPPFLAGS"
+
+     if test -z "$tor_trydir" ; then
 diff --git a/configure.ac b/configure.ac
 index 05e1392cf..580befa6b 100644
 --- a/configure.ac
