From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 31 Jul 2018 22:00:58 +0200
Subject: [Buildroot] [git commit] gcc: Fix building on ppc64le GCC 8 host
Message-ID: <20180731195527.3083D82A65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=88a161b3886c96b9bd6fc96b8f3850d422af7a5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When building on a ppc64le host we see this error:

    build/genmatch --gimple ../../gcc/match.pd \
        > tmp-gimple-match.c
    ../../gcc/match.pd:120:1 error: expected (, got NAME
       negative value by 0 gives -0, not +0.  */

This was reported upstream[1] and fixed on the GCC 6 [2] and GCC 7 [3]
branches:

    Backport from mainline
    2018-01-10  Kelvin Nilsen  <kelvin@gcc.gnu.org>

    * lex.c (search_line_fast): Remove illegal coercion of an
    unaligned pointer value to vector pointer type and replace with
    use of __builtin_vec_vsx_ld () built-in function, which operates
    on unaligned pointer values.

The patches included in Buildroot contain just the code changes, and not
the changelog, to make it easer to manage backporting.

Tested on Ubuntu Cosmic ppc64le.

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=86162
[2] https://gcc.gnu.org/viewcvs/gcc?view=revision&revision=261621
[3] https://gcc.gnu.org/viewcvs/gcc?view=revision&revision=262243

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/6.4.0/0002-fix-building-on-ppc64.patch | 38 ++++++++++++++++++++
 package/gcc/7.3.0/0002-fix-building-on-ppc64.patch | 40 ++++++++++++++++++++++
 2 files changed, 78 insertions(+)

diff --git a/package/gcc/6.4.0/0002-fix-building-on-ppc64.patch b/package/gcc/6.4.0/0002-fix-building-on-ppc64.patch
new file mode 100644
index 0000000000..ee096cfcf1
--- /dev/null
+++ b/package/gcc/6.4.0/0002-fix-building-on-ppc64.patch
@@ -0,0 +1,38 @@
+From 765527ad3725c5f3e82ab2b8e5031120b409983d Mon Sep 17 00:00:00 2001
+From: marxin <marxin@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Fri, 15 Jun 2018 08:51:28 +0000
+Subject: [PATCH] Partial backport r256656
+
+2018-06-15  Martin Liska  <mliska@suse.cz>
+
+	Backport from mainline
+	2018-01-10  Kelvin Nilsen  <kelvin@gcc.gnu.org>
+
+	* lex.c (search_line_fast): Remove illegal coercion of an
+	unaligned pointer value to vector pointer type and replace with
+	use of __builtin_vec_vsx_ld () built-in function, which operates
+	on unaligned pointer values.
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-6-branch at 261621 138bc75d-0d04-0410-961f-82ee72b054a4
+Signed-off-by: Joel Stanley <joel@jms.id.au>
+---
+ libcpp/lex.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libcpp/lex.c b/libcpp/lex.c
+index e5a0397f3099..b789686f1c49 100644
+--- a/libcpp/lex.c
++++ b/libcpp/lex.c
+@@ -568,7 +568,7 @@ search_line_fast (const uchar *s, const uchar *end ATTRIBUTE_UNUSED)
+     {
+       vc m_nl, m_cr, m_bs, m_qm;
+ 
+-      data = *((const vc *)s);
++      data = __builtin_vec_vsx_ld (0, s);
+       s += 16;
+ 
+       m_nl = (vc) __builtin_vec_cmpeq(data, repl_nl);
+-- 
+2.17.1
+
diff --git a/package/gcc/7.3.0/0002-fix-building-on-ppc64.patch b/package/gcc/7.3.0/0002-fix-building-on-ppc64.patch
new file mode 100644
index 0000000000..78a028c29a
--- /dev/null
+++ b/package/gcc/7.3.0/0002-fix-building-on-ppc64.patch
@@ -0,0 +1,40 @@
+From aa65a43516da1d48011ef621ed5988289711d99b Mon Sep 17 00:00:00 2001
+From: marxin <marxin@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Fri, 29 Jun 2018 09:31:30 +0000
+Subject: [PATCH] Partial backport r256656
+
+2018-06-29  Martin Liska  <mliska@suse.cz>
+
+	Backport from mainline
+	2018-01-10  Kelvin Nilsen  <kelvin@gcc.gnu.org>
+
+	* lex.c (search_line_fast): Remove illegal coercion of an
+	unaligned pointer value to vector pointer type and replace with
+	use of __builtin_vec_vsx_ld () built-in function, which operates
+	on unaligned pointer values.
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-6-branch at 261621 138bc75d-0d04-0410-961f-82ee72b054a4
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-7-branch at 262243 138bc75d-0d04-0410-961f-82ee72b054a4
+Signed-off-by: Joel Stanley <joel@jms.id.au>
+---
+ libcpp/lex.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libcpp/lex.c b/libcpp/lex.c
+index 097c78002cbb..e0fb9e822c44 100644
+--- a/libcpp/lex.c
++++ b/libcpp/lex.c
+@@ -568,7 +568,7 @@ search_line_fast (const uchar *s, const uchar *end ATTRIBUTE_UNUSED)
+     {
+       vc m_nl, m_cr, m_bs, m_qm;
+ 
+-      data = *((const vc *)s);
++      data = __builtin_vec_vsx_ld (0, s);
+       s += 16;
+ 
+       m_nl = (vc) __builtin_vec_cmpeq(data, repl_nl);
+-- 
+2.17.1
+
