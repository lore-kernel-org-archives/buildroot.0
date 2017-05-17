From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 May 2017 22:43:07 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] rabbitmq-c: openssl/popt
	sub-options don't work in static linking
Message-ID: <20170517204653.A661182862@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fdd9db2fae1bdecd14661a3234e1821efcf4fa2a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

rabbitmq-c currently fails to build in a number of static linking
situations, due to two issues:

 - CMake FindOpenSSL module is buggy. Even though it uses pkg-config,
   it doesn't use the information returned by pkg-config, and
   therefore doesn't know about second order libraries that need be
   part of the link for static linking to succeed. Due to this, -lz is
   not passed, and therefore rabbitmq-c fails when linking against
   libssl/libcrypto. This issue has been reported to upstream CMake at
   https://gitlab.kitware.com/cmake/cmake/issues/16885.

 - popt might use libintl, but CMake doesn't know about that. For
   autotools based packages, we typically work around this by passing
   LIBS=, but CMake apparently has no equivalent to LIBS=.

To workaround this, we only use the OpenSSL and Popt optional
dependencies in dynamic linking situations.

Fixes:

  http://autobuild.buildroot.net/results/798dbe5e5fd0463bb2066cb115656795144c327f/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit beb6524225f12549a216183abc07745f8d36e764)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rabbitmq-c/rabbitmq-c.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/rabbitmq-c/rabbitmq-c.mk b/package/rabbitmq-c/rabbitmq-c.mk
index 1ca35ad..eef09ec 100644
--- a/package/rabbitmq-c/rabbitmq-c.mk
+++ b/package/rabbitmq-c/rabbitmq-c.mk
@@ -21,14 +21,20 @@ else ifeq ($(BR2_SHARED_LIBS),y)
 RABBITMQ_C_CONF_OPTS += -DBUILD_SHARED_LIBS=ON -DBUILD_STATIC_LIBS=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_OPENSSL),y)
+# CMake OpenSSL detection is buggy, and doesn't properly use
+# pkg-config, so it fails when statically linking. See
+# https://gitlab.kitware.com/cmake/cmake/issues/16885.
+ifeq ($(BR2_PACKAGE_OPENSSL):$(BR2_STATIC_LIBS),y:)
 RABBITMQ_C_CONF_OPTS += -DENABLE_SSL_SUPPORT=ON
 RABBITMQ_C_DEPENDENCIES += openssl
 else
 RABBITMQ_C_CONF_OPTS += -DENABLE_SSL_SUPPORT=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_POPT), y)
+# Popt is sometimes linked against libintl, but CMake doesn't know
+# about that, and there's no way to tell manually CMake to link
+# against an additional library.
+ifeq ($(BR2_PACKAGE_POPT):$(BR2_STATIC_LIBS),y:)
 RABBITMQ_C_CONF_OPTS += -DBUILD_TOOLS=ON
 RABBITMQ_C_DEPENDENCIES += popt
 else
