From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Aug 2015 16:29:52 +0200
Subject: [Buildroot] [git commit] pkg-kernel-module: die if kernel module
	support is disabled
Message-ID: <20150817143015.5CF1C7FC3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8df95d926e963601c727defeb4ab90ce2368da70
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Test the configuration of the kernel to see if loadable module support
is enabled, and error out otherwise. This makes build failures of
external kernel modules less confusing.

[Thomas: tweak the commit log.]

Signed-off-by: No?? Rubinstein <nrubinstein@aldebaran.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-kernel-module.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/pkg-kernel-module.mk b/package/pkg-kernel-module.mk
index 5fb19be..6fb7704 100644
--- a/package/pkg-kernel-module.mk
+++ b/package/pkg-kernel-module.mk
@@ -60,6 +60,10 @@ $(2)_MODULE_SUBDIRS ?= .
 # includes and other support files (Booo!)
 define $(2)_KERNEL_MODULES_BUILD
 	@$$(call MESSAGE,"Building kernel module(s)")
+	@if ! grep -Fqx 'CONFIG_MODULES=y' $(LINUX_DIR)/.config; then \
+		echo "ERROR: Kernel does not support loadable modules"; \
+		exit 1; \
+	fi
 	$$(foreach d,$$($(2)_MODULE_SUBDIRS), \
 		$$(LINUX_MAKE_ENV) $$($$(PKG)_MAKE) \
 			-C $$(LINUX_DIR) \
