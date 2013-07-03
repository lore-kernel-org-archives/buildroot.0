From: Wade Berrier <wberrier@gmail.com>
Date: Wed, 3 Jul 2013 14:57:35 -0600
Subject: [Buildroot] [PATCH] tar: avoid ccache chicken and egg problem when
 bootstrapping tar
Message-ID: <20130703205733.GA11235@berrier.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Wade Berrier <wberrier@gmail.com>
---
 package/tar/tar.mk |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index 3ffeaf0..56443a8 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -20,6 +20,11 @@ $(eval $(autotools-package))
 # host-tar: use cpio.gz instead of tar.gz to prevent chicken-egg problem
 # of needing tar to build tar.
 HOST_TAR_SOURCE = tar-$(TAR_VERSION).cpio.gz
+
+# ccache isn't available yet when building for the host
+HOST_TAR_CONF_ENV = \
+	CC="$(HOSTCC_NOCCACHE)"
+
 define HOST_TAR_EXTRACT_CMDS
 	mkdir -p $(@D)
 	cd $(@D) && \
-- 
1.7.9.5
