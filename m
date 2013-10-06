From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  6 Oct 2013 13:19:48 +0200
Subject: [Buildroot] [PATCH] pkg-infra: log current message
Message-ID: <1381058388-24055-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

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
 package/pkg-utils.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 5930f2c..ad6bd7c 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -66,7 +66,14 @@ INFLATE.tar  = cat
 suitable-extractor = $(INFLATE$(suffix $(1)))
 
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
1.8.1.2
