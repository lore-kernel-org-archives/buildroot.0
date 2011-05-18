From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 May 2011 23:48:11 +0200
Subject: [Buildroot] [PATCH 2/4] package: remove stamp files in
	<pkg>-dirclean
In-Reply-To: <cover.1305755245.git.thomas.petazzoni@free-electrons.com>
References: <cover.1305755245.git.thomas.petazzoni@free-electrons.com>
Message-ID: <70bf4af511c8d87c27f8e4a9be762eb9e97c222f.1305755245.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When the package build directory was a real directory, then removing
the directory was enough to remove all its stamp files. However, now
that the build directory can in fact be a symbolic link to the real
source directory, we need to explicitly remove the stamp files before
removing the symbolic link. Otherwise, next time the symbolic is
re-created, some old stamp files would be found.

Unfortunately, there is still a bug: if one does a global "make
clean", the symbolic links are removed since $(BUILD_DIR) is removed,
but not the stamp files. Should we create the stamp files outside of
the package build directory ?

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.package.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 1afc18d..702395a 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -335,6 +335,7 @@ $(BUILD_DIR)/%/.stamp_uninstalled:
 
 # Remove package sources
 $(BUILD_DIR)/%/.stamp_dircleaned:
+	rm -f $(@D)/.stamp_*
 	rm -Rf $(@D)
 
 ################################################################################
-- 
1.7.1
