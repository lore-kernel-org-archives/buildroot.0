From: Ludovic Desroches <ludovic.desroches@microchip.com>
Date: Wed, 26 Feb 2020 14:29:16 +0100
Subject: [Buildroot] external, how to achieve our needs?
In-Reply-To: <VI1PR02MB3920FE7EF8D9CDDC656EAB49DCEA0@VI1PR02MB3920.eurprd02.prod.outlook.com>
References: <20200225150149.zvyqbn34swfizg72@M43218.corp.atmel.com>
 <VI1PR02MB3920FE7EF8D9CDDC656EAB49DCEA0@VI1PR02MB3920.eurprd02.prod.outlook.com>
Message-ID: <20200226132916.5umjrlej5to4shtl@M43218.corp.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mircea,

On Wed, Feb 26, 2020 at 12:11:36PM +0000, Mircea GLIGA wrote:
> Hi Ludovic,
> 
> I also have this kind of problems when implementing our external, sometimes is useful to 'override' or append to a recipe (Yocto style).
> 
>   *   I ended up "duplicating" recipes in our layer, e.g. bd-tcpdump in order to build the package differently

From the top of my head, I tried this and I got an error when duplicating
the recipes in the external. Did you use other tricks?

>   *   where it was possible, I manipulated the original package variables, from a .mk file in the external layer: e.g modify the *_CONF_OPTS or *_CONF_ENV for some package

I also have some hacks in external.mk as suggested by Thomas:
$(LIBRSVG_TARGET_CONFIGURE):| cairo_microchip
$(PANGO_TARGET_CONFIGURE):| cairo_microchip

But it's not perfect, buildroot is not aware of the dependecy when you
use target susch as show-depends.

Regards,

Ludovic

> 
> I'm also not that pleased with this 'unofficial' solution.
> 
> BR
> Mircea
> ________________________________
> From: buildroot <buildroot-bounces@busybox.net> on behalf of Ludovic Desroches <ludovic.desroches@microchip.com>
> Sent: Tuesday, February 25, 2020 17:01
> To: buildroot at buildroot.org <buildroot@buildroot.org>
> Cc: Eugen Hristev <Eugen.Hristev@microchip.com>; Joshua Henderson <Joshua.Henderson@microchip.com>; Nicolas Ferre <Nicolas.Ferre@Microchip.com>; Cristian Birsan <Cristian.Birsan@microchip.com>; Tudor Ambarus <Tudor.Ambarus@microchip.com>
> Subject: [Buildroot] external, how to achieve our needs?
> 
> Hi,
> 
> We are currently using it for linux4sam but it seems it has limitations
> and I would like to know if you have advice to share or the same issue.
> I did a quick search in the mailing list, I found a discussion with few
> answers and patches from Yann for external toolchains, jpeg and openssl.
> Unfortunately, it doesn't cover all our use cases.
> 
> At the beginning, we forked buildroot in the buildroot-at91 tree. It was
> mostly done to put patches we sent upstream. We release a distribution
> called linux4sam which contains bootloaders, kernel and rootfs. We can't
> wait for the next release of Buildroot to get our patches. It was also
> useful to handle additional defconfigs, buildroot bug fixes and sometimes
> patches that are not accepted upstream.
> 
> When the external feature was released, we thought that it should be better
> to rely on Buildroot vanilla and to release only our external. The goal was
> to remove the buildroot-at91 fork. At least, it was the plan...
> 
> Now, we still have buildroot-at91 + buildroot-external-microchip trees. We
> faced several problems which make difficult to only provide an external.
> 
> One of the latest issue is we are adding support for a GPU in cairo and
> this work is not upstream yet. It involves patching cairo sources
> (that's not a big deal) but also to modify cairo.mk to add dependencies and
> new configure options. I discussed with Thomas who helped me to achieve it
> with some tricks. I added a cairo_microchip package, I had to patch some
> libraries to link with this version of cairo and use the external.mk to
> force extra dependencies for cairo and pango. Honestly, even if it works,
> I am not pleased with the solution. It will be so much easier and cleaner
> to do this in buildroot-at91 instead of buildroot-external-microchip. We
> discussed again, internally, about the external and the fork of buildroot
> but we have different opinions. I would like to emphasize that recent
> changes in buildroot make us think that it won't be easy to get rid of
> buildroot-at91: devmem2 deprecated, rgnd which increases the boot time
> since it uses the lib jitterentropy, curl library name change and others.
> 
> My feeling is that the external is not flexible enough to allow us to
> remove buildroot-at91. Is it planned to offer a way to modify package
> configs and makefiles or is it totally against Buildroot philosophy? I
> think this is a strength of the Yocto layers but it's also a weakness as
> it becomes difficult to know what is built and how. I also wonder if we can
> have one version of the external to support several versions of buildroot
> or if we'll need to tag it according to the version of buildroot it has
> been tested against. Do we put too much hope in the external?
> 
> If I try to summarize our options with their pros and cons:
> 
> - buildroot fork:
>   - pros:
>     - one tree
>     - full control, can do whatever we want
>   - cons:
>     - fork
>     - need to rebase patches for new releases
>     - may not be able to keep the pace of buildroot releases
> 
> - buildroot external:
>   - pros:
>     - one tree
>     - not dependent on buildroot version (in theory) so no rebase to do
>   - cons:
>     - can't modify buildroot package makefiles, only the source code
>     - can't quickly solve bugs in buildroot
>     - may have dependency on the buildroot version
> 
> - buildroot fork + external:
>   - pros:
>     - full control, can do whatever we want
>     - less patches to rebase (only the ones on top of buildroot)
>   - cons:
>     - fork
>     - two trees
>     - may not be able to keep the pace of buildroot releases
>     - may have buildroot fork with no patches on top of it sometime
> 
> 
> If you have any suggestions, about improvements for Buildroot or the way we
> manage our Buildroot offer, I would be happy to hear them.
> 
> 
> Regards,
> 
> Ludovic
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> ________________________
> This email was scanned by Bitdefender
