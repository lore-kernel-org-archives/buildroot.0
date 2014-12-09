From: Baruch Siach <baruch@tkos.co.il>
Date: Tue,  9 Dec 2014 08:11:48 +0200
Subject: [Buildroot] [PATCH v2] ltrace: disable elfutils unwinding when
	libunwind is used
Message-ID: <7c0664a803bc2302dabed5243c09d57528ea3c4c.1418105508.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ltrace can't use both. Use --with-elfutils=no to disable use of elfutils
(libdwfl) for unwinding.

Note that elfutils (libelf) is still a mandatory dependency regardless of
--with-elfutils.

Fixes:
http://autobuild.buildroot.net/results/a3c/a3c1647578cdeda3aaf672084a9a893f06dbad26/
http://autobuild.buildroot.net/results/fdb/fdb7e760faeda77b263a6dac3e322a25b53e67ff/
http://autobuild.buildroot.net/results/70a/70a0614ca7baf6a46898834a87cd46865f6e3385/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v2:
	* Improve commit log; note that elfutils is a dependency anyway
	* Add code comment
---
 package/ltrace/ltrace.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/ltrace/ltrace.mk b/package/ltrace/ltrace.mk
index 5c9549f4019b..7f00ce324e9c 100644
--- a/package/ltrace/ltrace.mk
+++ b/package/ltrace/ltrace.mk
@@ -21,7 +21,9 @@ LTRACE_POST_PATCH_HOOKS += LTRACE_CREATE_CONFIG_M4
 # We don't normally do so for uClibc and we can't know if it's external
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),)
-LTRACE_CONF_OPTS += --with-libunwind=yes
+# --with-elfutils only selects unwinding support backend. elfutils is a
+# mandatory dependency regardless.
+LTRACE_CONF_OPTS += --with-libunwind=yes --with-elfutils=no
 LTRACE_DEPENDENCIES += libunwind
 else
 LTRACE_CONF_OPTS += --with-libunwind=no
-- 
2.1.3
