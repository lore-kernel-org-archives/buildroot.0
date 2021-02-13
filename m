From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 13 Feb 2021 18:58:54 +0100
Subject: [Buildroot] [RFC] package/rpi-firmware: Allow to deploy
 multiple firmware files
In-Reply-To: <20210213173426.GA2740149@scaer>
References: <fa3866259e9e3e908e8c92dbaa37e1f9e10886f4.1612789783.git.stefan@agner.ch>
 <20210213180513.08a4d844@gmx.net> <20210213173426.GA2740149@scaer>
Message-ID: <20210213185854.02383c04@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann,

On Sat, 13 Feb 2021 18:34:26 +0100, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Peter, Stefan, All,
>
> On 2021-02-13 18:05 +0100, Peter Seiderer spake thusly:
> > On Mon,  8 Feb 2021 14:13:49 +0100, Stefan Agner <stefan@agner.ch> wrote:
> > > Add a new config option to allow a specific list of firmware files to be
> > > deployed. This is useful if the system needs to decide at runtime which
> > > firmware to use.
> [--SNIP--]
> > Seems the rpi-firmware package tries to be too smart here and to workaround
> > the smart logic is getting more and more complicated
>
> Agreed.
>
> > (and your patch is
> > something orthogonal to the latest changes applied, see [1] for resulting
> > commit and [2] ff. for discussion) and the package logic is to much focused
> > to do the right thing for exactly one determined target platform...,
> > neglecting the multi-target enabled SD card use case (or other custom
> > use cases)...
>
> Well, that is what Buildroot is mostly: build a rootfs for one specific
> hardware which "global purpose" does not change over the course of the
> life of that hardware, and for the rpi case, that meant the GPU firmware
> would not change.

It is not about the 'change over the course of the live of that hardware'
but about the ability to create/provide a SD card image which fits more
than one fixed/limited target..., I believe a valid use case...

>
> So that's how the rpi-firmware came to be, and how I (amongst others)
> tried to steer it so far.
>
> And indeed that does not account for devices where the purpose may
> change without re-flashing a new version.
>
> > Maybe the best would be to reduce the rpi-firmware package to a selectable
> > list of (verbatim) installed firmware files and an editable/customized
> > config.txt (as already via the post-image.sh script) or go another step
> > further and provide customized config.txt files per raspberry pi defconfig
> > (as most buildroot/rpi user will need a customized version anyway e.g.
> > to enable custom dtoverlays as vc4-kms-v3d-pi4) and drop the post-image.sh
> > script?
>
> I think that we should just simply copy over all the firmware files for
> the selected variant (0/1/2/3 vs. 4), and just have a static config.txt
> that just boots the default firmware. Then, for people who want to use
> another firmware will have to provide their own post-image script
> (either as a replacement for the bundeld one, or as an additional one)
> to further tweak config.txt to boot the firmware they need and/or remove
> those firmwares they do not want.

The 'a static config.txt' will not work, see the post-image.sh quirks
for miniuart-bt-overlay (to enable the serial console on RPi3/RPi4)
and the aarch64 one for the 64-bit builds, instead at least a per
defconfig/board one is needed (some can share a common one)...

>
> This makes the rpi-firmware more in-line with the basic mantra of
> Buildroot, which is basically also the mantra of Buildroot: provide a
> basic bootable setup that just brings up the board to a shell (and
> optionally a very few other stuff) and let the user customise that.

Count a enabled serial console to the basic stuff (see above)...

>
> So in the end, although this would probably go against my initial
> thinking (to provide one-purpose setup), I will welcome such a
> simplification.

Will eventually try to provide a patch the next days....

Regards,
Peter

>
> Regards,
> Yann E. MORIN.
>
