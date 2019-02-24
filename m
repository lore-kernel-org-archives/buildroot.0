From: Simon van der Veldt <simon.vanderveldt@gmail.com>
Date: Sun, 24 Feb 2019 11:22:17 +0100
Subject: [Buildroot] Handling of rpi-firmware blobs broken for certain
 cases
In-Reply-To: <20190223225309.7560e64f@gmx.net>
References: <CAKDzfnqJfpgU3S1ZVSBcZFG87vZk=+EBykqUJUG4LMajCNSmoQ@mail.gmail.com>
 <20190223225309.7560e64f@gmx.net>
Message-ID: <CAKDzfnqYse7ier5jnL-4rSrPYJ2rv+-6WYf18X0v5=ONKE4VcQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Thanks for your thoughts and research!

On Sat, Feb 23, 2019 at 10:53 PM Peter Seiderer <ps.report@gmx.net> wrote:
>
> Hello Simon,
>
> On Sat, 23 Feb 2019 19:59:41 +0100, Simon van der Veldt <simon.vanderveldt@gmail.com> wrote:
>
> > Good evening everyone,
> >
> > I just ran into an issue where the .elf and .dat files copied into
> > /boot by buildroot when building for a Raspberry Pi are incorrect.
> >
> > Overview of the problem using current master (or 2018.11.2 which is
> > the same apart from the version):
> > - Put gpu_mem=16 in config.txt (the config file for the videocore of a
> > raspberry)
> > - When using <32M GPU memory the videocore needs the so called cut
> > down versions ("start_cd.elf" and "fixup_cd.dat") of the binary blobs
> > to boot. By emperical testing it seems at least "start_cd.elf" needs
> > to be present under that exact name to be able to boot the rpi
>
> From the documentation [1] I would read that you can select between multiple
> start/fixup files using the start_file/fixup_file option (or via the shortcut
> start_x/start_debug option) OR alternatively copy the selected files to the
> default names start.elf/fixup.elf?
>
> The description of the gpu_mem option (see [2]) does not mention a dependent
> selection of special start/fixup files (only something about 'to low values
> may automatically disable certain firmware features')...
>
> Your theory is that gpu_mem values smaller than 64M (the default) automatically
> select start_cd.elf/fixup_cd.elf?
>
> Seems [3], [4] support your statement...

Tbh whilst the docs are a lot better then they were in the past it's
still a bit unstructured.
There is mention in the official docs that gpu_mem=16 requires
start_cd.elf and fixup.dat here
https://www.raspberrypi.org/documentation/configuration/boot_folder.md

Can't link to a specific section but under the "start.elf,
start_x.elf, start_db.elf, start_cd.elf" section it says:
> and start_cd.elf is a cut-down version with no support hardware blocks like codecs and 3D, and for use when gpu_mem=16 is specified in config.txt

I don't think the fact that this requirement is actually < 32MB
instead of just 16MB is documented anywhere but it's been mentioned on
some issues and the forum by raspbian kernel devs (as you've found).

> > - Buildroot has some custom handling for these files
> > (https://github.com/buildroot/buildroot/blob/master/package/rpi-firmware/rpi-firmware.mk#L40)
> > and copies the correctly named "source" files from the rpi-firmware
> > package to the incorrect "start.elf" and "fixup.dat" names
> > - When trying to boot the RPi won't book (note I've only tested this
> > with a CM3, not sure if behavior is different for other RPis)
> >
> > Whilst I'm sure this is solvable I'm wondering why this level of
> > micro-management of these blobs is necessary? The .elf files are
> > 12.2MB and the .dat files are 28.6KB for all of them.
> > These files only get copied into the image directory from where one
> > can then choose which files to include in the actual image using the
> > genimage config. I don't think copying +-12MB should be a problem.
> >
> > Also users have the possibility of changing the config.txt file
> > (assume a writeable boot filesystem of course) which means they might
> > need different versions of these start and fixup files and by
> > extension multiple/all different versions of these blobs need to be
> > present.
>
> Mhhh, the buildroot defconfigs files are about a 'minimal' starting
> example and not about a fully configurable all-in-one solution, see
> e.g. [5], [6].

I'm glad to see this, I agree 100% with the points made by Arnout in [6].
Pretty much always you'll already have/need a custom config.txt and
genimage config so I don't feel it's a good move to add complexity to
try to automatically fix them up.

I especially like the suggestion to add wildcard/blob support to
genimage, I was really surprised it didn't support it.

To me the way it currently works goes more into the "fully
configurable all-in-one solution" direction with mimicking/duplicating
knowledge about how the RPi internally works (config options in
buildroot for different binary blobs supported by the RPi) into
buildroot. I'd be very wary of having code this specific, in general
I'd suggest to stay away from these implementation details for obvious
reasons. A nice example being the list is already incomplete (with
"start_db" missing).
And as mentioned with the way it currently works it's not possible to
switch to using different start and fixup files at runtime, meaning
for example a regular user of the built image can't use the camera
because it's impossible to switch to "start_x.elf/fixup_x.dat".

> There are some good arguments to add all start/fixup files (and/or keep
> the original names), but on the other side not all raspberry files
> install the dtb overlay files (only the defconfigs where some overlay
> is needed)....

IMHO the overlay files have the same issues as the dtbs, they are too
micro-managed from within buildroot.
The simple case where one is building for a regular Raspberry Pi is
only sometimes covered by buildroot. For some boards all overlays from
rpi-firmware are copied to /boot and for others they aren't. So for
some board the users of the built image can use any hat they want and
for others they can't.

When someone is building for a Compute Module they will probably have
custom dts files in the kernel sources that need to be compiled.
I'm currently working on such a board and I experience it as being too
micro-managed where information on which dts/dtbs files I need is
duplicated in the kernel and buildroot config.
I wanted to compile all of them from our kernel sources and of course
include all of them in the image but then I'd have to list all of them
in the buildroot config (and I'm not even sure how to handle the
overlays in our kernel sources this way).
So I'm currently also using a small patch (which I know won't be
acceptable to be upstreamed in it's current form) that just uses the
kernel's "make dtbs" and "make dtbs_install" targets. It can be found
here in case you're interested
https://github.com/simonvanderveldt/buildroot/commit/891d1a14e48930565e2294e82d07d80142fc529b

Kind regards,
Simon

> Regards,
> Peter
>
> >
> > With all of this said my suggestion would be to simplify how this is
> > handled in buildroot by just copying all *.elf and *.dat files in the
> > boot directory of rpi-firmware to the image directory.
> > Then the person building the image can choose which of these (specific
> > ones or all of them) to include using the genimage config.
> >
> > An example/suggestion for a fix can be found here
> > https://github.com/simonvanderveldt/buildroot/commit/16880713c2c03ad50e8cfe7bf05331718d52742e
> > I've tested this and it works like a charm :)
> >
> > Kind regards,
> > Simon
>
> [1] https://www.raspberrypi.org/documentation/configuration/config-txt/boot.md
> [2] https://www.raspberrypi.org/documentation/configuration/config-txt/memory.md
> [3] https://ultibo.org/forum/viewtopic.php?t=205
> [4] https://github.com/raspberrypi/linux/issues/503#issuecomment-37134612
> [5] http://lists.busybox.net/pipermail/buildroot/2019-January/241809.html
> [6] http://lists.busybox.net/pipermail/buildroot/2019-February/242704.html
>
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
