From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Mar 2017 22:37:51 +0100
Subject: [Buildroot] [git commit] glibc: drop version 2.22
Message-ID: <20170301213831.A97A982234@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a75eeddd7cc03f62fdb23c48e09a407867d1cf6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We don't want a dozen glibc versions and there's no particular reason to
keep this old version around so drop it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
[Thomas: add entry to Config.in.legacy.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                                   |  10 +
 package/glibc/2.22/0001-fix-CVE-2015-7547.patch    | 236 ---------------------
 .../0002-microblaze-include-unix-sysdep.h.patch    |  43 ----
 package/glibc/2.22/0003-fix-CVE-2016-3075.patch    |  44 ----
 ...-fix-wrong-vfork-aliases-in-libpthread.so.patch |  76 -------
 ...more-fixes-to-the-vfork-aliases-in-libpth.patch | 122 -----------
 package/glibc/Config.in                            |   6 -
 package/glibc/glibc.hash                           |   1 -
 8 files changed, 10 insertions(+), 528 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 20445b8..4962b92 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -143,6 +143,16 @@ comment "----------------------------------------------------"
 endif
 
 ###############################################################################
+comment "Legacy options removed in 2017.05"
+
+config BR2_GLIBC_VERSION_2_22
+	bool "glibc 2.22 removed"
+	select BR2_LEGACY
+	help
+	  Support for glibc version 2.22 has been removed. The current
+	  default version has been selected instead.
+
+###############################################################################
 comment "Legacy options removed in 2017.02"
 
 config BR2_PACKAGE_PERL_DB_FILE
diff --git a/package/glibc/2.22/0001-fix-CVE-2015-7547.patch b/package/glibc/2.22/0001-fix-CVE-2015-7547.patch
deleted file mode 100644
index 19b8b6e..0000000
--- a/package/glibc/2.22/0001-fix-CVE-2015-7547.patch
+++ /dev/null
@@ -1,236 +0,0 @@
-Fetched from gentoo glibc patchball
-Original patch filename: 10_all_glibc-CVE-2015-7547.patch
-Based on: https://sourceware.org/ml/libc-alpha/2016-02/msg00416.html
-
-Fixes:
-CVE-2015-7547 - glibc getaddrinfo stack-based buffer overflow.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
---- a/resolv/nss_dns/dns-host.c
-+++ b/resolv/nss_dns/dns-host.c
-@@ -1031,7 +1031,10 @@ gaih_getanswer_slice (const querybuf *answer, int anslen, const char *qname,
-   int h_namelen = 0;
- 
-   if (ancount == 0)
--    return NSS_STATUS_NOTFOUND;
-+    {
-+      *h_errnop = HOST_NOT_FOUND;
-+      return NSS_STATUS_NOTFOUND;
-+    }
- 
-   while (ancount-- > 0 && cp < end_of_message && had_error == 0)
-     {
-@@ -1208,7 +1211,14 @@ gaih_getanswer_slice (const querybuf *answer, int anslen, const char *qname,
-   /* Special case here: if the resolver sent a result but it only
-      contains a CNAME while we are looking for a T_A or T_AAAA record,
-      we fail with NOTFOUND instead of TRYAGAIN.  */
--  return canon == NULL ? NSS_STATUS_TRYAGAIN : NSS_STATUS_NOTFOUND;
-+  if (canon != NULL)
-+    {
-+      *h_errnop = HOST_NOT_FOUND;
-+      return NSS_STATUS_NOTFOUND;
-+    }
-+
-+  *h_errnop = NETDB_INTERNAL;
-+  return NSS_STATUS_TRYAGAIN;
- }
- 
- 
-@@ -1242,8 +1252,15 @@ gaih_getanswer (const querybuf *answer1, int anslen1, const querybuf *answer2,
- 						     &pat, &buffer, &buflen,
- 						     errnop, h_errnop, ttlp,
- 						     &first);
-+      /* Use the second response status in some cases.  */
-       if (status != NSS_STATUS_SUCCESS && status2 != NSS_STATUS_NOTFOUND)
- 	status = status2;
-+      /* Do not return a truncated second response (unless it was
-+         unavoidable e.g. unrecoverable TRYAGAIN).  */
-+      if (status == NSS_STATUS_SUCCESS
-+	  && (status2 == NSS_STATUS_TRYAGAIN
-+	      && *errnop == ERANGE && *h_errnop != NO_RECOVERY))
-+	status = NSS_STATUS_TRYAGAIN;
-     }
- 
-   return status;
---- a/resolv/res_query.c
-+++ b/resolv/res_query.c
-@@ -396,6 +396,7 @@ __libc_res_nsearch(res_state statp,
- 		  {
- 		    free (*answerp2);
- 		    *answerp2 = NULL;
-+		    *nanswerp2 = 0;
- 		    *answerp2_malloced = 0;
- 		  }
- 	}
-@@ -447,6 +448,7 @@ __libc_res_nsearch(res_state statp,
- 			  {
- 			    free (*answerp2);
- 			    *answerp2 = NULL;
-+			    *nanswerp2 = 0;
- 			    *answerp2_malloced = 0;
- 			  }
- 
-@@ -521,6 +523,7 @@ __libc_res_nsearch(res_state statp,
- 	  {
- 	    free (*answerp2);
- 	    *answerp2 = NULL;
-+	    *nanswerp2 = 0;
- 	    *answerp2_malloced = 0;
- 	  }
- 	if (saved_herrno != -1)
---- a/resolv/res_send.c
-+++ b/resolv/res_send.c
-@@ -639,11 +639,7 @@ send_vc(res_state statp,
- {
- 	const HEADER *hp = (HEADER *) buf;
- 	const HEADER *hp2 = (HEADER *) buf2;
--	u_char *ans = *ansp;
--	int orig_anssizp = *anssizp;
--	// XXX REMOVE
--	// int anssiz = *anssizp;
--	HEADER *anhp = (HEADER *) ans;
-+	HEADER *anhp = (HEADER *) *ansp;
- 	struct sockaddr *nsap = get_nsaddr (statp, ns);
- 	int truncating, connreset, n;
- 	/* On some architectures compiler might emit a warning indicating
-@@ -767,35 +763,6 @@ send_vc(res_state statp,
- 		assert (anscp != NULL || ansp2 == NULL);
- 		thisresplenp = &resplen;
- 	} else {
--		if (*anssizp != MAXPACKET) {
--			/* No buffer allocated for the first
--			   reply.  We can try to use the rest
--			   of the user-provided buffer.  */
--#if __GNUC_PREREQ (4, 7)
--			DIAG_PUSH_NEEDS_COMMENT;
--			DIAG_IGNORE_NEEDS_COMMENT (5, "-Wmaybe-uninitialized");
--#endif
--#if _STRING_ARCH_unaligned
--			*anssizp2 = orig_anssizp - resplen;
--			*ansp2 = *ansp + resplen;
--#else
--			int aligned_resplen
--			  = ((resplen + __alignof__ (HEADER) - 1)
--			     & ~(__alignof__ (HEADER) - 1));
--			*anssizp2 = orig_anssizp - aligned_resplen;
--			*ansp2 = *ansp + aligned_resplen;
--#endif
--#if __GNUC_PREREQ (4, 7)
--			DIAG_POP_NEEDS_COMMENT;
--#endif
--		} else {
--			/* The first reply did not fit into the
--			   user-provided buffer.  Maybe the second
--			   answer will.  */
--			*anssizp2 = orig_anssizp;
--			*ansp2 = *ansp;
--		}
--
- 		thisanssizp = anssizp2;
- 		thisansp = ansp2;
- 		thisresplenp = resplen2;
-@@ -804,10 +771,14 @@ send_vc(res_state statp,
- 	anhp = (HEADER *) *thisansp;
- 
- 	*thisresplenp = rlen;
--	if (rlen > *thisanssizp) {
--		/* Yes, we test ANSCP here.  If we have two buffers
--		   both will be allocatable.  */
--		if (__glibc_likely (anscp != NULL))       {
-+	/* Is the answer buffer too small?  */
-+	if (*thisanssizp < rlen) {
-+		/* If the current buffer is not the the static
-+		   user-supplied buffer then we can reallocate
-+		   it.  */
-+		if (thisansp != NULL && thisansp != ansp) {
-+			/* Always allocate MAXPACKET, callers expect
-+			   this specific size.  */
- 			u_char *newp = malloc (MAXPACKET);
- 			if (newp == NULL) {
- 				*terrno = ENOMEM;
-@@ -957,8 +928,6 @@ send_dg(res_state statp,
- {
- 	const HEADER *hp = (HEADER *) buf;
- 	const HEADER *hp2 = (HEADER *) buf2;
--	u_char *ans = *ansp;
--	int orig_anssizp = *anssizp;
- 	struct timespec now, timeout, finish;
- 	struct pollfd pfd[1];
- 	int ptimeout;
-@@ -1154,50 +1123,48 @@ send_dg(res_state statp,
- 			assert (anscp != NULL || ansp2 == NULL);
- 			thisresplenp = &resplen;
- 		} else {
--			if (*anssizp != MAXPACKET) {
--				/* No buffer allocated for the first
--				   reply.  We can try to use the rest
--				   of the user-provided buffer.  */
--#if _STRING_ARCH_unaligned
--				*anssizp2 = orig_anssizp - resplen;
--				*ansp2 = *ansp + resplen;
--#else
--				int aligned_resplen
--				  = ((resplen + __alignof__ (HEADER) - 1)
--				     & ~(__alignof__ (HEADER) - 1));
--				*anssizp2 = orig_anssizp - aligned_resplen;
--				*ansp2 = *ansp + aligned_resplen;
--#endif
--			} else {
--				/* The first reply did not fit into the
--				   user-provided buffer.  Maybe the second
--				   answer will.  */
--				*anssizp2 = orig_anssizp;
--				*ansp2 = *ansp;
--			}
--
- 			thisanssizp = anssizp2;
- 			thisansp = ansp2;
- 			thisresplenp = resplen2;
- 		}
- 
- 		if (*thisanssizp < MAXPACKET
--		    /* Yes, we test ANSCP here.  If we have two buffers
--		       both will be allocatable.  */
--		    && anscp
-+		    /* If the current buffer is not the the static
-+		       user-supplied buffer then we can reallocate
-+		       it.  */
-+		    && (thisansp != NULL && thisansp != ansp)
- #ifdef FIONREAD
-+		    /* Is the size too small?  */
- 		    && (ioctl (pfd[0].fd, FIONREAD, thisresplenp) < 0
- 			|| *thisanssizp < *thisresplenp)
- #endif
-                     ) {
-+			/* Always allocate MAXPACKET, callers expect
-+			   this specific size.  */
- 			u_char *newp = malloc (MAXPACKET);
- 			if (newp != NULL) {
--				*anssizp = MAXPACKET;
--				*thisansp = ans = newp;
-+				*thisanssizp = MAXPACKET;
-+				*thisansp = newp;
- 				if (thisansp == ansp2)
- 				  *ansp2_malloced = 1;
- 			}
- 		}
-+		/* We could end up with truncation if anscp was NULL
-+		   (not allowed to change caller's buffer) and the
-+		   response buffer size is too small.  This isn't a
-+		   reliable way to detect truncation because the ioctl
-+		   may be an inaccurate report of the UDP message size.
-+		   Therefore we use this only to issue debug output.
-+		   To do truncation accurately with UDP we need
-+		   MSG_TRUNC which is only available on Linux.  We
-+		   can abstract out the Linux-specific feature in the
-+		   future to detect truncation.  */
-+		if (__glibc_unlikely (*thisanssizp < *thisresplenp)) {
-+			Dprint(statp->options & RES_DEBUG,
-+			       (stdout, ";; response may be truncated (UDP)\n")
-+			);
-+		}
-+
- 		HEADER *anhp = (HEADER *) *thisansp;
- 		socklen_t fromlen = sizeof(struct sockaddr_in6);
- 		assert (sizeof(from) <= fromlen);
diff --git a/package/glibc/2.22/0002-microblaze-include-unix-sysdep.h.patch b/package/glibc/2.22/0002-microblaze-include-unix-sysdep.h.patch
deleted file mode 100644
index 28f4b6e..0000000
--- a/package/glibc/2.22/0002-microblaze-include-unix-sysdep.h.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 8415fb8d4f05c023b9d79e44dff197cc285fd1e5 Mon Sep 17 00:00:00 2001
-From: Mike Frysinger <vapier@gentoo.org>
-Date: Thu, 6 Aug 2015 02:10:46 -0400
-Subject: [PATCH] microblaze: include unix/sysdep.h
-
-The semi-recent SYSCALL_CANCEL inclusion broke microblaze due to the
-sysdep.h header not including the unix/sysdep.h header.  Include it
-here like all other ports.
-
-(cherry picked from commit 5d5de49c3ccd69f65b801f1ca490a0112d1cbd7d)
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-[edited to remove ChangeLog modifications, which cause conflicts.]
----
- sysdeps/unix/sysv/linux/microblaze/sysdep.h | 7 ++++++-
- 2 files changed, 12 insertions(+), 1 deletion(-)
-
-diff --git a/sysdeps/unix/sysv/linux/microblaze/sysdep.h b/sysdeps/unix/sysv/linux/microblaze/sysdep.h
-index 83c0340..9d5c542 100644
---- a/sysdeps/unix/sysv/linux/microblaze/sysdep.h
-+++ b/sysdeps/unix/sysv/linux/microblaze/sysdep.h
-@@ -16,8 +16,11 @@
-    License along with the GNU C Library; if not, see
-    <http://www.gnu.org/licenses/>.  */
- 
-+#ifndef _LINUX_MICROBLAZE_SYSDEP_H
-+#define _LINUX_MICROBLAZE_SYSDEP_H 1
-+
-+#include <sysdeps/unix/sysdep.h>
- #include <sysdeps/microblaze/sysdep.h>
--#include <sys/syscall.h>
- 
- /* Defines RTLD_PRIVATE_ERRNO.  */
- #include <dl-sysdep.h>
-@@ -305,3 +308,5 @@ SYSCALL_ERROR_LABEL_DCL:                            \
- # define PTR_DEMANGLE(var) (void) (var)
- 
- #endif /* not __ASSEMBLER__ */
-+
-+#endif /* _LINUX_MICROBLAZE_SYSDEP_H */
--- 
-2.6.4
-
diff --git a/package/glibc/2.22/0003-fix-CVE-2016-3075.patch b/package/glibc/2.22/0003-fix-CVE-2016-3075.patch
deleted file mode 100644
index 1ceb1f6..0000000
--- a/package/glibc/2.22/0003-fix-CVE-2016-3075.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 883dceebc8f11921a9890211a4e202e5be17562f Mon Sep 17 00:00:00 2001
-From: Florian Weimer <fweimer@redhat.com>
-Date: Tue, 29 Mar 2016 12:57:56 +0200
-Subject: [PATCH 1/1] CVE-2016-3075: Stack overflow in _nss_dns_getnetbyname_r [BZ #19879]
-
-The defensive copy is not needed because the name may not alias the
-output buffer.
-
-(cherry picked from commit 317b199b4aff8cfa27f2302ab404d2bb5032b9a4)
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-(downloaded from upstream git repo and removed changes to Changelog:
- https://sourceware.org/git/gitweb.cgi?p=glibc.git;a=commitdiff;h=883dceebc8f11921a9890211a4e202e5be17562f;hp=5a1a5f0dd2744044801c91bf2588444c29cda533)
----
- ChangeLog                    |    7 +++++++
- resolv/nss_dns/dns-network.c |    5 +----
- 2 files changed, 8 insertions(+), 4 deletions(-)
-
-diff --git a/resolv/nss_dns/dns-network.c b/resolv/nss_dns/dns-network.c
-index 00f4490..89f8783 100644
---- a/resolv/nss_dns/dns-network.c
-+++ b/resolv/nss_dns/dns-network.c
-@@ -118,17 +118,14 @@ _nss_dns_getnetbyname_r (const char *name, struct netent *result,
-   } net_buffer;
-   querybuf *orig_net_buffer;
-   int anslen;
--  char *qbuf;
-   enum nss_status status;
- 
-   if (__res_maybe_init (&_res, 0) == -1)
-     return NSS_STATUS_UNAVAIL;
- 
--  qbuf = strdupa (name);
--
-   net_buffer.buf = orig_net_buffer = (querybuf *) alloca (1024);
- 
--  anslen = __libc_res_nsearch (&_res, qbuf, C_IN, T_PTR, net_buffer.buf->buf,
-+  anslen = __libc_res_nsearch (&_res, name, C_IN, T_PTR, net_buffer.buf->buf,
- 			       1024, &net_buffer.ptr, NULL, NULL, NULL, NULL);
-   if (anslen < 0)
-     {
--- 
-1.7.1
-
diff --git a/package/glibc/2.22/0004-MIPS-SPARC-fix-wrong-vfork-aliases-in-libpthread.so.patch b/package/glibc/2.22/0004-MIPS-SPARC-fix-wrong-vfork-aliases-in-libpthread.so.patch
deleted file mode 100644
index 740b322..0000000
--- a/package/glibc/2.22/0004-MIPS-SPARC-fix-wrong-vfork-aliases-in-libpthread.so.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-From 43c2948756bb6e144c7b871e827bba37d61ad3a3 Mon Sep 17 00:00:00 2001
-From: Aurelien Jarno <aurelien@aurel32.net>
-Date: Sat, 18 Jun 2016 19:11:23 +0200
-Subject: [PATCH] MIPS, SPARC: fix wrong vfork aliases in libpthread.so
-
-With recent binutils versions the GNU libc fails to build on at least
-MISP and SPARC, with this kind of error:
-
-  /home/aurel32/glibc/glibc-build/nptl/libpthread.so:(*IND*+0x0): multiple definition of `vfork at GLIBC_2.0'
-  /home/aurel32/glibc/glibc-build/nptl/libpthread.so::(.text+0xee50): first defined here
-
-It appears that on these architectures pt-vfork.S includes vfork.S
-(through the alpha version of pt-vfork.S) and that the __vfork aliases
-are not conditionalized on IS_IN (libc) like on other architectures.
-Therefore the aliases are also wrongly included in libpthread.so.
-
-Fix this by properly conditionalizing the aliases like on other
-architectures.
-
-Changelog:
-	* sysdeps/unix/sysv/linux/mips/vfork.S (__vfork): Conditionalize
-	hidden_def, weak_alias and strong_alias on [IS_IN (libc)].
-	* sysdeps/unix/sysv/linux/sparc/sparc32/vfork.S: Likewise.
-	* sysdeps/unix/sysv/linux/sparc/sparc64/vfork.S: Likewise.
-
-[Vincent: do not patch ChangeLog]
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
----
- sysdeps/unix/sysv/linux/mips/vfork.S          | 2 ++
- sysdeps/unix/sysv/linux/sparc/sparc32/vfork.S | 2 ++
- sysdeps/unix/sysv/linux/sparc/sparc64/vfork.S | 2 ++
- 3 files changed, 6 insertions(+)
-
-diff --git a/sysdeps/unix/sysv/linux/mips/vfork.S b/sysdeps/unix/sysv/linux/mips/vfork.S
-index 8c66151..c0c0ce6 100644
---- a/sysdeps/unix/sysv/linux/mips/vfork.S
-+++ b/sysdeps/unix/sysv/linux/mips/vfork.S
-@@ -106,6 +106,8 @@ L(error):
- #endif
- 	END(__vfork)
- 
-+#if IS_IN (libc)
- libc_hidden_def(__vfork)
- weak_alias (__vfork, vfork)
- strong_alias (__vfork, __libc_vfork)
-+#endif
-diff --git a/sysdeps/unix/sysv/linux/sparc/sparc32/vfork.S b/sysdeps/unix/sysv/linux/sparc/sparc32/vfork.S
-index dc32e0a..94f2c8d 100644
---- a/sysdeps/unix/sysv/linux/sparc/sparc32/vfork.S
-+++ b/sysdeps/unix/sysv/linux/sparc/sparc32/vfork.S
-@@ -44,6 +44,8 @@ ENTRY(__vfork)
- 	 nop
- END(__vfork)
- 
-+#if IS_IN (libc)
- libc_hidden_def (__vfork)
- weak_alias (__vfork, vfork)
- strong_alias (__vfork, __libc_vfork)
-+#endif
-diff --git a/sysdeps/unix/sysv/linux/sparc/sparc64/vfork.S b/sysdeps/unix/sysv/linux/sparc/sparc64/vfork.S
-index 05be3c2..a7479e9 100644
---- a/sysdeps/unix/sysv/linux/sparc/sparc64/vfork.S
-+++ b/sysdeps/unix/sysv/linux/sparc/sparc64/vfork.S
-@@ -44,6 +44,8 @@ ENTRY(__vfork)
- 	 nop
- END(__vfork)
- 
-+#if IS_IN (libc)
- libc_hidden_def (__vfork)
- weak_alias (__vfork, vfork)
- strong_alias (__vfork, __libc_vfork)
-+#endif
--- 
-2.7.3
-
diff --git a/package/glibc/2.22/0005-MIPS-SPARC-more-fixes-to-the-vfork-aliases-in-libpth.patch b/package/glibc/2.22/0005-MIPS-SPARC-more-fixes-to-the-vfork-aliases-in-libpth.patch
deleted file mode 100644
index 3c53f6d..0000000
--- a/package/glibc/2.22/0005-MIPS-SPARC-more-fixes-to-the-vfork-aliases-in-libpth.patch
+++ /dev/null
@@ -1,122 +0,0 @@
-From b87c1ec3fa398646f042a68f0ce0f7d09c1348c7 Mon Sep 17 00:00:00 2001
-From: Aurelien Jarno <aurelien@aurel32.net>
-Date: Tue, 21 Jun 2016 23:59:37 +0200
-Subject: [PATCH] MIPS, SPARC: more fixes to the vfork aliases in libpthread.so
-
-Commit 43c29487 tried to fix the vfork aliases in libpthread.so on MIPS
-and SPARC, but failed to do it correctly, introducing an ABI change.
-
-This patch does the remaining changes needed to align the MIPS and SPARC
-vfork implementations with the other architectures. That way the the
-alpha version of pt-vfork.S works correctly for MIPS and SPARC. The
-changes for alpha were done in 82aab97c.
-
-Changelog:
-	* sysdeps/unix/sysv/linux/mips/vfork.S (__vfork): Rename into
-	__libc_vfork.
-	(__vfork) [IS_IN (libc)]: Remove alias.
-	(__libc_vfork) [IS_IN (libc)]: Define as an alias.
-	* sysdeps/unix/sysv/linux/sparc/sparc32/vfork.S: Likewise.
-	* sysdeps/unix/sysv/linux/sparc/sparc64/vfork.S: Likewise.
-
-[Vincent: do not patch ChangeLog]
-
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
----
- sysdeps/unix/sysv/linux/mips/vfork.S          | 12 ++++++------
- sysdeps/unix/sysv/linux/sparc/sparc32/vfork.S |  8 ++++----
- sysdeps/unix/sysv/linux/sparc/sparc64/vfork.S |  8 ++++----
- 3 files changed, 14 insertions(+), 14 deletions(-)
-
-diff --git a/sysdeps/unix/sysv/linux/mips/vfork.S b/sysdeps/unix/sysv/linux/mips/vfork.S
-index c0c0ce6..1867c86 100644
---- a/sysdeps/unix/sysv/linux/mips/vfork.S
-+++ b/sysdeps/unix/sysv/linux/mips/vfork.S
-@@ -31,13 +31,13 @@
- LOCALSZ= 1
- FRAMESZ= (((NARGSAVE+LOCALSZ)*SZREG)+ALSZ)&ALMASK
- GPOFF= FRAMESZ-(1*SZREG)
--NESTED(__vfork,FRAMESZ,sp)
-+NESTED(__libc_vfork,FRAMESZ,sp)
- #ifdef __PIC__
- 	SETUP_GP
- #endif
- 	PTR_SUBU sp, FRAMESZ
- 	cfi_adjust_cfa_offset (FRAMESZ)
--	SETUP_GP64_REG (a5, __vfork)
-+	SETUP_GP64_REG (a5, __libc_vfork)
- #ifdef __PIC__
- 	SAVE_GP (GPOFF)
- #endif
-@@ -104,10 +104,10 @@ L(error):
- 	RESTORE_GP64_REG
- 	j		__syscall_error
- #endif
--	END(__vfork)
-+	END(__libc_vfork)
- 
- #if IS_IN (libc)
--libc_hidden_def(__vfork)
--weak_alias (__vfork, vfork)
--strong_alias (__vfork, __libc_vfork)
-+weak_alias (__libc_vfork, vfork)
-+strong_alias (__libc_vfork, __vfork)
-+libc_hidden_def (__vfork)
- #endif
-diff --git a/sysdeps/unix/sysv/linux/sparc/sparc32/vfork.S b/sysdeps/unix/sysv/linux/sparc/sparc32/vfork.S
-index 94f2c8d..0d0a3b5 100644
---- a/sysdeps/unix/sysv/linux/sparc/sparc32/vfork.S
-+++ b/sysdeps/unix/sysv/linux/sparc/sparc32/vfork.S
-@@ -21,7 +21,7 @@
- 
- 	.text
- 	.globl		__syscall_error
--ENTRY(__vfork)
-+ENTRY(__libc_vfork)
- 	ld	[%g7 + PID], %o5
- 	cmp	%o5, 0
- 	bne	1f
-@@ -42,10 +42,10 @@ ENTRY(__vfork)
- 	 st	%o5, [%g7 + PID]
- 1:	retl
- 	 nop
--END(__vfork)
-+END(__libc_vfork)
- 
- #if IS_IN (libc)
-+weak_alias (__libc_vfork, vfork)
-+strong_alias (__libc_vfork, __vfork)
- libc_hidden_def (__vfork)
--weak_alias (__vfork, vfork)
--strong_alias (__vfork, __libc_vfork)
- #endif
-diff --git a/sysdeps/unix/sysv/linux/sparc/sparc64/vfork.S b/sysdeps/unix/sysv/linux/sparc/sparc64/vfork.S
-index a7479e9..0818eba 100644
---- a/sysdeps/unix/sysv/linux/sparc/sparc64/vfork.S
-+++ b/sysdeps/unix/sysv/linux/sparc/sparc64/vfork.S
-@@ -21,7 +21,7 @@
- 
- 	.text
- 	.globl	__syscall_error
--ENTRY(__vfork)
-+ENTRY(__libc_vfork)
- 	ld	[%g7 + PID], %o5
- 	sethi	%hi(0x80000000), %o3
- 	cmp	%o5, 0
-@@ -42,10 +42,10 @@ ENTRY(__vfork)
- 	 st	%o5, [%g7 + PID]
- 1:	retl
- 	 nop
--END(__vfork)
-+END(__libc_vfork)
- 
- #if IS_IN (libc)
-+weak_alias (__libc_vfork, vfork)
-+strong_alias (__libc_vfork, __vfork)
- libc_hidden_def (__vfork)
--weak_alias (__vfork, vfork)
--strong_alias (__vfork, __libc_vfork)
- #endif
--- 
-2.7.3
-
diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index f92cdf3..115388e 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -10,11 +10,6 @@ choice
 	prompt "glibc version"
 	default BR2_GLIBC_VERSION_2_24
 
-config BR2_GLIBC_VERSION_2_22
-	bool "2.22"
-	# Too old to build with gcc >= 6.x
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_6
-
 config BR2_GLIBC_VERSION_2_23
 	bool "2.23"
 
@@ -37,7 +32,6 @@ endif
 
 config BR2_GLIBC_VERSION_STRING
 	string
-	default "2.22" if BR2_GLIBC_VERSION_2_22
 	default "2.23" if BR2_GLIBC_VERSION_2_23
 	default "2.24" if BR2_GLIBC_VERSION_2_24
 	default "2.25" if BR2_GLIBC_VERSION_2_25
diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 863c9b4..0f420c5 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,4 @@
 # Locally calculated after checking pgp signature (glibc)
-sha256	eb731406903befef1d8f878a46be75ef862b9056ab0cde1626d08a7a05328948	glibc-2.22.tar.xz
 sha256	94efeb00e4603c8546209cefb3e1a50a5315c86fa9b078b6fad758e187ce13e9	glibc-2.23.tar.xz
 sha256	99d4a3e8efd144d71488e478f62587578c0f4e1fa0b4eed47ee3d4975ebeb5d3	glibc-2.24.tar.xz
 sha256	067bd9bb3390e79aa45911537d13c3721f1d9d3769931a30c2681bfee66f23a0	glibc-2.25.tar.xz
