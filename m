From: John Voltz <john.voltz@gmail.com>
Date: Wed, 4 Feb 2009 07:33:18 -0500
Subject: [Buildroot] buildroot Digest, Vol 32, Issue 12
In-Reply-To: <mailman.6052.1233715800.5049.buildroot@busybox.net>
References: <mailman.6052.1233715800.5049.buildroot@busybox.net>
Message-ID: <46a136670902040433h6bb7e883mc295b6a3fce75fb9@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Steve,

I'm the one who wrote that build-ext3-img script, so I'll try to
explain it for you. It does what you are looking for. You are right,
it needs to be run with sudo.

1. Path to the image, this is where in the filesystem you want the
script to put the finished ext3 image. Try /home/steve/Desktop or some
such.

2. The name to give the image, it defaults to buildroot.img if you do
not supply a name.

3. You need to select "Target filesystem options->tar the root
filesystem" before you build everything (in menuconfig). The script
extracts the tarball into the image file. It will be found in
binaries/your_target/rootfs_arch.tar. This is the tarball it needs.
You also need to make sure that the grub bootloader gets built before
you start too.

It will spit out an ext3 formatted image that you can boot in qemu. If
you want to run it in vmware, you need to convert it into a .vmdk file
like this:

qemu-img convert buildroot.img -O vmdk buildroot.vmdk

Hope this helps,

John


Date: Tue, 3 Feb 2009 11:35:40 -0800 (PST)
From: Steve Calfee <nospamcalfee@yahoo.com>
Subject: Re: [Buildroot] 2009.02-rc3 released
To: buildroot at uclibc.org, Peter Korsgaard <jacmet@uclibc.org>
Message-ID: <388709.89503.qm@web58208.mail.re3.yahoo.com>
Content-Type: text/plain; charset=us-ascii

Hi Peter,

Good job. First time in years I could download a buildroot and get it to build.

So now I thought why not try and see if it runs. I built all the
defaults, so I ended up with a 686 target. Fine, that is what I have
on as my host.

Googling around I found mention of running the image as a vmware
bootable disk. Good I have vmware installed. However now I get stuck.

The scripts directory has a build-ext3-img script with tantalizing
hints it might build what I need. It also appears it needs to be run
as root? Trying sudo in ubuntu did not work. However, the script has
no docs and it is talking in some kind of code :) It talks about the
path to the image - what is that the output file path? Then the name
of the image again - the output of the script? And then an enigmatic
message "echo "Enter the path and filename for the root filesystem"
echo "tarball that you want to install into the image"" I don't see
any applicable .tar type file.


First somewhere in the docs there should be a description of the disk
layout for buildroot. From my buildroot dir:

binaries - a couple directories in there is an intriguingly named file
"rootfs.i686.ext2" Would that be echo "Enter the path and filename for
the root filesystem"
echo "tarball that you want to install into the image"
from the build-ext3-img script?


dl - documented

package - looks like every known package that can be configured and built?

scripts - ok dir name is clear, script usage is not

toolchain - not clear but probably build tool sources?

build_i686 - Not clear what it holds?

docs - Nice html docs

project - my project make/config stuff?

target - unclear, more my project specific build stuff?

toolchain_build_i686 - looks like where the toolchain got built too.
Where do the binaries go? /bin only has sed?

project_build_i686 - appears to be where my project is built, but
under uclibc there are 3 mysterious directories autotools-stamps
buildroot-config  busybox-1.13.2. But then there is an intriguing
directory called root. Is this an NFS mountable point for my target?

Anyway, my confusion getting started cannot be totally unique. I
appreciate any help I can get.

Steve
