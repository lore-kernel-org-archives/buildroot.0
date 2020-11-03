From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 3 Nov 2020 23:24:44 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/systemd: add support for
 creating journal catalog DB
In-Reply-To: <20200717234245.17889-1-nolange79@gmail.com>
References: <20200717234245.17889-1-nolange79@gmail.com>
Message-ID: <1d09c49a-6d08-1cd7-9785-92b56c17ae06@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Norbert,

 I was about to apply, but I have a bit too many comments still to go forward...

On 18/07/2020 01:42, Norbert Lange wrote:
> journald supports catalog files, or rather a binary database of
> those.

 IIUC, the textual catalog files are already installed on the target at the
moment, and at boot time the binary database is created (and if the rootfs is
read-write, it is saved as well). So this patch is doing two functional changes:

- remove the catalog files for languages we "don't want", according to LOCALE_PURGE;

- create the binary catalog at build time instead of at runtime.

 Since the two changes are fairly distinct, it would be better to have it in two
separate patches.


> Functionality added includes:
> 
> -   A config option allows enabling this database.

 Why does it need to be an option? Is there any reason to prefer the text files
on the target?

> 
> -   If BR2_ENABLE_LOCALE_PURGE is enabled, the catalogs not in the
>     language whitelist are deleted.
> 
> -   if the option is enabled, the database is built and moved to
>     /usr/share/factory. A symlink is created in /var pointing to
>     that file.
> 
> -   the service normally used for creating the DB during boot,
>     and the source files used as input are deleted.
> 
> The move to /usr/share/factory is helpful for having /usr as whole
> system distribution.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
> v1>v2:
> -   Moved all logic into systemd.mk
> -   solved the LOCALE_PURGE order that way
> -   use the factory to store the file
> -   option to enable the DB (similar to udev HWDB)
> -   cant be anabled with !ROOTFS_RW, tons of issues with that one
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/systemd/Config.in  | 14 ++++++++++++++
>  package/systemd/systemd.mk | 38 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 52 insertions(+)
> 
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index f754b9d0cf..bbb77b280d 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -246,6 +246,20 @@ config BR2_PACKAGE_SYSTEMD_IMPORTD
>  
>  	  http://www.freedesktop.org/software/systemd/man/machinectl.html#Image%20Transfer%20Commands
>  
> +config BR2_PACKAGE_SYSTEMD_CATALOGDB
> +	bool "enable journal catalog database installation"
> +	depends on BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW # conflicting tmpfiles magic

 This is of course very annoying. However, I don't think it's needed, see below.

> +	help
> +	  Build and install the journal catalog database.
> +
> +	  catalog files are used to provide extended and potentially localized

 Line is too long (check-package)

> +	  messages for the journal.
> +
> +	  The original catalog files will be built into a DB at
> +	  /usr/share/factory/var/lib/systemd/catalog/database.
> +
> +	  https://www.freedesktop.org/wiki/Software/systemd/catalog/
> +
>  config BR2_PACKAGE_SYSTEMD_LOCALED
>  	bool "enable locale daemon"
>  	help
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 1b94ffc67a..60d97ae176 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -593,6 +593,44 @@ define SYSTEMD_INSTALL_INIT_SYSTEMD
>  	$(SYSTEMD_INSTALL_NETWORK_CONFS)
>  endef
>  
> +ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
> +define SYSTEMD_LOCALE_PURGE_CATALOGS
> +	for cfile in $$(find $(TARGET_DIR)/usr/lib/systemd/catalog -name '*.*.catalog'); \

 We use backticks `` instead of $$() to have a little less double-dollaring.

> +	do \
> +		basename=$${cfile##*/}; \
> +		basename=$${basename%.catalog}; \
> +		langext=$${basename#*.}; \
> +		[ "$$langext" != "$${basename}" ] || continue; \

 All the negatives are confusing me. Is this just

		[ "$$langext" = "$$basename" ] && continue; \

?

 Why do this? AFAIU, it avoids removing files of the form `.en_US.catalog`, why
would you want to do that?

> +		expr >/dev/null $(BR2_ENABLE_LOCALE_WHITELIST) : ".*\b$${langext}\b" || rm -f "$$cfile"; \

 I'd rather see this as

expr '$(LOCALE_NOPURGE)' : ".*\b$${langext}\b" >/dev/null || rm -f "$$cfile";

(redirect at the end, and using the qstripped variant instead of the raw .config
symbol).


> +	done
> +endef
> +
> +SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_LOCALE_PURGE_CATALOGS
> +endif
> +
> +ifeq ($(BR2_PACKAGE_SYSTEMD_CATALOGDB),y)
> +define SYSTEMD_UPDATE_CATALOGS
> +	$(HOST_DIR)/bin/journalctl --root=$(TARGET_DIR) --update-catalog
> +	install -D $(TARGET_DIR)/var/lib/systemd/catalog/database \
> +		$(TARGET_DIR)/usr/share/factory/var/lib/systemd/catalog/database
> +	rm $(TARGET_DIR)/var/lib/systemd/catalog/database
> +	ln -sf /usr/share/factory/var/lib/systemd/catalog/database \
> +		$(TARGET_DIR)/var/lib/systemd/catalog/database

 Isn't /var always a tmpfs in systemd? If so, what's the point of making this
symlink?

> +	grep -q '^L /var/lib/systemd/catalog/database' $(TARGET_DIR)/usr/lib/tmpfiles.d/var.conf || \
> +		printf "\nL /var/lib/systemd/catalog/database\n" >> $(TARGET_DIR)/usr/lib/tmpfiles.d/var.conf

 Instead of this, it would make more sense IMHO to make a new tmpfiles.d file.
That can be done as a POST_INSTALL_HOOK (simply copying the file, not generating
it like this).

 And I believe that that will also resolve the
BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW issue, because you no longer rely on var.conf.

 Could you test that and adapt accordingly?

> +endef
> +
> +SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_UPDATE_CATALOGS
> +endif
> +
> +define SYSTEMD_RM_CATALOG_UPDATE_SERVICE
> +	rm -rf $(TARGET_DIR)/usr/lib/systemd/catalog \

 This is a bit annoying... This directory is used to create the binary catalog
database above. So yes, it's OK to remove it afterwards, but if you then do a
rebuild, your database will be empty. IMHO this is a blocking issue. If a
rebuild is not perfect, I can tolerate that, but making the database completely
empty is not good IMHO.

 A simple workaround would be to simply do this as a SYSTEMD_POST_INSTALL_HOOK,
but IIUC, other packages will install their catalogs in this directory as well.

 Another solution could be to get the catalogs from STAGING_DIR, but that only
works if the packages install in STAGING_DIR.

 So the only thing I can think of is to copy everything to STAGING_DIR first,
and then copy it back, all of this before the locale purge. But that feels
pretty messy as well...

> +		$(TARGET_DIR)/usr/lib/systemd/system/systemd-journal-catalog-update.service \
> +		$(TARGET_DIR)/usr/lib/systemd/system/*/systemd-journal-catalog-update.service
> +endef
> +
> +SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_RM_CATALOG_UPDATE_SERVICE

 Why is this not in the BR2_PACKAGE_SYSTEMD_CATALOGDB condition? It's a kind of
big change - before, we had this catalog installed on the target, but now we
only have the binary installed, and only if the option is selected. So any
existing configuration that assumed the textual catalog was there will break. If
we remove the BR2_PACKAGE_SYSTEMD_CATALOGDB option and just always make the
binary database, I think it's OK to remove the textual one.

 Regards,
 Arnout

> +
>  define SYSTEMD_PRESET_ALL
>  	$(HOST_DIR)/bin/systemctl --root=$(TARGET_DIR) preset-all
>  endef
> 
