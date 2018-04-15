From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Apr 2018 22:05:41 +0200
Subject: [Buildroot] [git commit] libsemanage: remove Blackfin patch
Message-ID: <20180415200630.282218831B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5d18727bdcccc05a013bc35a8c413df4e1c2797e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And renumber the remaining patch.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...uild-follow-standard-semantics-for-DESTD.patch} |  0
 .../0001-workaround-blackfin-issue.patch           | 25 ----------------------
 2 files changed, 25 deletions(-)

diff --git a/package/libsemanage/0002-libsemanage-build-follow-standard-semantics-for-DESTD.patch b/package/libsemanage/0001-libsemanage-build-follow-standard-semantics-for-DESTD.patch
similarity index 100%
rename from package/libsemanage/0002-libsemanage-build-follow-standard-semantics-for-DESTD.patch
rename to package/libsemanage/0001-libsemanage-build-follow-standard-semantics-for-DESTD.patch
diff --git a/package/libsemanage/0001-workaround-blackfin-issue.patch b/package/libsemanage/0001-workaround-blackfin-issue.patch
deleted file mode 100644
index 7ce960665c..0000000000
--- a/package/libsemanage/0001-workaround-blackfin-issue.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Do not make symbols hidden on Blackfin
-
-The libselinux logic to hide internal symbols from the DSO doesn't
-work properly on Blackfin due to the USER_LABEL_PREFIX not being
-handled properly. A real fix is not that simple, so this patch simply
-disables the internal symbol hiding mechanism. This means that those
-symbols are visible in the final DSO, which is not a problem for
-proper execution, it just isn't as clean.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Adam Duskett <Aduskett@gmail.com>
-
-Index: b/src/dso.h
-===================================================================
---- a/src/dso.h
-+++ b/src/dso.h
-@@ -1,7 +1,7 @@
- #ifndef _SEPOL_DSO_H
- #define _SEPOL_DSO_H	1
- 
--#ifdef SHARED
-+#if defined(SHARED) && !defined(__bfin__)
- # define hidden __attribute__ ((visibility ("hidden")))
- # define hidden_proto(fct) __hidden_proto (fct, fct##_internal)
- # define __hidden_proto(fct, internal)	\
