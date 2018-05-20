From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 20 May 2018 17:03:19 +0200
Subject: [Buildroot] [PATCH 1/1] oprofile: bump to version 1.2.0
Message-ID: <20180520150319.4255-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove second patch (already in version)
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0002-Fix-FTBFS-problem-with-GCC-6.patch        | 51 ----------------------
 package/oprofile/oprofile.hash                     |  9 ++--
 package/oprofile/oprofile.mk                       |  2 +-
 3 files changed, 7 insertions(+), 55 deletions(-)
 delete mode 100644 package/oprofile/0002-Fix-FTBFS-problem-with-GCC-6.patch

diff --git a/package/oprofile/0002-Fix-FTBFS-problem-with-GCC-6.patch b/package/oprofile/0002-Fix-FTBFS-problem-with-GCC-6.patch
deleted file mode 100644
index 34bf365226..0000000000
--- a/package/oprofile/0002-Fix-FTBFS-problem-with-GCC-6.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 39d4d46a0bd504ac708ffe72df87bf74cd12ad30 Mon Sep 17 00:00:00 2001
-From: William Cohen <wcohen@redhat.com>
-Date: Fri, 5 Feb 2016 17:30:19 -0500
-Subject: [PATCH] Fix FTBFS problem with GCC-6
-
-GCC-6 is pickier about some of the type conversions causing the Fedora
-24 mass rebuild the build of oprofile failed with:
-
-make[3]: Entering directory '/builddir/build/BUILD/oprofile-1.1.0/libutil++'
-g++ -DHAVE_CONFIG_H -I. -I..  -I ../libutil -I ../libop -I ../libpp   -W -Wall -fno-common -ftemplate-depth-50 -O2 -g -pipe -Wall -Werror=format-security -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector-strong --param=ssp-buffer-size=4 -grecord-gcc-switches -specs=/usr/lib/rpm/redhat/redhat-hardened-cc1 -m32 -march=i686 -mtune=atom -fasynchronous-unwind-tables -c -o op_bfd.o op_bfd.cpp
-op_bfd.cpp: In member function 'void op_bfd::get_symbol_range(symbol_index_t, long long unsigned int&, long long unsigned int&) const':
-op_bfd.cpp:538:47: error: cannot convert 'std::ostream {aka std::basic_ostream<char>}' to 'const bool' in initialization
-  bool const verbose = cverb << (vbfd & vlevel1);
-                                               ^
-op_bfd.cpp:546:7: error: in argument to unary !
-  if (!verbose)
-       ^~~~~~~
-
-Avoid the intermediate bool type to make GCC-6 happy.
-
-Signed-off-by: William Cohen <wcohen@redhat.com>
-[Backported from upstream]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- libutil++/op_bfd.cpp | 4 +---
- 1 file changed, 1 insertion(+), 3 deletions(-)
-
-diff --git a/libutil++/op_bfd.cpp b/libutil++/op_bfd.cpp
-index 389c920..f2eb42b 100644
---- a/libutil++/op_bfd.cpp
-+++ b/libutil++/op_bfd.cpp
-@@ -535,15 +535,13 @@ void op_bfd::get_symbol_range(symbol_index_t sym_idx,
- {
- 	op_bfd_symbol const & sym = syms[sym_idx];
- 
--	bool const verbose = cverb << (vbfd & vlevel1);
--
- 	if (anon_obj)
- 		start = sym.vma();
- 	else
- 		start = sym.filepos();
- 	end = start + sym.size();
- 
--	if (!verbose)
-+	if (!(cverb << (vbfd & vlevel1)))
- 		return;
- 
- 	io_state state(cverb << (vbfd & vlevel1));
--- 
-2.5.5
-
diff --git a/package/oprofile/oprofile.hash b/package/oprofile/oprofile.hash
index cc15ed1100..737137e0dd 100644
--- a/package/oprofile/oprofile.hash
+++ b/package/oprofile/oprofile.hash
@@ -1,3 +1,6 @@
-# From http://sourceforge.net/projects/oprofile/files/oprofile/oprofile-1.1.0/
-sha1	38c0d8812fe605f6ddd1cd183a482aa7605c0e81	oprofile-1.1.0.tar.gz
-md5	248c4c069f9476f427fa7195563f9867		oprofile-1.1.0.tar.gz
+# From http://sourceforge.net/projects/oprofile/files/oprofile/oprofile-1.2.0/
+sha1	7bf28b74953bd042ff23dc53c399be96d37f144c	oprofile-1.2.0.tar.gz
+md5	4fcd3920984dcb607314b2e225086c3a		oprofile-1.2.0.tar.gz
+
+# Hash for license file:
+sha256	32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670	COPYING
diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
index 4e0278eb2a..2b82194406 100644
--- a/package/oprofile/oprofile.mk
+++ b/package/oprofile/oprofile.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPROFILE_VERSION = 1.1.0
+OPROFILE_VERSION = 1.2.0
 OPROFILE_SITE = http://downloads.sourceforge.net/project/oprofile/oprofile/oprofile-$(OPROFILE_VERSION)
 OPROFILE_LICENSE = GPL-2.0+
 OPROFILE_LICENSE_FILES = COPYING
-- 
2.14.1
