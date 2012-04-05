From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 5 Apr 2012 21:38:48 +0200
Subject: [Buildroot] [git commit] haserl: fix lua support build on hosts
	without lua development package
Message-ID: <20120405193916.5E5CA96A13@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dc2a3048ebed15d6555fbfa601dee408038610e0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Abuse lua2c_LDFLAGS to pass the correct host cflags/ldflags when lua2c
is built for the host.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/haserl/haserl.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/haserl/haserl.mk b/package/haserl/haserl.mk
index c8a88ad..dfe4cf0 100644
--- a/package/haserl/haserl.mk
+++ b/package/haserl/haserl.mk
@@ -10,7 +10,9 @@ HASERL_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/ha
 ifeq ($(BR2_PACKAGE_HASERL_WITH_LUA),y)
 	HASERL_CONF_OPT += --with-lua=$(STAGING_DIR) \
 		--with-lua-headers=$(STAGING_DIR)
-	HASERL_DEPENDENCIES += lua
+	HASERL_DEPENDENCIES += lua host-lua
+	# lua2c is built for host, so needs to find host libs/headers
+	HASERL_MAKE_OPT += lua2c_LDFLAGS='$(HOST_CFLAGS) $(HOST_LDFLAGS)'
 endif
 
 define HASERL_REMOVE_EXAMPLES
