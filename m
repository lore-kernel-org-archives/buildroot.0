From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Aug 2012 18:17:41 +0200
Subject: [Buildroot] [PATCH] Added new package - rdiff-backup.
In-Reply-To: <1344777509-17936-1-git-send-email-avishorp@gmail.com>
References: <1344777509-17936-1-git-send-email-avishorp@gmail.com>
Message-ID: <20120812181741.720352aa@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello!

Thanks for this contribution!

Le Sun, 12 Aug 2012 16:18:29 +0300,
Avishay Orpaz <avishorp@gmail.com> a ?crit :

> Signed-off-by: Avishay Orpaz <avishorp@gmail.com>
> ---
>  package/Config.in                    |    1 +
>  package/python/Config.in             |    6 ++++++
>  package/python/python.mk             |    4 ++++
>  package/rdiff-backup/Config.in       |   10 ++++++++++
>  package/rdiff-backup/rdiff-backup.mk |   28 ++++++++++++++++++++++++++++

The python package changes and the new rdiff-backup package should be
two separate patches.

> diff --git a/package/python/python.mk b/package/python/python.mk
> index fae4e5c..0584a5a 100644
> --- a/package/python/python.mk
> +++ b/package/python/python.mk
> @@ -110,6 +110,10 @@ else
>  PYTHON_CONF_OPT += --disable-zlib
>  endif
>  
> +ifeq ($(BR2_PACKAGE_PYTHON_HASHLIB),y)
> +PYTHON_DEPENDENCIES += openssl
> +endif

Is it enough to just have openssl in the dependencies to get hashlib
support in Python? How does this interact with the existing
BR2_PACKAGE_PYTHON_SSL option? Maybe a new patch that makes hashlib
support optional through --enable/--disable options should be added.

> new file mode 100644
> index 0000000..77d9caf
> --- /dev/null
> +++ b/package/rdiff-backup/rdiff-backup.mk
> @@ -0,0 +1,28 @@
> +#############################################################
> +#
> +# rdiff-backup
> +#
> +#############################################################
> +
> +RDIFF_BACKUP_VERSION = 1.2.8
> +RDIFF_BACKUP_SOURCE = rdiff-backup-$(RDIFF_BACKUP_VERSION).tar.gz
> +RDIFF_BACKUP_SITE = http://savannah.nongnu.org/download/rdiff-backup

Can you try adding the license information as well?

> +RDIFF_BACKUP_DEPENDENCIES = python librsync
> +
> +define RDIFF_BACKUP_BUILD_CMDS
> +	(cd $(@D); \
> +		CC="$(TARGET_CC)"		\
> +		CFLAGS="$(TARGET_CFLAGS)" 	\
> +		LDSHARED="$(TARGET_CC) -shared" \
> +		LDFLAGS="$(TARGET_LDFLAGS)" 	\
> +	$(HOST_DIR)/usr/bin/python setup.py build_ext \
> +	--include-dirs=$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR))
> +	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py build -e /usr/bin/python )

There is no way to do everything in a single "setup.py build" call?

Otherwise, looks good to me.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
