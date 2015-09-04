From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Sep 2015 13:16:42 +0200
Subject: [Buildroot] [git commit] core/pkg-kernel-module: drop now-useless
	check for CONFIG_MODULES
Message-ID: <20150904111726.6FC847FB01@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2e95747ab9b6b0bf97007ce2733321c90462249a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 8df95d9 (pkg-kernel-module: die if kernel module
support is disabled).

Now that we force-enable support for modules in the kernel config, we
need not check it.

Besides, the check was broken, because it did not use $$ to dereference
LINUX_DIR, thus leading to systematic build failures when a package
using the kernel-module infra was enabled.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: No?? Rubinstein <noe.rubinstein@gmail.com>
Cc: Jan Viktorin <viktorin@rehivetech.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-kernel-module.mk |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/package/pkg-kernel-module.mk b/package/pkg-kernel-module.mk
index f6730b8..200c91d 100644
--- a/package/pkg-kernel-module.mk
+++ b/package/pkg-kernel-module.mk
@@ -65,10 +65,6 @@ $(2)_MODULE_SUBDIRS ?= .
 # includes and other support files (Booo!)
 define $(2)_KERNEL_MODULES_BUILD
 	@$$(call MESSAGE,"Building kernel module(s)")
-	@if ! grep -Fqx 'CONFIG_MODULES=y' $(LINUX_DIR)/.config; then \
-		echo "ERROR: Kernel does not support loadable modules"; \
-		exit 1; \
-	fi
 	$$(foreach d,$$($(2)_MODULE_SUBDIRS), \
 		$$(LINUX_MAKE_ENV) $$($$(PKG)_MAKE) \
 			-C $$(LINUX_DIR) \
