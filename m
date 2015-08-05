From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Aug 2015 12:11:20 +0200
Subject: [Buildroot] [git commit] zmqpp: use more logical way of expressing
	comment dependencies
Message-ID: <20150805101202.42976819A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7b69cc9f184806d4a62462095475f70bd05f286a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In most packages, we use 'depends on !A || !B || !C' and not 'depends
on !(A && B && C)' to express the dependencies of comments on missing
toolchain features. As suggested by Yann E. Morin, let's switch zmqpp
to this convention.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/zmqpp/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zmqpp/Config.in b/package/zmqpp/Config.in
index 756c810..a10602f 100644
--- a/package/zmqpp/Config.in
+++ b/package/zmqpp/Config.in
@@ -15,8 +15,8 @@ config BR2_PACKAGE_ZMQPP
 	  http://github.com/benjamg/zmqpp
 
 comment "zmqpp needs a toolchain w/ C++, wchar, threads, gcc >= 4.6"
-	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && \
-		BR2_TOOLCHAIN_HAS_THREADS && BR2_TOOLCHAIN_GCC_AT_LEAST_4_6)
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
 
 if BR2_PACKAGE_ZMQPP
 
