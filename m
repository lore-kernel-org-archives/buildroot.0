From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Apr 2013 22:45:41 +0200
Subject: [Buildroot] [PATCH v2 00/12] RFC: ARC port
In-Reply-To: <E6BF041E97966E4DB955F0DF883AD2D6339FA392@de02wembxa.internal.synopsys.com>
References: <1366798403-6984-1-git-send-email-mjonker@synopsys.com>
 <20130425050221.4846d873@skate>
 <E6BF041E97966E4DB955F0DF883AD2D6339FA392@de02wembxa.internal.synopsys.com>
Message-ID: <20130429224541.6f46b3b4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mischa Jonker,

On Thu, 25 Apr 2013 11:01:15 +0000, Mischa Jonker wrote:

> > (host-flex/host-bison)
> Thanks for the patches! I have integrated them and added version
> checks. I'm not 100% certain from which version onwards the
> dependency has been removed, but my colleague says that he didn't
> encounter these dependencies with GCC 4.5, so I made it depend on
> 4.2,4.3,4.4.

Ok.

> > Do you have an idea for this pthread_mutex_t issue? Maybe ARC
> > doesn't support NPTL or something?
> Correct, we don't have NPTL support yet. It was the initial planning
> to have this finished before we went out with the BuildRoot patches,
> but priorities shifted, and I hadn't disabled it yet. Added a patch
> for that.

Good.

> > Also, do you have a public repo to push your changes to? Since your
> > patch series has become quite long, it would make it easier for us
> > to test it as a whole.
> Our github site has a BuildRoot repository:
> https://github.com/foss-for-synopsys-dwc-arc-processors/buildroot
> 
> I'm regularly rebasing & updating patches, and pushing them to this
> repo. Right now, there are two branches/tags that are relevant:
> * master_arc_20130425
> * master_3.9_arc_20130425
> 
> The only difference between the two is that the first relies on
> 3.9-rc8, and the second on 3.9. So the second branch doesn't build
> right now, but should build after this weekend.

3.9 has been released now, so that should solve your problem. Could you
rebase your patch series on top of master, Peter has added 3.9 as a
supported kernel.

I tested your branch, and it built fine for me on the autobuilders, so
in terms of basic buildability, we're good.

> BTW: would you like to repost the new set of patches on the mailing
> list, or would you rather have a look at it on github? BTW2: I
> noticed that GNU config went from GPLv2 to GPLv3, I'm not sure what
> the impact would be for BuildRoot, as it is really part of BuildRoot
> (not downloaded).

Yes, they should be reposted, but I have a number of comments on them:

 * 'toolchain/gcc: Add host-{flex,bison} dependencies for GCC
   4.2,4.3,4.4' should be earlier in the series, i.e before 'arc: add
   gcc for ARC'.

 * 'package/binutils: add host-{flex,bison} dependencies for 2.19-arc'
   should probably be squashed into 'arc: Add support for ARC-specific
   binutils'.

 * I am not entirely happy with 'toolchain/gcc: Introduce
   BR2_ARCH_HAS_NO_GCC_x_y' using a reverted logic. I haven't thought
   too much about it, but wouldn't it be possible to instead do
   something like BR2_ARCH_NEEDS_GCC_4_6_PLUS, and then do something
   like depends !BR2_ARCH_NEEDS_GCC_4_6_PLUS on all gcc versions <
   4.6 ? Hum, the problem is that it works with architecture that are
   supported starting from a given upstream gcc version, but not
   architecture that are supported only in 4.2-avr, or in 4.4-arc, etc.

   Maybe others will have a suggestion on this point?

Other than that, it looks good to me.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
