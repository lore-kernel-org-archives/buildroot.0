From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 06 Oct 2013 21:59:22 +0200
Subject: [Buildroot] [PATCH 1/1] ngrep: fix static linking issue with libpcre
Message-ID: <5251C11A.10808@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


-lpcre must be placed in LIBS
So, use EXTRA_LIBS variable instead of LDFLAGS

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/ngrep/ngrep-1.45-configure-extra-lib.patch | 22 ++++++++++++++++++++++
 package/ngrep/ngrep.mk                             |  3 ++-
 2 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 package/ngrep/ngrep-1.45-configure-extra-lib.patch

diff --git a/package/ngrep/ngrep-1.45-configure-extra-lib.patch b/package/ngrep/ngrep-1.45-configure-extra-lib.patch
new file mode 100644
index 0000000..aeb6a39
--- /dev/null
+++ b/package/ngrep/ngrep-1.45-configure-extra-lib.patch
@@ -0,0 +1,22 @@
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ configure | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure b/configure
+index 621f1be..bd5649f 100755
+--- a/configure
++++ b/configure
+@@ -3533,7 +3533,7 @@ fi
+
+ EXTRA_DEFINES=""
+ EXTRA_INCLUDES=""
+-EXTRA_LIBS=""
++EXTRA_LIBS ?= ""
+
+
+
+--
+1.8.4
+
diff --git a/package/ngrep/ngrep.mk b/package/ngrep/ngrep.mk
index 99b8f46..1501dab 100644
--- a/package/ngrep/ngrep.mk
+++ b/package/ngrep/ngrep.mk
@@ -8,7 +8,8 @@ NGREP_VERSION = 1.45
 NGREP_SOURCE = ngrep-$(NGREP_VERSION).tar.bz2
 NGREP_SITE = http://downloads.sourceforge.net/project/ngrep/ngrep/$(NGREP_VERSION)
 NGREP_INSTALL_STAGING = YES
-NGREP_CONF_ENV = LDFLAGS="-lpcre"
+NGREP_CONF_ENV = EXTRA_LIBS="-lpcre"
+
 NGREP_CONF_OPT =  \
 	--with-pcap-includes=$(STAGING_DIR)/usr/include \
 	--enable-pcre \
-- 
1.8.4
