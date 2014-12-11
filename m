From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 11 Dec 2014 11:53:21 +0000
Subject: [Buildroot] [PATCH 2/2] libsvgtiny: add a patch to remove -Werror
	from Makefile
In-Reply-To: <1418298801-47799-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1418298801-47799-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <1418298801-47799-2-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

glibc-2.20 includes some changes to the include/features.h file
introduced by this commit:

  https://sourceware.org/git/?p=glibc.git;a=commit;h=ade40b10ff5fa59a318cf55b9d8414b758e8df78

Those changes make libsvgtiny fail because some warnings are thrown and
the build system is using the -Werror option. We disable this to be able
to build it, or otherwise we will see errors like this one:

GPERF: src/colors.gperf
COMPILE: build-Linux-Linux-release-lib-static/src_colors.c
In file included from
/br/output/host/usr/mipsel-buildroot-linux-gnu/sysroot/usr/include/string.h:25:0,
		 from src/colors.gperf:16:
/br/output/host/usr/mipsel-buildroot-linux-gnu/sysroot/usr/include/features.h:148:3:
error: #warning "_BSD_SOURCE and _SVID_SOURCE are deprecated, use
_DEFAULT_SOURCE" [-Werror=cpp]

and this one:

In file included from src/colors.gperf:18:0:
/home/ldap/vriera/work/mips-buildroots/mips32/output/build/libsvgtiny-12121/src/svgtiny_internal.h:71:0:
error: "strndup" redefined [-Werror]

Fixes:
  http://autobuild.buildroot.net/results/3dd/3dd700405055750262738f867eb5aa08531f5781/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Markos Chandras <Markos.Chandras@imgtec.com>
---
Chages v1 -> v2: add a patch instead of using a 'sed' command

 package/libsvgtiny/0003-Remove-Werror.patch |   44 +++++++++++++++++++++++++++
 1 files changed, 44 insertions(+), 0 deletions(-)
 create mode 100644 package/libsvgtiny/0003-Remove-Werror.patch

diff --git a/package/libsvgtiny/0003-Remove-Werror.patch b/package/libsvgtiny/0003-Remove-Werror.patch
new file mode 100644
index 0000000..c8b0c0b
--- /dev/null
+++ b/package/libsvgtiny/0003-Remove-Werror.patch
@@ -0,0 +1,44 @@
+Remove -Werror from Makefile
+
+glibc-2.20 includes some changes to the include/features.h file
+introduced by this commit:
+
+  https://sourceware.org/git/?p=glibc.git;a=commit;h=ade40b10ff5fa59a318cf55b9d8414b758e8df78
+
+Those changes make libsvgtiny fail because some warnings are thrown and
+the build system is using the -Werror option. We disable this to be able
+to build it, or otherwise we will see errors like this one:
+
+GPERF: src/colors.gperf
+COMPILE: build-Linux-Linux-release-lib-static/src_colors.c
+In file included from
+/br/output/host/usr/mipsel-buildroot-linux-gnu/sysroot/usr/include/string.h:25:0,
+		 from src/colors.gperf:16:
+/br/output/host/usr/mipsel-buildroot-linux-gnu/sysroot/usr/include/features.h:148:3:
+error: #warning "_BSD_SOURCE and _SVID_SOURCE are deprecated, use
+_DEFAULT_SOURCE" [-Werror=cpp]
+
+and this one:
+
+In file included from src/colors.gperf:18:0:
+/home/ldap/vriera/work/mips-buildroots/mips32/output/build/libsvgtiny-12121/src/svgtiny_internal.h:71:0:
+error: "strndup" redefined [-Werror]
+
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+
+diff -rup a/Makefile b/Makefile
+--- a/Makefile	2010-01-03 23:37:39.000000000 +0000
++++ b/Makefile	2014-12-11 11:35:37.241903884 +0000
+@@ -13,12 +13,6 @@ TESTRUNNER := $(ECHO)
+ WARNFLAGS := -Wall -W -Wundef -Wpointer-arith -Wcast-align \
+ 	-Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes \
+ 	-Wmissing-declarations -Wnested-externs -pedantic
+-# BeOS/Haiku/AmigaOS4 standard library headers create warnings
+-ifneq ($(TARGET),beos)
+-  ifneq ($(TARGET),AmigaOS)
+-    WARNFLAGS := $(WARNFLAGS) -Werror
+-  endif
+-endif
+ CFLAGS := -D_BSD_SOURCE -I$(CURDIR)/include/ \
+ 	-I$(CURDIR)/src $(WARNFLAGS) $(CFLAGS)
+ ifneq ($(GCCVER),2)
-- 
1.7.1
