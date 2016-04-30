From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Sat, 30 Apr 2016 09:49:04 +0200
Subject: [Buildroot] [PATCH 08/34] reproducibility/libgpg-error: override
	timestamps
In-Reply-To: <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <1462002570-14706-8-git-send-email-gilles.chanteperdrix@xenomai.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

with SOURCE_DATE_EPOCH
---
 package/libgpg-error/0002-honor-source-date-epoch.patch | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 package/libgpg-error/0002-honor-source-date-epoch.patch

diff --git a/package/libgpg-error/0002-honor-source-date-epoch.patch b/package/libgpg-error/0002-honor-source-date-epoch.patch
new file mode 100644
index 0000000..2df7cca
--- /dev/null
+++ b/package/libgpg-error/0002-honor-source-date-epoch.patch
@@ -0,0 +1,15 @@
+--- libgpg-error-1.12/configure.ac~	2016-02-23 20:30:21.000000000 +0100
++++ libgpg-error-1.12/configure.ac	2016-02-23 21:16:20.284133994 +0100
+@@ -198,7 +198,11 @@ changequote([,])dnl
+ BUILD_FILEVERSION="${BUILD_FILEVERSION}0,mym4_revision_dec"
+ AC_SUBST(BUILD_FILEVERSION)
+ 
+-BUILD_TIMESTAMP=`date -u +%Y-%m-%dT%H:%M+0000 2>/dev/null || date`
++if test x"${SOURCE_DATE_EPOCH}" = x; then
++   	BUILD_TIMESTAMP=`date -u +%Y-%m-%dT%H:%M+0000 2>/dev/null || date`
++else
++	BUILD_TIMESTAMP=`date -u -d @${SOURCE_DATE_EPOCH} +%Y-%m-%dT%H:%M+0000 2>/dev/null || date -d @${SOURCE_DATE_EPOCH}`
++fi
+ AC_SUBST(BUILD_TIMESTAMP)
+ AC_DEFINE_UNQUOTED(BUILD_TIMESTAMP, "$BUILD_TIMESTAMP",
+                    [The time this package was configured for a build])
-- 
2.7.4
