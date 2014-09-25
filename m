From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 25 Sep 2014 20:00:52 +0200
Subject: [Buildroot] [PATCH] Fix selection of bootloaders
	from	$(BR2_EXTERNAL)
In-Reply-To: <1411667269-8347-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1411667269-8347-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <c006e085-cc6f-436a-88bb-79fa3f4fcd77@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eric Le Bihan <eric.le.bihan.dev@free.fr> schreef:
>If a package is based on "generic-package", pkg-generic.mk will compute
>the name of the Kconfig variable to use for checking if this package has
>been selected by the user.
>
>Unfortunately, this mechanism does not take into account the case where
>a bootloader is declared in a $(BR2_EXTERNAL)/boot directory.
>
>So, even if the bootloader has been selected, it will not be added to
>$(TARGETS) and will not be built.
>
>This patch fixes this issue.
>
>Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
>---
> package/pkg-generic.mk | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
>index d04fd36..064d736 100644
>--- a/package/pkg-generic.mk
>+++ b/package/pkg-generic.mk
>@@ -616,6 +616,8 @@ ifeq ($(1),linux)
> $(2)_KCONFIG_VAR = BR2_LINUX_KERNEL
> else ifneq ($$(filter boot/%,$(pkgdir)),)
> $(2)_KCONFIG_VAR = BR2_TARGET_$(2)
>+else ifneq ($$(filter $(BR2_EXTERNAL)/boot/%,$(pkgdir)),)
>+$(2)_KCONFIG_VAR = BR2_TARGET_$(2)

filter accepts multiple patterns, so you can edit the existing block.

Also, the same problem would exist for the other
 package types in this if-else structure. Granted, it's
 less likely that a user will add a new kernel type or
 toolchain type in BR2_EXTERNAL, but isn't it more
 logical and symmetrical to apply this change for the
 rest the if-else block too?

Best regards,
Thomas
