From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 12 May 2013 21:15:52 +0200
Subject: [Buildroot] [PATCH] czmq: disable asciidoc documentation generation
Message-ID: <1368386152-27165-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

czmq uses asciidoc for its documentation. asciidoc uses python and import
the unicodedata module, which is not in host-python. So disable asciidoc
entirely.

This doesn't get hit by the autobuilders because they don't have asciidoc
installed in their chroot.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/czmq/czmq.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/czmq/czmq.mk b/package/czmq/czmq.mk
index 2b34654..d63fb78 100644
--- a/package/czmq/czmq.mk
+++ b/package/czmq/czmq.mk
@@ -14,6 +14,10 @@ CZMQ_DEPENDENCIES = zeromq
 CZMQ_LICENSE = LGPLv3+ with exceptions
 CZMQ_LICENSE_FILES = COPYING COPYING.LESSER
 
+# asciidoc is a python script that imports unicodedata, which is not in
+# host-python, so disable asciidoc entirely.
+CZMQ_CONF_ENV = ac_cv_prog_czmq_have_asciidoc=no
+
 define CZMQ_CREATE_CONFIG_DIR
 	mkdir -p $(@D)/config
 endef
-- 
1.8.2.1
