From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 29 May 2013 21:22:12 +0200
Subject: [Buildroot] [git commit] libtirpc: prevent selection when ADI
	Blackfin external toolchains are used
Message-ID: <20130529193614.431159A653@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c5f9a4fb91f7a19a9a507490a8f1d3d40ab708ba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libtirpc fails to build with the Blackfin external toolchains provided
by Analog Devices, because their uClibc configuration doesn't include
AI_ADDRCONFIG. In order to prevent such build failures to happen, we
simply prevent libtirpc from being selected when such toolchains are
used. This is not a big problem, since they provide native RPC
support.

Also, since they provide native RPC, we don't have to propagate this
new dependency to the reverse dependencies of libtirpc, because they
all use native RPC when available. The exception to this rule is the
rpcbind package, which can only use the libtirpc implementation of
RPCs, and not the native one of C libraries. Therefore, the dependency
is propagated to the rpcbind package.

Fixes:

  http://autobuild.buildroot.org/results/58b/58b16449065c16afce11ba120db56839efb2b1ea/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libtirpc/Config.in |    7 +++++++
 package/rpcbind/Config.in  |    4 ++++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/package/libtirpc/Config.in b/package/libtirpc/Config.in
index 7e891b4..b9db5aa 100644
--- a/package/libtirpc/Config.in
+++ b/package/libtirpc/Config.in
@@ -1,5 +1,12 @@
 config BR2_PACKAGE_LIBTIRPC
 	bool "libtirpc"
+	# uClibc toolchains provided by ADI don't have AI_ADDRCONFIG
+	# support. Note that since they provide native RPC support, we
+	# don't need to propagate this dependency to reverse
+	# dependencies of libtirpc for which native RPC support can be
+	# used instead of libtirpc.
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && \
+		!BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1
 	help
 	  Libtirpc is a port of Sun's Transport-Independent RPC
 	  library to Linux.
diff --git a/package/rpcbind/Config.in b/package/rpcbind/Config.in
index 1bdcd9e..cbe53af 100644
--- a/package/rpcbind/Config.in
+++ b/package/rpcbind/Config.in
@@ -3,6 +3,10 @@ config BR2_PACKAGE_RPCBIND
 	# We really need libtirpc and can't work with the native RPC
 	# implementation of toolchains.
 	select BR2_PACKAGE_LIBTIRPC
+	# uClibc toolchains provided by ADI don't have AI_ADDRCONFIG
+	# support, needed for libtirpc
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && \
+		!BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1
 	help
 	  The rpcbind utility is a server that converts RPC program numbers
 	  into universal addresses.
