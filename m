From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Aug 2016 17:19:39 +0200
Subject: [Buildroot] [git commit] package/sg3_utils: fix uclinux build
Message-ID: <20160816152127.94F4482114@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=59472d3ba0841b7c41a08bad0f76f2c2fe5f0682
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

sg3_utils grep for '^linux' as the host OS to decide if we are
targetting Linux.

However, on noMMU targets, the host OS can be 'uclinux' instead of just
plain 'linux', which make sg3_util confused and thus it forgets to
include some source files in the build, resulting in link failures.

Fix that by ammending the regexp that recognises Linux. We now need to
run autoreconf.

Fixes:
    http://autobuild.buildroot.org/results/79a/79a572f67bafa6a007256a5f22529c2daabd5733/
    http://autobuild.buildroot.org/results/4f7/4f7ea4bb4c4c12ceb9cd08bfb6720386f5bdea0b/

[Peter: fix typos as pointed out by Arnout]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sg3_utils/0001-support-uclinux-as-a-linux.patch | 16 ++++++++++++++++
 package/sg3_utils/sg3_utils.mk                          |  3 +++
 2 files changed, 19 insertions(+)

diff --git a/package/sg3_utils/0001-support-uclinux-as-a-linux.patch b/package/sg3_utils/0001-support-uclinux-as-a-linux.patch
new file mode 100644
index 0000000..d9106cd
--- /dev/null
+++ b/package/sg3_utils/0001-support-uclinux-as-a-linux.patch
@@ -0,0 +1,16 @@
+Recognise uclinux as a linux
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN sg3_utils-1.42.orig/configure.ac sg3_utils-1.42/configure.ac
+--- sg3_utils-1.42.orig/configure.ac	2015-10-21 01:10:59.000000000 +0200
++++ sg3_utils-1.42/configure.ac	2016-08-14 19:30:37.841766149 +0200
+@@ -71,7 +71,7 @@
+ 
+ # Define platform-specific symbol.
+ AM_CONDITIONAL(OS_FREEBSD, [echo $host_os | grep 'freebsd' > /dev/null])
+-AM_CONDITIONAL(OS_LINUX, [echo $host_os | grep '^linux' > /dev/null])
++AM_CONDITIONAL(OS_LINUX, [echo $host_os | grep -E '^(uc)?linux' > /dev/null])
+ AM_CONDITIONAL(OS_OSF, [echo $host_os | grep '^osf' > /dev/null])
+ AM_CONDITIONAL(OS_SOLARIS, [echo $host_os | grep '^solaris' > /dev/null])
+ AM_CONDITIONAL(OS_WIN32_MINGW, [echo $host_os | grep '^mingw' > /dev/null])
diff --git a/package/sg3_utils/sg3_utils.mk b/package/sg3_utils/sg3_utils.mk
index 36cb32e..e7af83a 100644
--- a/package/sg3_utils/sg3_utils.mk
+++ b/package/sg3_utils/sg3_utils.mk
@@ -14,6 +14,9 @@ SG3_UTILS_LICENSE += GPLv2+
 endif
 SG3_UTILS_LICENSE_FILES = COPYING BSD_LICENSE
 
+# Patching configure.ac
+SG3_UTILS_AUTORECONF = YES
+
 # install the libsgutils2 library
 SG3_UTILS_INSTALL_STAGING = YES
 
