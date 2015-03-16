From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Mar 2015 17:31:25 +0100
Subject: [Buildroot] [PATCH 6/7 v7] package/fftw: enable threads when the
	toolchain has them
In-Reply-To: <cover.1426523417.git.yann.morin.1998@free.fr>
References: <cover.1426523417.git.yann.morin.1998@free.fr>
Message-ID: <24f2aa8348acdb30a32f89a9ba600e1d5e739ae0.1426523417.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[based on a patch by Guillaume]
Cc: guillaume william brs <guillaume.bressaix@gmail.com>
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Tested-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Reviewed-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

---
Changes v6 -> v7:
  - generate a single library with thread support included (otherwise
    thread support is in another library)
  - fix typo in commit title
---
 package/fftw/fftw.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/fftw/fftw.mk b/package/fftw/fftw.mk
index 3acde57..aea3910 100644
--- a/package/fftw/fftw.mk
+++ b/package/fftw/fftw.mk
@@ -29,6 +29,13 @@ FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_USE_SSE2),--enable,--disable)-sse2
 FFTW_CONF_OPTS += $(if $(BR2_PACKAGE_FFTW_USE_NEON),--enable,--disable)-neon
 FFTW_CFLAGS += $(if $(BR2_PACKAGE_FFTW_USE_NEON),-mfpu=neon)
 
+# Generic optimisations
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+FFTW_CONF_OPTS += --enable-threads --with-combined-threads
+else
+FFTW_CONF_OPTS += --disable-threads
+endif
+
 FFTW_CONF_OPTS += CFLAGS="$(FFTW_CFLAGS)"
 
 $(eval $(autotools-package))
-- 
1.9.1
