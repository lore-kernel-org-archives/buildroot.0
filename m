From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Aug 2015 20:55:55 +0200
Subject: [Buildroot] [git commit] package/ltrace: do not enable libunwind
	support for MIPS
Message-ID: <20150825185601.A18BA81E69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=627a1044bf363d3a633c5926e97113f5fe79c7f6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently libunwind support in ltrace is broken for MIPS. I'm working
with upstream to fix this issue, but it's not yet ready, so let's
disable it by now.

Fixes:

  http://autobuild.buildroot.net/results/79b/79b51941ed57b0564c68112489b03cac39a04e9a/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ltrace/ltrace.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/ltrace/ltrace.mk b/package/ltrace/ltrace.mk
index 73ae28e..eac42be 100644
--- a/package/ltrace/ltrace.mk
+++ b/package/ltrace/ltrace.mk
@@ -19,8 +19,9 @@ LTRACE_POST_PATCH_HOOKS += LTRACE_CREATE_CONFIG_M4
 
 # ltrace can use libunwind only if libc has backtrace() support
 # We don't normally do so for uClibc and we can't know if it's external
+# Also ltrace with libunwind support is broken for MIPS so we disable it
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
-ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),)
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC)$(BR2_mips)$(BR2_mipsel),)
 # --with-elfutils only selects unwinding support backend. elfutils is a
 # mandatory dependency regardless.
 LTRACE_CONF_OPTS += --with-libunwind=yes --with-elfutils=no
