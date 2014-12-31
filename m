From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Dec 2014 15:13:43 +0100
Subject: [Buildroot] [git commit] libvncserver: OpenSSL support needs NPTL
	thread support
Message-ID: <20141231141348.B7515807DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fa168c1aa45649094d90704267b8a8cac17a8e34
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The OpenSSL support of libvncserver already has a dependency on thread
support, but it in fact requires NPTL threading.

Fixes:

  http://autobuild.buildroot.org/results/be2/be20dec9ffe7de3adc46a834852b20353d39baff/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libvncserver/libvncserver.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libvncserver/libvncserver.mk b/package/libvncserver/libvncserver.mk
index ed6b64d..87bcf45 100644
--- a/package/libvncserver/libvncserver.mk
+++ b/package/libvncserver/libvncserver.mk
@@ -32,8 +32,8 @@ ifneq ($(BR2_INET_IPV6),y)
 LIBVNCSERVER_CONF_OPTS += --without-ipv6
 endif
 
-# openssl supports needs pthread
-ifeq ($(BR2_PACKAGE_OPENSSL)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
+# openssl supports needs NPTL thread support
+ifeq ($(BR2_PACKAGE_OPENSSL)$(BR2_TOOLCHAIN_HAS_THREADS_NPTL),yy)
 LIBVNCSERVER_DEPENDENCIES += openssl
 else
 LIBVNCSERVER_CONF_OPTS += --without-crypto --without-ssl
