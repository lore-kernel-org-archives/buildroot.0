From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Aug 2015 21:01:51 +0200
Subject: [Buildroot] [git commit] linux: enable all options needed by
	xtables-addons
Message-ID: <20150823190159.A0E43818CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d824792b75475719949850179f08ad8ec8d0a228
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Both of CONFIG_NF_CONNTRACK and CONFIG_NF_CONNTRACK_MARK are needed by
xtables-addons.

Although the current code does enable them in the linux' .config file,
the former is protected behind CONFIG_NETFILTER_ADVANCED, which may be
missing from a user-supplied (def)config file, and is missing from some
of the bundled defconfigs as well.

For example, the following defconfig fails to build:

    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_LINUX_KERNEL=y
    BR2_LINUX_KERNEL_DEFCONFIG="i386"
    BR2_PACKAGE_XTABLES_ADDONS=y

So, also force-enable CONFIG_NETFILTER_ADVANCED.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index d91dbb2..48f9c74 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -215,6 +215,7 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XTABLES,$(@D)/.config))
 	$(if $(BR2_PACKAGE_XTABLES_ADDONS),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_ADVANCED,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_MARK,$(@D)/.config))
 	$(if $(BR2_LINUX_KERNEL_APPENDED_DTB),
