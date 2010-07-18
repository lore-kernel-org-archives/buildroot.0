From: Malte Starostik <m-starostik@versanet.de>
Date: Sun, 18 Jul 2010 22:16:46 +0200
Subject: [Buildroot] [PATCH 1/2] Match whole words when changing .config
	options
Message-ID: <1279484207-1692-1-git-send-email-m-starostik@versanet.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make KCONFIG_{ENABLE,DISABLE,SET}_OPT match whole words only.
Fixes that BR_INET_IPV6 enables CONFIG_IPV6 in the kernel's
.config, but also nukes everything with "CONFIG_IPV6" in its name, e.g.
CONFIG_IPV6_PRIVACY.  This in turn causes any IPv6 options in a custom
kernel .config to be lost and oldconfig going interactive.
---
 package/Makefile.package.in |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index c476de9..d76b791 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -41,17 +41,17 @@ UPPERCASE = $(strip $(eval __tmp := $1) \
      $(__tmp))
 
 define KCONFIG_ENABLE_OPT
-       $(SED) "/$(1)/d" $(2)
+       $(SED) "/\\<$(1)\\>/d" $(2)
        echo "$(1)=y" >> $(2)
 endef
 
 define KCONFIG_SET_OPT
-       $(SED) "/$(1)/d" $(3)
+       $(SED) "/\\<$(1)\\>/d" $(3)
        echo "$(1)=$(2)" >> $(3)
 endef
 
 define KCONFIG_DISABLE_OPT
-       $(SED) "/$(1)/d" $(2)
+       $(SED) "/\\<$(1)\\>/d" $(2)
        echo "# $(1) is not set" >> $(2)
 endef
 
-- 
1.7.1
