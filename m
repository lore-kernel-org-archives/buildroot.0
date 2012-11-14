From: Vellemans, Noel <Noel.Vellemans@visionBMS.com>
Date: Wed, 14 Nov 2012 10:53:07 +0100
Subject: [Buildroot] [PATCH 1/1] libxml2: add support for building host
	library with python support
In-Reply-To: <20121114102545.7f835367@skate>
References: <1352883977-16288-1-git-send-email-noel.vellemans@visionbms.com>
 <20121114102545.7f835367@skate>
Message-ID: <1531E53627F1F749B4FE809BF2A4EB6703AA4E37@wetmex10>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi thomas,


>> I don't know if we want to introduce sub-options for host packages. 


Well, I first did HARD-code this option into my "test"-build, but based
on (a previous) patch from Will and based on the comments of Arnout, I
kind of did agree on the sub-option.
I know its not that good-looking, but at this time, it looks a
'reasonable' way of getting this done.


Ref to : [Buildroot] mesa3d:  "ImportError: No module named libxml2"


>>I'm confused here. I thought mesa required a Python that has xml2
support. But here you're building xml2 with Python support. 
>>Could you enlighten me? :-)

Please have a look at this 

http://lists.busybox.net/pipermail/buildroot/2012-November/061334.html

... Hope is clears out some questions...


Again, open to comments and/or better solutions, but at this time it
looked acceptable (if you ask me).


Regards Noel


-----Original Message-----
From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com] 
Sent: 14Nov12 10:26
To: Vellemans, Noel
Cc: buildroot at busybox.net; willw at carallon.com
Subject: Re: [Buildroot] [PATCH 1/1] libxml2: add support for building
host library with python support

Noel,

On Wed, 14 Nov 2012 10:06:17 +0100, Noel vellemans wrote:

> +config BR2_PACKAGE_HOST_LIBXML2_PYTHON
> +    bool
> \ No newline at end of file

I don't know if we want to introduce sub-options for host packages.

> diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk 
> index 71f2bd1..fde3735 100644
> --- a/package/libxml2/libxml2.mk
> +++ b/package/libxml2/libxml2.mk
> @@ -26,7 +26,15 @@ LIBXML2_POST_INSTALL_STAGING_HOOKS += 
> LIBXML2_STAGING_LIBXML2_CONFIG_FIXUP
>  HOST_LIBXML2_DEPENDENCIES = host-pkgconf
>  
> -HOST_LIBXML2_CONF_OPT = --without-debug --without-python
> +HOST_LIBXML2_CONF_OPT = --without-debug
> +
> +ifeq ($(BR2_PACKAGE_HOST_LIBXML2_PYTHON),y)
> +HOST_LIBXML2_DEPENDENCIES += host-python HOST_LIBXML2_CONF_OPT += 
> +--with-python=$(HOST_DIR)/usr else HOST_LIBXML2_CONF_OPT += 
> +--without-python endif

I'm confused here. I thought mesa required a Python that has xml2
support. But here you're building xml2 with Python support. Could you
enlighten me? :-)

Thanks!

Thomas
--
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux development, consulting,
training and support.
http://free-electrons.com
