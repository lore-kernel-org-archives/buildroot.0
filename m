From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Sep 2018 21:53:31 +0200
Subject: [Buildroot] [git commit] package/mongodb: add patch to compile with
 glibc >= 2.28
Message-ID: <20180916195653.E76E388424@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8dc2f33d0a83419e7132a4f12de0acb8529eaaf9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

glibc 2.28 no longer includes <sys/sysmacros.h> from <sys/types.h>,
and therefore <sys/sysmacros.h> must be included explicitly when
major()/minor() are used.

Signed-off-by: Florian La Roche <F.LaRoche@pilz.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../mongodb/0001-add-missing-sysmacros-include.patch  | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/package/mongodb/0001-add-missing-sysmacros-include.patch b/package/mongodb/0001-add-missing-sysmacros-include.patch
new file mode 100644
index 0000000000..3a8bfa16c7
--- /dev/null
+++ b/package/mongodb/0001-add-missing-sysmacros-include.patch
@@ -0,0 +1,19 @@
+Add missing <sys/sysmacros.h>
+
+mmap_v1_engine.cpp is using major()/minor(), which are defined by
+<sys/sysmacros.h>. This header file was implicitly included by
+<sys/types.h> in glibc < 2.28. But this glibc 2.28, this is no longer
+the case, so <sys/sysmacros.h> needs to be included explicitly.
+
+Signed-off-by: Florian La Roche <F.LaRoche@pilz.de>
+
+--- ./src/mongo/db/storage/mmap_v1/mmap_v1_engine.cpp
++++ ./src/mongo/db/storage/mmap_v1/mmap_v1_engine.cpp
+@@ -32,6 +32,7 @@
+ 
+ #include "mongo/db/storage/mmap_v1/mmap_v1_engine.h"
+ 
++#include <sys/sysmacros.h>
+ #include <boost/filesystem/path.hpp>
+ #include <boost/filesystem/operations.hpp>
+ #include <fstream>
