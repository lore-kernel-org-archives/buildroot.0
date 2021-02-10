From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 10 Feb 2021 22:10:58 +0100
Subject: [Buildroot] [git commit] utils/getdeveloperlib.py: reduce Cc: list
 based on package infras
Message-ID: <20210210205011.04B6F83C5E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=38b0560f4ee1f113e32ce2cf59a08c37a967150d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When a developer has package/pkg-<infra>.mk assigned to him/her in the
DEVELOPERS file, this has 3 implications:

 (1) Patches adding new packages using this infrastructure are Cc'ed
     to this developer. This is done by the analyze_patch() function,
     which matches the regexp r"^\+\$\(eval
     \$\((host-)?([^-]*)-package\)\)$" in the patch, i.e where an
     added line contains a reference to the infra maintained by the
     developer.

 (2) Patches touching the package/pkg-<infra>.mk file itself are Cc'ed
     to this developer.

 (3) Any patch touching a package using this infra are also Cc'ed to
     this developer.

Point (3) causes a significant amount of patches to be sent to
developers who have package/pkg-generic.mk and
package/pkg-autotools.mk assigned to them in the DEVELOPERS
file. Basically, all patches touching generic or autotools packages
get CC'ed to such developers, which causes a massive amount of patches
to be received.

So this patch adjusts the getdeveloperlib.py to drop point (3), but
preserves point (1) and (2). Indeed, it makes sense to be Cc'ed on new
package additions (to make a review that they use the package
infrastructure correctly), and it makes sense to be Cc'ed on patches
that touch the infrastructure code itself.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 utils/getdeveloperlib.py | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/utils/getdeveloperlib.py b/utils/getdeveloperlib.py
index d7a90457ed..b205817033 100644
--- a/utils/getdeveloperlib.py
+++ b/utils/getdeveloperlib.py
@@ -56,17 +56,6 @@ def fname_get_package_infra(fname):
     return None
 
 
-def get_infras(files):
-    """Search in the list of files for .mk files, and collect the package
-    infrastructures used by those .mk files."""
-    infras = set()
-    for fname in files:
-        infra = fname_get_package_infra(fname)
-        if infra:
-            infras.add(infra)
-    return infras
-
-
 def analyze_patches(patches):
     """Parse a list of patches and returns the list of files modified,
     added or removed by the patches, as well as the list of package
@@ -77,7 +66,6 @@ def analyze_patches(patches):
         (files, infras) = analyze_patch(patch)
         allfiles = allfiles | files
         allinfras = allinfras | infras
-    allinfras = allinfras | get_infras(allfiles)
     return (allfiles, allinfras)
 
 
