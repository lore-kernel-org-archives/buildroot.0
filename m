From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu,  2 Aug 2018 09:38:30 +0300
Subject: [Buildroot] [PATCH] glibc: Install iconvconfig on target with gconv
 libs
Message-ID: <20180802063830.19364-1-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In some cases we need to have gconv-modules.cache on target,
for example see [1] or glibc's test-suite (iconv/test-iconvconfig).

We do have iconvconfig installed in Buildroot's staging folder but
it gets never installed on targe because instead of calling glibc's
"install" target we simply copy a list of libs.

So then let's copy oven iconvconfig there as well in a similar manner.
Still we do it only if gconv libs are being copied otherwise it makes no
sense I guess.

[1] http://lists.busybox.net/pipermail/buildroot/2013-July/075097.html

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Baruch Siach <baruch@tkos.co.il>
---

I do realize my implementation might look not super correct as
appending *binary* to the list of *libs* is not good. But:

1. It's very tiny yet working fix or even better "improvement"
2. That might at least be a good starting pont for a discussion on
   what would be a better way :)

 package/glibc/glibc.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 6d21ae7ac07d..9366b3ec4199 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -119,6 +119,10 @@ ifeq ($(BR2_PACKAGE_GDB),y)
 GLIBC_LIBS_LIB += libthread_db.so.*
 endif
 
+ifeq ($(BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY),y)
+GLIBC_LIBS_LIB += iconvconfig
+endif
+
 define GLIBC_INSTALL_TARGET_CMDS
 	for libpattern in $(GLIBC_LIBS_LIB); do \
 		$(call copy_toolchain_lib_root,$$libpattern) ; \
-- 
2.17.1
