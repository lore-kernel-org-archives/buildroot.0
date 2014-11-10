From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 10 Nov 2014 16:38:41 +0000
Subject: [Buildroot] [PATCH v2 4/4] elfutils: really make -Werror
	conditional to BUILD_WERROR
In-Reply-To: <1415637521-57583-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1415637521-57583-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1415637521-57583-5-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Apply a patch written by Yann E. Morin to really make -Werror
conditional to BUILD_WERROR. Otherwise it will fail with a message like
this one:

elf_getarsym.c:290:9: error: 'n' may be used uninitialized in this
function [-Werror=maybe-uninitialized]
    arsym[n].as_name = NULL;
	 ^
cc1: all warnings being treated as errors

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 ...y-make-werror-conditional-to-build-werror.patch |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 package/elfutils/0006-really-make-werror-conditional-to-build-werror.patch

diff --git a/package/elfutils/0006-really-make-werror-conditional-to-build-werror.patch b/package/elfutils/0006-really-make-werror-conditional-to-build-werror.patch
new file mode 100644
index 0000000..dab4f35
--- /dev/null
+++ b/package/elfutils/0006-really-make-werror-conditional-to-build-werror.patch
@@ -0,0 +1,16 @@
+Really make -Werror conditional to BUILD_WERROR
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+diff -rup a/config/eu.am b/config/eu.am
+--- a/config/eu.am	2014-11-10 16:19:14.356031479 +0000
++++ b/config/eu.am	2014-11-10 16:21:11.702072011 +0000
+@@ -35,7 +35,6 @@ LD_AS_NEEDED = @LD_AS_NEEDED@
+ DEFS = -D_GNU_SOURCE -DHAVE_CONFIG_H -DLOCALEDIR='"${localedir}"'
+ AM_CPPFLAGS = -I. -I$(srcdir) -I$(top_srcdir)/lib -I..
+ AM_CFLAGS = -std=gnu99 -Wall -Wshadow \
+-	    $(if $($(*F)_no_Werror),,-Werror) \
+ 	    $(if $($(*F)_no_Wunused),,-Wunused $(WEXTRA)) \
+ 	    $(if $($(*F)_no_Wformat),-Wno-format,-Wformat=2) \
+ 	    $($(*F)_CFLAGS)
-- 
1.7.1
