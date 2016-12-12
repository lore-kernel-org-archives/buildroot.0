From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 12 Dec 2016 17:54:25 -0300
Subject: [Buildroot] [PATCH] icu: fix build failure for musl
Message-ID: <20161212205425.29423-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

musl doesn't have xlocale.h, and stdtod_l is crippled, so disable it.
See thread from OE:
http://lists.openembedded.org/pipermail/openembedded-core/2016-November/128527.html
Fixes:
http://autobuild.buildroot.net/results/6ca/6caebf0f6c4adf66e67bedd0f04155413a9aa7bd/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/icu/icu.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index 12406d7..b9e42de 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -25,6 +25,11 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 ICU_CONF_ENV += LIBS="-latomic"
 endif
 
+# strtod_l() is not supported by musl; also xlocale.h is missing
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+ICU_CONF_ENV += ac_cv_func_strtod_l=no
+endif
+
 HOST_ICU_CONF_OPTS = \
 	--disable-samples \
 	--disable-tests \
-- 
2.10.2
