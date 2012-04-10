From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Apr 2012 18:10:48 +0200
Subject: [Buildroot] [PATCH 4/5] busybox: enable useful hush suboptions
In-Reply-To: <cover.1334074065.git.thomas.petazzoni@free-electrons.com>
References: <cover.1334074065.git.thomas.petazzoni@free-electrons.com>
Message-ID: <68fa343e6e49a655e65d48ec6674f148823bd662.1334074065.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Our default Busybox configuration enables the ash shell, but since
this shell doesn't work on noMMU platforms, we enable the hush shell
instead. However, the hush shell by itself isn't very useful without
interactive mode, support for loops, if and case statements, etc. So
we enable them.

The drawback of this method is that those options are forcefully
selected, regarless of the users choices. The other solution would be
to have a separate Busybox configuration for noMMU platforms, or work
with fragments of Busybox configurations.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/busybox/busybox.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 59448d5..7e05ead 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -131,6 +131,11 @@ define BUSYBOX_DISABLE_MMU_APPLETS
 	$(call KCONFIG_DISABLE_OPT,CONFIG_SWAPONOFF,$(BUSYBOX_BUILD_CONFIG))
 	$(call KCONFIG_DISABLE_OPT,CONFIG_ASH,$(BUSYBOX_BUILD_CONFIG))
 	$(call KCONFIG_ENABLE_OPT,CONFIG_HUSH,$(BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_HUSH_IF,$(BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_HUSH_LOOPS,$(BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_HUSH_CASE,$(BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_HUSH_FUNCTIONS,$(BUSYBOX_BUILD_CONFIG))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_HUSH_INTERACTIVE,$(BUSYBOX_BUILD_CONFIG))
 endef
 endif
 
-- 
1.7.4.1
