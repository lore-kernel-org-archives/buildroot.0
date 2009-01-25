From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Sun, 25 Jan 2009 23:49:37 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/cups
In-Reply-To: <87hc3ndrio.fsf@macbook.be.48ers.dk>
References: <20090125205344.6649776D28@busybox.osuosl.org>
	<87hc3ndrio.fsf@macbook.be.48ers.dk>
Message-ID: <1232923777.2298.44.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

s?n 2009-01-25 klockan 22:06 +0100 skrev Peter Korsgaard:
> >>>>> "ulf" == ulf  <ulf@uclibc.org> writes:
> 
>  ulf> Author: ulf
>  ulf> Date: 2009-01-25 20:53:43 +0000 (Sun, 25 Jan 2009)
>  ulf> New Revision: 25020
> 
>  ulf> Log:
>  ulf> Make cups build, support perl/php option
> 
>  ulf> Modified:
>  ulf>    trunk/buildroot/package/cups/cups.mk
> 
> 
>  ulf>  	(cd $(CUPS_DIR) && \
>  ulf>  		$(TARGET_CONFIGURE_OPTS) \
>  ulf>  		$(TARGET_CONFIGURE_ARGS) \
>  ulf> +		$(CUPS_CONF_ENV) \
>  ulf> +		CFLAGS="$(CUPS_CFLAGS)" \
>  ulf>  		./configure \
>  ulf> -		--prefix=/usr $(CUPS_CONF_OPT_DBUS) --includedir=/usr/include  \
>  ulf> -		--libdir=/usr/lib --disable-gnutls --disable-gssapi --host=$(ARCH) \ )
>  ulf> +		--target=$(GNU_TARGET_NAME) \
>  ulf> +		--host=$(GNU_TARGET_NAME) \
>  ulf> +		--build=$(GNU_HOST_NAME) \
>  ulf> +		--prefix=/usr \
>  ulf> +		--includedir=/usr/include  \
>  ulf> +		--libdir=/usr/lib \
>  ulf> +		--exec-prefix=/ \
> 
> Shouldn't that be /usr?
> 

True, the config was all screwed, so I copied from 
another location.

A grep shows other packages with problems.

bootutils/bootutils.mk:BOOTUTILS_CONF_OPT = --prefix=/ --exec-prefix=/
cups/cups.mk:			--exec-prefix=/ \
gzip/gzip.mk:			--exec-prefix=/ \
libeXosip2/libeXosip2.mk:	--exec-prefix=/ \
php/php.mk:			--exec-prefix=/ \
xfsprogs/xfsprogs.mk:		--exec-prefix=/ \
xfsprogs/xfsprogs.mk:		    exec-prefix=/ \


>  ulf> +		--bindir=/usr/bin \
>  ulf> +		--sbindir=/usr/sbin \
>  ulf> +		--libexecdir=/usr/lib \
>  ulf> +		--sysconfdir=/etc \
> 
> And all of those should get set automatically by prefix.
> 
>  ulf> +		--with-config-file-path=/etc \
>  ulf> +		--datadir=/usr/share/misc \
>  ulf> +		--localstatedir=/var \
>  ulf> +		--mandir=/usr/man \
>  ulf> +		--infodir=/usr/info \
>  ulf> +		--disable-gnutls \
>  ulf> +		--disable-gssapi \
>  ulf> +		$(CUPS_CONF_OPT) \
>  ulf> +		)
>  ulf>  	touch $@
>  
> 
BR
Ulf Samuelsson

-------------- next part --------------
A non-text attachment was scrubbed...
Name: exec-prefix.patch
Type: text/x-patch
Size: 2727 bytes
Desc: not available
Url : http://lists.busybox.net/pipermail/buildroot/attachments/20090125/d7a6f5d7/attachment-0001.bin 
