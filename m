From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Apr 2020 21:01:20 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/localedef: fix
 gcc-10.0.1 compile
Message-ID: <20200407184756.696EE8D6E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0c381102f054bf82657858086c421783e19b290d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes build with gcc-10, by backporting an upstream patch:

  programs/ld-ctype.c:855:18: error: array subscript 0 is outside the bounds of an interior zero-length array ???unsigned char[0]??? [-Werror=zero-length-bounds]
    855 |  replace[0].bytes[0] = '?';
        |  ~~~~~~~~~~~~~~~~^~~

Fixes: #12711

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[yann.morin.1998 at free.fr: slight reword in commit log]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 13cc36dcfee5bdbd963fe335d19a2dc8f3486e62)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...se-initializer-for-flexible-array-member-.patch | 81 ++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/package/localedef/2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/0003-localedef-Use-initializer-for-flexible-array-member-.patch b/package/localedef/2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/0003-localedef-Use-initializer-for-flexible-array-member-.patch
new file mode 100644
index 0000000000..93547e08f0
--- /dev/null
+++ b/package/localedef/2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/0003-localedef-Use-initializer-for-flexible-array-member-.patch
@@ -0,0 +1,81 @@
+From 6fea0a8e33760258c4baa5d0a6f3a145897427fe Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Tue, 3 Sep 2019 14:01:39 +0200
+Subject: [PATCH] localedef: Use initializer for flexible array member [BZ
+ #24950]
+
+struct charseq used a zero-length array instead of a flexible array
+member.  This required a strange construct to initialize struct
+charseq objects, and GCC 10 warns about that:
+
+cc1: error: writing 1 byte into a region of size 0 [-Werror=stringop-overflow=]
+In file included from programs/repertoire.h:24,
+                 from programs/localedef.h:32,
+                 from programs/ld-ctype.c:35:
+programs/charmap.h:63:17: note: destination object declared here
+   63 |   unsigned char bytes[0];
+      |                 ^~~~~
+cc1: error: writing 1 byte into a region of size 0 [-Werror=stringop-overflow=]
+programs/charmap.h:63:17: note: destination object declared here
+cc1: error: writing 1 byte into a region of size 0 [-Werror=stringop-overflow=]
+programs/charmap.h:63:17: note: destination object declared here
+cc1: error: writing 1 byte into a region of size 0 [-Werror=stringop-overflow=]
+programs/charmap.h:63:17: note: destination object declared here
+
+The change makes the object physically const, but it is not expected
+to be modified.
+
+[Upstream: https://sourceware.org/git/?p=glibc.git;a=patch;h=1471fa556afb428c4a4c46cf5543a4101d5bcf91]
+[Dropped confliciting ChangeLog part]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ locale/programs/charmap.h  |  2 +-
+ locale/programs/ld-ctype.c | 12 ++++++------
+ 2 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/locale/programs/charmap.h b/locale/programs/charmap.h
+index 870a9e95..70db330d 100644
+--- a/locale/programs/charmap.h
++++ b/locale/programs/charmap.h
+@@ -60,7 +60,7 @@ struct charseq
+   const char *name;
+   uint32_t ucs4;
+   int nbytes;
+-  unsigned char bytes[0];
++  unsigned char bytes[];
+ };
+ 
+ 
+diff --git a/locale/programs/ld-ctype.c b/locale/programs/ld-ctype.c
+index cfc9c43f..9123f64a 100644
+--- a/locale/programs/ld-ctype.c
++++ b/locale/programs/ld-ctype.c
+@@ -842,8 +842,6 @@ no input digits defined and none of the standard names in the charmap"));
+   for (cnt = 0; cnt < 10; ++cnt)
+     if (ctype->mboutdigits[cnt] == NULL)
+       {
+-	static struct charseq replace[2];
+-
+ 	if (!warned)
+ 	  {
+ 	    record_error (0, 0, _("\
+@@ -851,10 +849,12 @@ not all characters used in `outdigit' are available in the charmap"));
+ 	    warned = 1;
+ 	  }
+ 
+-	replace[0].nbytes = 1;
+-	replace[0].bytes[0] = '?';
+-	replace[0].bytes[1] = '\0';
+-	ctype->mboutdigits[cnt] = &replace[0];
++	static const struct charseq replace =
++	  {
++	     .nbytes = 1,
++	     .bytes = "?",
++	  };
++	ctype->mboutdigits[cnt] = (struct charseq *) &replace;
+       }
+ 
+   warned = 0;
+-- 
+2.26.0
+
