From: Gergely Imreh <imrehg@gmail.com>
Date: Mon, 21 Sep 2015 23:13:29 +0800
Subject: [Buildroot] [PATCH v4 1/2] board: add support for Intel Galileo
 Gen 2
In-Reply-To: <20150921164554.0e4f348f@free-electrons.com>
References: <1441914721.20486.6.camel@intel.com>
 <CAJ3iQcoMbnFxPE+DAV=2PF7xCmQdqz8YGKTkZT5BeFNasbsmyw@mail.gmail.com>
 <20150921164554.0e4f348f@free-electrons.com>
Message-ID: <CAJ3iQcrKO2-yifLBWBq0qQHN9DpbWx0sK7CHGiRB=Kk77qtDzA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21 September 2015 at 22:45, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Gergely Imreh,
>
> On Mon, 21 Sep 2015 22:31:39 +0800, Gergely Imreh wrote:
>
>> I was trying this patch series out, but running into some issues.
>>
>> The major one is that if I create the "sdcard.img" using the
>> defconfig, write it onto a card, and try to boot from it, I get this
>> kernel panic as the result:
>>
>> [    3.470356] mmc0: new high speed SDHC card at address 0007
>> [    3.477010] VFS: Cannot open root device "mmcblk0p2" or
>> unknown-block(0,0): error -6
>> [    3.484871] Please append a correct "root=" boot option; here are
>> the available partitions:
>> [    3.493332] Kernel panic - not syncing: VFS: Unable to mount root
>> fs on unknown-block(0,0)
>> [    3.501649] Pid: 1, comm: swapper Not tainted 3.8.7 #1
>> [    3.503281] Call Trace:
>> [    3.503281]  [<c12e5571>] panic+0x64/0x144
>> [    3.503281]  [<c1458cc7>] mount_block_root+0x191/0x1ef
>> [    3.503281]  [<c10b9468>] ? sys_mknod+0x28/0x30
>> [    3.503281]  [<c1458e2c>] mount_root+0x4f/0x57
>> [    3.503281]  [<c1458f74>] prepare_namespace+0x140/0x171
>> [    3.503281]  [<c1458a71>] kernel_init_freeable+0x15e/0x166
>> [    3.503281]  [<c12e2d7b>] kernel_init+0xb/0x140
>> [    3.503281]  [<c12e87fb>] ret_from_kernel_thread+0x1b/0x30
>> [    3.503281]  [<c12e2d70>] ? rest_init+0x60/0x60
>>
>> Is there anything I might be missing?
>> (Using a Gen2 board)
>
> Can you add "rootwait" to your kernel command line?
>

That seems to be it. Modifying the board/intel/galileo/grub.cfg to
have the following line with the added "rootwait" seems to do the
trick!

linux /boot/bzImage root=/dev/mmcblk0p2 rootwait
console=ttyS1,115200n8 reboot=efi,warm apic=debug rw

> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
