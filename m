From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 18 Mar 2016 11:51:24 +0000
Subject: [Buildroot] [PATCH] busybox: bump version to 1.24.2
Message-ID: <1458301884-2946-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

- Remove already upstreamed patches:
  - 0002-unzip.patch
    https://git.busybox.net/busybox/commit/?id=1de25a6e87e0e627aa34298105a3d17c60a1f44e
  - 0003-g-unzip-fix-recent-breakage.patch
    https://git.busybox.net/busybox/commit/?id=6bd3fff51aa74e2ee2d87887b12182a3b09792ef
  - 0004-truncate-open-mode.patch
    https://git.busybox.net/busybox/commit/?id=e111a1640494fe87fc913f94fae3bb805de0fc99

- Rename 0008 patch to 0002 to have patches in a consecutive order
  without gaps.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 ...ags-strip-non-l-arguments-returned-by-pkg.patch |  28 +++++
 package/busybox/0002-unzip.patch                   | 111 -----------------
 .../busybox/0003-g-unzip-fix-recent-breakage.patch | 134 ---------------------
 package/busybox/0004-truncate-open-mode.patch      |  74 ------------
 ...ags-strip-non-l-arguments-returned-by-pkg.patch |  28 -----
 package/busybox/busybox.hash                       |   6 +-
 package/busybox/busybox.mk                         |   2 +-
 7 files changed, 32 insertions(+), 351 deletions(-)
 create mode 100644 package/busybox/0002-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch
 delete mode 100644 package/busybox/0002-unzip.patch
 delete mode 100644 package/busybox/0003-g-unzip-fix-recent-breakage.patch
 delete mode 100644 package/busybox/0004-truncate-open-mode.patch
 delete mode 100644 package/busybox/0008-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch

diff --git a/package/busybox/0002-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch b/package/busybox/0002-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch
new file mode 100644
index 0000000..105626c
--- /dev/null
+++ b/package/busybox/0002-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch
@@ -0,0 +1,28 @@
+From 67eb23d2be8aba3c474dac81a15b0fa11e5847b7 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Mon, 25 Nov 2013 22:51:53 +0100
+Subject: [PATCH] Makefile.flags: strip non -l arguments returned by pkg-config
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Makefile.flags | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.flags b/Makefile.flags
+index 307afa7..885e323 100644
+--- a/Makefile.flags
++++ b/Makefile.flags
+@@ -141,7 +141,9 @@ ifeq ($(CONFIG_SELINUX),y)
+ SELINUX_PC_MODULES = libselinux libsepol
+ $(eval $(call pkg_check_modules,SELINUX,$(SELINUX_PC_MODULES)))
+ CPPFLAGS += $(SELINUX_CFLAGS)
+-LDLIBS += $(if $(SELINUX_LIBS),$(SELINUX_LIBS:-l%=%),$(SELINUX_PC_MODULES:lib%=%))
++LDLIBS += $(if $(SELINUX_LIBS),\
++       $(patsubst -l%,%,$(filter -l%,$(SELINUX_LIBS))),\
++       $(SELINUX_PC_MODULES:lib%=%))
+ endif
+ 
+ ifeq ($(CONFIG_EFENCE),y)
+-- 
+1.8.1.2
+
diff --git a/package/busybox/0002-unzip.patch b/package/busybox/0002-unzip.patch
deleted file mode 100644
index 400e528..0000000
--- a/package/busybox/0002-unzip.patch
+++ /dev/null
@@ -1,111 +0,0 @@
-From 1de25a6e87e0e627aa34298105a3d17c60a1f44e Mon Sep 17 00:00:00 2001
-From: Denys Vlasenko <vda.linux@googlemail.com>
-Date: Mon, 26 Oct 2015 19:33:05 +0100
-Subject: [PATCH] unzip: test for bad archive SEGVing
-
-function                                             old     new   delta
-huft_build                                          1296    1300      +4
-
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- archival/libarchive/decompress_gunzip.c | 11 +++++++----
- testsuite/unzip.tests                   | 23 ++++++++++++++++++++++-
- 2 files changed, 29 insertions(+), 5 deletions(-)
-
-diff --git a/archival/libarchive/decompress_gunzip.c b/archival/libarchive/decompress_gunzip.c
-index 7b6f459..30bf451 100644
---- a/archival/libarchive/decompress_gunzip.c
-+++ b/archival/libarchive/decompress_gunzip.c
-@@ -305,11 +305,12 @@ static int huft_build(const unsigned *b, const unsigned n,
- 	unsigned i;             /* counter, current code */
- 	unsigned j;             /* counter */
- 	int k;                  /* number of bits in current code */
--	unsigned *p;            /* pointer into c[], b[], or v[] */
-+	const unsigned *p;      /* pointer into c[], b[], or v[] */
- 	huft_t *q;              /* points to current table */
- 	huft_t r;               /* table entry for structure assignment */
- 	huft_t *u[BMAX];        /* table stack */
- 	unsigned v[N_MAX];      /* values in order of bit length */
-+	unsigned v_end;
- 	int ws[BMAX + 1];       /* bits decoded stack */
- 	int w;                  /* bits decoded */
- 	unsigned x[BMAX + 1];   /* bit offsets, then code stack */
-@@ -324,7 +325,7 @@ static int huft_build(const unsigned *b, const unsigned n,
- 
- 	/* Generate counts for each bit length */
- 	memset(c, 0, sizeof(c));
--	p = (unsigned *) b; /* cast allows us to reuse p for pointing to b */
-+	p = b;
- 	i = n;
- 	do {
- 		c[*p]++; /* assume all entries <= BMAX */
-@@ -365,12 +366,14 @@ static int huft_build(const unsigned *b, const unsigned n,
- 	}
- 
- 	/* Make a table of values in order of bit lengths */
--	p = (unsigned *) b;
-+	p = b;
- 	i = 0;
-+	v_end = 0;
- 	do {
- 		j = *p++;
- 		if (j != 0) {
- 			v[x[j]++] = i;
-+			v_end = x[j];
- 		}
- 	} while (++i < n);
- 
-@@ -432,7 +435,7 @@ static int huft_build(const unsigned *b, const unsigned n,
- 
- 			/* set up table entry in r */
- 			r.b = (unsigned char) (k - w);
--			if (p >= v + n) {
-+			if (p >= v + v_end) { // Was "if (p >= v + n)" but v[] can be shorter!
- 				r.e = 99; /* out of values--invalid code */
- 			} else if (*p < s) {
- 				r.e = (unsigned char) (*p < 256 ? 16 : 15);	/* 256 is EOB code */
-diff --git a/testsuite/unzip.tests b/testsuite/unzip.tests
-index 8677a03..ca0a458 100755
---- a/testsuite/unzip.tests
-+++ b/testsuite/unzip.tests
-@@ -7,7 +7,7 @@
- 
- . ./testing.sh
- 
--# testing "test name" "options" "expected result" "file input" "stdin"
-+# testing "test name" "commands" "expected result" "file input" "stdin"
- #   file input will be file called "input"
- #   test can create a file "actual" instead of writing to stdout
- 
-@@ -30,6 +30,27 @@ testing "unzip (subdir only)" "unzip -q foo.zip foo/ && test -d foo && test ! -f
- rmdir foo
- rm foo.zip
- 
-+# File containing some damaged encrypted stream
-+testing "unzip (bad archive)" "uudecode; unzip bad.zip 2>&1; echo \$?" \
-+"Archive:  bad.zip
-+  inflating: ]3j?r?IK-%Ix
-+unzip: inflate error
-+1
-+" \
-+"" "\
-+begin-base64 644 bad.zip
-+UEsDBBQAAgkIAAAAIQA5AAAANwAAADwAAAAQAAcAXTNqwr1ywqtJGxJLLSVJ
-+eCkBD0AdKBk8JzQsIj01JC0/ORJQSwMEFAECCAAAAAAhADoAAAAPAAAANgAA
-+AAwAAQASw73Ct1DCokohPXQiNjoUNTUiHRwgLT4WHlBLAQIQABQAAggIAAAA
-+oQA5AAAANwAAADwAAAAQQAcADAAAACwAMgCAAAAAAABdM2rCvXLCq0kbEkst
-+JUl4KQEPQB0oGSY4Cz4QNgEnJSYIPVBLAQIAABQAAggAAAAAIQAqAAAADwAA
-+BDYAAAAMAAEADQAAADIADQAAAEEAAAASw73Ct1DKokohPXQiNzA+FAI1HCcW
-+NzITNFBLBQUKAC4JAA04Cw0EOhZQSwUGAQAABAIAAgCZAAAAeQAAAAIALhM=
-+====
-+"
-+
-+rm *
-+
- # Clean up scratch directory.
- 
- cd ..
--- 
-2.6.2
-
diff --git a/package/busybox/0003-g-unzip-fix-recent-breakage.patch b/package/busybox/0003-g-unzip-fix-recent-breakage.patch
deleted file mode 100644
index 061e2c4..0000000
--- a/package/busybox/0003-g-unzip-fix-recent-breakage.patch
+++ /dev/null
@@ -1,134 +0,0 @@
-From 6bd3fff51aa74e2ee2d87887b12182a3b09792ef Mon Sep 17 00:00:00 2001
-From: Denys Vlasenko <vda.linux@googlemail.com>
-Date: Fri, 30 Oct 2015 23:41:53 +0100
-Subject: [PATCH] [g]unzip: fix recent breakage.
-
-Also, do emit error message we so painstakingly pass from gzip internals
-
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
----
- archival/libarchive/decompress_gunzip.c | 33 +++++++++++++++++++++------------
- testsuite/unzip.tests                   |  1 +
- 2 files changed, 22 insertions(+), 12 deletions(-)
-
-diff --git a/archival/libarchive/decompress_gunzip.c b/archival/libarchive/decompress_gunzip.c
-index 30bf451..20e4d9a 100644
---- a/archival/libarchive/decompress_gunzip.c
-+++ b/archival/libarchive/decompress_gunzip.c
-@@ -309,8 +309,7 @@ static int huft_build(const unsigned *b, const unsigned n,
- 	huft_t *q;              /* points to current table */
- 	huft_t r;               /* table entry for structure assignment */
- 	huft_t *u[BMAX];        /* table stack */
--	unsigned v[N_MAX];      /* values in order of bit length */
--	unsigned v_end;
-+	unsigned v[N_MAX + 1];  /* values in order of bit length. last v[] is never used */
- 	int ws[BMAX + 1];       /* bits decoded stack */
- 	int w;                  /* bits decoded */
- 	unsigned x[BMAX + 1];   /* bit offsets, then code stack */
-@@ -365,15 +364,17 @@ static int huft_build(const unsigned *b, const unsigned n,
- 		*xp++ = j;
- 	}
- 
--	/* Make a table of values in order of bit lengths */
-+	/* Make a table of values in order of bit lengths.
-+	 * To detect bad input, unused v[i]'s are set to invalid value UINT_MAX.
-+	 * In particular, last v[i] is never filled and must not be accessed.
-+	 */
-+	memset(v, 0xff, sizeof(v));
- 	p = b;
- 	i = 0;
--	v_end = 0;
- 	do {
- 		j = *p++;
- 		if (j != 0) {
- 			v[x[j]++] = i;
--			v_end = x[j];
- 		}
- 	} while (++i < n);
- 
-@@ -435,7 +436,9 @@ static int huft_build(const unsigned *b, const unsigned n,
- 
- 			/* set up table entry in r */
- 			r.b = (unsigned char) (k - w);
--			if (p >= v + v_end) { // Was "if (p >= v + n)" but v[] can be shorter!
-+			if (/*p >= v + n || -- redundant, caught by the second check: */
-+			    *p == UINT_MAX /* do we access uninited v[i]? (see memset(v))*/
-+			) {
- 				r.e = 99; /* out of values--invalid code */
- 			} else if (*p < s) {
- 				r.e = (unsigned char) (*p < 256 ? 16 : 15);	/* 256 is EOB code */
-@@ -520,8 +523,9 @@ static NOINLINE int inflate_codes(STATE_PARAM_ONLY)
- 		e = t->e;
- 		if (e > 16)
- 			do {
--				if (e == 99)
--					abort_unzip(PASS_STATE_ONLY);;
-+				if (e == 99) {
-+					abort_unzip(PASS_STATE_ONLY);
-+				}
- 				bb >>= t->b;
- 				k -= t->b;
- 				e -= 16;
-@@ -557,8 +561,9 @@ static NOINLINE int inflate_codes(STATE_PARAM_ONLY)
- 			e = t->e;
- 			if (e > 16)
- 				do {
--					if (e == 99)
-+					if (e == 99) {
- 						abort_unzip(PASS_STATE_ONLY);
-+					}
- 					bb >>= t->b;
- 					k -= t->b;
- 					e -= 16;
-@@ -824,8 +829,9 @@ static int inflate_block(STATE_PARAM smallint *e)
- 
- 		b_dynamic >>= 4;
- 		k_dynamic -= 4;
--		if (nl > 286 || nd > 30)
-+		if (nl > 286 || nd > 30) {
- 			abort_unzip(PASS_STATE_ONLY);	/* bad lengths */
-+		}
- 
- 		/* read in bit-length-code lengths */
- 		for (j = 0; j < nb; j++) {
-@@ -906,12 +912,14 @@ static int inflate_block(STATE_PARAM smallint *e)
- 		bl = lbits;
- 
- 		i = huft_build(ll, nl, 257, cplens, cplext, &inflate_codes_tl, &bl);
--		if (i != 0)
-+		if (i != 0) {
- 			abort_unzip(PASS_STATE_ONLY);
-+		}
- 		bd = dbits;
- 		i = huft_build(ll + nl, nd, 0, cpdist, cpdext, &inflate_codes_td, &bd);
--		if (i != 0)
-+		if (i != 0) {
- 			abort_unzip(PASS_STATE_ONLY);
-+		}
- 
- 		/* set up data for inflate_codes() */
- 		inflate_codes_setup(PASS_STATE bl, bd);
-@@ -999,6 +1007,7 @@ inflate_unzip_internal(STATE_PARAM transformer_state_t *xstate)
- 	error_msg = "corrupted data";
- 	if (setjmp(error_jmp)) {
- 		/* Error from deep inside zip machinery */
-+		bb_error_msg(error_msg);
- 		n = -1;
- 		goto ret;
- 	}
-diff --git a/testsuite/unzip.tests b/testsuite/unzip.tests
-index ca0a458..d8738a3 100755
---- a/testsuite/unzip.tests
-+++ b/testsuite/unzip.tests
-@@ -34,6 +34,7 @@ rm foo.zip
- testing "unzip (bad archive)" "uudecode; unzip bad.zip 2>&1; echo \$?" \
- "Archive:  bad.zip
-   inflating: ]3j?r?IK-%Ix
-+unzip: corrupted data
- unzip: inflate error
- 1
- " \
--- 
-2.6.2
-
diff --git a/package/busybox/0004-truncate-open-mode.patch b/package/busybox/0004-truncate-open-mode.patch
deleted file mode 100644
index f0dc6d1..0000000
--- a/package/busybox/0004-truncate-open-mode.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From be729c1d3b5c923f10871dd68ea94156d0f8c803 Mon Sep 17 00:00:00 2001
-From: Ari Sundholm <ari@tuxera.com>
-Date: Mon, 4 Jan 2016 15:40:37 +0200
-Subject: [PATCH] truncate: always set mode when opening file to avoid fortify
- errors
-
-Busybox crashes due to no mode being given when opening:
-$ ./busybox truncate -s 1M foo
-*** invalid open64 call: O_CREAT without mode ***: ./busybox terminated
-======= Backtrace: =========
-/lib/x86_64-linux-gnu/libc.so.6(+0x7338f)[0x7f66d921338f]
-/lib/x86_64-linux-gnu/libc.so.6(__fortify_fail+0x5c)[0x7f66d92aac9c]
-/lib/x86_64-linux-gnu/libc.so.6(+0xeb6aa)[0x7f66d928b6aa]
-./busybox[0x4899f9]
-======= Memory map: ========
-00400000-004d0000 r-xp 00000000 00:1a 137559                             /home/ari/busybox/busybox
-006cf000-006d0000 r--p 000cf000 00:1a 137559                             /home/ari/busybox/busybox
-006d0000-006d1000 rw-p 000d0000 00:1a 137559                             /home/ari/busybox/busybox
-006d1000-006d4000 rw-p 00000000 00:00 0
-014e7000-01508000 rw-p 00000000 00:00 0                                  [heap]
-7f66d8f8a000-7f66d8fa0000 r-xp 00000000 08:07 1579008                    /lib/x86_64-linux-gnu/libgcc_s.so.1
-7f66d8fa0000-7f66d919f000 ---p 00016000 08:07 1579008                    /lib/x86_64-linux-gnu/libgcc_s.so.1
-7f66d919f000-7f66d91a0000 rw-p 00015000 08:07 1579008                    /lib/x86_64-linux-gnu/libgcc_s.so.1
-7f66d91a0000-7f66d935b000 r-xp 00000000 08:07 1578994                    /lib/x86_64-linux-gnu/libc-2.19.so
-7f66d935b000-7f66d955a000 ---p 001bb000 08:07 1578994                    /lib/x86_64-linux-gnu/libc-2.19.so
-7f66d955a000-7f66d955e000 r--p 001ba000 08:07 1578994                    /lib/x86_64-linux-gnu/libc-2.19.so
-7f66d955e000-7f66d9560000 rw-p 001be000 08:07 1578994                    /lib/x86_64-linux-gnu/libc-2.19.so
-7f66d9560000-7f66d9565000 rw-p 00000000 00:00 0
-7f66d9565000-7f66d966a000 r-xp 00000000 08:07 1579020                    /lib/x86_64-linux-gnu/libm-2.19.so
-7f66d966a000-7f66d9869000 ---p 00105000 08:07 1579020                    /lib/x86_64-linux-gnu/libm-2.19.so
-7f66d9869000-7f66d986a000 r--p 00104000 08:07 1579020                    /lib/x86_64-linux-gnu/libm-2.19.so
-7f66d986a000-7f66d986b000 rw-p 00105000 08:07 1579020                    /lib/x86_64-linux-gnu/libm-2.19.so
-7f66d986b000-7f66d988e000 r-xp 00000000 08:07 1578981                    /lib/x86_64-linux-gnu/ld-2.19.so
-7f66d9a64000-7f66d9a67000 rw-p 00000000 00:00 0
-7f66d9a8a000-7f66d9a8d000 rw-p 00000000 00:00 0
-7f66d9a8d000-7f66d9a8e000 r--p 00022000 08:07 1578981                    /lib/x86_64-linux-gnu/ld-2.19.so
-7f66d9a8e000-7f66d9a8f000 rw-p 00023000 08:07 1578981                    /lib/x86_64-linux-gnu/ld-2.19.so
-7f66d9a8f000-7f66d9a90000 rw-p 00000000 00:00 0
-7ffc47761000-7ffc47782000 rw-p 00000000 00:00 0                          [stack]
-7ffc477ab000-7ffc477ad000 r-xp 00000000 00:00 0                          [vdso]
-ffffffffff600000-ffffffffff601000 r-xp 00000000 00:00 0                  [vsyscall]
-Aborted (core dumped)
-$
-
-Fix this by simply always setting the mode, as it doesn't hurt even
-when O_CREAT is not specified.
-
-This bug is a regression introduced in fc3e40e, as xopen(), which
-was originally used, would automatically set the mode.
-
-Signed-off-by: Ari Sundholm <ari@tuxera.com>
-Signed-off-by: Mike Frysinger <vapier@gentoo.org>
-(cherry picked from commit e111a1640494fe87fc913f94fae3bb805de0fc99)
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- coreutils/truncate.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/coreutils/truncate.c b/coreutils/truncate.c
-index e5fa656..4c997bf 100644
---- a/coreutils/truncate.c
-+++ b/coreutils/truncate.c
-@@ -64,7 +64,7 @@ int truncate_main(int argc UNUSED_PARAM, char **argv)
- 
- 	argv += optind;
- 	while (*argv) {
--		int fd = open(*argv, flags);
-+		int fd = open(*argv, flags, 0666);
- 		if (fd < 0) {
- 			if (errno != ENOENT || !(opts & OPT_NOCREATE)) {
- 				bb_perror_msg("%s: open", *argv);
--- 
-2.6.2
-
diff --git a/package/busybox/0008-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch b/package/busybox/0008-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch
deleted file mode 100644
index 105626c..0000000
--- a/package/busybox/0008-Makefile.flags-strip-non-l-arguments-returned-by-pkg.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 67eb23d2be8aba3c474dac81a15b0fa11e5847b7 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Mon, 25 Nov 2013 22:51:53 +0100
-Subject: [PATCH] Makefile.flags: strip non -l arguments returned by pkg-config
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- Makefile.flags | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.flags b/Makefile.flags
-index 307afa7..885e323 100644
---- a/Makefile.flags
-+++ b/Makefile.flags
-@@ -141,7 +141,9 @@ ifeq ($(CONFIG_SELINUX),y)
- SELINUX_PC_MODULES = libselinux libsepol
- $(eval $(call pkg_check_modules,SELINUX,$(SELINUX_PC_MODULES)))
- CPPFLAGS += $(SELINUX_CFLAGS)
--LDLIBS += $(if $(SELINUX_LIBS),$(SELINUX_LIBS:-l%=%),$(SELINUX_PC_MODULES:lib%=%))
-+LDLIBS += $(if $(SELINUX_LIBS),\
-+       $(patsubst -l%,%,$(filter -l%,$(SELINUX_LIBS))),\
-+       $(SELINUX_PC_MODULES:lib%=%))
- endif
- 
- ifeq ($(CONFIG_EFENCE),y)
--- 
-1.8.1.2
-
diff --git a/package/busybox/busybox.hash b/package/busybox/busybox.hash
index 99fb8e4..4f8d0d6 100644
--- a/package/busybox/busybox.hash
+++ b/package/busybox/busybox.hash
@@ -1,3 +1,3 @@
-# From http://busybox.net/downloads/busybox-1.24.1.tar.bz2.sign
-md5 be98a40cadf84ce2d6b05fa41a275c6a  busybox-1.24.1.tar.bz2
-sha1 157d14d24748b4505b1a418535688706a2b81680  busybox-1.24.1.tar.bz2
+# From http://busybox.net/downloads/busybox-1.24.2.tar.bz2.sign
+md5 2eaae519cac1143bcf583636a745381f  busybox-1.24.2.tar.bz2
+sha1 03e6cfc8ddb2f709f308719a9b9f4818bc0a28d0  busybox-1.24.2.tar.bz2
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 7c904c8..c7fb8b4 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUSYBOX_VERSION = 1.24.1
+BUSYBOX_VERSION = 1.24.2
 BUSYBOX_SITE = http://www.busybox.net/downloads
 BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
 BUSYBOX_LICENSE = GPLv2
-- 
2.7.3
