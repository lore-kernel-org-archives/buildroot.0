From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Dec 2019 22:27:45 +0100
Subject: [Buildroot] [PATCH v2] ebtables: add option to install
 save/restore utils
In-Reply-To: <20191216220832.6792-1-matthew.weber@rockwellcollins.com>
References: <20191216220832.6792-1-matthew.weber@rockwellcollins.com>
Message-ID: <20191222222745.68d51300@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 16 Dec 2019 16:08:32 -0600
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> From: David Owens <david.owens@rockwellcollins.com>
> 
> This patch adds an option to include the tools on target that allow
> the saving and restoring of ebtables. The upstream save utility is
> replaced in this commit as it depended on perl which is not always
> possible on an embedded system. The commit used to replace this
> script seems to note it as a common approach across a few distros.
> 
> Signed-off-by: David Owens <david.owens@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>

So, I've applied to master, after doing some changes.

First, I did two preparation patches:

 - One that drops EBTABLES_SUBDIR entirely, since it's not defined
   anywhere.

 - One that reworks the installation loop to use a make "foreach" loop.


> +if BR2_PACKAGE_EBTABLES
> +config BR2_PACKAGE_EBTABLES_UTILS_SAVE
> +	bool "ebtables save"
> +	depends on BR2_PACKAGE_BASH # runtime
> +	help
> +	  Include the save tool

Changed to:

	  Install the ebtables-save tool.

> +
> +config BR2_PACKAGE_EBTABLES_UTILS_RESTORE
> +	bool "ebtables restore"
> +	depends on !BR2_STATIC_LIBS
> +	help
> +	  Include the restore tool

Changed to:

	Install the ebtables-restore tool.

> +ifeq ($(BR2_PACKAGE_EBTABLES_UTILS_SAVE),y)
> +EBTABLES_DEPENDENCIES = bash

bash is a runtime dependency, so I dropped this.

> +define EBTABLES_INSTALL_TARGET_UTILS_SAVE
> +	$(INSTALL) -m 0755 -D $(@D)/$(EBTABLES_SUBDIR)/ebtables-save.sh \

Dropped EBTABLES_SUBDIR

> +		$(TARGET_DIR)/sbin/ebtables-save
> +endef
> +endif
> +ifeq ($(BR2_PACKAGE_EBTABLES_UTILS_RESTORE),y)
> +define EBTABLES_INSTALL_TARGET_UTILS_RESTORE
> +	$(INSTALL) -m 0755 -D $(@D)/$(EBTABLES_SUBDIR)/ebtables-restore \

Ditto.

Thanks, applied with those changes!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
