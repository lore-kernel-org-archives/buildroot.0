From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Thu, 17 Jul 2014 23:56:54 -0400
Subject: [Buildroot] [PATCH 2/2] ntp: prevent keyword-gen failure during
	ntp_keyword.h check
In-Reply-To: <1405655815-2025-1-git-send-email-danomimanchego123@gmail.com>
References: <1405655815-2025-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <1405655815-2025-2-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

During the first compile, the keyword-gen check is not run.  However,
it gets run on the first rebuild.  Because we are cross-compiling, the
keyword-gen can't run on the host.  Since this is only used to check if
ntp_keyword.h is up to date, we simply drop the check altogether.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

---

Note: "the first rebuild" means "the first 'make ntp-rebuild'"
---
 package/ntp/ntp-003-skip-keyword-check.patch |   56 ++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 package/ntp/ntp-003-skip-keyword-check.patch

diff --git a/package/ntp/ntp-003-skip-keyword-check.patch b/package/ntp/ntp-003-skip-keyword-check.patch
new file mode 100644
index 0000000..dc09fbc
--- /dev/null
+++ b/package/ntp/ntp-003-skip-keyword-check.patch
@@ -0,0 +1,56 @@
+ntp: prevent keyword-gen failure during ntp_keyword.h check
+
+During the first compile, the keyword-gen check is not run.  However,
+it gets run on the first rebuild.  Because we are cross-compiling, the
+keyword-gen can't run on the host.  Since this is only used to check if
+ntp_keyword.h is up to date, we simply drop the check altogether.
+
+Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
+
+
+diff -purN a/ntpd/Makefile.am b/ntpd/Makefile.am
+--- a/ntpd/Makefile.am	2014-07-16 15:16:30.650280205 -0400
++++ b/ntpd/Makefile.am	2014-07-16 15:24:57.256527446 -0400
+@@ -213,17 +213,8 @@ libntpd_a_SOURCES =		\
+ 	refclock_zyfer.c	\
+ 	$(NULL)
+ 
+-k-g-u-submake: keyword-gen
+-	./keyword-gen $(srcdir)/ntp_parser.h > k-g.out
+-	@grep -v diff_ignore_line < k-g.out > cmp1
+-	@grep -v diff_ignore_line < $(srcdir)/ntp_keyword.h > cmp2
+-	@cmp cmp1 cmp2 > /dev/null || \
+-		{ mv -f k-g.out $(srcdir)/ntp_keyword.h && \
+-		  echo 'Generated changed ntp_keyword.h.' ;}
+-	@[ ! -f k-g.out ] || \
+-		{ rm k-g.out && echo 'ntp_keyword.h is up to date.' ;}
+-	@rm cmp1 cmp2
+-	@echo 'keyword-gen and ntp_keyword.h are up to date.' > $@
++k-g-u-submake:
++	# Skip keyword-gen check due to cross-compile
+ 
+ $(srcdir)/keyword-gen-utd: $(srcdir)/keyword-gen.c $(srcdir)/ntp_parser.h
+ 	$(MAKE) k-g-u-submake	# avoid explicit dependency
+diff -purN a/ntpd/Makefile.in b/ntpd/Makefile.in
+--- a/ntpd/Makefile.in	2014-07-16 15:16:30.650280205 -0400
++++ b/ntpd/Makefile.in	2014-07-16 15:25:08.764962071 -0400
+@@ -1182,17 +1182,8 @@ vphack_after:
+ check-local: @MAKE_CHECK_Y2K@ $(CHECK_SAVECONFIG)
+ 	test -z "@MAKE_CHECK_Y2K@" || ./@MAKE_CHECK_Y2K@
+ 
+-k-g-u-submake: keyword-gen
+-	./keyword-gen $(srcdir)/ntp_parser.h > k-g.out
+-	@grep -v diff_ignore_line < k-g.out > cmp1
+-	@grep -v diff_ignore_line < $(srcdir)/ntp_keyword.h > cmp2
+-	@cmp cmp1 cmp2 > /dev/null || \
+-		{ mv -f k-g.out $(srcdir)/ntp_keyword.h && \
+-		  echo 'Generated changed ntp_keyword.h.' ;}
+-	@[ ! -f k-g.out ] || \
+-		{ rm k-g.out && echo 'ntp_keyword.h is up to date.' ;}
+-	@rm cmp1 cmp2
+-	@echo 'keyword-gen and ntp_keyword.h are up to date.' > $@
++k-g-u-submake:
++	# Skip keyword-gen check due to cross-compile
+ 
+ $(srcdir)/keyword-gen-utd: $(srcdir)/keyword-gen.c $(srcdir)/ntp_parser.h
+ 	$(MAKE) k-g-u-submake	# avoid explicit dependency
-- 
1.7.9.5
