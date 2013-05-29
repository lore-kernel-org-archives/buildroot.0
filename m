From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 29 May 2013 21:20:33 +0200
Subject: [Buildroot] [git commit] czmq: prevent selection when ADI Blackfin
	external toolchains are used
Message-ID: <20130529193613.93E8F9A653@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=200b2dfa6db19c5907eaabb13411505301e9757a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

czmq fails to build with the Blackfin external toolchains provided by
Analog Devices, because their uClibc configuration doesn't include
AI_ADDRCONFIG. In order to prevent such build failures to happen, we
simply prevent the selection of czmq or one of its reverse
dependencies when such toolchains are used.

This fixes:

  http://autobuild.buildroot.org/results/821/82140fac4c2a2cef3f38f06cada8f17fd7f0078b/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/czmq/Config.in   |    4 ++++
 package/filemq/Config.in |    4 ++++
 package/zyre/Config.in   |    4 ++++
 3 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/package/czmq/Config.in b/package/czmq/Config.in
index 7e4205e..0f16c2e 100644
--- a/package/czmq/Config.in
+++ b/package/czmq/Config.in
@@ -6,6 +6,10 @@ config BR2_PACKAGE_CZMQ
 	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
+	# uClibc toolchains provided by ADI don't have AI_ADDRCONFIG
+	# support
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && \
+		!BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1
 	help
 	  High-level C Binding for 0MQ
 
diff --git a/package/filemq/Config.in b/package/filemq/Config.in
index d25f03f..6f9fdb0 100644
--- a/package/filemq/Config.in
+++ b/package/filemq/Config.in
@@ -8,6 +8,10 @@ config BR2_PACKAGE_FILEMQ
 	depends on BR2_LARGEFILE # util-linux
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS # zeromq
+	# uClibc toolchains provided by ADI don't have AI_ADDRCONFIG
+	# support, which is needed by czmq
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && \
+		!BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1
 	help
 	  FileMQ is a publish-subscribe file service based on 0MQ.
 
diff --git a/package/zyre/Config.in b/package/zyre/Config.in
index f181ac8..0ae0eec 100644
--- a/package/zyre/Config.in
+++ b/package/zyre/Config.in
@@ -5,6 +5,10 @@ config BR2_PACKAGE_ZYRE
 	depends on BR2_LARGEFILE # filemq
 	depends on BR2_USE_WCHAR # filemq
 	depends on BR2_TOOLCHAIN_HAS_THREADS # filemq
+	# uClibc toolchains provided by ADI don't have AI_ADDRCONFIG
+	# support, needed by filemq -> czmq
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && \
+		!BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1
 	select BR2_PACKAGE_FILEMQ
 	help
 	  An open-source framework for proximity-based peer-to-peer
