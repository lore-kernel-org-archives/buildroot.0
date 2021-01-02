From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Jan 2021 11:55:45 +0100
Subject: [Buildroot] [PATCH 2/5] package/datatables: new package
In-Reply-To: <20201208180529.9152-2-patrickdepinguin@gmail.com>
References: <20201208180529.9152-1-patrickdepinguin@gmail.com>
 <20201208180529.9152-2-patrickdepinguin@gmail.com>
Message-ID: <20210102115545.3138feab@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  8 Dec 2020 19:05:25 +0100
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> From: Joeri Barbarien <joeri.barbarien@nokia.com>
> 
> Signed-off-by: Joeri Barbarien <joeri.barbarien@nokia.com>
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Thanks, applied, with one change. See below.

> +DATATABLES_VERSION = 1.10.20
> +DATATABLES_SITE = https://datatables.net/releases
> +DATATABLES_SOURCE =  DataTables-$(DATATABLES_VERSION).zip
> +DATATABLES_LICENSE = MIT
> +DATATABLES_LICENSE_FILES = DataTables-$(DATATABLES_VERSION)/license.txt
> +
> +define DATATABLES_EXTRACT_CMDS
> +	$(UNZIP) $(DATATABLES_DL_DIR)/$(DATATABLES_SOURCE) -d $(@D)
> +endef
> +
> +define DATATABLES_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 0755 -d $(TARGET_DIR)/var/www/datatables/css $(TARGET_DIR)/var/www/datatables/js
> +	$(INSTALL) -m 0644 -t $(TARGET_DIR)/var/www/datatables/css $(@D)/DataTables-$(DATATABLES_VERSION)/media/css/*.min.css
> +	$(INSTALL) -m 0644 -t $(TARGET_DIR)/var/www/datatables/js $(@D)/DataTables-$(DATATABLES_VERSION)/media/js/*.min.js
> +endef

I've changed EXTRACT_CMDS to move files directly into $(@D):

+define DATATABLES_EXTRACT_CMDS
+       $(UNZIP) $(DATATABLES_DL_DIR)/$(DATATABLES_SOURCE) -d $(@D)
+       mv $(@D)/DataTables-$(DATATABLES_VERSION)/* $(@D)
+       rmdir $(@D)/DataTables-$(DATATABLES_VERSION)
+endef

We typically do that in other packages that use .zip files as sources.
It avoids the need for using $(@D)/DataTables-$(DATATABLES_VERSION)
everywhere.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
