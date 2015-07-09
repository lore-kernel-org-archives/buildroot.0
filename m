From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu,  9 Jul 2015 12:38:51 +0300
Subject: [Buildroot] [PATCH] pure-ftpd: disable PIE on ARC
Message-ID: <1436434731-2388-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Even though ARC gcc understands "-pie" option and attempts to generate
PIE binaries as of today PIE is not really supported for user-space
applications.

So we disable PIE detection if building for ARC.
That first fixes http://autobuild.buildroot.net/results/57a/57a6180809bc51f7206280533f0b9898ce4cfbb4
and also prevents execution of non-supported PIE binary in runtime.

Interesting enough reported build failure is not directly related to PIE
it looks like if PIE is enabled then successful detection of explicit_bzero()
happens erroneously.

A simple test app that mentions explicit_bzero() while built with
"-pie" gives this output:
--------------------------------->8-----------------------------
arc-linux-gcc test.c -pie
/home/abrodkin/Tools/arc/gnu/2015.06-rc1-uclibc-archs/bin/../lib/gcc/arc-snps-linux-uclibc/4.8.4/../../../../arc-snps-linux-uclibc/bin/ld: /home/abrodkin/Tools/arc/gnu/2015.06-rc1-uclibc-archs/bin/../arc-snps-linux-uclibc/sysroot/usr/lib/crt1.o: warning: unresolvable relocation against symbol `__uClibc_main' from .text section
/home/abrodkin/Tools/arc/gnu/2015.06-rc1-uclibc-archs/bin/../lib/gcc/arc-snps-linux-uclibc/4.8.4/../../../../arc-snps-linux-uclibc/bin/ld: /home/abrodkin/Tools/arc/gnu/2015.06-rc1-uclibc-archs/bin/../lib/gcc/arc-snps-linux-uclibc/4.8.4/crtbegin.o: warning: unresolvable relocation against symbol `__deregister_frame_info@@GCC_3.0' from .text section
/home/abrodkin/Tools/arc/gnu/2015.06-rc1-uclibc-archs/bin/../lib/gcc/arc-snps-linux-uclibc/4.8.4/../../../../arc-snps-linux-uclibc/bin/ld: /home/abrodkin/Tools/arc/gnu/2015.06-rc1-uclibc-archs/bin/../lib/gcc/arc-snps-linux-uclibc/4.8.4/crtbegin.o: warning: unresolvable relocation against symbol `__deregister_frame_info@@GCC_3.0' from .text section
/home/abrodkin/Tools/arc/gnu/2015.06-rc1-uclibc-archs/bin/../lib/gcc/arc-snps-linux-uclibc/4.8.4/../../../../arc-snps-linux-uclibc/bin/ld: /home/abrodkin/Tools/arc/gnu/2015.06-rc1-uclibc-archs/bin/../lib/gcc/arc-snps-linux-uclibc/4.8.4/crtbegin.o: warning: unresolvable relocation against symbol `__register_frame_info@@GCC_3.0' from .text section
--------------------------------->8-----------------------------

And what's really interesting exist status is 0!:
--------------------------------->8-----------------------------
$ echo $?
0
--------------------------------->8-----------------------------

With removal of "-pie" we're getting expected failure and exist status 1:
--------------------------------->8-----------------------------
$ arc-linux-gcc test.c
/tmp/ccaWbKwc.o: In function `main':
test.c:(.text+0x1c): undefined reference to `explicit_bzero'
collect2: error: ld returned 1 exit status

$ echo $?
1
--------------------------------->8-----------------------------

We'll look into that strange issue separately internally.
I filed internal STAR 9000925001 for that issue.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---

Note there will be a separate patch for pure-ftpd made from this pull-request:
https://github.com/jedisct1/pure-ftpd/pull/28

---
 package/pure-ftpd/pure-ftpd.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index 8269327..b49f047 100644
--- a/package/pure-ftpd/pure-ftpd.mk
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -33,4 +33,8 @@ else
 PURE_FTPD_CONF_OPTS += --without-tls
 endif
 
+ifeq ($(BR2_arc),y)
+PURE_FTPD_CONF_ENV += ax_cv_check_cflags___fPIE=no ax_cv_check_ldflags___fPIE=no
+endif
+
 $(eval $(autotools-package))
-- 
2.4.3
