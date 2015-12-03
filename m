From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  3 Dec 2015 23:22:07 +0100
Subject: [Buildroot] [PATCH 2/2] package/gawk: add optional readline
	dependency
In-Reply-To: <cover.1449181275.git.yann.morin.1998@free.fr>
References: <cover.1449181275.git.yann.morin.1998@free.fr>
Message-ID: <f37416a8d0f491f30efbc89ddd3a2ce82e56b65c.1449181275.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The gawk debugger can optionally use readline for user input during
the debugging session (for the usual autocompletion and stuff).

Enable readline support when the readline package is enabled; let
./configure automatically find it. Forcibly disable readline support
when the readline package is disabled.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>
---
 package/gawk/gawk.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index 74c1fe4..4145025 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -23,6 +23,13 @@ else
 GAWK_CONF_OPTS += --without-mpfr
 endif
 
+# When enabled, let ./configure find it automatically
+ifeq ($(BR2_PACKAGE_READLINE),y)
+GAWK_DEPENDENCIES += readline
+else
+GAWK_CONF_OPTS += --without-readline
+endif
+
 # We don't have a host-busybox, and we don't want to use readline or mpfr
 HOST_GAWK_DEPENDENCIES =
 
-- 
1.9.1
