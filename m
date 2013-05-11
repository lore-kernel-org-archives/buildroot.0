From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 11 May 2013 08:10:55 +0200
Subject: [Buildroot] [PATCH 1/5] beaglebone: update to linux 3.8
In-Reply-To: <CAE4k2391Ku1Oi+2ACCetmvr5dO8JBygv_hNTM18BchAbdBA3DA@mail.gmail.com>
References: <CAE4k2391Ku1Oi+2ACCetmvr5dO8JBygv_hNTM18BchAbdBA3DA@mail.gmail.com>
Message-ID: <518DE0EF.8060500@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/05/13 06:37, Anders Darander wrote:
> Hi Arnout,
>
> (Resending as I first sent from an unsubcribed email).

  Yeah, the subscribed-only sending can get annoying.

  BTW your re-sending lost the in-reply-to headers, which is unfortunate.

>
> Arnout Vandecappelle <arnout at mind.be <mailto:arnout@mind.be>> wrote:
>  >On 09/05/13 22:31, Anders Darander wrote:
>  >> From: Anders Darander <anders@chargestorm.se
> <mailto:anders@chargestorm.se>>
>  >>
>  >> The kernel config here, is basically the default one from the TI
>  >kernel.
>  >> Thus, it's omap2plus_defconfig, which is rather generic.
>  >
>  > So why include a config in buildroot? If it's just the defconfig that
>  >is already in the kernel tree, you can use it.
>
> Well, the intention was to reduce it in the next patch, just to show how
> it was derived. Though, I'll squash them in the next revision.

  Good reasoning, but it still makes reviewing more difficult :-)

>
>  >> As the beaglebone support is mainlined, there's no support for the
>  >old
>  >> board setup files, and the only supported run-time configuration is
>  >through
>  >> the device tree.
>  >>
>  >> We're also setting the kernel headers to follow the 3.8 series.
>  >>
>  >> Signed-off-by: Anders Darander <anders@chargestorm.se
> <mailto:anders@chargestorm.se>>
>  >> ---
>  >>   board/beaglebone/linux-3.2.9.config |  252
>  >----------------------------
>  >>   board/beaglebone/linux-3.8.config   |  315
>  >+++++++++++++++++++++++++++++++++++
>  >
>  >  Please create your patches with the -M option to send-email or
>  >format-patch, so that we can actually see the diff crossing the rename.
>
> Hmm, strange, I was using -M, but I might have to tweak the threshold a
> little bit. I'll look into that for the next revision.

  Ah, it's probably because you didn't squash in the next patch: now the 
differences are too high to pass the threshold.

>
>  >Otherwise it's pretty hard to review.
>  >
>  >>   configs/beaglebone_defconfig        |   22 +--
>  >>   3 files changed, 321 insertions(+), 268 deletions(-)
>  >>   delete mode 100644 board/beaglebone/linux-3.2.9.config
>  >>   create mode 100644 board/beaglebone/linux-3.8.config
>  >>
>  >[snip]
>  >> diff --git a/configs/beaglebone_defconfig
>  >b/configs/beaglebone_defconfig
>  >> index 2177068..f80dd79 100644
>  >> --- a/configs/beaglebone_defconfig
>  >> +++ b/configs/beaglebone_defconfig
>  >> @@ -1,24 +1,14 @@
>  >> -# architecture
>  >>   BR2_arm=y
>  >>   BR2_cortex_a8=y
>  >> +BR2_KERNEL_HEADERS_3_8=y
>  >>   BR2_EXTRA_GCC_CONFIG_OPTIONS="--with-fpu=vfpv3 --with-float=hard"
>  >>   # BR2_SOFT_FLOAT is not set
>  >> -
>  >> -# system
>  >
>  >Please don't remove these comments, they're useful. You can selectively
>
> Ok, then I guess that I should keep the old ordering, even though
> savedefconfig have reordered some of them.?

  No, the new ordering is good - I do prefer to see things in the 'make 
savedefconfig' order.

>
>  >undo changes with 'git checkout -p configs/beaglebone_defconfig'.
>  >
>
>  >>   BR2_LINUX_KERNEL=y
>  >>   BR2_LINUX_KERNEL_CUSTOM_GIT=y
>  >>
>  >-BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://github.com/koenkooi/linux.git <http://github.com/koenkooi/linux.git>"
>  >>
>  >-BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="linux-ti33x-psp-3.2-r5a+gitr09e9651bcf2ee8d86685f2a8075bc6557b1d3b91"
>  >>
>  >+BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL="git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git <http://git.ti.com/ti-linux-kernel/ti-linux-kernel.git>"
>  >>
>  >+BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION="935f6c2f82056d538b528272e2bdbb5c08d69a58"
>  >
>  >Isn't there a tag you can clone from? That's much faster, because then
>  >we can (usually) do a shallow clone.
>
> I'm not sure if there's a tag available in this case.
>
> Ok, so tags preferred if they exists... Good to know, I'll check it and
> change it if there's a tag.
>
> The list few years I've mainly been working with another build system,
> where SHA1's are preferred over tags for network-less building.

  Do you know if there's a specific reason for that? The 'network-less' 
doesn't make a difference because the tags are always equally available, 
unless you clone/fetch with --no-tags.


  Regards,
  Arnout

> I'll come back with a new series in a couple of days.
>
> Thanks for the feedback!
>
> Cheers,
> Anders
>
> --
> Anders Darander
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
