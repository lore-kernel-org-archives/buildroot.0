From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 12 May 2014 18:07:57 +0200
Subject: [Buildroot] [PATCH] build log: add message when starting
 target-finalize target
In-Reply-To: <3230f72b2606158b2575.1399904367@argentina>
References: <3230f72b2606158b2575.1399904367@argentina>
Message-ID: <5370F1DD.1000004@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/05/14 16:19, Thomas De Schampheleire wrote:
> The target-finalize target does a large number of actions (removing
> unnecessary files, stripping objects, etc.) but does not have a header. This
> makes it seem that all these actions are done as part of the last action
> before target-finalize, for example:
>     >>> makedevs undefined Installing to target
> 
> To make a clear distinction, add a message to the beginning of
> target-finalize:
>     >>>   Finalizing target directory
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> 
> ---
>  Makefile |  1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> Note: in system/system.mk there are a number of smaller items that are
> executed before target-finalize but do not have any message associated with
> them. This includes the adding to securetty, the setting of issue and
> hostname, ... Adding a message to each of these small targets is probably
> too much, but if we could find an elegant way to add a message to the group
> of system/system.mk, that would be nice.

 IMHO those targets should be converted into command variables that are expanded
inside the target-finalize rule. I think that that makes it much more
understandable what this target is doing.

 In fact, Fabio has a patch series doing exactly that. Fabio, if you would
resend your series, I suggest to include this patch in it as well. Although most
likely this patch will still be committed for 2014.05 while Fabio's series is
too risky at this point.

 Regards,
 Arnout

> Adding an initial target in system/system.mk just printing a message would
> work, but only if there is no top-level parallel build.
> 
> diff --git a/Makefile b/Makefile
> --- a/Makefile
> +++ b/Makefile
> @@ -533,6 +533,7 @@ endif
>  $(TARGETS_ROOTFS): target-finalize
>  
>  target-finalize: $(TARGETS)
> +	@$(call MESSAGE,"Finalizing target directory")
>  	$(TARGET_PURGE_LOCALES)
>  	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/share/aclocal \
>  		$(TARGET_DIR)/usr/lib/pkgconfig $(TARGET_DIR)/usr/share/pkgconfig \
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
