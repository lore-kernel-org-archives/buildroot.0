From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Jun 2014 10:46:41 +0200
Subject: [Buildroot] [git commit] dnsmasq: static linking with lua doesn't
	need -ldl
Message-ID: <20140612084948.CBAE59CFD0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cbf2ae296ed08bee10945e9ca95459adbf793c67
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/77e/77e4123a3ddc934efedf4b09adc2436421ee70b3/

liblua only uses libdl when dynamic linking is used, and certain toolchains
(E.G.  bfin) doesn't provide a libdl - So only link against it if it is
needed.

At the same time change it pass the library in LIBS instead of LDFLAGS so it
ends up at the end of the linker cmdline.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dnsmasq/dnsmasq.mk |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index dd15994..71d2f30 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -55,7 +55,11 @@ endif
 
 ifeq ($(BR2_PACKAGE_DNSMASQ_LUA),y)
 	DNSMASQ_DEPENDENCIES += lua
-	DNSMASQ_MAKE_OPT += LDFLAGS+="-ldl"
+
+# liblua uses dlopen when dynamically linked
+ifneq ($(BR2_PREFER_STATIC_LIB),y)
+	DNSMASQ_MAKE_OPT += LIBS="-ldl"
+endif
 
 define DNSMASQ_ENABLE_LUA
 	$(SED) 's/lua5.1/lua/g' $(DNSMASQ_DIR)/Makefile
