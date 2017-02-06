From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 6 Feb 2017 22:56:53 +0100
Subject: [Buildroot] [git commit] binutils: backport fix for
	xg_reverse_shift_count
Message-ID: <20170206215734.91D0A81F6C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=76e1594f0004098fc01aeac2b9a8292fd8c5c104
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

binutils-2.27 gas has bug that results in the following kind of build
error when assembling bb[cs]i.l on big-endian xtensa targets:

  ieee754-sf.S:237: Error: invalid symbolic operand

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...tensa.c-fixup-xg_reverse_shift_count-typo.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/binutils/2.27/0130-tc-xtensa.c-fixup-xg_reverse_shift_count-typo.patch b/package/binutils/2.27/0130-tc-xtensa.c-fixup-xg_reverse_shift_count-typo.patch
new file mode 100644
index 0000000..7973607
--- /dev/null
+++ b/package/binutils/2.27/0130-tc-xtensa.c-fixup-xg_reverse_shift_count-typo.patch
@@ -0,0 +1,33 @@
+From 78fb7e37eb8bb08ae537d6c487996ff17c810332 Mon Sep 17 00:00:00 2001
+From: Trevor Saunders <tbsaunde+binutils@tbsaunde.org>
+Date: Mon, 26 Sep 2016 12:42:11 -0400
+Subject: [PATCH] tc-xtensa.c: fixup xg_reverse_shift_count typo
+
+gas/ChangeLog:
+
+2016-09-26  Trevor Saunders  <tbsaunde+binutils@tbsaunde.org>
+
+	* config/tc-xtensa.c (xg_reverse_shift_count): Pass cnt_arg instead of
+	cnt_argp to concat.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+---
+ gas/config/tc-xtensa.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gas/config/tc-xtensa.c b/gas/config/tc-xtensa.c
+index d062044..ca261ae 100644
+--- a/gas/config/tc-xtensa.c
++++ b/gas/config/tc-xtensa.c
+@@ -2228,7 +2228,7 @@ xg_reverse_shift_count (char **cnt_argp)
+   cnt_arg = *cnt_argp;
+ 
+   /* replace the argument with "31-(argument)" */
+-  new_arg = concat ("31-(", cnt_argp, ")", (char *) NULL);
++  new_arg = concat ("31-(", cnt_arg, ")", (char *) NULL);
+ 
+   free (cnt_arg);
+   *cnt_argp = new_arg;
+-- 
+2.1.4
+
