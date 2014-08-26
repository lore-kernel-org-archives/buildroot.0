From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 26 Aug 2014 23:49:18 +0200
Subject: [Buildroot] [git commit] libev: don't install event.h
Message-ID: <20140826215057.38F259D552@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5de840cc6a9370c0765da4ad55cd116c96ef741c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's a 'compatibility layer' with libevent which we:
1) Don't need
2) Possibly outdated with respect to libevent2
3) Causes build failures

Fixes:
http://autobuild.buildroot.net/results/451/4510fe02ef3497803ed27bf339dca07b3b073c10/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libev/libev.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/libev/libev.mk b/package/libev/libev.mk
index a6ff3a9..dc42858 100644
--- a/package/libev/libev.mk
+++ b/package/libev/libev.mk
@@ -10,4 +10,11 @@ LIBEV_INSTALL_STAGING = YES
 LIBEV_LICENSE = BSD-2c or GPLv2+
 LIBEV_LICENSE_FILES = LICENSE
 
+# The 'compatibility' event.h header conflicts with libevent
+# It's completely unnecessary for BR packages so remove it
+define LIBEV_DISABLE_EVENT_H_INSTALL
+	$(SED) 's/ event.h//' $(@D)/Makefile.in
+endef
+LIBEV_POST_PATCH_HOOKS += LIBEV_DISABLE_EVENT_H_INSTALL
+
 $(eval $(autotools-package))
