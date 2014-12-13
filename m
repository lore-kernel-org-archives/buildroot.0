From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 13 Dec 2014 20:34:04 +0200
Subject: [Buildroot] [PATCH 2/2] pcre: add a patch fixing CVE-2014-8964
In-Reply-To: <65f6d701d05bfb6c2cce52beef094c5674bdfa06.1418495644.git.baruch@tkos.co.il>
References: <65f6d701d05bfb6c2cce52beef094c5674bdfa06.1418495644.git.baruch@tkos.co.il>
Message-ID: <586e5679f6558f2fcb303d6fc8f38b071b0d128c.1418495644.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch taken from the Debian package.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/pcre/0003-fix-CVE-2014-8964.patch | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 package/pcre/0003-fix-CVE-2014-8964.patch

diff --git a/package/pcre/0003-fix-CVE-2014-8964.patch b/package/pcre/0003-fix-CVE-2014-8964.patch
new file mode 100644
index 000000000000..bfc586034ed2
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
-- 
2.1.3
