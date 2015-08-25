From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Aug 2015 20:53:44 +0200
Subject: [Buildroot] [git commit] package/canfestival: don't build in
	parallel
Message-ID: <20150825185349.523D281E0C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2f8b46c8f5c06273c91f4e33a52bd1795c0bfba7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Makefiles for canfestival are not correctly written, which leads to
multiple warnings such as:

    make[4]: warning: jobserver unavailable: using -j1. Add `+' to parent make rule.

Since canfestival is relatively small, it builds in less than 6s here
when not in parallell, while a parallel build takes 5s.

Just disable parallel build to avoid future surprises.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/canfestival/canfestival.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/canfestival/canfestival.mk b/package/canfestival/canfestival.mk
index e929c5e..61578d3 100644
--- a/package/canfestival/canfestival.mk
+++ b/package/canfestival/canfestival.mk
@@ -36,13 +36,13 @@ define CANFESTIVAL_CONFIGURE_CMDS
 endef
 
 define CANFESTIVAL_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) all \
+	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) all \
 		PYTHON=$(HOST_DIR)/usr/bin/python2
 endef
 
 define CANFESTIVAL_INSTALL_TARGET_CMDS
 	for d in $(CANFESTIVAL_INSTALLED-y) ; do \
-		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/$$d install \
+		$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)/$$d install \
 			PYTHON=$(HOST_DIR)/usr/bin/python2 \
 			DESTDIR=$(TARGET_DIR) || exit 1 ; \
 	done
@@ -50,7 +50,7 @@ endef
 
 define CANFESTIVAL_INSTALL_STAGING_CMDS
 	for d in $(CANFESTIVAL_INSTALLED-y) ; do \
-		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/$$d install \
+		$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D)/$$d install \
 			PYTHON=$(HOST_DIR)/usr/bin/python2 \
 			DESTDIR=$(STAGING_DIR) || exit 1 ; \
 	done
