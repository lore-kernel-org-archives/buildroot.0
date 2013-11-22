From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Nov 2013 22:45:00 +0100
Subject: [Buildroot] [git commit] libvncserver: openssl support needs
	pthreads
Message-ID: <20131122215507.122659BD50@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f8e4365e997abe583a496f852a804436d116da0d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/c30/c3082693fe0da0c54d4bbf950dd6d74e1395c1d9/

Also pass --without-ssl if that isn't the case, as the configure script
otherwise ends up detecting openssl if built before libvncserver.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libvncserver/libvncserver.mk |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libvncserver/libvncserver.mk b/package/libvncserver/libvncserver.mk
index a96b8c5..f5a0aef 100644
--- a/package/libvncserver/libvncserver.mk
+++ b/package/libvncserver/libvncserver.mk
@@ -23,10 +23,11 @@ ifneq ($(BR2_INET_IPV6),y)
 LIBVNCSERVER_CONF_OPT += --without-ipv6
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+# openssl supports needs pthread
+ifeq ($(BR2_PACKAGE_OPENSSL)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
 LIBVNCSERVER_DEPENDENCIES += openssl
 else
-LIBVNCSERVER_CONF_OPT += --without-crypto
+LIBVNCSERVER_CONF_OPT += --without-crypto --without-ssl
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
