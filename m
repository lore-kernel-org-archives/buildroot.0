From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 7 Jan 2013 21:43:06 +0100
Subject: [Buildroot] [git commit] elfutils: towards uClibc support: solve
	memcpy problem
Message-ID: <20130107212532.3A6FF9A691@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a64632e44728450e6fa814ce95fbb67161c8971a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

elfutils uses some strange internal alias of memcpy in glibc, so
workaround this when building with uClibc.

Heavily based from work done by Stefan Fr??berg, but with many further
modifications by Thomas Petazzoni.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/elfutils/elfutils-03-memcpy-def.patch |   24 ++++++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)

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
