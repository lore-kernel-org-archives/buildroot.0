From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 09:37:44 +0200
Subject: [Buildroot] [git commit] uclibc: add a missing function member to
	siginfo.h
Message-ID: <20141012080244.2F164B2211@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=af9d0442cdc8d10e1be55beb02d422194c94a6f9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Applying an upstream patch to add a missing function member on ia64,
mips and sparc arches.

Upstream patch URL:
   http://git.uclibc.org/uClibc/commit/libc/sysdeps/linux?id=b4e6e61e2f7c6fb4bf59f66efaa74591a2112912

Fixes:
   http://autobuild.buildroot.net/results/fa0/fa03ecc087a4b30df8b0366bb238be3d167a56d9/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...9-siginfo_h-add-a-missing-function-member.patch |   66 ++++++++++++++++++++
 ...5-siginfo_h-add-a-missing-function-member.patch |   66 ++++++++++++++++++++
 2 files changed, 132 insertions(+), 0 deletions(-)

diff --git a/package/uclibc/0.9.32.1/uclibc-0009-siginfo_h-add-a-missing-function-member.patch b/package/uclibc/0.9.32.1/uclibc-0009-siginfo_h-add-a-missing-function-member.patch
new file mode 100644
index 0000000..1a837bb
--- /dev/null
+++ b/package/uclibc/0.9.32.1/uclibc-0009-siginfo_h-add-a-missing-function-member.patch
@@ -0,0 +1,66 @@
+siginfo.h: add a missing function member on ia64, mips and sparc arches
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+From b4e6e61e2f7c6fb4bf59f66efaa74591a2112912 Mon Sep 17 00:00:00 2001
+From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Date: Thu, 02 Jan 2014 15:02:11 +0000
+Subject: siginfo.h: add a missing function member on ia64, mips and sparc arches
+
+Add "__pid_t _tid" member which is used for some packages, like rt-test
+for instance, which fails with an error like this one:
+
+src/cyclictest/cyclictest.c:638:9: error: 'union <anonymous>' has no
+member named '_tid'
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
+---
+(limited to 'libc/sysdeps/linux')
+
+diff --git a/libc/sysdeps/linux/ia64/bits/siginfo.h b/libc/sysdeps/linux/ia64/bits/siginfo.h
+index f571f46..82cc73f 100644
+--- a/libc/sysdeps/linux/ia64/bits/siginfo.h
++++ b/libc/sysdeps/linux/ia64/bits/siginfo.h
+@@ -309,6 +309,10 @@ typedef struct sigevent
+       {
+ 	int _pad[__SIGEV_PAD_SIZE];
+ 
++	/* When SIGEV_SIGNAL and SIGEV_THREAD_ID set, LWP ID of the
++	   thread to receive the signal.  */
++	__pid_t _tid;
++
+ 	struct
+ 	  {
+ 	    void (*_function) (sigval_t);	/* Function to start.  */
+diff --git a/libc/sysdeps/linux/mips/bits/siginfo.h b/libc/sysdeps/linux/mips/bits/siginfo.h
+index 79fb15a..84b08ca 100644
+--- a/libc/sysdeps/linux/mips/bits/siginfo.h
++++ b/libc/sysdeps/linux/mips/bits/siginfo.h
+@@ -281,6 +281,10 @@ typedef struct sigevent
+       {
+ 	int _pad[__SIGEV_PAD_SIZE];
+ 
++	/* When SIGEV_SIGNAL and SIGEV_THREAD_ID set, LWP ID of the
++	   thread to receive the signal.  */
++	__pid_t _tid;
++
+ 	struct
+ 	  {
+ 	    void (*_function) (sigval_t);	/* Function to start.  */
+diff --git a/libc/sysdeps/linux/sparc/bits/siginfo.h b/libc/sysdeps/linux/sparc/bits/siginfo.h
+index 6f2d035..3ffeb6d 100644
+--- a/libc/sysdeps/linux/sparc/bits/siginfo.h
++++ b/libc/sysdeps/linux/sparc/bits/siginfo.h
+@@ -288,6 +288,10 @@ typedef struct sigevent
+       {
+ 	int _pad[__SIGEV_PAD_SIZE];
+ 
++	/* When SIGEV_SIGNAL and SIGEV_THREAD_ID set, LWP ID of the
++	   thread to receive the signal.  */
++	__pid_t _tid;
++
+ 	struct
+ 	  {
+ 	    void (*_function) (sigval_t);	/* Function to start.  */
+--
+cgit v0.9.1
diff --git a/package/uclibc/0.9.33.2/uclibc-0055-siginfo_h-add-a-missing-function-member.patch b/package/uclibc/0.9.33.2/uclibc-0055-siginfo_h-add-a-missing-function-member.patch
new file mode 100644
index 0000000..1a837bb
--- /dev/null
+++ b/package/uclibc/0.9.33.2/uclibc-0055-siginfo_h-add-a-missing-function-member.patch
@@ -0,0 +1,66 @@
+siginfo.h: add a missing function member on ia64, mips and sparc arches
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+From b4e6e61e2f7c6fb4bf59f66efaa74591a2112912 Mon Sep 17 00:00:00 2001
+From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Date: Thu, 02 Jan 2014 15:02:11 +0000
+Subject: siginfo.h: add a missing function member on ia64, mips and sparc arches
+
+Add "__pid_t _tid" member which is used for some packages, like rt-test
+for instance, which fails with an error like this one:
+
+src/cyclictest/cyclictest.c:638:9: error: 'union <anonymous>' has no
+member named '_tid'
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
+---
+(limited to 'libc/sysdeps/linux')
+
+diff --git a/libc/sysdeps/linux/ia64/bits/siginfo.h b/libc/sysdeps/linux/ia64/bits/siginfo.h
+index f571f46..82cc73f 100644
+--- a/libc/sysdeps/linux/ia64/bits/siginfo.h
++++ b/libc/sysdeps/linux/ia64/bits/siginfo.h
+@@ -309,6 +309,10 @@ typedef struct sigevent
+       {
+ 	int _pad[__SIGEV_PAD_SIZE];
+ 
++	/* When SIGEV_SIGNAL and SIGEV_THREAD_ID set, LWP ID of the
++	   thread to receive the signal.  */
++	__pid_t _tid;
++
+ 	struct
+ 	  {
+ 	    void (*_function) (sigval_t);	/* Function to start.  */
+diff --git a/libc/sysdeps/linux/mips/bits/siginfo.h b/libc/sysdeps/linux/mips/bits/siginfo.h
+index 79fb15a..84b08ca 100644
+--- a/libc/sysdeps/linux/mips/bits/siginfo.h
++++ b/libc/sysdeps/linux/mips/bits/siginfo.h
+@@ -281,6 +281,10 @@ typedef struct sigevent
+       {
+ 	int _pad[__SIGEV_PAD_SIZE];
+ 
++	/* When SIGEV_SIGNAL and SIGEV_THREAD_ID set, LWP ID of the
++	   thread to receive the signal.  */
++	__pid_t _tid;
++
+ 	struct
+ 	  {
+ 	    void (*_function) (sigval_t);	/* Function to start.  */
+diff --git a/libc/sysdeps/linux/sparc/bits/siginfo.h b/libc/sysdeps/linux/sparc/bits/siginfo.h
+index 6f2d035..3ffeb6d 100644
+--- a/libc/sysdeps/linux/sparc/bits/siginfo.h
++++ b/libc/sysdeps/linux/sparc/bits/siginfo.h
+@@ -288,6 +288,10 @@ typedef struct sigevent
+       {
+ 	int _pad[__SIGEV_PAD_SIZE];
+ 
++	/* When SIGEV_SIGNAL and SIGEV_THREAD_ID set, LWP ID of the
++	   thread to receive the signal.  */
++	__pid_t _tid;
++
+ 	struct
+ 	  {
+ 	    void (*_function) (sigval_t);	/* Function to start.  */
+--
+cgit v0.9.1
