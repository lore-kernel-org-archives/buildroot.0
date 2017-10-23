From: Seamus Connor <sconnor@lynx.com>
Date: Mon, 23 Oct 2017 13:27:31 -0700
Subject: [Buildroot] Multiple root filesystems for single
	kernel/toolchain
In-Reply-To: <43ed600f-f03b-da68-4f2d-8931b40bbe41@mind.be>
References: <f5e13782-3ec4-1b63-ef4f-df269bfe8e9f@lynx.com>
 <43ed600f-f03b-da68-4f2d-8931b40bbe41@mind.be>
Message-ID: <80be431a-061f-f64c-ae8b-6fb1ca566430@lynx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I really like the gist of your second idea, I will give that a go. I 
will create a script that filters the rootfs down to what I need, and 
then creates a cpio. I can then hook this up to buildroot using the 
custom script hook.

Thanks for getting back to me so quickly!


On 10/23/2017 01:23 PM, Arnout Vandecappelle wrote:
>
> On 23-10-17 21:59, Seamus Connor wrote:
>> I have a system with a few unique restrictions.? It has low memory, and its bulk
>> storage device is not available until some bits have been flipped in the
>> hardware.? What I would like to do is:
>>
>> 1) Create a bzImage with a baked in minimal initramfs.
>>
>> 2) Create a larger squashfs that is stored in MMC.
>>
>> What is the best procedure to create multiple file systems w/ buildroot?? Would
>> I just have two separate configs that specify different packages?
>   Indeed, that's the way to go. This also allows you to specify completely
> different build options. For example, you might want to go for a uClibc
> statically linked toolchain in the initramfs and a glibc- or musl-based
> toolchain in the full rootfs.
>
>   However, if all you need is a to toggle a few bits and to wait until the device
> is available, you might even get away with a simple C program that does that,
> mounts the rootfs, does a pivot_root(), and exec()s /sbin/init. Then you make a
> cpio archive with just that executable. Perhaps more work but you're very sure
> that it's small :-)
>
>
>   Regards,
>   Arnout
>
