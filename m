From: Willy Lambert <lambert.willy@gmail.com>
Date: Wed, 16 Jan 2013 15:13:20 +0100
Subject: [Buildroot] Creating/installing images
In-Reply-To: <CAKvQZ_3t5oFBZzbK4oX1fNw3gQ7GOfW1aPbyhbvxqq93JnAMCA@mail.gmail.com>
References: <CAKvQZ_37DWZxZZi5yUS3im0cdHCsDfAXKg=GChc-V8NHj6mCJQ@mail.gmail.com>
 <20121212233318.33c7ba9d@skate>
 <CAKvQZ_3t5oFBZzbK4oX1fNw3gQ7GOfW1aPbyhbvxqq93JnAMCA@mail.gmail.com>
Message-ID: <CAKvQZ_2ow1PE-aTwgDSz9O2zhTcnMTUiN72773iVztVqCTOz3w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/12/13 Willy Lambert <lambert.willy@gmail.com>:
> 2012/12/12 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
>> Dear Willy Lambert,
>>
>> On Wed, 12 Dec 2012 22:28:10 +0100, Willy Lambert wrote:
>>
>>> I was using for my embedded system a standard debian + a set of
>>> apt-get to get a customized OS on a 2GB on board persistent memory (so
>>> I have a working system, as kernel config for instance). But now I
>>> decided to dive into the wonderfull world of "linux from scratch" with
>>> the great help of busybox in order to :
>>> _ know exactly what's on my board
>>> _ reduce persistent size
>>> _ stop doing overkill with a 2GB system that can fit in 32Mb
>>>
>>> So I have setup busybox and spent some days into documentation and
>>> sandbox, but I'm stuck with the target image installation. The
>>> documentation stops at this point and I'm alone in the dark. I spent 2
>>> days in searching docs on the internet without great success.
>>>
>>> I have a successful qemu working to test the buildroot output, cause I
>>> don't need bootloader or proper image, just giving bzImage and
>>> rootfs.ext2 is enougth.
>>>
>>> But as to create something that my embedded system can boot on .... I
>>> really don't know what and how to do. So I would be glad if anyone
>>> could help me, at least in giving links or keyword for documentation.
>>>
>>> My target has an onboard flash memory. World would have been simplier
>>> if I could have a removable "root" memory but it's not the case. So If
>>> I'm correct I need to boot my target (either with an external boot
>>> device like usb key, or with the existing linux installed on it) and
>>> then replace the rootfs. What would you do in this case (knowing that
>>> it will happen often in the dev cycle) ?
>>> _ use a ram pivot_root from the current linux?
>>> _ use a dd from an external usb key boot ?
>>> _ re-partition all this to have a little 10Mb part for a "Tool OS"
>>> that can be used for rootfs installation ?
>>> _ do somethig else ?
>>> _ take a beer and think more ?
>>
>> I would use the capacity of your board to boot over the network. Since
>> it is a x86 platform with a BIOS, I guess it is capable of doing PXE.
>> So during development, I would load the kernel using PXE, and then
>> mount the root filesystem over NFS.
>>
>> Then, to flash the devices before they go in production in the field, I
>> would create a minimal Linux system,
>
> Do you mean that I have the honor to use buildroot twice for one
> device ?! :D once for the little network boot, and one operationnal.
>
>> that you boot over the network
>> using PXE, and this Linux system downloads and flash the real Linux
>> system in the internal Flash of your system (which apparently is
>> accessed as a normal ATA hard drive). You make sure this minimal Linux
>> system makes all this process automatically when it is booted, so
>> whenever you boot one of your system on a network that has your
>> PXE/TFTP server on it, it will be erased and reflashed (of course, be
>> careful not to boot a real laptop or desktop system in the same network
>> segment, or it might boot over the network and get erased).
>>
>> Does this helps?
>
> Yes ! It's a nice solution that I wouldn't have found alone. It'll
> take me some time to manage all concepts behind this (I mean general
> network boot). I really like the idea of auto reflash when the pxe
> server is started.
>
> I just have one robot, and he will be the only one to boot on PXE, so
> it should be ok.
>

I managed to create my PXE/NFSRoot setup. Thanks for having pointing
this. This is enougth to develop, but is not enouth to flash a system
on my embedded device, but it'll come later.

I'm willing to write a "what to do next with  output/images/*"
section, this will be a part of it (the aim is not to explain how, but
to tell what you can do).

For others that could be in the same case here is some entries (and to
be corrected if I'm wrong in comprehension) :

_ there is 2 parts in PXE/NFSRootfs setup :  1/ the network
bootloading and 2/ the access to a shared rootfs over NFS
_ 1/ the PXE boot operates in 2 stages : A/ you have to get a default
rom  that is called in general pxelinux.0 (and setup your bios to
activate LAN boot...) B/ the pxelinux.0 rom read its boot menu (as any
classic boot menu grub.cfg, syslinux/default,lilo.conf,...) and
execute operations

_ A/ as you are early in the boot process, you can see this as an
entry step, all your network booting device will come here as "the
same person". You have to setup a DHCP server (I used udhcp which is
simple) with an entry to enable to give an ip adress to your device
and relay it to a TFTP server (wich is a simple FTP server). So you
can't use your internet box as a dhcp any more ... you need to put
your pxelinux.0 (that you can get from syslinux which contains
pxelinux) in your tftp root directory (eg /srv/tftp)
_B/ now the pxelinux.0 is executing and will get more specific
required stuff (like boot menu, kernels,...) depending on "who" is
your network booting device. The different menu has to be in
/srv/tftp/pxelinux.cfg, and you have to put at least a menu called
"default". From here you are doing the same thing that you could from
a classic bootloader (as getting kerel, setting kernel options,...)
exept that stuff is downloaded from the tftp server instead of the
hard drive. You now have to mount the root dir "/" from something.
Here is when step 2 comes

2/ On the server you need to setup an NFS server which is used to
export a complete rootfs as a network shared folder. In case of
buildroot, it's a folder in which you have extracted
output/images/roofts.tar. IMPORTANT : you have to disable the network
initialisation as it has already been done during bootloading (so mv
etc/init.d/S40network etc/init.d/no.S40network) . I highly suggest
that you test from another working device that your NFS root is
proprely exported. Then you have to setup some kernel parameters and
you are ready :D

Here is a starting pointer with the whole process :
http://www.digitalpeer.com/id/linuxnfs (replace step 4 with your
generated stuff from buildroot)


PXE (step 1/A/) :
http://pxe.dev.aboveaverageurl.com/index.php/PXE_Booting
http://en.wikipedia.org/wiki/Preboot_Execution_Environment

PXELINUX ( step 1/B/ )
http://www.syslinux.org/wiki/index.php/PXELINUX
http://www.syslinux.org/wiki/index.php/SYSLINUX

NFS (step 2/) :
there are many docs on internet about network setting, just browse
https://www.kernel.org/doc/Documentation/filesystems/nfs/nfsroot.txt


>>
>> For a simple PXE/TFTP server solution, I would strongly suggest using
>> ptftpd/pxed: <https://ssl.bulix.org/svn/ptftpd/trunk/>. It is very
>> simple to setup (just *one* command to have a complete PXE solution
>> running).
>>
>>> For completness here is my board datasheet, but I don't expect anyone
>>> to read :-). It's an Advantech PCM-3362
>>> http://support.elmark.com.pl/advantech/pdf/pcm-3362man.pdf
>>
>> I actually read it, and verified that your board is capable of booting
>> over the network, and it apparently is.
>
> Yes. I have to check that my CAN stack doesn't conflict with memory/irq/...
>
>>
>>> Is it possible to use other filesystems, like ext3 or 4 ?
>>
>> Yes, you just need to do some tuning of your ext2 image using tune2fs.
>> I really should submit a patch to add support for ext3 and ext4 image
>> generation in Buildroot.
>>
>
> Yes please ! Among others, I would really love that.
>
>> Best regards,
>>
>> Thomas
>> --
>> Thomas Petazzoni, Free Electrons
>> Kernel, drivers, real-time and embedded Linux
>> development, consulting, training and support.
>> http://free-electrons.com
