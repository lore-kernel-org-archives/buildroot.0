From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 20 Jan 2013 17:03:51 +0100
Subject: [Buildroot] [PATCH 7/7] pkg-infra: log current message
In-Reply-To: <cover.1358697765.git.yann.morin.1998@free.fr>
References: <cover.1358697765.git.yann.morin.1998@free.fr>
Message-ID: <bec3bfa51bfe97499e2dfd38adda2acef2e45cef.1358697765.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to help the auto-builders (our own, or in-house ones),
just log the current message in a file that contains:
    Package: $($(PKG)_NAME)
    Version: $($(PKG)_VERSION)
    Action : Last '>>>' message displayed

For example:
    Package: host-fakeroot
    Version: 1.18.2
    Action : Configuring

If there is no package, then the package name and version are
empty, eg.:
    Package:
    Version:
    Action : Generating root filesystem image rootfs.tar

Also, all messages are logged to a file, one per line, with the
date each message was generated at, as the number of seconds
elapsed since Epoch.

This will hopefully help autobuilders extract the real reason for
a failure, and take appropriate action (eg. bug-mail the last
git-author of a package...)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pkg-utils.mk |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 835c588..477be57 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -64,7 +64,14 @@ INFLATE.xz   = $(XZCAT)
 INFLATE.tar  = cat
 
 # MESSAGE Macro -- display a message in bold type
-MESSAGE     = echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION) $(1)$(TERM_RESET)"
+define MESSAGE
+	echo "$(TERM_BOLD)>>> $($(PKG)_NAME) $($(PKG)_VERSION) $(1)$(TERM_RESET)";   \
+	echo "$$(date '+%s'): $($(PKG)_NAME) $($(PKG)_VERSION) $(1)"                 \
+	     >>$(BUILD_DIR)/actions.log;                                             \
+	printf "Package: %s\nVersion: %s\nAction : %s\n"                             \
+	       "$($(PKG)_NAME)" "$($(PKG)_VERSION)" $(1)                             \
+	       >$(BUILD_DIR)/last-action
+endef
 TERM_BOLD  := $(shell tput smso)
 TERM_RESET := $(shell tput rmso)
 
-- 
1.7.2.5
