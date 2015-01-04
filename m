From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  4 Jan 2015 10:59:35 +0100
Subject: [Buildroot] [PATCH] package/janus-gateway: fix compilation with
	older gcc versions
Message-ID: <1420365575-25718-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

janus-gateway forcibly uses -Wunused-but-set-variable, which is not
available for all gcc versions. For example, gcc-4.5, as used in
Sourcery CodeBench PowerPC 2011.03, does not have it.

Fixes:
    http://autobuild.buildroot.org/results/6d8/6d8e15ac5d592a51b6a8d2ceb9fc1ca954428ed7/
    http://autobuild.buildroot.org/results/abe/abe25b588bf6de0d76cce0135841d65dc66d5cca/
    [...]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gregory Dymarek <gregd72002@gmail.com>
---
 package/janus-gateway/0002-no-unused-but-set.patch | 20 ++++++++++++++++++++
 package/janus-gateway/janus-gateway.mk             |  1 +
 2 files changed, 21 insertions(+)
 create mode 100644 package/janus-gateway/0002-no-unused-but-set.patch

diff --git a/package/janus-gateway/0002-no-unused-but-set.patch b/package/janus-gateway/0002-no-unused-but-set.patch
new file mode 100644
index 0000000..652a73f
--- /dev/null
+++ b/package/janus-gateway/0002-no-unused-but-set.patch
@@ -0,0 +1,20 @@
+Makefile: do not forcibly pass -Wunused-but-set-variable
+
+Not all versions of gcc support that warning; for example, gcc 4.5
+does not, but is still widely used.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Cc: Gregory Dymarek <gregd72002@gmail.com>
+
+diff -durN a/Makefile.am b/Makefile.am
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -6,7 +6,7 @@
+ 	-Wnested-externs -Wstrict-prototypes -Wunsafe-loop-optimizations \
+ 	-Wwrite-strings -Wno-missing-field-initializers -Wno-unused-parameter \
+ 	-Wcast-align -Wformat-nonliteral -Wformat-security -Wswitch-default \
+-	-Wmissing-include-dirs -Waggregate-return -Wunused-but-set-variable \
++	-Wmissing-include-dirs -Waggregate-return \
+ 	-Warray-bounds -Wold-style-definition -Wsign-compare -Wlarger-than=65537
+ AM_CFLAGS += -Wno-undef  # sophiasip is not -Wundef--safe
+ AM_CFLAGS += -Wredundant-decls  # sophiasip also contains redundant declarations
diff --git a/package/janus-gateway/janus-gateway.mk b/package/janus-gateway/janus-gateway.mk
index 6c89e9a..47cf499 100644
--- a/package/janus-gateway/janus-gateway.mk
+++ b/package/janus-gateway/janus-gateway.mk
@@ -14,6 +14,7 @@ JANUS_GATEWAY_DEPENDENCIES = host-pkgconf libmicrohttpd jansson \
 	libnice sofia-sip libsrtp host-gengetopt openssl ding-libs
 
 # Straight out of the repository, no ./configure
+# We also touch Makefile.am anyway.
 JANUS_GATEWAY_AUTORECONF = YES
 
 define JANUS_GATEWAY_M4
-- 
1.9.1
