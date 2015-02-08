From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 8 Feb 2015 22:19:45 +0100
Subject: [Buildroot] [git commit] libselinux: add patch to fix Blackfin
	build issue
Message-ID: <20150208212304.75942805FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5a9dcd09f6436af125277f57c6c55d9a63d2f35c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/165/165a227a0a8ecd4cb3f96761aacdf90ae974fea7/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-workaround-blackfin-issue.patch           |   24 ++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)

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
