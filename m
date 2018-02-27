From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 27 Feb 2018 22:32:39 +0100
Subject: [Buildroot] [PATCH 2/3] bind config files
In-Reply-To: <20180227123924.20725-2-chrismcc@gmail.com>
References: <20180227123924.20725-1-chrismcc@gmail.com>
 <20180227123924.20725-2-chrismcc@gmail.com>
Message-ID: <20180227223239.191a2c66@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Christopher,

Commit title should be something like:

	bind: add sample config files

On Tue, 27 Feb 2018 04:39:23 -0800, Christopher McCrory wrote:
> Snag config files from FreeBSD ports and use those for a working DNS system
> 
> ( Not sure what to add for Licensing )

Does licensing on config files really matters ?

Any reason to chose those FreeBSD config files ? The bind tarball
doesn't contain sample files ?

Note: I'm making comments about the implementation below, but I don't
know if we should use those FreeBSD files, bundle some sample files in
Buildroot, or use other example files shipped with bind.

>  BIND_VERSION = 9.11.2-P1
>  BIND_SITE = http://ftp.isc.org/isc/bind9/$(BIND_VERSION)
> +BIND_EXTRA_DOWNLOADS = https://svn.freebsd.org/ports/head/dns/bind912/files/empty.db
> +BIND_EXTRA_DOWNLOADS += https://svn.freebsd.org/ports/head/dns/bind912/files/named.root https://svn.freebsd.org/ports/head/dns/bind912/files/localhost-forward.db https://svn.freebsd.org/ports/head/dns/bind912/files/named.conf.in
> +BIND_EXTRA_DOWNLOADS += https://svn.freebsd.org/ports/head/dns/bind912/files/localhost-forward.db https://svn.freebsd.org/ports/head/dns/bind912/files/named.conf.in
> +BIND_EXTRA_DOWNLOADS += https://svn.freebsd.org/ports/head/dns/bind912/files/named.conf.in

Why do you have named.conf.in three times ? and localhost-forward.db
two times ? Am I missing something here ?

Also, this is pretty verbose. What about:

BIND_EXTRA_CONFIG_FILES = \
	empty.db named.root localhost-forward.db \
	named.conf.in
BIND_EXTRA_DOWNLOADS = \
	$(addprefix https://svn.freebsd.org/ports/head/dns/bind912/files/,$(BIND_EXTRA_CONFIG_FILES))

>  # bind does not support parallel builds.
>  BIND_MAKE = $(MAKE1)
>  BIND_INSTALL_STAGING = YES
> @@ -113,6 +117,34 @@ ifeq ($(BR2_PACKAGE_BIND_TOOLS),)
>  BIND_POST_INSTALL_TARGET_HOOKS += BIND_TARGET_REMOVE_TOOLS
>  endif
>  
> +define BIND_POST_DOWNLOAD_CONF_FILES
> +	$(INSTALL) -m 0755 -d $(@D)/BR2
> +	$(INSTALL) -m 0644 -D $(DL_DIR)/empty.db $(@D)/BR2/
> +	$(INSTALL) -m 0644 -D $(DL_DIR)/named.root $(@D)/BR2/
> +	$(INSTALL) -m 0644 -D $(DL_DIR)/localhost-forward.db $(@D)/BR2/
> +	$(INSTALL) -m 0644 -D $(DL_DIR)/named.conf.in $(@D)/BR2/

You could replace those 5 lines by:

	$(foreach f,$(BIND_EXTRA_CONFIG_FILES), \
		$(INSTALL) -D -m0644 $(DL_DIR)/$(f) $(@D)/BR2/$(f)
	)

> +	sed -f $(BIND_PKGDIR)/configs.sed \
> +	    $(@D)/BR2/named.conf.in > $(@D)/BR2/named.conf
> +endef
> +BIND_POST_DOWNLOAD_HOOKS += BIND_POST_DOWNLOAD_CONF_FILES

This as a post download hook looks wrong, the package hasn't been
extracted yet. Doing this as a post-extract hook or post-patch hook
looks more appropriate.

> +define BIND_POST_INSTALL_CONFIG_FILES
> +	$(INSTALL) -m 0755 -d $(TARGET_DIR)/etc/bind/{,master}

This is not needed if you use a full destination path when installing
files below.

> +	$(INSTALL) -m 0755 -d $(TARGET_DIR)/var/named/{,slave,dynamic}

The {,slave,dynamic} could be just {slave,dynamic}: install -d creates
subfolders as needed.

> +	$(INSTALL) -m 0644 -D $(@D)/BR2/empty.db $(TARGET_DIR)/etc/bind/master
> +	$(INSTALL) -m 0644 -D $(@D)/BR2/named.root $(TARGET_DIR)/etc/bind/master
> +	$(INSTALL) -m 0644 -D $(@D)/BR2/localhost-forward.db $(TARGET_DIR)/etc/bind/master
> +	$(INSTALL) -m 0644 -D $(@D)/BR2/named.conf.in $(TARGET_DIR)/etc/bind/

Do you need to install the .in file ?

> +	$(INSTALL) -m 0644 -D $(@D)/BR2/named.conf $(TARGET_DIR)/etc/bind/

Use a full destination path on all those installation commands.

> +endef
> +BIND_POST_INSTALL_TARGET_HOOKS += BIND_POST_INSTALL_CONFIG_FILES
> +
> +define BIND_PERMISSIONS
> +	/var/named d 0755 named named - - - - -
> +	/var/named/dynamic d 0755 named named - - - - -
> +	/var/named/slave d 0755 named named - - - - -
> +endef
> +
>  define BIND_USERS
>  	named -1 named -1 * /etc/bind - - BIND daemon
>  endef

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
