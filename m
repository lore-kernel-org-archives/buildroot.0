From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 4 Nov 2017 21:51:36 +0100
Subject: [Buildroot] [PATCH 1/1] package/dtc: qemu system build need
 libfdt.
In-Reply-To: <cecbedfb-98a5-4b52-a59b-3129c7e0da51@cesnet.cz>
References: <1509624873-16240-1-git-send-email-ren_guo@c-sky.com>
 <09523a7a-0125-4c10-bb29-e15cfa00165f@cesnet.cz>
 <cecbedfb-98a5-4b52-a59b-3129c7e0da51@cesnet.cz>
Message-ID: <d6dd36db-bf3f-217e-cf1f-978c9c0ebf16@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03-11-17 03:33, Jan Kundr?t wrote:
> ...and here's a simple patch against U-Boot which fixes the build for me. 

 Isn't the build already fixed if you only replace the ../include line? The
../lib/libfdt/fdt.h should not be problematic since that file doesn't exist in
STAGING_DIR. Right? Same for libfdt_internal.h.

> It
> seems that U-Boot is special in Buildroot when it comes to patch handling. 

 Indeed, because the U-Boot version is configurable so it's impossible to say if
a patch can apply.

 However, it would be possible to do the fixup using sed, e.g.

$(SED) 's%<../include/libfdt.h>%"../include/libfdt.h"%' $(@D)/tools/fdtgrep.c

in a post-patch hook.

 Regards,
 Arnout

> I
> also don't know whether it's reasonable to patch it like this instead of not
> installing libfdt from the DTC. I also looked at U-Boot's patchwork and noticed
> that there's aparently an active series where someone is refactoring libfdt
> wrappers.
> 
> TL;DR: it's a mess. This fixes stuff for me, feel free to pick in any way you
> feel is appropriate.
> 
> My mail with this patch to upstream U-Boot is in a moderation queue, so I'm
> posting it at least here.
> 
> Cheers,
> Jan
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
