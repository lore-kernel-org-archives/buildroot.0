From: Gergely Imreh <imrehg@gmail.com>
Date: Fri, 08 May 2015 14:46:18 +0000
Subject: [Buildroot] [PATCH 1/1] enlightenment: updating on which platforms
	ptrace is disabled
Message-ID: <1431096376-21900-1-git-send-email-imrehg@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

uclibc is missing definitions in sys/ptrace.h for certain plaforms.
The xtensa platform is also affected (linked autobuild failure), fixed
by disabling ptrace for that too. This choice of disabling ptrace for
all uclibc choices is probably conservative: while uclibc-ng fails,
uclibc Git Xstensa seeems to compile successfully.

http://autobuild.buildroot.org/results/d03/d035e3735e414acb26ae79a8cf55a562c89d01e8/

Testing previously affected platforms, powerpc does not fail anymore while
building enlightenment on either uclibc-0.9.33.x or uclibc-ng, so re-enabling
support for it.

The sparc build fails on other issues earlier in the build, so couldn't
directly test enlightenment; probably the safe choice is leaving it as is.

The tests were run by using the config from the linked autobuild,
changing platform, and running `make enlightenment`.

Signed-off-by: Gergely Imreh <imrehg@gmail.com>
---
 package/enlightenment/enlightenment.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index ddebe06..e8d6143 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -29,8 +29,8 @@ ENLIGHTENMENT_CONF_OPTS = \
 	--with-eet-eet=$(HOST_DIR)/usr/bin/eet \
 	--disable-rpath
 
-# uClibc has an old incomplete sys/ptrace.h for powerpc & sparc
-ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC)$(BR2_powerpc)$(BR2_sparc),yy)
+# uClibc has an incomplete sys/ptrace.h for sparc and xtensa
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC)$(BR2_sparc)$(BR2_xtensa),yy)
 ENLIGHTENMENT_CONF_ENV += ac_cv_header_sys_ptrace_h=no
 endif
 
-- 
1.9.1
