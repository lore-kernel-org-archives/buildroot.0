From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Jun 2019 16:36:06 +0200
Subject: [Buildroot] [git commit] package/tvheadend: fix PIE build failures
Message-ID: <20190620143534.4C51A82A89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dd0907d465a0d82a4844e7aaf3eb3be69103642b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Package tvheadend builds using '-pie' linker flag in any case. This
leads to linking failure if toolchain doesn't support 'pie'.

Add patch to fix tvheadend's Makefile bug where '-pie' flag is hardcoded
making it depend on '--disable-pie' as compiler's flags already are
treated.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-fix-pie-linking-according-to-disable-pie.patch | 34 ++++++++++++++++++++++
 package/tvheadend/tvheadend.mk                     |  4 +++
 2 files changed, 38 insertions(+)

diff --git a/package/tvheadend/0002-Makefile-fix-pie-linking-according-to-disable-pie.patch b/package/tvheadend/0002-Makefile-fix-pie-linking-according-to-disable-pie.patch
new file mode 100644
index 0000000000..385c94b36b
--- /dev/null
+++ b/package/tvheadend/0002-Makefile-fix-pie-linking-according-to-disable-pie.patch
@@ -0,0 +1,34 @@
+From 5cbf08213222cb507d365e6cbda87277f0b8f31e Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@micronovasrl.com>
+Date: Fri, 14 Jun 2019 14:25:08 +0200
+Subject: [PATCH] Makefile: fix -pie linking according to --disable-pie
+
+Only compilation follows './configure --disable-pie', linking instead
+doesn't, because '-pie' flag is passed to LDFLAGS uncoditionally.
+
+So add '-pie' flag only if CONFIG_PIE=yes.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
+---
+ Makefile | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 41783b546..4e5a947a3 100644
+--- a/Makefile
++++ b/Makefile
+@@ -62,7 +62,10 @@ LDFLAGS += -ldl -lm
+ else
+ LDFLAGS += -ldl -lpthread -lm
+ endif
+-LDFLAGS += -pie -Wl,-z,now
++ifeq ($(CONFIG_PIE),yes)
++LDFLAGS += -pie
++endif
++LDFLAGS += -Wl,-z,now
+ ifeq ($(CONFIG_LIBICONV),yes)
+ LDFLAGS += -liconv
+ endif
+-- 
+2.17.1
+
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index e92c111082..b192a33d4a 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -94,6 +94,10 @@ else
 TVHEADEND_CONF_OPTS += --disable-pcre
 endif
 
+ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
+TVHEADEND_CONF_OPTS += --disable-pie
+endif
+
 TVHEADEND_DEPENDENCIES += dtv-scan-tables
 
 # The tvheadend build system expects the transponder data to be present inside
