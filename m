From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 May 2016 23:33:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/quagga: Fix directories and
 permissions
In-Reply-To: <1462953673-1190-1-git-send-email-nroach44@gmail.com>
References: <1462953673-1190-1-git-send-email-nroach44@gmail.com>
Message-ID: <20160511233309.1ea81a24@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm adding in Cc: Baruch, since he has done most of the recent updates
to the Quagga package. Baruch, could you review/test this patch,
according to your knowledge of Quagga?

I'm also adding some comments below.

> Quagga runs as the "quagga" user, but it also needs to modify files
> in /etc and /var - config files, pid files and vty sockets for vtysh.

Does it really need to write in /etc ? If that's the case, then it
seems a bit wrong, and we have a bigger problem. What happens if /etc
is read-only ?


On Wed, 11 May 2016 16:01:13 +0800, Nathaniel Roach wrote:

> diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
> index 6b98367..3592aee 100644
> --- a/package/quagga/quagga.mk
> +++ b/package/quagga/quagga.mk
> @@ -10,7 +10,11 @@ QUAGGA_SITE = http://download.savannah.gnu.org/releases/quagga
>  QUAGGA_DEPENDENCIES = host-gawk
>  QUAGGA_LICENSE = GPLv2+
>  QUAGGA_LICENSE_FILES = COPYING
> -QUAGGA_CONF_OPTS = --program-transform-name=''
> +QUAGGA_CONF_OPTS = \
> +  --program-transform-name='' \
> +  --sysconfdir=/etc/quagga \
> +  --localstatedir=/var/run/quagga

Indentation should be one tab for those lines. But why isn't
sysconfdir=/etc appropriate? Is it because quagga writes to some files
in /etc? If that's the case, as said above, I'm believe it's bad.

> +define QUAGGA_PERMISSIONS
> +	/etc/quagga r 600 quagga quagga - - - - -
> +	/etc/quagga d 755 quagga quagga - - - - -

Hum, does this actually work?

> +	/var/run/quagga d 755 quagga quagga - - - - -
> +endef
> +
>  ifeq ($(BR2_PACKAGE_QUAGGA_SNMP),y)
>  QUAGGA_CONF_ENV += ac_cv_path_NETSNMP_CONFIG=$(STAGING_DIR)/usr/bin/net-snmp-config
>  QUAGGA_CONF_OPTS += --enable-snmp=agentx
> @@ -50,4 +64,10 @@ ifeq ($(BR2_arc),y)
>  QUAGGA_CONF_OPTS += --disable-pie
>  endif
>  
> +define QUAGGA_INSTALL_INIT_SYSTEMD
> +	mkdir -p $(TARGET_DIR)/usr/lib/tmpfiles.d

This mkdir -p is useless, as $(INSTALL) -D creates all sub-directories
needed to be able to copy to the destination path.

> +	$(INSTALL) -D -m 644 package/quagga/quagga_tmpfiles.conf \
> +		$(TARGET_DIR)/usr/lib/tmpfiles.d/quagga.conf
> +endef
> +
>  $(eval $(autotools-package))
> diff --git a/package/quagga/quagga_tmpfiles.conf b/package/quagga/quagga_tmpfiles.conf
> new file mode 100644
> index 0000000..ad82cc6
> --- /dev/null
> +++ b/package/quagga/quagga_tmpfiles.conf
> @@ -0,0 +1,2 @@
> +d /var/run/quagga/ 1755 quagga quagga -
> +

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
