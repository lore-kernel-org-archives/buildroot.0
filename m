From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 14 Sep 2016 02:25:23 +0200
Subject: [Buildroot] [PATCH 1/5] grub2: bump up version
In-Reply-To: <20160913041548.10290-2-nunes.erico@gmail.com>
References: <20160913041548.10290-1-nunes.erico@gmail.com>
 <20160913041548.10290-2-nunes.erico@gmail.com>
Message-ID: <c4d34da0-6dc8-3eec-a2aa-08cf5b05bf42@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13-09-16 06:15, Erico Nunes wrote:
> Grub 2 version 2.00 which exists in Buildroot dates back from 2012 and
> does not support new interesting features such as ARM support.
> 
> Despite it being the last official non-beta release, it makes sense to
> bump Grub 2 to current master HEAD as the project has not been providing
> regular releases since then.
> Other distributions such as Fedora have also been shipping variations of
> the newer "beta" releases.
[snip]
> diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
> index dc4e51e..ecdf421 100644
> --- a/boot/grub2/grub2.mk
> +++ b/boot/grub2/grub2.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -GRUB2_VERSION = 2.00
> -GRUB2_SITE = $(BR2_GNU_MIRROR)/grub
> -GRUB2_SOURCE = grub-$(GRUB2_VERSION).tar.xz
> +GRUB2_VERSION = 4e0f8f66e321cf1051c0e01f6fbcc6fc35a807b6
> +GRUB2_SITE = git://git.savannah.gnu.org/grub.git

 It's not so nice that we have to download via git, no http protocol, we have to
autoregen, we can't check the signature...

 Isn't it better to use grub-2.02~beta3.tar.xz which is just half a year old?

> +GRUB2_SITE_METHOD = git
>  GRUB2_LICENSE = GPLv3+
>  GRUB2_LICENSE_FILES = COPYING
>  GRUB2_DEPENDENCIES = host-bison host-flex
> @@ -70,6 +70,11 @@ GRUB2_CONF_OPTS = \
>  	--enable-libzfs=no \
>  	--disable-werror
>  
> +define GRUB2_RUN_AUTOGEN
> +	cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
> +endef
> +GRUB2_PRE_CONFIGURE_HOOKS += GRUB2_RUN_AUTOGEN

 Isn't there a possibility to use GRUB2_AUTORECONF = YES?

 If not, you must:

* Explain in a comment why not.
* Add host-automake host-autoconf to GRUB2_DEPENDENCIES
* Normally also host-libtool and normally you have to run LIBTOOL_PATCH_HOOK,
but grub2 doesn't use libtool.


 Regards,
 Arnout

> +
>  # We don't want all the native tools and Grub2 modules to be installed
>  # in the target. So we in fact install everything into the host
>  # directory, and the image generation process (below) will use the
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
