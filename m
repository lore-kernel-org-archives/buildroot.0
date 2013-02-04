From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 4 Feb 2013 23:33:44 +0100
Subject: [Buildroot] [git commit] tvheadend: disable on avr32
Message-ID: <20130204223733.794449A808@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ca83edc9af7af33b985f2175396b34857b774fbc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

tvheadend requires an atomic_add operation. Either you have a gcc >=
4.3 toolchain and it uses the gcc intrinsics, or it has special code
for x86, x86-64, PPC and ARM. So in the context of Buildroot, the only
really problematic architecture is avr32, which uses gcc 4.2.

Fixes http://autobuild.buildroot.org/results/f015b1888d739c383aca61609059aa7675a4da7d/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/tvheadend/Config.in |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
index 899b160..19ab276 100644
--- a/package/tvheadend/Config.in
+++ b/package/tvheadend/Config.in
@@ -4,6 +4,12 @@ comment "tvheadend requires a toolchain with LARGEFILE and IPv6 support"
 config BR2_PACKAGE_TVHEADEND
 	bool "tvheadend"
 	depends on BR2_LARGEFILE && BR2_INET_IPV6
+	# tvheadend requires an atomic_add operation. Either you have
+	# a gcc >= 4.3 toolchain and it uses the gcc intrinsics, or it
+	# has special code for x86, x86-64, PPC and ARM. So in the
+	# context of Buildroot, the only really problematic
+	# architecture is avr32, which uses gcc 4.2.
+	depends on !BR2_avr32
 	select BR2_PACKAGE_DVB_APPS
 	select BR2_PACKAGE_OPENSSL
 	help
