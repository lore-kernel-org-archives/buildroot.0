From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 9 Dec 2014 12:32:44 +0100
Subject: [Buildroot] [git commit] ltrace: disable elfutils unwinding when
	libunwind is used
Message-ID: <20141209133124.25B3280096@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2c81e8e779b42d81bb3f05b764e9654a0feef64b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ltrace can't use both. Use --with-elfutils=no to disable use of elfutils
(libdwfl) for unwinding.

Note that elfutils (libelf) is still a mandatory dependency regardless of
--with-elfutils.

Fixes:
http://autobuild.buildroot.net/results/a3c/a3c1647578cdeda3aaf672084a9a893f06dbad26/
http://autobuild.buildroot.net/results/fdb/fdb7e760faeda77b263a6dac3e322a25b53e67ff/
http://autobuild.buildroot.net/results/70a/70a0614ca7baf6a46898834a87cd46865f6e3385/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ltrace/ltrace.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/ltrace/ltrace.mk b/package/ltrace/ltrace.mk
index 5c9549f..7f00ce3 100644
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
