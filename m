From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 11 Oct 2012 09:01:39 +0200
Subject: [Buildroot] [git commit] sudo: ensure proper CPPFLAGS are used for
	host/compat build
Message-ID: <20121011070543.B937699835@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=526badc945d797f38a647441e418e8a8ae9d43ea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/ea326401a6711aaac10696629655e6d5ac4e0a90

sudo internally uses CPPFLAGS, so host/compat build now breaks after
CPPFLAGS got added to HOST_CONFIGURE_OPTS.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sudo/sudo.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 71dacec..e6b554c 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -18,7 +18,9 @@ SUDO_CONF_OPT = \
 
 # mksigname/mksiglist needs to run on build host to generate source files
 define SUDO_BUILD_MKSIGNAME_MKSIGLIST_HOST
-	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D)/compat mksigname mksiglist
+	$(MAKE) $(HOST_CONFIGURE_OPTS) \
+		CPPFLAGS="$(HOST_CPPFLAGS) -I../include -I.." \
+		-C $(@D)/compat mksigname mksiglist
 endef
 
 SUDO_POST_CONFIGURE_HOOKS += SUDO_BUILD_MKSIGNAME_MKSIGLIST_HOST
