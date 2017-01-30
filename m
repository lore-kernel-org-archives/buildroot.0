From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Jan 2017 21:16:05 +0100
Subject: [Buildroot] [git commit] lcms2: add upstream security fix for
	CVE-2016-10165
Message-ID: <20170130201643.4684A7FFF1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cd2e115a3feb501afc11d3c6ce29fd947a631cda
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

An out-of-bounds read in cmstypes.c in Type_MLU_Read function was found,
leading to heap memory leak triggered by crafted ICC profile.

https://bugzilla.redhat.com/show_bug.cgi?id=1367357

Add upstream patch to fix it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-Added-an-extra-check-to-MLU-bounds.patch  | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/package/lcms2/0002-Added-an-extra-check-to-MLU-bounds.patch b/package/lcms2/0002-Added-an-extra-check-to-MLU-bounds.patch
new file mode 100644
index 0000000..9a5d9dd
--- /dev/null
+++ b/package/lcms2/0002-Added-an-extra-check-to-MLU-bounds.patch
@@ -0,0 +1,27 @@
+From 5ca71a7bc18b6897ab21d815d15e218e204581e2 Mon Sep 17 00:00:00 2001
+From: Marti <marti.maria@tktbrainpower.com>
+Date: Mon, 15 Aug 2016 23:31:39 +0200
+Subject: [PATCH] Added an extra check to MLU bounds
+
+Thanks to Ibrahim el-sayed for spotting the bug
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/cmstypes.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/cmstypes.c b/src/cmstypes.c
+index cb61860..c7328b9 100644
+--- a/src/cmstypes.c
++++ b/src/cmstypes.c
+@@ -1460,6 +1460,7 @@ void *Type_MLU_Read(struct _cms_typehandler_struct* self, cmsIOHANDLER* io, cmsU
+ 
+         // Check for overflow
+         if (Offset < (SizeOfHeader + 8)) goto Error;
++        if ((Offset + Len) > SizeOfTag + 8) goto Error;
+ 
+         // True begin of the string
+         BeginOfThisString = Offset - SizeOfHeader - 8;
+-- 
+2.11.0
+
