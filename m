From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Sep 2019 12:24:20 +0200
Subject: [Buildroot] How to reduce the size of the rootfs with buildroot
In-Reply-To: <CAN6m0Dxz-KsTSR0063KmztKvx5uGfva-6vixpsjURs4sBtkxZQ@mail.gmail.com>
References: <CAN6m0Dxz-KsTSR0063KmztKvx5uGfva-6vixpsjURs4sBtkxZQ@mail.gmail.com>
Message-ID: <20190927122420.1a6ff236@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 25 Sep 2019 23:51:32 -0700
Song Xiaojia <xiaojia.song12@gmail.com> wrote:

>  I want to merge the linux image+file system+bootloader to one file, but my
> current filesystem is too large (189MB).
> I want to create a very small-size rootfs (<10MB) for my linux system on
> riscv soc.
> I wonder how to leverage the buildroot to achieve that?

Do a full clean build (make clean all), and then run:

	make graph-size

Following this, in output/graphs/, you have a nice graph showing the
contribution of each package to the overall filesystem size.

I assume that if your filesystem size is 198 MB, it's because you have
lots of packages enabled. If you want to reduce the filesystem size,
the easiest solution is "simply" to enable less packages.

> I also feel a little confused about the initramfs and rootfs, though I did
> some search. Some of the linux system booting just need initramfs, while
> others need both (initramfs+rootfs).
> For my case do I need both or just....

It depends of your use case. If you have nothing special to do in
user-space before mounting the real root filesystem, then you should
either use an initramfs *OR* a real rootfs, but not both.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
