From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  6 Dec 2015 12:13:59 +0100
Subject: [Buildroot] [PATCH 2/2 v2] package/gawk: add optional readline
	dependency
In-Reply-To: <cover.1449400403.git.yann.morin.1998@free.fr>
References: <cover.1449400403.git.yann.morin.1998@free.fr>
Message-ID: <2b971b558fa20e875348aa2213e0ad385f72d20f.1449400403.git.yann.morin.1998@free.fr>
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
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
Changes v1 -> v2:
  - better comment on why no --with-readline  (Arnout)
---
 package/gawk/gawk.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index 0fd131d..507ea6d 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -24,6 +24,14 @@ else
 GAWK_CONF_OPTS += --without-mpfr
 endif
 
+# --with-readline requires an argument so just let
+# configure find it automatically
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
