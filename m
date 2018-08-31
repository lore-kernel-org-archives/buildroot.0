From: David De Grave (Essensium/Mind) <david.degrave@mind.be>
Date: Fri, 31 Aug 2018 16:20:22 +0200
Subject: [Buildroot] [PATCH 1/3] package/Makefile.in: Use '-isystem' instead
 of '-I' in HOST_CFLAGS globally
Message-ID: <20180831142024.27548-1-david.degrave@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 As the $(HOST_DIR) is the buildroot's system install directory, and that
all the builds should use that one in priority (it's even mandatory for
uboot and linux), it make sense to use '-isystem' to ensure it is searched
right before the system directories and still let the possibility for the
packages to use specific ones using '-I'.

 Now, changing '-I' into '-isystem' carries the risk that a package will add
'-I/usr/include' to CFLAGS and thus give priority to system headers over
host headers. However, this turns out not to be the case, because gcc will
remove the '-I' options that add system includes:

  $ gcc -v -c -isystem $PWD/output/host/include -I/usr/include \
    support/kconfig/expr.c
  ...
  ignoring duplicate directory "/usr/include" as it is a non-system \
    directory that duplicates a system directory
  #include "..." search starts here:
  #include <...> search starts here:
   {output}/host/include
   /usr/lib/gcc/x86_64-linux-gnu/8/include
   /usr/local/include
   /usr/lib/gcc/x86_64-linux-gnu/8/include-fixed
   /usr/include/x86_64-linux-gnu
   /usr/include
  End of search list.
  ...

Signed-off-by: David De Grave (Essensium/Mind) <david.degrave@mind.be>
---
 package/Makefile.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 91b3e8f936..5ed70f0a65 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -223,7 +223,7 @@ UNZIP := $(shell which unzip || type -p unzip) -q
 
 APPLY_PATCHES = PATH=$(HOST_DIR)/bin:$$PATH support/scripts/apply-patches.sh $(if $(QUIET),-s)
 
-HOST_CPPFLAGS  = -I$(HOST_DIR)/include
+HOST_CPPFLAGS  = -isystem $(HOST_DIR)/include
 HOST_CFLAGS   ?= -O2
 HOST_CFLAGS   += $(HOST_CPPFLAGS)
 HOST_CXXFLAGS += $(HOST_CFLAGS)
-- 
2.13.6
