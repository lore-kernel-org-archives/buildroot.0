From: Baruch Siach <baruch@tkos.co.il>
Date: Fri,  5 Dec 2014 09:09:53 +0200
Subject: [Buildroot] [PATCH] ltrace: disable elfutils unwinding when
	libunwind is used
Message-ID: <8b0ae63676267c7fb215344ddb2ef959eaaf165d.1417763393.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ltrace can't use both.

Fixes:
http://autobuild.buildroot.net/results/a3c/a3c1647578cdeda3aaf672084a9a893f06dbad26/
http://autobuild.buildroot.net/results/fdb/fdb7e760faeda77b263a6dac3e322a25b53e67ff/
http://autobuild.buildroot.net/results/70a/70a0614ca7baf6a46898834a87cd46865f6e3385/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/ltrace/ltrace.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ltrace/ltrace.mk b/package/ltrace/ltrace.mk
index 5c9549f4019b..61e0fb7d57be 100644
--- a/package/ltrace/ltrace.mk
+++ b/package/ltrace/ltrace.mk
@@ -21,7 +21,7 @@ LTRACE_POST_PATCH_HOOKS += LTRACE_CREATE_CONFIG_M4
 # We don't normally do so for uClibc and we can't know if it's external
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),)
-LTRACE_CONF_OPTS += --with-libunwind=yes
+LTRACE_CONF_OPTS += --with-libunwind=yes --with-elfutils=no
 LTRACE_DEPENDENCIES += libunwind
 else
 LTRACE_CONF_OPTS += --with-libunwind=no
-- 
2.1.3
