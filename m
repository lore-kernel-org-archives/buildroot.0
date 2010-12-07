From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Dec 2010 20:44:26 +0100
Subject: [Buildroot] Steps to add a new board
In-Reply-To: <AB12B32E73474741A2C5361C433A44DE01E38E6B@rte-ben-exch.RTE.ADWIN.RENESAS.COM>
References: <AB12B32E73474741A2C5361C433A44DE01E38E6B@rte-ben-exch.RTE.ADWIN.RENESAS.COM>
Message-ID: <20101207204426.08a6be76@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Phil,

Now that I have finally submitted my board-cleanup work, I can answer
your questions on how things should work starting from Buildroot
2011.02, or at least what I'm currently pushing.

On Mon, 28 Jun 2010 14:09:05 +0100
"Phil Edworthy" <Phil.Edworthy@renesas.com> wrote:

> I've been using Buildroot for a Renesas SH4 device (SH7724) on a
> MS7724 development board, so first of all many thanks for all your
> work!
> 
> In order to get the board going, I've had to make a number of changes
> and want to feed these back... However, there are a few things I'd
> like to iron out.

Good idea, sorry for the huge delay for the answer :)

> Right now I'm using an external toolchain (CodeSourcery) as I had some
> problems building the kernel using the BR generated toolchain. Would
> you accept patches based on using an external toolchain? I guess this
> causes problems for the board's defconfig.

For me, it's just fine. I'm also pushing changes to make Buildroot
capable of downloading external toolchains (including the CodeSourcery
SuperH one), so if an external toolchain is your choice to support a
particular board, then I don't see why we wouldn't accept the board's
defconfig.

> Regarding the directory structure, I assume that I should populate
> target/device/Renesas/MS7724 with the kernel & busybox configs and
> device_table.txt. For the kernel, I'm using 2.6.33 with a few
> patches, so under this dir I should have a kernel-patches dir for
> patches required and these patches should start with linux-2.6.33-
> is this correct?

Not anymore. You should create a board/renesas/ms7724 directory, and
populate it with the kernel configuration. We generally prefer not to
add more Busybox configuration files, unless there is a real,
board/hardware-related reason to do so.

> I also use a post build script to fix securetty (the device needs
> ttySC0)

Maybe this could be added in a generic way, i.e in the main securetty
file.

> and also add an mdev script to /etc/init.d along with mdef.conf.

The boards-cleanup branch I'm pushing also carries some work from Yegor
that better integrates mdev (there's just a Buildroot option to
enable). However, it does not come with a mdev configuration file.

> Atmel provides its own target skeleton, but I only need to fix
> securetty. Is there a better way to do this? Since the need for
> ttySC0 means target/generic/Config.in has to be fixed, surely it
> makes sense to fix the generic securetty?

Yes, it does.

> I notice that other boards only setup mdev via a replacement target
> skeleton. Should I be doing this instead of a post build script? Is
> there a way to apply a patch to the generic skeleton?

I said above, there is now an option to select between static /dev,
dynamic /dev with devtmpfs, dynamic /dev with mdev or dynamic /dev with
udev.

All of those changes are still pending review and inclusion, though.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
