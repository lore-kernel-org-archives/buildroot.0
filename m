From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 6 May 2012 11:49:19 +0200
Subject: [Buildroot] [git commit] valgrind: fix build on PowerPC/uClibc
Message-ID: <20120506094928.82E6F96A19@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ed7b3362ad6dc33899766c803bba51240111aa43
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes build failures like
http://autobuild.buildroot.org/results/112fa7c56e1e31c9a81d5f27394f58789e36bfec/build-end.log.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../valgrind-3.7.0-dont-include-a-out-header.patch |   45 ++++++++++++++++++++
 1 files changed, 45 insertions(+), 0 deletions(-)

diff --git a/package/valgrind/valgrind-3.7.0-dont-include-a-out-header.patch b/package/valgrind/valgrind-3.7.0-dont-include-a-out-header.patch
new file mode 100644
index 0000000..ed1c939
--- /dev/null
+++ b/package/valgrind/valgrind-3.7.0-dont-include-a-out-header.patch
@@ -0,0 +1,45 @@
+Add replacement for <a.out.h>
+
+Valgrind includes <a.out.h> to get the definition of 'struct
+nlist'. However, while glibc directly defines 'struct nlist' in
+<a.out.h>, uClibc relies on it being defined by kernel headers (i.e
+<a.out.h> simply includes <linux/a.out.h>). This works for most
+architectures, but not for PowerPC, on which the a.out binary format
+has never been supported, and therefore the <linux/a.out.h> kernel
+header does not exist.
+
+One solution would have been to use the <nlist.h> header, but this one
+is only available in glibc, and it also has a slightly different
+definition than the one in <a.out.h>. So, for the time being, the
+easiest solution is to just replace the #include <a.out.h> in Valgrind
+code by a copy/paste of the 'struct nlist' definition.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/coregrind/m_debuginfo/readstabs.c
+===================================================================
+--- a/coregrind/m_debuginfo/readstabs.c
++++ b/coregrind/m_debuginfo/readstabs.c
+@@ -52,7 +52,21 @@
+ 
+ /* --- !!! --- EXTERNAL HEADERS start --- !!! --- */
+ #if defined(VGO_linux)
+-#  include <a.out.h> /* stabs defns */
++/* Copied from a.out.h, because it is otherwise not available on
++   PowerPC/uClibc */
++struct nlist
++{
++  union
++    {
++      char *n_name;
++      struct nlist *n_next;
++      long n_strx;
++    } n_un;
++  unsigned char n_type;
++  char n_other;
++  short n_desc;
++  unsigned long n_value;
++};
+ #elif defined(VGO_darwin)
+ #  include <mach-o/nlist.h>
+ #  define n_other n_sect
