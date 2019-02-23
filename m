From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 23 Feb 2019 22:53:09 +0100
Subject: [Buildroot] Handling of rpi-firmware blobs broken for certain
 cases
In-Reply-To: <CAKDzfnqJfpgU3S1ZVSBcZFG87vZk=+EBykqUJUG4LMajCNSmoQ@mail.gmail.com>
References: <CAKDzfnqJfpgU3S1ZVSBcZFG87vZk=+EBykqUJUG4LMajCNSmoQ@mail.gmail.com>
Message-ID: <20190223225309.7560e64f@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Simon,

On Sat, 23 Feb 2019 19:59:41 +0100, Simon van der Veldt <simon.vanderveldt@gmail.com> wrote:

> Good evening everyone,
> 
> I just ran into an issue where the .elf and .dat files copied into
> /boot by buildroot when building for a Raspberry Pi are incorrect.
> 
> Overview of the problem using current master (or 2018.11.2 which is
> the same apart from the version):
> - Put gpu_mem=16 in config.txt (the config file for the videocore of a
> raspberry)
> - When using <32M GPU memory the videocore needs the so called cut
> down versions ("start_cd.elf" and "fixup_cd.dat") of the binary blobs
> to boot. By emperical testing it seems at least "start_cd.elf" needs
> to be present under that exact name to be able to boot the rpi

From the documentation [1] I would read that you can select between multiple
start/fixup files using the start_file/fixup_file option (or via the shortcut
start_x/start_debug option) OR alternatively copy the selected files to the
default names start.elf/fixup.elf?

The description of the gpu_mem option (see [2]) does not mention a dependent
selection of special start/fixup files (only something about 'to low values
may automatically disable certain firmware features')...

Your theory is that gpu_mem values smaller than 64M (the default) automatically
select start_cd.elf/fixup_cd.elf?

Seems [3], [4] support your statement...

> - Buildroot has some custom handling for these files
> (https://github.com/buildroot/buildroot/blob/master/package/rpi-firmware/rpi-firmware.mk#L40)
> and copies the correctly named "source" files from the rpi-firmware
> package to the incorrect "start.elf" and "fixup.dat" names
> - When trying to boot the RPi won't book (note I've only tested this
> with a CM3, not sure if behavior is different for other RPis)
> 
> Whilst I'm sure this is solvable I'm wondering why this level of
> micro-management of these blobs is necessary? The .elf files are
> 12.2MB and the .dat files are 28.6KB for all of them.
> These files only get copied into the image directory from where one
> can then choose which files to include in the actual image using the
> genimage config. I don't think copying +-12MB should be a problem.
> 
> Also users have the possibility of changing the config.txt file
> (assume a writeable boot filesystem of course) which means they might
> need different versions of these start and fixup files and by
> extension multiple/all different versions of these blobs need to be
> present.

Mhhh, the buildroot defconfigs files are about a 'minimal' starting
example and not about a fully configurable all-in-one solution, see
e.g. [5], [6].

There are some good arguments to add all start/fixup files (and/or keep
the original names), but on the other side not all raspberry files
install the dtb overlay files (only the defconfigs where some overlay
is needed).... 

Regards,
Peter

> 
> With all of this said my suggestion would be to simplify how this is
> handled in buildroot by just copying all *.elf and *.dat files in the
> boot directory of rpi-firmware to the image directory.
> Then the person building the image can choose which of these (specific
> ones or all of them) to include using the genimage config.
> 
> An example/suggestion for a fix can be found here
> https://github.com/simonvanderveldt/buildroot/commit/16880713c2c03ad50e8cfe7bf05331718d52742e
> I've tested this and it works like a charm :)
> 
> Kind regards,
> Simon

[1] https://www.raspberrypi.org/documentation/configuration/config-txt/boot.md
[2] https://www.raspberrypi.org/documentation/configuration/config-txt/memory.md
[3] https://ultibo.org/forum/viewtopic.php?t=205
[4] https://github.com/raspberrypi/linux/issues/503#issuecomment-37134612
[5] http://lists.busybox.net/pipermail/buildroot/2019-January/241809.html
[6] http://lists.busybox.net/pipermail/buildroot/2019-February/242704.html

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
