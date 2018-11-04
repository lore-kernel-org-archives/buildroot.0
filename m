From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Nov 2018 21:31:50 +0100
Subject: [Buildroot] [git commit] package/ngrep: add optional dependency on
 libdnet
Message-ID: <20181104202952.7F74C81472@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=100ba8351c088fd764effdcaba848cfd92de79dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Enable tcpkill based on libnet availability
- Add BSD-3-Clause for tcpkill, added in version 1.46 and
  https://github.com/jpr5/ngrep/commit/f2a1f8b09194a8ab87787c1fdb60b968f5957c05

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ngrep/ngrep.mk | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/ngrep/ngrep.mk b/package/ngrep/ngrep.mk
index fbfb999730..41d08d9f26 100644
--- a/package/ngrep/ngrep.mk
+++ b/package/ngrep/ngrep.mk
@@ -6,7 +6,7 @@
 
 NGREP_VERSION = 1_47
 NGREP_SITE = $(call github,jpr5,ngrep,V$(NGREP_VERSION))
-NGREP_LICENSE = BSD-4-Clause-like
+NGREP_LICENSE = BSD-4-Clause-like, BSD-3-Clause (tcpkill)
 NGREP_LICENSE_FILES = LICENSE
 NGREP_INSTALL_STAGING = YES
 # We're patching configure.in
@@ -20,9 +20,15 @@ NGREP_CONF_OPTS = \
 	--with-pcap-includes=$(STAGING_DIR)/usr/include/pcap \
 	--enable-pcre \
 	--disable-dropprivs \
-	--disable-pcap-restart \
-	--disable-tcpkill
+	--disable-pcap-restart
 
 NGREP_DEPENDENCIES = libpcap pcre
 
+ifeq ($(BR2_PACKAGE_LIBNET),y)
+NGREP_DEPENDENCIES += libnet
+NGREP_CONF_OPTS += --enable-tcpkill
+else
+NGREP_CONF_OPTS += --disable-tcpkill
+endif
+
 $(eval $(autotools-package))
