From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 11 Jun 2012 21:32:31 +0200
Subject: [Buildroot] [git commit] pppd: fix plugin search path
Message-ID: <20120611202841.A493596E84@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b9910f1906dc8dab6ba65fcb464ee4095c6c944a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the plugin search path by passing a --prefix to configure.
DESTDIR is used in the source code for the search path of plugins
(DESTDIR/lib/pppd/VERSION).
Since DESTDIR defaults to /usr/local we get the search path wrong so the
'plugin' directive requires a full pathspec to the plugin rather than
the .so name, which isn't nice or portable.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pppd/pppd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
index 2137f6a..a62f495 100644
--- a/package/pppd/pppd.mk
+++ b/package/pppd/pppd.mk
@@ -26,7 +26,7 @@ endif
 define PPPD_CONFIGURE_CMDS
 	$(SED) 's/FILTER=y/#FILTER=y/' $(PPPD_DIR)/pppd/Makefile.linux
 	$(SED) 's/ifneq ($$(wildcard \/usr\/include\/pcap-bpf.h),)/ifdef FILTER/' $(PPPD_DIR)/*/Makefile.linux
-	( cd $(@D); ./configure )
+	( cd $(@D); ./configure --prefix=/usr )
 endef
 
 define PPPD_BUILD_CMDS
