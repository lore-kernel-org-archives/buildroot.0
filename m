From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jan 2016 16:33:48 +0100
Subject: [Buildroot] Verifying Checksum ... Bad Data CRC
In-Reply-To: <CAKvcKqe0ikfjVcKcoTASC9LzsEcwfYpFmqMziqF_MjhYWVsipw@mail.gmail.com>
References: <CAKvcKqe0ikfjVcKcoTASC9LzsEcwfYpFmqMziqF_MjhYWVsipw@mail.gmail.com>
Message-ID: <20160127163348.19c41a0c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gabriel,

On Wed, 27 Jan 2016 11:20:10 -0300, Gabriel Andr?s Castillo wrote:
> Hi, when i configure linux kernel, on kernel features -> preemption model,
> i had "No forced preemption" and the boot was working fine. But when i want
> to change the option to "Preemptible Kernel", i want to boot again and i
> get this:
> 
> 
> NAND read: device 0 offset 0x180000, size 0x10000
>  65536 bytes read: OK
> 
> NAND read: device 0 offset 0x200000, size 0x380000
>  3670016 bytes read: OK
> ## Booting kernel from Legacy Image at 22000000 ...
>    Image Name:   Linux-4.1.0-linux4sam_5.0
>    Image Type:   ARM Linux Kernel Image (uncompressed)
>    Data Size:    3730848 Bytes = 3.6 MiB
>    Load Address: 20008000
>    Entry Point:  20008000
>    Verifying Checksum ... Bad Data CRC
> ERROR: can't get kernel image!
> 
> How can i make my kernel preemptible?

This error has nothing to do with the kernel being preemptible or not.
It generally means that you improperly flashed your kernel image, or
are improperly loading it. Maybe you forgot to erase your NAND before
reflashing your kernel? Maybe you didn't reflash the entire kernel
image which is bigger than it used to be?

You're actually not *reading* enough: you're reading 0x380000 bytes
(i.e 3670016 bytes) from your NAND to load the kernel image, but the
mkimage header says the image is 3730848 bytes in size.

Please double check your NAND programming and reading commands, to make
sure that they accommodate the slightly larger kernel.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
