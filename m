From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 14 Sep 2016 09:27:25 +0200
Subject: [Buildroot] [PATCH] infra/pkg-kconfig: Be sure to reconfigure
	the package on foo-reconfigure
In-Reply-To: <1473806117-3858-1-git-send-email-yann.morin.1998@free.fr>
References: <1473806117-3858-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <CAAXf6LUrhOVJJG-1_pf4vzKMh1=7WG0xop9XY6m9fva-FepHzA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 14, 2016 at 12:35 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Currently, calling foo-reconfigure for a kconfig-based package will not
> re-trigger the configuration (kconfig-wise) step for the package.
>
> This can be problematic when using an override-srcdir suring development
> and the content of the veride-srcdir changes (e.g. on a rebase, a merge,
> or during a bisect).
>
> This is because the configuration (kconfig-wise) of the package is not
> done in the _CONFIGURE_CMDS block, but as a separate action that is not
> part of any step [0].
>
> So, be sure to remove the stamp file .stamp_kconfig_fixup_done during
> the foo-clean-for-reconfigure rule, so that the configuration is applied
> again with the new source tree.
>
> We use another rule, foo-clean-kconfig-for-reconfigure, because we do
> not want to override the default foo-clean-for-reconfigure rule, and we
> have no way to add conditional commands to it.
>
> [0] The reasons it was not done are not entirely clear in my head, but
> IIRC that was not working at the time we tried with Thomas DS.

This period is very blurry for me :-)

I can't recall having focused on the reconfigure step for the kconfig
infrastructure, I think I was looking primarily at configure, combined
with cleans and various other combinations. So it is very well
possible that this has always been broken until now.

/Thomas
