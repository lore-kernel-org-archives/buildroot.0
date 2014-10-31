From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Oct 2014 16:19:59 +0100
Subject: [Buildroot] [git commit] libpcap: omit -rpath from pcap-config
Message-ID: <20141031152829.E717CB25DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=be995fbb403653336b5929adcd6e90b1ebbbe604
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For target processes the libraries are always in their usual location under
/lib and /usr/lib. It doesn't make sense to add RPATH tag pointing to host
build directory to programs using libpcap. This commit changes V_RPATH_OPT in
pcap-config to remove -rpath from its output.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpcap/libpcap.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index 6126a86..bcc83ed 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -20,6 +20,12 @@ LIBPCAP_CFLAGS = $(TARGET_CFLAGS)
 LIBPCAP_CONF_OPTS = --disable-yydebug --with-pcap=linux
 LIBPCAP_CONFIG_SCRIPTS = pcap-config
 
+# Omit -rpath from pcap-config output
+define LIBPCAP_CONFIG_REMOVE_RPATH
+	$(SED) 's/^V_RPATH_OPT=.*/V_RPATH_OPT=""/g' $(@D)/pcap-config
+endef
+LIBPCAP_POST_BUILD_HOOKS = LIBPCAP_CONFIG_REMOVE_RPATH
+
 # On purpose, not compatible with bluez5
 ifeq ($(BR2_PACKAGE_BLUEZ_UTILS),y)
 LIBPCAP_DEPENDENCIES += bluez_utils
