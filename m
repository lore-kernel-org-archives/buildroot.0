From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Feb 2017 09:26:43 +0100
Subject: [Buildroot] [git commit] libraw: fix build with old glibc versions
Message-ID: <20170216082712.7D7E17FC3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d246cf5fd01bb0d20a0e64194ffed514ea8dd0aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Prior to glibc 2.18, definitions like SIZE_MAX or INT_FAST32_MAX from
<stdint.h> were only made available for C code, or in C++ if
__STDC_LIMIT_MACROS was defined.

The code from jasper uses such definitions, without defining
__STDC_LIMIT_MACROS. Unfortunately, defining __STDC_LIMIT_MACROS in
the jasper headers doesn't work, since <stdint.h> has already been
included before, at a point where __STDC_LIMIT_MACROS was not defined.

So to solve this problem, we simply pass -D__STDC_LIMIT_MACROS in
CXXFLAGS when building libraw with jasper support.

Fixes:

  http://autobuild.buildroot.net/results/908aef6c82d56060933713df217b6b2ba21a01b0/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libraw/libraw.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libraw/libraw.mk b/package/libraw/libraw.mk
index d76a180..f78ce1e 100644
--- a/package/libraw/libraw.mk
+++ b/package/libraw/libraw.mk
@@ -21,10 +21,15 @@ LIBRAW_CONF_OPTS += \
 LIBRAW_LICENSE = LGPLv2.1 or CDDL 1.0 or LibRaw Software License 27032010
 LIBRAW_LICENSE_FILES = LICENSE.LGPL LICENSE.CDDL LICENSE.LibRaw.pdf README
 LIBRAW_DEPENDENCIES = host-pkgconf
+LIBRAW_CXXFLAGS = $(TARGET_CXXFLAGS)
+LIBRAW_CONF_ENV = CXXFLAGS="$(LIBRAW_CXXFLAGS)"
 
 ifeq ($(BR2_PACKAGE_JASPER),y)
 LIBRAW_CONF_OPTS += --enable-jasper
 LIBRAW_DEPENDENCIES += jasper
+# glibc prior to 2.18 only defines constants such as SIZE_MAX or
+# INT_FAST32_MAX for C++ code if __STDC_LIMIT_MACROS is defined
+LIBRAW_CXXFLAGS += -D__STDC_LIMIT_MACROS
 else
 LIBRAW_CONF_OPTS += --disable-jasper
 endif
