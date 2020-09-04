From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Sep 2020 14:58:57 +0200
Subject: [Buildroot] [PATCH 02/15] fs/common.mk: set SELinux file
 security contexts
In-Reply-To: <20200731101040.1723047-3-antoine.tenart@bootlin.com>
References: <20200731101040.1723047-1-antoine.tenart@bootlin.com>
 <20200731101040.1723047-3-antoine.tenart@bootlin.com>
Message-ID: <20200904145857.10506bf6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 31 Jul 2020 12:10:27 +0200
Antoine Tenart <antoine.tenart@bootlin.com> wrote:

> +ifeq ($(BR2_PACKAGE_REFPOLICY)$(BR2_PACKAGE_POLICYCOREUTILS),yy)

In fact, BR2_PACKAGE_POLICYCOREUTILS=y is not at all a requirement for
a working SELinux system. While host-policycoreutils is needed to have
the setfiles utility that you use below, having policycoreutils on the
target is not needed. So I've simplified this condition to:

ifeq ($(BR2_PACKAGE_REFPOLICY),y)

> +define ROOTFS_SELINUX
> +	$(HOST_DIR)/sbin/setfiles -m -r $(TARGET_DIR) \
> +		-c $(TARGET_DIR)/etc/selinux/targeted/policy/policy.$(BR2_PACKAGE_LIBSEPOL_POLICY_VERSION) \
> +		$(TARGET_DIR)/etc/selinux/targeted/contexts/files/file_contexts \
> +		$(TARGET_DIR)
> +endef
> +ROOTFS_COMMON_DEPENDENCIES += refpolicy host-policycoreutils

While it doesn't hurt, I don't think it makes sense to have "refpolicy"
in the dependencies here. Indeed, all this rootfs creation logic
happens after all packages have been built. Due to the
BR2_PACKAGE_REFPOLICY=y condition above, we know refpolicy is enabled,
and therefore it has already been built prior to the rootfs being
generated.

The ROOTFS_xyz_DEPENDENCIES are mainly useful for dependencies on host
tools that are needed to generate the root filesystem. Which is the
case here with host-policycoreutils. So I've simplified to:

ROOTFS_COMMON_DEPENDENCIES += host-policycoreutils

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
