From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Dec 2018 21:56:52 +0100
Subject: [Buildroot] [PATCH] libglib2: fix configure issue without
 libmount
In-Reply-To: <20181203235118.7846-1-gael.portay@collabora.com>
References: <20181203235118.7846-1-gael.portay@collabora.com>
Message-ID: <20181206215652.5bc874a5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ga?l,

On Mon,  3 Dec 2018 18:51:18 -0500, Ga?l PORTAY wrote:
> The following configure error happens when the util-linux dependency
> does not install libmount:
> 
> 	(...)
> 	checking for LIBMOUNT... no
> 	configure: error: *** Could not find libmount
> 	make[1]: *** [package/pkg-generic.mk:222: /home/gportay/src/buildroot/output-rpi3-64-drm-kms/build/libglib2-2.56.1/.stamp_configured] Error 1
> 	make: *** [Makefile:84: _all] Error 2
> 
> If no enable/disable option is given through to configure, glib2 checks
> for the libmount package (linux only) and fails if is not present[1].
> 
> To fix this configure issue, this path explicits the option at configure
> to make sure to disable libmount if is is not installed.
> 
> [1]: https://github.com/GNOME/glib/blob/glib-2-56/configure.ac#L1856
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@collabora.com>

You must have done a partial rebuild to reach this issue, because:

$ grep UTIL_LINUX package/libglib2/Config.in 
	select BR2_PACKAGE_UTIL_LINUX
	select BR2_PACKAGE_UTIL_LINUX_LIBMOUNT

So there is no way for util-linux to not have libmount support.

The issue you're seeing is typically what happens when util-linux is
built first, without libmount support. Then later on you enable
libglib2, but don't do a full rebuild. So util-linux is not rebuilt
with libmount support, and you see this problem.

>  LIBGLIB2_CONF_OPTS = \
>  	--with-pcre=system \
> +	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBMOUNT),--enable-libmount,--disable-libmount) \

However, if libmount support is indeed optional in libglib2, should we
also make it optional in Buildroot ? This mandatory dependency was
added in:

commit 4c7c010f9fae01399070844991252d3f5b9aae5f
Author: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date:   Tue Sep 20 12:01:30 2016 -0300

    libglib2: bump to version 2.50.0
    
    It now requires util-linux libmount so add the dependency/select.

Perhaps we need to revisit this and make it optional again ? Could you
have a look into this ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
