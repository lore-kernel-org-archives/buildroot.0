From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 4 Jan 2020 15:42:46 +0100
Subject: [Buildroot] [git commit] package/linux-tools: add support for
 installing init system files
Message-ID: <20200104145905.A96BA8EB41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b02afdf32feb841c2666cbf3eab2f6d34b0474f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some linux tools (e.g. the Microsoft HyperV convenience utilities) will
install programs tostart at boot time, so they need to be able to
install init files (systemd units, sysv init script, or openrc units).

Unlike the other commands, we are redefining the real _INSTALL_INIT_*
macros, rather than use hooks, to let the infra call those at the right
moment.

We must be careful about the openrc support, though: if two tools are
enabled, one which provides sysv scripts but no openrc config, and the
other which provides openrc config, and we are using openrc as init
system, then we want to use the sysv scripts from the former as well as
the openrc config of the latter. Thus we need to duplicate a bit the
openrc logic here.

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
[yann.morin.1998 at free.fr:
  - define macros, not hooks
  - introduce support for openrc too
  - expand commit log
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-tools/linux-tools.mk | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/package/linux-tools/linux-tools.mk b/package/linux-tools/linux-tools.mk
index ac4da59b17..65d9e850e0 100644
--- a/package/linux-tools/linux-tools.mk
+++ b/package/linux-tools/linux-tools.mk
@@ -42,4 +42,26 @@ LINUX_TOOLS_POST_INSTALL_TARGET_HOOKS += $(foreach tool,$(LINUX_TOOLS),\
 	$(if $(BR2_PACKAGE_LINUX_TOOLS_$(call UPPERCASE,$(tool))),\
 		$(call UPPERCASE,$(tool))_INSTALL_TARGET_CMDS))
 
+define LINUX_TOOLS_INSTALL_INIT_SYSTEMD
+	$(foreach tool,$(LINUX_TOOLS),\
+		$(if $(BR2_PACKAGE_LINUX_TOOLS_$(call UPPERCASE,$(tool))),\
+			$($(call UPPERCASE,$(tool))_INSTALL_INIT_SYSTEMD))
+	)
+endef
+
+define LINUX_TOOLS_INSTALL_INIT_SYSV
+	$(foreach tool,$(LINUX_TOOLS),\
+		$(if $(BR2_PACKAGE_LINUX_TOOLS_$(call UPPERCASE,$(tool))),\
+			$($(call UPPERCASE,$(tool))_INSTALL_INIT_SYSV))
+	)
+endef
+
+define LINUX_TOOLS_INSTALL_INIT_OPENRC
+	$(foreach tool,$(LINUX_TOOLS),\
+		$(if $(BR2_PACKAGE_LINUX_TOOLS_$(call UPPERCASE,$(tool))),\
+			$(or $($(call UPPERCASE,$(tool))_INSTALL_INIT_OPENRC),\
+			     $($(call UPPERCASE,$(tool))_INSTALL_INIT_SYSV)))
+	)
+endef
+
 $(eval $(generic-package))
