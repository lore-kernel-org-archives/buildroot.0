From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Dec 2016 22:27:10 +0100
Subject: [Buildroot] [git commit] icu: fix build failure for musl
Message-ID: <20161212212714.3589980AEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=93aaf48d29f315caf6ba9254559ad119ca0d5cb9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

musl doesn't have xlocale.h, and stdtod_l is crippled, so disable it.
See thread from OE:
http://lists.openembedded.org/pipermail/openembedded-core/2016-November/128527.html
Fixes:
http://autobuild.buildroot.net/results/6ca/6caebf0f6c4adf66e67bedd0f04155413a9aa7bd/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
