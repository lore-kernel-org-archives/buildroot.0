From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Sep 2016 11:01:43 +0200
Subject: [Buildroot] [PATCH] infra/pkg-kconfig: Be sure to reconfigure
 the package on foo-reconfigure
In-Reply-To: <CAAXf6LUrhOVJJG-1_pf4vzKMh1=7WG0xop9XY6m9fva-FepHzA@mail.gmail.com>
References: <1473806117-3858-1-git-send-email-yann.morin.1998@free.fr>
 <CAAXf6LUrhOVJJG-1_pf4vzKMh1=7WG0xop9XY6m9fva-FepHzA@mail.gmail.com>
Message-ID: <20160914110143.2f25e8a9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 14 Sep 2016 09:27:25 +0200, Thomas De Schampheleire wrote:

> > This can be problematic when using an override-srcdir suring development
> > and the content of the veride-srcdir changes (e.g. on a rebase, a merge,
> > or during a bisect).
> >
> > This is because the configuration (kconfig-wise) of the package is not
> > done in the _CONFIGURE_CMDS block, but as a separate action that is not
> > part of any step [0].
> >
> > So, be sure to remove the stamp file .stamp_kconfig_fixup_done during
> > the foo-clean-for-reconfigure rule, so that the configuration is applied
> > again with the new source tree.
> >
> > We use another rule, foo-clean-kconfig-for-reconfigure, because we do
> > not want to override the default foo-clean-for-reconfigure rule, and we
> > have no way to add conditional commands to it.
> >
> > [0] The reasons it was not done are not entirely clear in my head, but
> > IIRC that was not working at the time we tried with Thomas DS.  
> 
> This period is very blurry for me :-)
> 
> I can't recall having focused on the reconfigure step for the kconfig
> infrastructure, I think I was looking primarily at configure, combined
> with cleans and various other combinations. So it is very well
> possible that this has always been broken until now.

Well, the question is not so much about "reconfigure", but about
the configure step itself. Why isn't the configure step done inside
<pkg>_CONFIGURE_CMDS ? If it had been done inside the
<pkg>_CONFIGURE_CMDS, then those "hacks" to make reconfigure work
would not be needed.

I'm pretty sure that there's a solid reason for not doing the .config
preparation inside <pkg>_CONFIGURE_CMDS, but it'd be great to remember
why and document it somewhere :)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
