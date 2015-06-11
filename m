From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 12 Jun 2015 01:02:57 +0200
Subject: [Buildroot] [PATCH 06/11 v2] package/cryptodev-linux: use the
 kernel-module helper
In-Reply-To: <329d95315f937a0cbd912b8035fb0ccc0e94a9ed.1433964001.git.yann.morin.1998@free.fr>
References: <cover.1433964001.git.yann.morin.1998@free.fr>
 <329d95315f937a0cbd912b8035fb0ccc0e94a9ed.1433964001.git.yann.morin.1998@free.fr>
Message-ID: <557A13A1.2000500@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/10/15 21:22, Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> [Doug: add pre-build hook to build version.h]

 The version.h thing deserves a slightly more explicit commit message, like:

The cryptodev-linux Makefile defines the following:

build: version.h
        make ${KERNEL_MAKE_OPTS} modules

modules_install:
        make -C $(KERNEL_DIR) SUBDIRS=`pwd` modules_install
        @echo "Installing cryptodev.h in $(PREFIX)/usr/include/crypto ..."
        @install -D crypto/cryptodev.h $(PREFIX)/usr/include/crypto/cryptodev.h

So when we use the kernel-module infrastructure, we have to explicitly handle
version.h and cryptodev.h. cryptodev.h was already handled specifically because
it goes to STAGING_DIR. For version.h, we add a pre-build hook.


 That said, SUBDIRS= does not behave exactly the same as M=, but I don't know
what the difference is. So that part should probably be mentioned explicitly in
the commit message as well.

> Signed-off-by: Doug Kehn <rdkehn@yahoo.com>

[snip]
> -define CRYPTODEV_LINUX_INSTALL_TARGET_CMDS
> -	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) KERNEL_DIR=$(LINUX_DIR) \
> -		PREFIX=$(TARGET_DIR) modules_install
> -endef
> +CRYPTODEV_LINUX_MODULE_MAKE_OPTS = \
> +	KERNEL_DIR=$(LINUX_DIR) \
> +	PREFIX=$(TARGET_DIR)

 PREFIX is only used for installing cryptodev.h, which is now no longer done. So
we don't need to define it, right? Same for KERNEL_DIR, it's only used by the
rules we no longer use.

 If you remove these, it should of course also be mentioned explicitly in the
commit message.


 Regards,
 Arnout

>  
>  define CRYPTODEV_LINUX_INSTALL_STAGING_CMDS
>  	$(INSTALL) -D -m 644 $(@D)/crypto/cryptodev.h \
>  		$(STAGING_DIR)/usr/include/crypto/cryptodev.h
>  endef
>  
> +$(eval $(kernel-module))
>  $(eval $(generic-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
