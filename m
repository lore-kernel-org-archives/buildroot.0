From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 May 2017 15:13:56 +0200
Subject: [Buildroot] [git commit] radvd: fix build with 4.11 kernel headers
Message-ID: <20170513131405.E745E82867@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=205c5283042ffd96859e1b78e539492a0143d0c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the introduction of 4.11 kernel headers in Buildroot, radvd has
failed to build with all toolchains using this kernel header version.

The issue comes from the fact that radvd includes both <net/if_arp.h>
and <linux/if_arp.h> if they are available. Until 4.11,
<linux/if_arp.h> was in fact not included, because the
AC_CHECK_HEADERS() test concluded this header was unsuitable. This has
been fixed in the upstream kernel by commit
2618be7dccf8739b89e1906b64bd8d551af351e6 ("uapi: fix linux/if.h
userspace compilation errors"). So now, the radvd configure script
considers both <net/if_arp.h> and <linux/if_arp.h> as suitable
headers, and includes both of them, leading to the duplicate
definition of various types.

Since it's redundant to include both <net/if_arp.h> and
<linux/if_arp.h>, we simply force radvd to believe that
<linux/if_arp.h> is not available by passing the appropriate autoconf
cache variable. This gets us back to the previous situation, where
<linux/if_arp.h> was never used.

This has been tested with a uClibc toolchain using 4.11 kernel
headers, and verified to work on glibc and musl with older kernel
headers as well.

Fixes:

  http://autobuild.buildroot.net/results/949a75d96299394e4ac957746fa23a4b52f31b43/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/radvd/radvd.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index 64f755d..8822187 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -8,7 +8,11 @@ RADVD_VERSION = 2.12
 RADVD_SOURCE = radvd-$(RADVD_VERSION).tar.xz
 RADVD_SITE = http://www.litech.org/radvd/dist
 RADVD_DEPENDENCIES = host-bison flex host-flex host-pkgconf
-RADVD_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
+# We need to ignore <linux/if_arp.h>, because radvd already includes
+# <net/if_arp.h>, which conflicts with <linux/if_arp.h>.
+RADVD_CONF_ENV = \
+	ac_cv_prog_cc_c99='-std=gnu99' \
+	ac_cv_header_linux_if_arp_h=no
 # For 0002-Don-t-force-fstack-protector-the-toolchain-might-lac.patch
 RADVD_AUTORECONF = YES
 RADVD_LICENSE = BSD-4-Clause-like
