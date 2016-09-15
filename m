From: Erico Nunes <nunes.erico@gmail.com>
Date: Thu, 15 Sep 2016 23:48:40 +0200
Subject: [Buildroot] [PATCH 0/5] grub2: add support for arm and aarch64
In-Reply-To: <c3f16bfb-5e1f-6135-11d1-e5cf7e226b52@mind.be>
References: <20160913041548.10290-1-nunes.erico@gmail.com>
 <c3f16bfb-5e1f-6135-11d1-e5cf7e226b52@mind.be>
Message-ID: <CAK4VdL128XcR_9S+M2Fy0MhQpWzTXmH2Ug=1b578X2Eohh4cTQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Wed, Sep 14, 2016 at 2:15 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 13-09-16 06:15, Erico Nunes wrote:
>> As a uboot platform, Grub 2 image gets built as a u-boot image (i.e.
>> u-boot mkimage) and is loaded from u-boot through a regular "bootm".
>
>  Perhaps a stupid question, but why would you want to do that? When you have a
> working U-Boot, there is no need to stack Grub 2 on top of it, is there?

sounds like a valid question, as this was also a question in the video
in my third reference in this cover letter.
Depending on the case, if you can spare the bytes and effort to add
Grub 2 in the boot process, that makes it nicer for you to manage
different boot options, such as booting with different kernels or with
different bootargs. For example, at the very least with a common
Buildroot target you could have a menu entry to boot a kernel with
more verbose debug and another one to boot quietly. You don't even
have to choose it interactively in the serial console, with the
grub-reboot application you can tell grub to boot with a different
entry (such as the debug entry) just for the next boot. Of course that
you can do all that with u-boot only and make something similar with
the use of uboot-tools, but in my opinion this is much nicer to manage
with Grub 2 than having to mess with u-boot scripts or u-boot
environment variables for that. And there's the convenient menu too in
the serial, of course.

An additional reason is that the trend for new aarch64 server machines
is to standardize on EFI firmware, so certainly the aarch64-efi grub
platform can be useful for those.
And after we refactor our recipes for that (as in this patch series)
it is low effort to also have arm-uboot and arm-efi. arm-efi may more
convenient for boards that have mainline u-boot support as bootefi
will be there by default, but arm-uboot for now also has the advantage
that it doesn't require u-boot >= 2016.05.

My personal use case is that I'm interested in having other components
such as different kernel builds, and I want to be able to test them on
an aarch64 platform. In particular, I'd prefer to do that without
messing up too much with my working u-boot environment and without
having to stop in the u-boot shell for recovery in case something goes
wrong.

Erico
