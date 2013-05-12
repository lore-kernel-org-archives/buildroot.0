From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 12 May 2013 21:28:10 +0200
Subject: [Buildroot] [git commit] czmq: disable asciidoc documentation
	generation
Message-ID: <20130512193210.DED2E9A094@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=92cd8a527373bf0c059f806761a851d2364d0246
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

czmq uses asciidoc for its documentation. asciidoc uses python and import
the unicodedata module, which is not in host-python. So disable asciidoc
entirely.

This doesn't get hit by the autobuilders because they don't have asciidoc
installed in their chroot.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/czmq/czmq.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

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
