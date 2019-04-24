From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Apr 2019 22:04:09 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] linux: simplify
 LINUX_BUILD_CMDS
Message-ID: <20190424200040.48DB380DE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=71ce6efa3cc638211e39d7a645e54831cc543f77
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

We currently do the Linux build as follows:

   make <imagename>
   if modules enabled; make modules; fi

However, Clement L??ger recently reported that due to us not using the
"all" target, the GDB scripts that the kernel can build when
CONFIG_GDB_SCRIPTS is enabled are not built, since upstream kernel
commit 67274c083438340ad16c1437caebc84e1253b224 (merged in v5.1) moved
that logic to a separate scripts_gdb target, which is a dependency of
the "all" target.

While we could add some more logic to explicit generate the
"scripts_gdb" target, this logic would fail on Linux < 5.1 for which
this make target doesn't exist.

So instead, let's simplify the build logic, and use:

  make all <imagename>

The "all" target automatically depends on "modules" if CONFIG_MODULES
is set, so we no longer need to explicit generate the "modules" target
separately.

As a result of this change, we may generate additional kernel images
compared to what was done previously, but such images would anyway not
be installed, and the additional build time is minimal.

We did some research as to why the kernel build was done like this in
Buildroot, and it's been like that since linux/linux.mk was added back
in 2010 by commit 487e21cff69b30b404146b2ffb46959a728a4002 ("New,
simpler, infrastructure for building the Linux kernel").

Reported-by: Cl??ment Leger <cleger@kalray.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit ffbe46a5295ce4e0442728f2ad3e19afa7eaa8ed)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.mk | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 304fce21d0..1eac3287ab 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -444,10 +444,7 @@ define LINUX_BUILD_CMDS
 	$(foreach dts,$(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)), \
 		cp -f $(dts) $(LINUX_ARCH_PATH)/boot/dts/
 	)
-	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) $(LINUX_TARGET_NAME)
-	@if grep -q "CONFIG_MODULES=y" $(@D)/.config; then \
-		$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) modules ; \
-	fi
+	$(LINUX_MAKE_ENV) $(MAKE) $(LINUX_MAKE_FLAGS) -C $(@D) all $(LINUX_TARGET_NAME)
 	$(LINUX_BUILD_DTB)
 	$(LINUX_APPEND_DTB)
 endef
