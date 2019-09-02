From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 15:52:57 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/daq: fix build
 with host libdnet
Message-ID: <20190902134858.5DCBB88F41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f669af108770b92bcc00e77ec252f1705f59bc7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=12106

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit bd8a37a681cb5190f5af0ed1c20f556bf5661345)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/daq/daq.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/daq/daq.mk b/package/daq/daq.mk
index a23a9dc5ee..f0f996ba2c 100644
--- a/package/daq/daq.mk
+++ b/package/daq/daq.mk
@@ -18,6 +18,13 @@ DAQ_MAKE = $(MAKE1)
 # disable ipq module as libipq is deprecated
 DAQ_CONF_OPTS += --disable-ipq-module
 
+# Set --with-dnet-{includes,libraries} even if ipq and nfq modules are disabled
+# otherwise daq will call 'dnet-config --cflags' and 'dnet-config --libs' which
+# will result in a build failure if libdnet is installed on host
+DAQ_CONF_OPTS += \
+	--with-dnet-includes=$(STAGING_DIR)/usr/include \
+	--with-dnet-libraries=$(STAGING_DIR)/usr/lib
+
 ifeq ($(BR2_PACKAGE_LIBDNET)$(BR2_PACKAGE_LIBNETFILTER_QUEUE),yy)
 DAQ_DEPENDENCIES += libdnet libnetfilter_queue
 DAQ_CONF_OPTS += --enable-nfq-module
