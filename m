From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 22:04:48 +0100
Subject: [Buildroot] [git commit] package/libsepol: add patch to fix
	Blackfin build issue
Message-ID: <20150214211139.2B11A8044E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=aa476ab32cfb2dc0ba3621d78cdb6971a9f86753
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libsepol use the same build system than libselinux,
so it's affected by the same issue.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../libsepol/0002-workaround-blackfin-issue.patch  |   24 ++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/package/libsepol/0002-workaround-blackfin-issue.patch b/package/libsepol/0002-workaround-blackfin-issue.patch
new file mode 100644
index 0000000..5d00c69
--- /dev/null
+++ b/package/libsepol/0002-workaround-blackfin-issue.patch
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
