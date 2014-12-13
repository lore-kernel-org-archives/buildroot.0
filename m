From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 13 Dec 2014 22:13:09 +0100
Subject: [Buildroot] [git commit] pcre: add a patch fixing CVE-2014-8964
Message-ID: <20141213212028.DF676800DE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=753a2937f663d6e7dc630319ae903dc595b0ddd9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch taken from the Debian package.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pcre/0003-fix-CVE-2014-8964.patch |   25 +++++++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/package/pcre/0003-fix-CVE-2014-8964.patch b/package/pcre/0003-fix-CVE-2014-8964.patch
new file mode 100644
index 0000000..bfc5860
--- /dev/null
+++ b/package/pcre/0003-fix-CVE-2014-8964.patch
@@ -0,0 +1,25 @@
+Description: CVE-2014-8964, heap buffer overflow
+ Heap buffer overflow if an assertion with a zero minimum repeat is used as
+ the condition in a conditional group.
+Origin: upstream http://bugs.exim.org/show_bug.cgi?id=1546
+Bug: http://bugs.exim.org/show_bug.cgi?id=1546
+Applied-Upstream: Yes, after 8.36
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+This patch header follows DEP-3: http://dep.debian.net/deps/dep3/
+--- a/pcre_exec.c
++++ b/pcre_exec.c
+@@ -1404,8 +1404,11 @@
+         condition = TRUE;
+ 
+         /* Advance ecode past the assertion to the start of the first branch,
+-        but adjust it so that the general choosing code below works. */
++        but adjust it so that the general choosing code below works. If the
++	assertion has a quantifier that allows zero repeats we must skip over
++	the BRAZERO. This is a lunatic thing to do, but somebody did! */
+ 
++	if (*ecode == OP_BRAZERO) ecode++;
+         ecode += GET(ecode, 1);
+         while (*ecode == OP_ALT) ecode += GET(ecode, 1);
+         ecode += 1 + LINK_SIZE - PRIV(OP_lengths)[condcode];
