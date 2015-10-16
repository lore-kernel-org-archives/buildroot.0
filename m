From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 16 Oct 2015 11:55:03 +0200
Subject: [Buildroot] Kernel panic while trying to boot
 qemu_x86_64_defconfig on notebook with dual boot.
In-Reply-To: <CAAmaEROCOJc_LYXDoFtBJwidH-h531ogKDY0EQJeKKnX6752Hw@mail.gmail.com>
References: <CAAmaERMLtspQ2X-rSM_jaFGyqp_Gw1z6zOiPv=S9pZML=YjH-A@mail.gmail.com>
 <562093C7.9000501@mind.be>
 <CAAmaEROCOJc_LYXDoFtBJwidH-h531ogKDY0EQJeKKnX6752Hw@mail.gmail.com>
Message-ID: <5620C977.8030101@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Alexandre,

 [Please don't top-post, but reply in-line with the quoted text as is done
below. Also remove redundant pieces of quoted text.]

On 16-10-15 11:33, Alexandre Oliveira wrote:
> I realy Thank you Arnout for the asnwer.
> 
> There are still some questions to fully understand.
> 
> What I am trying to do now is do not use QEMU anymore.
> I dont want to simulate a full computer. I want to boot the buildroot linux
> after I reboot my notebook.

 Ah, OK, that really wasn't clear.

[snip]
> After reboot, I could start the kernel in /boot/bzImage inside /dev/sda7 partition.
> However, kernel panics with:
> 
> ===========================
> VFS: Cannot open root device "sda7" or unknown-block(0,0)
> Please append a correct "root=" boot option; here are the available partitions:
> Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,0)
>  error -6
> ===========================

 Normally, the kernel should also dump a list of block devices that it found. If
it doesn't, then probably the drivers for your disk are not built into the
kernel. In "big" distroes like Debian/Ubuntu, there is an initramfs which
contains all possible drivers are modules and the correct one is loaded at boot
time. The qemu defconfig in Buildroot is really minimal, it only contains a PIIX
driver.

 To find the correct driver(s), do 'lsmod' in your ubuntu system. You'll get a
long list of modules currently loaded, and you have to look for the ones that
are related to the disk. Most likely, it's CONFIG_SATA_AHCI (module ahci) that
you need. You'll probably also need CONFIG_MSDOS_PARTITION.

 To enable these, run 'make linux-menuconfig', type / to search for the options
you need, enable them (with y, not with m), and rebuild.

 Regards,
 Arnout


[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
