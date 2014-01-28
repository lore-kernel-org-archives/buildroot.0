From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Jan 2014 22:55:55 +0100
Subject: [Buildroot] [git commit] busybox: ensure $(BUSYBOX_BUILD_CONFIG) is
	writable
Message-ID: <20140128215820.A71519C582@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9b659b815bbb747590f64f57066b36b938946353
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If $(BUSYBOX_CONFIG_FILE) is read-only (eg. because Buildroot's
source dir is), the sed fixups to $(BUSYBOX_BUILD_CONFIG) fail.

Fixes: #4363
Signed-off-by: Nathan Lynch <ntl@pobox.com>
[yann.morin.1998 at free.fr: use $(INSTALL) instead of cp]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/busybox.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index f6f542e..948f3e4 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -135,7 +135,7 @@ endef
 endif
 
 define BUSYBOX_COPY_CONFIG
-	cp -f $(BUSYBOX_CONFIG_FILE) $(BUSYBOX_BUILD_CONFIG)
+	$(INSTALL) -D -m 0644 $(BUSYBOX_CONFIG_FILE) $(BUSYBOX_BUILD_CONFIG)
 endef
 
 # Disable shadow passwords support if unsupported by the C library
