From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 15 May 2019 22:47:20 +0200
Subject: [Buildroot] [PATCH 1/2] package/libunwind: add cxx exceptions
 support
Message-ID: <20190515204721.18722-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If C++ is enabled, enable cxx exceptions, so libunwind will implement
_Unwind_GetIP which is used by mono (which already depends on C++)

Fixes:
 - http://autobuild.buildroot.net/results/dbd64c89815d393a4e28b312d74fd80ee6de92da

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libunwind/libunwind.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libunwind/libunwind.mk b/package/libunwind/libunwind.mk
index 94d1899bd3..26deaa5f00 100644
--- a/package/libunwind/libunwind.mk
+++ b/package/libunwind/libunwind.mk
@@ -11,7 +11,9 @@ LIBUNWIND_LICENSE_FILES = COPYING
 LIBUNWIND_LICENSE = MIT
 LIBUNWIND_AUTORECONF = YES
 
-LIBUNWIND_CONF_OPTS = --disable-tests
+LIBUNWIND_CONF_OPTS = \
+	--disable-tests \
+	$(if $(BR2_INSTALL_LIBSTDCPP),--enable-cxx-exceptions,--disable-cxx-exceptions)
 
 ifeq ($(BR2_PACKAGE_LIBATOMIC_OPS),y)
 LIBUNWIND_DEPENDENCIES = libatomic_ops
-- 
2.20.1
