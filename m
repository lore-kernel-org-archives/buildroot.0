From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 11 Jun 2019 22:55:44 +0200
Subject: [Buildroot] [PATCH 2/2] package/libglib2: fix NLS build on musl and
 uclibc
In-Reply-To: <cover.1560286529.git.yann.morin.1998@free.fr>
References: <cover.1560286529.git.yann.morin.1998@free.fr>
Message-ID: <348952c2f966fb8c1ccb5b18418b3a8596925645.1560286529.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libglib2 uses a very crude and error-prone way to detect the intl
functions, which basically fails when the C library is not glibc.

Now that a meson pacakge can specify its LDFLAGS, use that to pass the
infrastructure-provided TARGET_NLS_LIBS to link with.

Fixes:
    http://autobuild.buildroot.org/results/f0d/f0d85d76786343d767fba9c7c5c01f042ecfc018/
    [...]

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Adam Duskett <aduskett@gmail.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libglib2/libglib2.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 78d6e5ab32..04f747cec7 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -31,6 +31,8 @@ LIBGLIB2_DEPENDENCIES = \
 	host-pkgconf host-libglib2 \
 	libffi pcre util-linux zlib $(TARGET_NLS_DEPENDENCIES)
 
+LIBGLIB2_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
+
 HOST_LIBGLIB2_DEPENDENCIES = \
 	host-gettext \
 	host-libffi \
-- 
2.20.1
