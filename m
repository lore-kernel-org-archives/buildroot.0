From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 22 Feb 2014 22:00:32 +0100
Subject: [Buildroot] [git commit] iputils: disable on older uclibc versions
Message-ID: <20140222210313.2CCDF9B2FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=50c33ad125e84f6df485b85ef10c9dd6b73ae7ea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable when using a uclibc version before 0.9.33 since dn_comp
function support was added in this version. Also disabling on AVR32
since any AVR32 toolchain will be based on a uclibc version older
than 0.9.33 (for using an external AVR32 toolchain).

[Peter: use dn_comp instead of __dn_comp]
Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iputils/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/iputils/Config.in b/package/iputils/Config.in
index d4d2829..e7bb3d9 100644
--- a/package/iputils/Config.in
+++ b/package/iputils/Config.in
@@ -2,6 +2,10 @@ config BR2_PACKAGE_IPUTILS
 	bool "iputils"
 	select BR2_OPENSSL if BR2_INET_IPV6
 	depends on BR2_USE_MMU # fork()
+	# requires dn_comp (only available in since uclibc 0.9.33)
+	depends on !BR2_avr32
+	depends on !BR2_UCLIBC_VERSION_0_9_31 && \
+		!BR2_UCLIBC_VERSION_0_9_32
 	help
 	  This package is set of small useful utilities for Linux networking.
 	  It includes complete versions of ping, traceroute, etc.
