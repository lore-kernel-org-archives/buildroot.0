From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 14 Feb 2015 16:10:57 +0100
Subject: [Buildroot] [PATCH 2/2] package/libsemanage: add patch to fix
	Blackfin build issue
In-Reply-To: <1423926657-12882-1-git-send-email-romain.naour@openwide.fr>
References: <1423926657-12882-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1423926657-12882-2-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libsemanage use the same build system than libselinux,
so it's affected by the same issue.

Fixes:
http://autobuild.buildroot.net/results/39d/39d3460e88a1316ec7dbcd0d67b7fdb992c3fc77

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 .../0002-workaround-blackfin-issue.patch           | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 package/libsemanage/0002-workaround-blackfin-issue.patch

diff --git a/package/libsemanage/0002-workaround-blackfin-issue.patch b/package/libsemanage/0002-workaround-blackfin-issue.patch
new file mode 100644
index 0000000..5d00c69
--- /dev/null
+++ b/package/libsemanage/0002-workaround-blackfin-issue.patch
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
1.9.3
