From: Carlos Santos <casantos@datacom.ind.br>
Date: Tue, 27 Jun 2017 14:03:03 -0300
Subject: [Buildroot] [PATCH] util-linux: fix compilation when libc lacks
	wide-character support
Message-ID: <1498582983-19532-1-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A recent change in util-linux left calls to wcstok and wcspbrk not
guarded by "#ifdef HAVE_WIDECHAR". This causes build failures when
libc does not have the wide-character functions, like some uClibc
builds.

Solve the broblem by means of a patch already sent upstream.

Fixes:
  http://autobuild.buildroot.net/results/fd8a1a8e0cef3aeed9588540e8e663664f6b43aa
  http://autobuild.buildroot.net/results/5ad73ea8b471321988c50d80a5e50d4504151dd6
  http://autobuild.buildroot.net/results/04411b7280dc51ecd51236967981a42352bbeb3e

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 ...compilation-when-libc-lacks-wide-characte.patch | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 package/util-linux/0002-column-fix-compilation-when-libc-lacks-wide-characte.patch

diff --git a/package/util-linux/0002-column-fix-compilation-when-libc-lacks-wide-characte.patch b/package/util-linux/0002-column-fix-compilation-when-libc-lacks-wide-characte.patch
new file mode 100644
index 0000000..21c95d1
--- /dev/null
+++ b/package/util-linux/0002-column-fix-compilation-when-libc-lacks-wide-characte.patch
@@ -0,0 +1,53 @@
+From 46a37cd25db592db878d5beccdf75d1accbbacb6 Mon Sep 17 00:00:00 2001
+From: Carlos Santos <casantos@datacom.ind.br>
+Date: Tue, 27 Jun 2017 13:18:48 -0300
+Subject: [PATCH] column: fix compilation when libc lacks wide-character
+ support
+
+Commit 4762ae9d removed mtsafe_strtok() but left behind calls to wcstok
+and wcspbrk. This leads to build failures when libc does not have the
+wide-character functions, like some uClibc builds.
+
+Solve the broblem by using strtok_r and strpbrk when HAVE_WIDECHAR is
+not defined.
+
+Fixes:
+  http://autobuild.buildroot.net/results/fd8a1a8e0cef3aeed9588540e8e663664f6b43aa
+  http://autobuild.buildroot.net/results/5ad73ea8b471321988c50d80a5e50d4504151dd6
+  http://autobuild.buildroot.net/results/04411b7280dc51ecd51236967981a42352bbeb3e
+
+Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
+---
+ text-utils/column.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/text-utils/column.c b/text-utils/column.c
+index be99f94..fb57b47 100644
+--- a/text-utils/column.c
++++ b/text-utils/column.c
+@@ -160,14 +160,22 @@ static wchar_t *local_wcstok(wchar_t *p, const wchar_t *separator, int greedy, w
+ 	wchar_t *result = NULL;
+ 
+ 	if (greedy)
++#ifdef HAVE_WIDECHAR
+ 		return wcstok(p, separator, state);
++#else
++		return strtok_r(p, separator, state);
++#endif
+ 	if (!p) {
+ 		if (!*state || !**state)
+ 			return NULL;
+ 		p = *state;
+ 	}
+ 	result = p;
++#ifdef HAVE_WIDECHAR
+ 	p = wcspbrk(result, separator);
++#else
++	p = strpbrk(result, separator);
++#endif
+ 	if (!p)
+ 		*state = NULL;
+ 	else {
+-- 
+2.7.5
+
-- 
2.7.5
