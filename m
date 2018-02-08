From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Feb 2018 23:12:23 +0100
Subject: [Buildroot] [git commit] ltp-testsuite: add numactl as optional
 dependency
Message-ID: <20180208221226.6DE7F884FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6ba44a70df115b643475e0085e6ad52d18eeb3ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make the detection of libnuma in the configure script consistent when
the numactl package is enabled.

ltp-testsuite does not currently take explicit enable/disable for
libnuma, so none are used. The next ltp-testsuite version will add these
options.

Cc: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ltp-testsuite/ltp-testsuite.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 5e0b35d12a..c47f587836 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -40,6 +40,13 @@ else
 LTP_TESTSUITE_CONF_ENV += ac_cv_lib_cap_cap_compare=no
 endif
 
+# No explicit enable/disable options
+ifeq ($(BR2_PACKAGE_NUMACTL),y)
+LTP_TESTSUITE_DEPENDENCIES += numactl
+else
+LTP_TESTSUITE_CONF_ENV += have_numa_headers=no
+endif
+
 # ltp-testsuite uses <fts.h>, which isn't compatible with largefile
 # support.
 LTP_TESTSUITE_CFLAGS = $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))
