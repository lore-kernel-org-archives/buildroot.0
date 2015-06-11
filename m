From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 12 Jun 2015 00:51:40 +0200
Subject: [Buildroot] [PATCH 04/11 v2] package/igh-ethercat: use
 kernel-module helper
In-Reply-To: <67fa2434cd648918b67fe560841ceacd75bed3ac.1433964001.git.yann.morin.1998@free.fr>
References: <cover.1433964001.git.yann.morin.1998@free.fr>
 <67fa2434cd648918b67fe560841ceacd75bed3ac.1433964001.git.yann.morin.1998@free.fr>
Message-ID: <557A10FC.5010309@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/10/15 21:22, Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Perhaps it would be better for changes like this to mention in the commit
message what the Makefile does. If there is a commit message like this, I trust
the patch a whole lot more:

igh-ethercat's Makefile has these rules, so our kernel-module helper does
exactly the same:

modules:
        $(MAKE) -C "$(LINUX_SOURCE_DIR)" M="$(@D)" modules

modules_install:
        $(MAKE) -C "$(LINUX_SOURCE_DIR)" M="$(@D)" \
                INSTALL_MOD_DIR="$(INSTALL_MOD_DIR)" modules_install


(for convenience I replaced the full path with $(@D)).


 Regards,
 Arnout

> ---
>  package/igh-ethercat/igh-ethercat.mk | 14 +-------------
>  1 file changed, 1 insertion(+), 13 deletions(-)
> 
> diff --git a/package/igh-ethercat/igh-ethercat.mk b/package/igh-ethercat/igh-ethercat.mk
> index b5221f8..32c49a3 100644
> --- a/package/igh-ethercat/igh-ethercat.mk
> +++ b/package/igh-ethercat/igh-ethercat.mk
> @@ -10,7 +10,6 @@ IGH_ETHERCAT_SOURCE = ethercat-$(IGH_ETHERCAT_VERSION).tar.bz2
>  IGH_ETHERCAT_LICENSE = GPLv2 (IgH EtherCAT master), LGPLv2.1 (libraries)
>  IGH_ETHERCAT_LICENSE_FILES = COPYING COPYING.LESSER
>  
> -IGH_ETHERCAT_DEPENDENCIES = linux
>  IGH_ETHERCAT_INSTALL_STAGING = YES
>  
>  IGH_ETHERCAT_CONF_OPTS = \
> @@ -22,16 +21,5 @@ IGH_ETHERCAT_CONF_OPTS += $(if $(BR2_PACKAGE_IGH_ETHERCAT_E1000),--enable-e1000,
>  IGH_ETHERCAT_CONF_OPTS += $(if $(BR2_PACKAGE_IGH_ETHERCAT_E1000E),--enable-e1000e,--disable-e1000e)
>  IGH_ETHERCAT_CONF_OPTS += $(if $(BR2_PACKAGE_IGH_ETHERCAT_R8169),--enable-r8169,--disable-r8169)
>  
> -define IGH_ETHERCAT_BUILD_MODULES
> -	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) modules
> -endef
> -
> -IGH_ETHERCAT_POST_BUILD_HOOKS += IGH_ETHERCAT_BUILD_MODULES
> -
> -define IGH_ETHERCAT_INSTALL_MODULES
> -	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) modules_install
> -endef
> -
> -IGH_ETHERCAT_POST_INSTALL_TARGET_HOOKS += IGH_ETHERCAT_INSTALL_MODULES
> -
> +$(eval $(kernel-module))
>  $(eval $(autotools-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
