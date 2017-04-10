From: Christian Stewart <christian@paral.in>
Date: Mon, 10 Apr 2017 18:17:49 -0400
Subject: [Buildroot] Building multi-part rootfs images
In-Reply-To: <e31fa965-9f62-8dac-d7ae-e30eed26bc1a@mind.be>
References: <CA+h8R2ofinZ+3yGzNOCtfM5KDSrxeizyEVAKTYv2v24DbEPzkw@mail.gmail.com>
 <c764d6cf-eaf1-154f-2ece-cd9bdff881fd@mind.be>
 <CA+h8R2q56gk6z_9phg_qyRccvGccQrCrF0-Sem-4+5SLqBj6dg@mail.gmail.com>
 <e31fa965-9f62-8dac-d7ae-e30eed26bc1a@mind.be>
Message-ID: <CA+h8R2pOVRkRnqmqqURCRvEi+2LQTgxoVzkRxCOuU8TarjTvqQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Mon, Apr 10, 2017 at 6:09 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>  Loop mount indeed means -o loop, but that's used to mount a normal file where a
> block device is expected. What you want is to mount a different partition (or
> UBI volume, or NFS export) on /lib/modules. At least, that's what I think you mean.

No, I mean mounting a file from the boot partition - that way, we have
three files that define the system: the kernel image, the initrootfs
image, and the "extras" image in one partition. I do this because then
OTAing the system is just replacing those files, and theoretically
later on logic could be added to fall-back on older versions of the
files if there are issues with an upgrade.

That might have a significant performance impact on the "extras" IO
speed, probably, since you're reading through two layers - the loop,
and the fs volume. Since I only plan to store read-only code and not
r/w data files in that image, the performance decrease should be
pretty negligible.

>  systemd already has that for anything specified in /etc/fstab. It's not
> blocking, though.

Cool, I'll use that at first. The primary motivation behind making it
a boot step is that I can then make the systemd kernel-modules-load
step depend on the "extras" being loaded in before running, although
this is probably already the case with /etc/fstab. Furthermore, the
more complex fallback mechanism could be implemented there as well.

Best,
Christian
