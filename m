From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  5 Apr 2018 21:50:33 +0200
Subject: [Buildroot] [PATCH 19/23] libsemanage: remove Blackfin patch
In-Reply-To: <20180405195037.32641-1-thomas.petazzoni@bootlin.com>
References: <20180405195037.32641-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180405195037.32641-20-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And renumber the remaining patch.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...uild-follow-standard-semantics-for-DESTD.patch} |  0
 .../0001-workaround-blackfin-issue.patch           | 25 ----------------------
 2 files changed, 25 deletions(-)
 rename package/libsemanage/{0002-libsemanage-build-follow-standard-semantics-for-DESTD.patch => 0001-libsemanage-build-follow-standard-semantics-for-DESTD.patch} (100%)
 delete mode 100644 package/libsemanage/0001-workaround-blackfin-issue.patch

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
-- 
2.14.3
