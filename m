From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Apr 2014 20:12:35 +0200
Subject: [Buildroot] [git commit] gettext: make host gettextize
	non-interactive
Message-ID: <20140403181311.A30859C518@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=42e623ac2361feb28c1a37e14d612d916d1135cf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make the host gettextize tool non-interactive to avoid stalling for user
confirmation when using it to fix up a package.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gettext/gettext.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index 748c2a5..b5efa76 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -57,5 +57,11 @@ endef
 endif
 endif # GETTEXT_TOOLS = n
 
+# Disable interactive confirmation in host gettextize for package fixups
+define HOST_GETTEXT_GETTEXTIZE_CONFIRMATION
+	$(SED) '/read dummy/d' $(HOST_DIR)/usr/bin/gettextize
+endef
+HOST_GETTEXT_POST_INSTALL_HOOKS += HOST_GETTEXT_GETTEXTIZE_CONFIRMATION
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
