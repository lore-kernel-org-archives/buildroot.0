From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 24 Aug 2016 02:58:22 +0200
Subject: [Buildroot] How I can add a package of cmus?
In-Reply-To: <68562d34c69d106316a77f40dfa9a0@cweb20.nm.nhnsystem.com>
References: <68562d34c69d106316a77f40dfa9a0@cweb20.nm.nhnsystem.com>
Message-ID: <6eaa9426-87d3-3cab-d700-e638eee782e2@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19-08-16 16:21, ??? wrote:
> I want to add cmus(ncurse based cui music player) package to my buildroot. But,
> I'm a lemon. I am struggling to write. Would you help me some?  
> 
>  
> 
> ################################################################################
> #
> # cmus
> #
> ################################################################################
> 
> 
> CMUS_VERSION = 2.7.1
> CMUS_SOURCE = v$(CMUS_VERSION).tar.gz
> CMUS_SITE = https://github.com/cmus/cmus/archive
> CMUS_DEPENDENCIES  = host-pkgconf
> CMUS_INSTALL_STAGING = YES
> 
> define CMUS_CONFIGURE_CMDS
>         (cd $(@D); \
>                
> PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)" \
>                 PKG_CONFIG_SYSROOT_DIR="$(STAGING_DIR)" \
>                 PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
>                 PKG_CONFIG_LIBDIR="$(STAGING_DIR)/usr/lib/pkgconfig" \

 The configure script also seems to want to cross-compile some test programs, so
you should pass $(TARGET_CONFIGURE_OPTS) $(TARGET_CONFIGURE_ARGS). This already
includes the PKG_CONFIG stuff so that can be removed.

>         ./configure \
>                 prefix="$(STAGING_DIR)/usr"  \
>                          )
> endef
> 
> define CMUS_BUILD_CMDS
>           $(MAKE) CC=$(TARGET_CC) LD=$(TARGET_LD) -C $(@D) all

 I think you can actually pass $(TARGET_CONFIGURE_OPTS) in the environment and
remove the CC and LD overrides.

 Regards,
 Arnout

> endef
> 
> $(eval $(generic-package))
>  
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
