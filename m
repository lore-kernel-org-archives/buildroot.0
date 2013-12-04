From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  4 Dec 2013 14:37:27 -0300
Subject: [Buildroot] [PATCH] wireshark: fix wrong CFLAGS_FOR_BUILD assumption
Message-ID: <1386178647-26959-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tested valid CFLAGS can't be pushed into CFLAGS_FOR_BUILD, they're
different compilers.

Fixes:
http://autobuild.buildroot.net/results/2b1/2b1a0654b649618422d65edf370b82476ba84491/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...001-fix-wrong-cflags-for-build-assumption.patch | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/wireshark/wireshark-0001-fix-wrong-cflags-for-build-assumption.patch

diff --git a/package/wireshark/wireshark-0001-fix-wrong-cflags-for-build-assumption.patch b/package/wireshark/wireshark-0001-fix-wrong-cflags-for-build-assumption.patch
new file mode 100644
index 0000000..de30c81
--- /dev/null
+++ b/package/wireshark/wireshark-0001-fix-wrong-cflags-for-build-assumption.patch
@@ -0,0 +1,40 @@
+AC_WIRESHARK_GCC_CFLAGS_CHECK checks for valid CFLAGS against CC and pushes
+them into CFLAGS and CFLAGS_FOR_BUILD.
+This is wrong since CC_FOR_BUILD might be wildly different and older than CC
+leading to build errors.
+
+Upstream status: reported in tracker
+https://bugs.wireshark.org/bugzilla/show_bug.cgi?id=9507
+
+Patch status: Interim to fix:
+http://autobuild.buildroot.net/results/2b1/2b1a0654b649618422d65edf370b82476ba84491/
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura wireshark-1.10.3.orig/acinclude.m4 wireshark-1.10.3/acinclude.m4
+--- wireshark-1.10.3.orig/acinclude.m4	2013-12-04 14:06:44.986074426 -0300
++++ wireshark-1.10.3/acinclude.m4	2013-12-04 14:25:36.496356791 -0300
+@@ -1664,11 +1664,6 @@
+                             # the saved value plus just the new option.
+                             #
+                             CFLAGS="$CFLAGS_saved $GCC_OPTION"
+-                            #
+-                            # Add it to the flags we use when building
+-                            # build tools.
+-                            #
+-                            CFLAGS_FOR_BUILD="$CFLAGS_FOR_BUILD $GCC_OPTION"
+                             if test "$2" != C ; then
+                               #
+                               # Add it to the C++ flags as well.
+@@ -1687,11 +1682,6 @@
+                         # the saved value plus just the new option.
+                         #
+                         CFLAGS="$CFLAGS_saved $GCC_OPTION"
+-                        #
+-                        # Add it to the flags we use when building
+-                        # build tools.
+-                        #
+-                        CFLAGS_FOR_BUILD="$CFLAGS_FOR_BUILD $GCC_OPTION"
+                         if test "$2" != C ; then
+                           #
+                           # Add it to the C++ flags as well.
-- 
1.8.3.2
