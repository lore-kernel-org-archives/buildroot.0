From: =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>
Date: Fri,  7 Nov 2014 00:50:36 -0300
Subject: [Buildroot] [PATCH v2 3/5] pkg-generic.mk: don't depend on external
	package permissions
In-Reply-To: <1415332238-31677-1-git-send-email-guido@vanguardiasur.com.ar>
References: <1415018556-28336-1-git-send-email-guido@vanguardiasur.com.ar>
 <1415332238-31677-1-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <1415332238-31677-4-git-send-email-guido@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reset permissions for rsynced packages (when using OVERRIDE_SRCDIR) to
755/644. We do this under the assumption that source files shouldn't
care about their permissions, except for possibly the exec bit.

This guarantees that if a package uses 'rsync -a' or 'cp -p' to copy
a file from its build dir to the target, it'll end up with the same
permissions on the target every time.

Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
---
 package/pkg-generic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 9643a30..ec2989f 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -117,7 +117,7 @@ $(BUILD_DIR)/%/.stamp_rsynced:
 	@$(call MESSAGE,"Syncing from source dir $(SRCDIR)")
 	@test -d $(SRCDIR) || (echo "ERROR: $(SRCDIR) does not exist" ; exit 1)
 	$(foreach hook,$($(PKG)_PRE_RSYNC_HOOKS),$(call $(hook))$(sep))
-	rsync -au $(RSYNC_VCS_EXCLUSIONS) $(SRCDIR)/ $(@D)
+	rsync -au --chmod=u=rwX,go=rX $(RSYNC_VCS_EXCLUSIONS) $(SRCDIR)/ $(@D)
 	$(foreach hook,$($(PKG)_POST_RSYNC_HOOKS),$(call $(hook))$(sep))
 	$(Q)touch $@
 
-- 
2.1.1
