From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Dec 2017 21:26:08 +0100
Subject: [Buildroot] [PATCH] tar: do not build SELinux support for host
 variant
Message-ID: <20171229202608.1767-1-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If we don't explicitly disable SELinux support in the host-tar build,
it might pick up system-wide installed SELinux libraries, causing the
tar in HOST_DIR/bin/ to depend on the host SELinux libraries, which is
not desirable to make the SDK portable/relocatable.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tar/tar.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index 813eabed14..678de978cc 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -50,4 +50,6 @@ HOST_TAR_CONF_ENV = \
 	CC="$(HOSTCC_NOCCACHE)" \
 	CXX="$(HOSTCXX_NOCCACHE)"
 
+HOST_TAR_CONF_OPTS = --without-selinux
+
 $(eval $(host-autotools-package))
-- 
2.14.3
