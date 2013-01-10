From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Thu, 10 Jan 2013 21:52:39 +0200
Subject: [Buildroot] [PATCH v2] pkg-infra: add <pkg>_CONFIG_FIXUP to fix
	*-config files
In-Reply-To: <1357847559-31530-1-git-send-email-stefan.froberg@petroprogram.com>
References: <1357847559-31530-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <1357847559-31530-2-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch will add <pkg>_CONFIG_FIXUP variable to buildroot infra.
It's purpose is to inform buildroot that the package in question
contains some $(STAGING_DIR)/usr/bin/*-config files and that we
want to automatically fix prefixes of such files.

It is often the case that many packages call these
files during their configuration step to determine 3rd party
library package locations and any flags needed to link against them.

For example:
Some package might try to check the existense and linking flags
of NSPR package by calling $(STAGING_DIR)/usr/bin/nspr-config --prefix.
Without this fix, NSPR would return /usr/ as it's prefix which is 
wrong when cross-compiling.
Correct would be $(STAGING_DIR)/usr.

All packages that have <pkg>_INSTALL_STAGING = YES defined and
also install some config file(s) into $(STAGING_DIR)/usr/bin must
hereafter also define <pkg>_CONFIG_FIXUP with the corresponding
filename(s).

For example:

DIVINE_CONFIG_FIXUP = divine-config

or for multiple files:

IMAGEMAGICK_CONFIG_FIXUP = Magick-config Wand-config

Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 package/pkg-generic.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index a570ad7..9f6ea7b 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -121,6 +121,12 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
 	@$(call MESSAGE,"Installing to staging directory")
 	$($(PKG)_INSTALL_STAGING_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_STAGING_HOOKS),$(call $(hook))$(sep))
+	$(Q)if test -n "$($(PKG)_CONFIG_FIXUP)" ; then \
+		$(call MESSAGE,"Fixing package configuration files") ;\
+		$(SED) "s,^prefix=.*,prefix=$(STAGING_DIR)/usr,g" \
+			-e "s,^exec_prefix=.*,exec_prefix=$(STAGING_DIR)/usr,g" \
+			$(addprefix $(STAGING_DIR)/usr/bin/,$($(PKG)_CONFIG_FIXUP)) ;\
+	fi
 	$(Q)touch $@
 
 # Install to images dir
-- 
1.7.7.6
