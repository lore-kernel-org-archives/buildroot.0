From: Steve Calfee <nospamcalfee@yahoo.com>
Date: Wed, 4 Feb 2009 15:12:17 -0800 (PST)
Subject: [Buildroot] buildroot Digest, Vol 32, Issue 12
In-Reply-To: <46a136670902040433h6bb7e883mc295b6a3fce75fb9@mail.gmail.com>
Message-ID: <889327.65678.qm@web58205.mail.re3.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--- On Wed, 2/4/09, John Voltz <john.voltz@gmail.com> wrote:

> From: John Voltz <john.voltz@gmail.com>
> Subject: Re: buildroot Digest, Vol 32, Issue 12
> To: buildroot at busybox.net, nospamcalfee at yahoo.com
> Date: Wednesday, February 4, 2009, 4:33 AM
> Hi Steve,
> 
> I'm the one who wrote that build-ext3-img script, so
> I'll try to
> explain it for you. It does what you are looking for. You
> are right,
> it needs to be run with sudo.
> 
> 1. Path to the image, this is where in the filesystem you
> want the
> script to put the finished ext3 image. Try
> /home/steve/Desktop or some
> such.
> 
> 2. The name to give the image, it defaults to buildroot.img
> if you do
> not supply a name.
> 
> 3. You need to select "Target filesystem
> options->tar the root
> filesystem" before you build everything (in
> menuconfig). The script
> extracts the tarball into the image file. It will be found
> in
> binaries/your_target/rootfs_arch.tar. This is the tarball
> it needs.
> You also need to make sure that the grub bootloader gets
> built before
> you start too.
> 
> It will spit out an ext3 formatted image that you can boot
> in qemu. If
> you want to run it in vmware, you need to convert it into a
> .vmdk file
> like this:
> 
> qemu-img convert buildroot.img -O vmdk buildroot.vmdk
> 
> Hope this helps,
> 
> John

Hi John,

Thanks for the info. 

First I discovered a problem while running on Ubuntu Hardy at least. Running this script as "sudo build-ext3-img" and the script fails in mounting the loop3 device etc. If however I "sudo su" so I am root and then "build-ext3-img" it seems to run much farther.

I did hit another snag. At the end of the script is:
# Install GRUB
     /sbin/grub --no-floppy --batch <<EOT 
     device (hd0) ${IMAGE}
     geometry (hd0) ${CYLINDERS} 16 63
     root (hd0,0)
     setup (hd0)
     quit
     EOT

What does this do? what is (hd0)? What is the context I need to run this? It looks like it runs the host's grub? I don't want to install grub in my host's boot directory, but in the new "image" is that what this does?

Thanks, Steve


      
