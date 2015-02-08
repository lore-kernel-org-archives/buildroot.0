From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  8 Feb 2015 22:02:03 +0100
Subject: [Buildroot] [PATCH] libselinux: add patch to fix Blackfin build
	issue
Message-ID: <1423429323-17675-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  http://autobuild.buildroot.org/results/165/165a227a0a8ecd4cb3f96761aacdf90ae974fea7/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-workaround-blackfin-issue.patch           | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 package/libselinux/0001-workaround-blackfin-issue.patch

diff --git a/package/libselinux/0001-workaround-blackfin-issue.patch b/package/libselinux/0001-workaround-blackfin-issue.patch
new file mode 100644
index 0000000..5d00c69
--- /dev/null
+++ b/package/libselinux/0001-workaround-blackfin-issue.patch
@@ -0,0 +1,24 @@
+Do not make symbols hidden on Blackfin
+
+The libselinux logic to hide internal symbols from the DSO doesn't
+work properly on Blackfin due to the USER_LABEL_PREFIX not being
+handled properly. A real fix is not that simple, so this patch simply
+disables the internal symbol hiding mechanism. This means that those
+symbols are visible in the final DSO, which is not a problem for
+proper execution, it just isn't as clean.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/src/dso.h
+===================================================================
+--- a/src/dso.h
++++ b/src/dso.h
+@@ -1,7 +1,7 @@
+ #ifndef _SELINUX_DSO_H
+ #define _SELINUX_DSO_H	1
+ 
+-#ifdef SHARED
++#if defined(SHARED) && !defined(__bfin__)
+ # define hidden __attribute__ ((visibility ("hidden")))
+ # define hidden_proto(fct) __hidden_proto (fct, fct##_internal)
+ # define __hidden_proto(fct, internal)	\
-- 
2.1.0
