From: Jan Viktorin <viktorin@rehivetech.com>
Date: Wed, 19 Aug 2015 15:14:35 +0200
Subject: [Buildroot] [PATCH v1 1/2] pkg-utils: Define KCONFIG_ASSERT_OPT
	macro
In-Reply-To: <1439990076-10412-1-git-send-email-viktorin@rehivetech.com>
References: <1439990076-10412-1-git-send-email-viktorin@rehivetech.com>
Message-ID: <1439990076-10412-2-git-send-email-viktorin@rehivetech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The macro can be used (eg. in packages) to assure that
a certain option in the Linux/BusyBox/...'s .config is
set to the given value.

Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
---
 package/pkg-utils.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 44bd2c9..1e34864 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -63,6 +63,11 @@ define KCONFIG_DISABLE_OPT # (option, file)
 	echo '# $(1) is not set' >> $(2)
 endef
 
+define KCONFIG_ASSERT_OPT # (option, value, file)
+	grep "\\<$(1)\\>=$(2)" $(3) > /dev/null \
+		|| (echo "KCONFIG_ASSERT_OPT($(1),$(2),$(3)) has failed" >&2; exit 1)
+endef
+
 # Helper functions to determine the name of a package and its
 # directory from its makefile directory, using the $(MAKEFILE_LIST)
 # variable provided by make. This is used by the *-package macros to
-- 
2.5.0
