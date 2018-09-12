From: Florian La Roche <F.LaRoche@pilz.de>
Date: Wed, 12 Sep 2018 10:34:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/mongodb: add patch to compile with
 glibc >= 2.28
Message-ID: <20180912083447.5169-1-F.LaRoche@pilz.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

glibc 2.28 no longer includes <sys/sysmacros.h> from <sys/types.h>,
and therefore <sys/sysmacros.h> must be included explicitly when
major()/minor() are used.

Signed-off-by: Florian La Roche <F.LaRoche@pilz.de>
---
 package/mongodb/mongodb.patch | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 package/mongodb/mongodb.patch

diff --git a/package/mongodb/mongodb.patch b/package/mongodb/mongodb.patch
new file mode 100644
index 0000000000..d429b4e891
--- /dev/null
+++ b/package/mongodb/mongodb.patch
@@ -0,0 +1,10 @@
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
-- 
2.17.1

Gesch?ftsf?hrung: Susanne Kunschert, Thomas Pilz
Pilz GmbH & Co. KG, Sitz: Ostfildern, HRA 210 893, Amtsgericht Stuttgart
Kompl. Ges. Peter Pilz GmbH, Sitz: Ostfildern, HRB 210 612, Amtsgericht Stuttgart
Umsatzsteuer: ID-Nr. DE 145 355 773, WEEE-Reg.-Nr. DE 71636849
This email is intended solely for the use of the named address(es). Any unauthorised disclosure, copying or distribution of these confidential information contained therein, or the taking of any action based on it, is prohibited. The sender disclaims any liability for the integrity of this email. Legally binding declarations must be in written form.
Umweltschutz liegt uns am Herzen! - Bitte denken Sie an unsere Umwelt, bevor Sie diese E-Mail drucken.
We do care about the environment! - Please consider the environment before printing this e-mail.
