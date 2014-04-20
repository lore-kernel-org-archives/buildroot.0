From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 20 Apr 2014 19:21:30 +0200
Subject: [Buildroot] [PATCH 1/1] system: add ability to pass additional
 users tables.
In-Reply-To: <1395937176-7585-2-git-send-email-eric.le.bihan.dev@free.fr>
References: <1395937176-7585-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1395937176-7585-2-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20140420172130.GB3503@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2014-03-27 17:19 +0100, Eric Le Bihan spake thusly:
> A new entry has been added to the "System Configuration" menu to allow
> the user to set the location of additional user tables (besides the ones
> defined in packages).
> 
> A user table is a text file, formatted using the mkusers syntax, which
> describes the users on the target system, with their UID/GID, home
> directory, password, etc.
> 
> The target root file system will be populated according the content of
> these files.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Although a minor nit below:

> ---
>  fs/common.mk     |    6 +++++-
>  system/Config.in |    9 +++++++++
>  2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/common.mk b/fs/common.mk
> index d95c26b..6f37bd0 100644
> --- a/fs/common.mk
> +++ b/fs/common.mk
> @@ -33,6 +33,7 @@ FULL_DEVICE_TABLE = $(BUILD_DIR)/_device_table.txt
>  ROOTFS_DEVICE_TABLES = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE) \
>         $(BR2_ROOTFS_STATIC_DEVICE_TABLE))
>  USERS_TABLE = $(BUILD_DIR)/_users_table.txt
> +ROOTFS_USERS_TABLE = $(call qstrip,$(BR2_ROOTFS_USERS_TABLE))

This is a list of space-separated files, so I'd prefer TABLE be a plural
TABLES.

>  define ROOTFS_TARGET_INTERNAL
>  
> @@ -78,7 +79,10 @@ endif
>  	printf '$$(subst $$(sep),\n,$$(PACKAGES_PERMISSIONS_TABLE))' >> $$(FULL_DEVICE_TABLE)
>  	echo "$$(HOST_DIR)/usr/bin/makedevs -d $$(FULL_DEVICE_TABLE) $$(TARGET_DIR)" >> $$(FAKEROOT_SCRIPT)
>  endif
> -	printf '$(subst $(sep),\n,$(PACKAGES_USERS))' > $(USERS_TABLE)
> +ifneq ($$(ROOTFS_USERS_TABLE),)
> +	cat $$(ROOTFS_USERS_TABLE) > $(USERS_TABLE)

Rename here too.

> +endif
> +	printf '$(subst $(sep),\n,$(PACKAGES_USERS))' >> $(USERS_TABLE)
>  	$(TOPDIR)/support/scripts/mkusers $(USERS_TABLE) $(TARGET_DIR) >> $(FAKEROOT_SCRIPT)
>  	echo "$$(ROOTFS_$(2)_CMD)" >> $$(FAKEROOT_SCRIPT)
>  	chmod a+x $$(FAKEROOT_SCRIPT)
> diff --git a/system/Config.in b/system/Config.in
> index e8f1ed6..b7052f5 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -280,6 +280,15 @@ config BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW
>  
>  endif # BR2_ROOTFS_SKELETON_DEFAULT
>  
> +config BR2_ROOTFS_USERS_TABLE

Rename here.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
