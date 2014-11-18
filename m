From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Nov 2014 23:17:02 +0100
Subject: [Buildroot] [PATCH 2/3] live555: add support for building
 dynamic libraries
In-Reply-To: <1a9971bcf4a300fcb43f9b8b3392d3c3790c1ebf.1416212296.git.baruch@tkos.co.il>
References: <83acc63ec240a462958adbc5bdcfea13758768d5.1416212296.git.baruch@tkos.co.il>
 <1a9971bcf4a300fcb43f9b8b3392d3c3790c1ebf.1416212296.git.baruch@tkos.co.il>
Message-ID: <20141118231702.6e0ebdf0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Mon, 17 Nov 2014 10:18:15 +0200, Baruch Siach wrote:

> +ifeq ($(BR2_PREFER_STATIC_LIB),y)
> +LIVE555_CONFIG_TARGET = linux
> +LIVE555_LIBRARY_LINK = $(TARGET_AR) cr
> +else
> +LIVE555_CONFIG_TARGET = linux-with-shared-libraries
> +LIVE555_LIBRARY_LINK = $(TARGET_CC) -o
> +endif
> +
>  ifndef ($(BR2_ENABLE_LOCALE),y)
>  LIVE555_CFLAGS += -DLOCALE_NOT_USED
>  endif
>  
>  define LIVE555_CONFIGURE_CMDS
> -	echo 'COMPILE_OPTS = $$(INCLUDES) -I. -DSOCKLEN_T=socklen_t $(LIVE555_CFLAGS)' >> $(@D)/config.linux
> -	echo 'C_COMPILER = $(TARGET_CC)' >> $(@D)/config.linux
> -	echo 'CPLUSPLUS_COMPILER = $(TARGET_CXX)' >> $(@D)/config.linux
> -	echo 'LINK = $(TARGET_CXX) -o' >> $(@D)/config.linux
> -	echo 'LINK_OPTS = -L. $(TARGET_LDFLAGS)' >> $(@D)/config.linux
> -	echo 'PREFIX = /usr' >> $(@D)/config.linux
> -	(cd $(@D); ./genMakefiles linux)
> +	echo 'COMPILE_OPTS = $$(INCLUDES) -I. -DSOCKLEN_T=socklen_t $(LIVE555_CFLAGS)' >> $(@D)/config.$(LIVE555_CONFIG_TARGET)
> +	echo 'C_COMPILER = $(TARGET_CC)' >> $(@D)/config.$(LIVE555_CONFIG_TARGET)
> +	echo 'CPLUSPLUS_COMPILER = $(TARGET_CXX)' >> $(@D)/config.$(LIVE555_CONFIG_TARGET)
> +
> +	echo 'LINK = $(TARGET_CXX) -o' >> $(@D)/config.$(LIVE555_CONFIG_TARGET)
> +	echo 'LINK_OPTS = -L. $(TARGET_LDFLAGS)' >> $(@D)/config.$(LIVE555_CONFIG_TARGET)
> +	echo 'PREFIX = /usr' >> $(@D)/config.$(LIVE555_CONFIG_TARGET)
> +	# Must have a whitespace at the end of LIBRARY_LINK, otherwise static link
> +	# fails
> +	echo 'LIBRARY_LINK = $(LIVE555_LIBRARY_LINK) ' >> $(@D)/config.$(LIVE555_CONFIG_TARGET)
> +	(cd $(@D); ./genMakefiles $(LIVE555_CONFIG_TARGET))

I don't understand why you need a separate config.linux and
config.linux-with-shared-libraries. Since in Buildroot we will either
be building with BR2_PREFER_STATIC_LIB=y, or BR2_PREFER_STATIC_LIB
disabled, why not simply call the file config.linux, as it was called
before this patch?

Of course, the LIVE555_LIBRARY_LINK think is needed, but I don't see
why the other changes are needed.

Can you expand on this?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
