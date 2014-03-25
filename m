From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 25 Mar 2014 23:58:12 +0100
Subject: [Buildroot] [PATCH 3 of 4] qtuio: use TARGET_MAKE_ENV when
 running make and qmake
In-Reply-To: <90542cc669bb4125a904.1395257408@argentina>
References: <patchbomb.1395257405@argentina>
 <90542cc669bb4125a904.1395257408@argentina>
Message-ID: <53320A04.7060201@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/03/14 20:30, Thomas De Schampheleire wrote:
> This patch prepends TARGET_MAKE_ENV to $(MAKE) and $(QT_QMAKE) command
> lines, to make sure PATH is set correctly, and to line up with the qt5
> packages that do this consistently.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> 
> ---
>  package/qtuio/qtuio.mk |  6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/qtuio/qtuio.mk b/package/qtuio/qtuio.mk
> --- a/package/qtuio/qtuio.mk
> +++ b/package/qtuio/qtuio.mk
> @@ -19,13 +19,13 @@ QTUIO_EXAMPLES = dials fingerpaint knobs
>  ifeq ($(BR2_QTUIO_EXAMPLES),y)
>  define QTUIO_CONFIGURE_EXAMPLES
>  	for example in $(QTUIO_EXAMPLES) ; do \
> -		(cd $(@D)/examples/$${example} && $(QT_QMAKE)) ; \
> +		(cd $(@D)/examples/$${example} && $(TARGET_MAKE_ENV) $(QT_QMAKE)) ; \
>  	done
>  endef
>  endif
>  
>  define QTUIO_CONFIGURE_CMDS
> -	cd $(@D)/src && $(QT_QMAKE)
> +	cd $(@D)/src && $(TARGET_MAKE_ENV) $(QT_QMAKE)
>  	$(QTUIO_CONFIGURE_EXAMPLES)
>  endef
>  
> @@ -38,7 +38,7 @@ endef
>  endif
>  
>  define QTUIO_BUILD_CMDS
> -	$(MAKE) -C $(@D)/src
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src
>  	$(QTUIO_BUILD_EXAMPLES)
>  endef
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
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
