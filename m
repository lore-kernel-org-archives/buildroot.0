From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 8 Aug 2017 17:11:20 +0200
Subject: [Buildroot] [git commit branch/next] mutt: fix build with
	BR2_PACKAGE_SKELETON_NONE
Message-ID: <20170809225749.3D3517FF5E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f6756d69154bb8a68232ff11d4b15a2a8f0788b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

BR2_PACKAGE_SKELETON_NONE does not provide the /var subdirectory which
breaks symlink creation in that directory. Make sure that /var exists
before creating the symlink.

Fixes:
http://autobuild.buildroot.net/results/32d/32dff0df759baf1120e4f11335e735eb0708b237/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mutt/mutt.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index abd40e5..b0bf5a7 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -66,6 +66,7 @@ MUTT_CONF_ENV += \
 MUTT_CONF_OPTS += --with-mailpath=/var/mail
 
 define MUTT_VAR_MAIL
+	mkdir -p $(TARGET_DIR)/var
 	ln -sf /tmp $(TARGET_DIR)/var/mail
 endef
 MUTT_POST_INSTALL_TARGET_HOOKS += MUTT_VAR_MAIL
