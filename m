From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 14 Feb 2015 23:28:43 +0100
Subject: [Buildroot] [RFC 2/3] package/efl/libevas: explicitly disable
	GL/GLES2 support
In-Reply-To: <1423952924-6322-1-git-send-email-romain.naour@openwide.fr>
References: <1423952924-6322-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1423952924-6322-2-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/efl/libevas/libevas.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
index 30d9f7c..4868050 100644
--- a/package/efl/libevas/libevas.mk
+++ b/package/efl/libevas/libevas.mk
@@ -107,16 +107,25 @@ LIBEVAS_CONF_ENV += \
 	GL_EET_LIBS='-leet'
 endif
 
+# libevas OpenGL flavor
 ifeq ($(BR2_PACKAGE_LIBEVAS_GL),y)
 LIBEVAS_DEPENDENCIES += mesa3d libeet
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEVAS_GLES_SGX),y)
 LIBEVAS_CONF_OPTS += --enable-gl-flavor-gles --enable-gles-variety-sgx
+else
+LIBEVAS_CONF_OPTS += --disable-gles-variety-sgx
 endif
 
 ifeq ($(BR2_PACKAGE_LIBEVAS_GLES_S3C6410),y)
 LIBEVAS_CONF_OPTS += --enable-gl-flavor-gles --enable-gles-variety-s3c6410
+else
+LIBEVAS_CONF_OPTS += --disable-gles-variety-s3c6410
+endif
+
+ifeq ($(BR2_PACKAGE_LIBEVAS_GLES_SGX)$(BR2_PACKAGE_LIBEVAS_GLES_S3C6410),)
+LIBEVAS_CONF_OPTS += --disable-gl-flavor-gles
 endif
 
 # code options
-- 
1.9.3
