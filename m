From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 30 Apr 2014 00:03:51 +0200
Subject: [Buildroot] [PATCH] target-finalize: avoid stripping kernel
 modules with incorrect permissions
In-Reply-To: <7d963df83be71e515c67.1398797646@argentina>
References: <7d963df83be71e515c67.1398797646@argentina>
Message-ID: <536021C7.6030105@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/04/14 20:54, Thomas De Schampheleire wrote:
> If a kernel module is installed with incorrect permissions (0755 iso 0644),
> it would get stripped in a way that would render the kernel module broken.
> While the incorrect permissions are a developer error, it is a minor change
> to prevent this mistake from causing incorrectly stripped modules.
> 
> This was reported with bug #6992:
> https://bugs.busybox.net/show_bug.cgi?id=6992
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> 
> ---
>  Makefile |  2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> --- a/Makefile
> +++ b/Makefile
> @@ -507,7 +507,7 @@ ifneq (,$(call qstrip,$(BR2_STRIP_EXCLUD
>  STRIP_FIND_CMD += \( $(call finddirclauses,$(TARGET_DIR),$(call qstrip,$(BR2_STRIP_EXCLUDE_DIRS))) \) -prune -o
>  endif
>  STRIP_FIND_CMD += -type f \( -perm /111 -o -name '*.so*' \)
> -STRIP_FIND_CMD += -not \( $(call findfileclauses,libpthread*.so* $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) -print
> +STRIP_FIND_CMD += -not \( $(call findfileclauses,libpthread*.so* *.ko $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) -print

 The *.ko is a bit lost between the others, so maybe add a comment to
explain why libpthread*.so* and *.ko are excluded.

 But that's optional and may be a separate patch, hence my Ack on this
one already.

 Regards,
 Arnout

>  
>  $(TARGETS_ROOTFS): target-finalize
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
