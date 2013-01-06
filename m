From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Jan 2013 16:22:50 +0100
Subject: [Buildroot] [PATCH 10/15] elfutils: towards uClibc support: solve
	memcpy problem
In-Reply-To: <cover.1357485747.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357485747.git.thomas.petazzoni@free-electrons.com>
Message-ID: <f0becaaa58faa7a0bfe7a1bf9b8026e60137e57f.1357485747.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

elfutils uses some strange internal alias of memcpy in glibc, so
workaround this when building with uClibc.

Heavily based from work done by Stefan Fr?berg, but with many further
modifications by Thomas Petazzoni.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/elfutils/elfutils-03-memcpy-def.patch |   24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 package/elfutils/elfutils-03-memcpy-def.patch

diff --git a/package/elfutils/elfutils-03-memcpy-def.patch b/package/elfutils/elfutils-03-memcpy-def.patch
new file mode 100644
index 0000000..eb50cf6
--- /dev/null
+++ b/package/elfutils/elfutils-03-memcpy-def.patch
@@ -0,0 +1,24 @@
+Provide a compatibility alias __memcpy
+
+For some reason, libelf uses the internal glibc alias __memcpy, which
+doesn't exist in uClibc. Add a manual alias so that the build can
+proceed with uClibc.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/libelf/libelf.h
+===================================================================
+--- a/libelf/libelf.h
++++ b/libelf/libelf.h
+@@ -34,6 +34,11 @@
+ /* Get the ELF types.  */
+ #include <elf.h>
+ 
++#ifndef _LIBC
++#ifndef __mempcpy
++#define __mempcpy mempcpy
++#endif
++#endif
+ 
+ /* Known translation types.  */
+ typedef enum
-- 
1.7.9.5
