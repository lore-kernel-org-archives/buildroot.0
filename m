From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 01 Jul 2013 08:00:02 +0200
Subject: [Buildroot] Sample configurations / test suite ?
In-Reply-To: <20130627004309.6f15cf53@skate>
References: <20130627004309.6f15cf53@skate>
Message-ID: <51D11AE2.5050707@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/27/13 00:43, Thomas Petazzoni wrote:
> Hello,
>
> Currently, the defconfig that we accept in configs/ are defconfig for
> various hardware platforms that should be as minimal as possible: the
> bootloader(s), the kernel, Busybox, the right filesystem images and
> that's it. Since I've been a fairly strong supporter of this approach,
> I continue to believe it makes sense, since there is no way, for a
> particular board, to decide which software components should or should
> not be part of the default configuration for this board.
>
> However, I am seeing two cases where we would want to have bigger, more
> specific defconfig files:
>
>   1) As part of a test suite. Things like building Xenomai, RTAI,
>      building a kernel with the various combination (with or without DT,
>      etc.) are not tested by our autobuilders, and we've recently had
>      reports of Xenomai being broken for example. Having a set of
>      configurations that are interesting to build would be very useful,
>      and this set could be extended when we think it is necessary (for
>      example after receiving a bug report). Those configurations could
>      be built on a daily basis, they could have some custom post-image
>      script to verify that the build has generated everything that was
>      expected, etc.
>
>   2) As part of a set of demonstration defconfigs. For example, Spenser
>      Gilliland has recently posted on his blog a defconfig that
>      demonstrates how to use OpenMAX on Raspberry Pi to do
>      hardware-accelerated video decoding. Maybe it would make sense to
>      have a way of storing those "demonstration" configurations
>      somewhere, so that they gain in visibility and can more easily be
>      re-used by users.
>
> What do you think about this? Do you have ideas on how to implement
> this? Should it be part of the Buildroot tree itself, or something
> separate? If something separate, how do we keep Buildroot and this
> separate tree in sync?

  For both use cases, it makes the most sense if these defconfigs are 
part of the buildroot tree.

  The risk is that the configs/ directory becomes too large and unwieldy 
(people will have to browse it to find the defconfig they want). So 
perhaps this calls for changing it into a tree.

  Personally, I think it makes sense to move the defconfigs into the 
board/ directory. Many defconfigs already refer into there for kernel 
configs or specific patches, so it makes sense to put the defconfig in 
the same place.

  And while I'm on this subject, I think the structure of the board 
directory is not very clear. It would make sense to me to switch to the 
layout that U-Boot uses: board/<arch>/<soc>/<boardname>/ (although the 
<soc> level may be optional for us). You can expect people to know what 
the basic architecture of the processor is, but not always who the vendor 
is (which is probably why raspberrypi, beaglebone and gnublin don't have 
a vendor directory). Or sometimes there are multiple vendors for the same 
board (e.g. Beagleboard and SabreLite).

  But of course, I'm not going to produce patches so I should probably 
shut up :-)

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
