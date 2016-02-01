From: Samuel Martin <s.martin49@gmail.com>
Date: Mon,  1 Feb 2016 16:53:34 +0100
Subject: [Buildroot] [PATCH v6 06/13] core: make host *-config scripts
	relocatable
In-Reply-To: <1454342021-22960-1-git-send-email-s.martin49@gmail.com>
References: <1454342021-22960-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1454342021-22960-7-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This change adjusts the _CONFIG_SCRIPTS hook to set add {exec_,}prefix computed
relatively to the script location.

This patch only fixes *-config scripts located in the host area, those
from the target and staging area are already handled.

This hook is a kind of brute-force sed on all files matching '*-config'
in the $(HOST_DIR)/usr/bin directory. This allows correctly handle
script whose name may depends on the host system, not the target
configuration (e.g. ncurses can be configured for the target to be
ncurses6w, so ncurses6w-config ; whereas for the host it will be
ncurses5, so ncurses5-config).
Since there way less host packages than target ones, it is reasonable to
assume that processing all *-config scripts found when a host package
(whose target package set the *_CONFIG_SCRIPTS variable) is fairly short
and does not add its overhead not even noticeable.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v5 -> v6:
- new patch
---
 package/pkg-generic.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 1bf613e..ca79450 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -207,6 +207,18 @@ $(BUILD_DIR)/%/.stamp_host_installed:
 	$(foreach hook,$($(PKG)_PRE_INSTALL_HOOKS),$(call $(hook))$(sep))
 	+$($(PKG)_INSTALL_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_HOOKS),$(call $(hook))$(sep))
+	$(Q)if test -n "$($(RAWNAME)_CONFIG_SCRIPTS)" ; then \
+		$(call MESSAGE,"Fixing package configuration files") ;\
+			ls $(HOST_DIR)/usr/bin/*-config 2>/dev/null |\
+			xargs --no-run-if-empty \
+			$(SED)  "s,$(BASE_DIR), at BASE_DIR@,g" \
+				-e "s,$(HOST_DIR), at HOST_DIR@,g" \
+				-e "s,^\(exec_\)\?prefix=.*,\1prefix=\`dirname \$$0\`/../../usr,g" \
+				-e "s,-I/usr/,-I at HOST_DIR@/usr/,g" \
+				-e "s,-L/usr/,-L at HOST_DIR@/usr/,g" \
+				-e "s, at HOST_DIR@,$(HOST_DIR),g" \
+				-e "s, at BASE_DIR@,$(BASE_DIR),g" ;\
+	fi
 	@$(call step_end,install-host)
 	$(Q)touch $@
 
-- 
2.7.0
