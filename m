From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Oct 2016 13:53:26 +0200
Subject: [Buildroot] [git commit] package/oprofile: fix gcc6 build issue
Message-ID: <20161009115329.97C2781EB2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c1f3d4f0cc013b8f0c43408e83abe51d9b48534a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Backport a patch from upstream to fix a gcc6 build issue.

Fixes:
http://autobuild.buildroot.net/results/d9f/d9f2f771f8515a1ac17009e233a135b5af58ea00

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0002-Fix-FTBFS-problem-with-GCC-6.patch        | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/package/oprofile/0002-Fix-FTBFS-problem-with-GCC-6.patch b/package/oprofile/0002-Fix-FTBFS-problem-with-GCC-6.patch
new file mode 100644
index 0000000..34bf365
--- /dev/null
+++ b/package/oprofile/0002-Fix-FTBFS-problem-with-GCC-6.patch
@@ -0,0 +1,51 @@
+From 39d4d46a0bd504ac708ffe72df87bf74cd12ad30 Mon Sep 17 00:00:00 2001
+From: William Cohen <wcohen@redhat.com>
+Date: Fri, 5 Feb 2016 17:30:19 -0500
+Subject: [PATCH] Fix FTBFS problem with GCC-6
+
+GCC-6 is pickier about some of the type conversions causing the Fedora
+24 mass rebuild the build of oprofile failed with:
+
+make[3]: Entering directory '/builddir/build/BUILD/oprofile-1.1.0/libutil++'
+g++ -DHAVE_CONFIG_H -I. -I..  -I ../libutil -I ../libop -I ../libpp   -W -Wall -fno-common -ftemplate-depth-50 -O2 -g -pipe -Wall -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector-strong --param=ssp-buffer-size=4 -grecord-gcc-switches -specs=/usr/lib/rpm/redhat/redhat-hardened-cc1 -m32 -march=i686 -mtune=atom -fasynchronous-unwind-tables -c -o op_bfd.o op_bfd.cpp
+op_bfd.cpp: In member function 'void op_bfd::get_symbol_range(symbol_index_t, long long unsigned int&, long long unsigned int&) const':
+op_bfd.cpp:538:47: error: cannot convert 'std::ostream {aka std::basic_ostream<char>}' to 'const bool' in initialization
+  bool const verbose = cverb << (vbfd & vlevel1);
+                                               ^
+op_bfd.cpp:546:7: error: in argument to unary !
+  if (!verbose)
+       ^~~~~~~
+
+Avoid the intermediate bool type to make GCC-6 happy.
+
+Signed-off-by: William Cohen <wcohen@redhat.com>
+[Backported from upstream]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ libutil++/op_bfd.cpp | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/libutil++/op_bfd.cpp b/libutil++/op_bfd.cpp
+index 389c920..f2eb42b 100644
+--- a/libutil++/op_bfd.cpp
++++ b/libutil++/op_bfd.cpp
+@@ -535,15 +535,13 @@ void op_bfd::get_symbol_range(symbol_index_t sym_idx,
+ {
+ 	op_bfd_symbol const & sym = syms[sym_idx];
+ 
+-	bool const verbose = cverb << (vbfd & vlevel1);
+-
+ 	if (anon_obj)
+ 		start = sym.vma();
+ 	else
+ 		start = sym.filepos();
+ 	end = start + sym.size();
+ 
+-	if (!verbose)
++	if (!(cverb << (vbfd & vlevel1)))
+ 		return;
+ 
+ 	io_state state(cverb << (vbfd & vlevel1));
+-- 
+2.5.5
+
