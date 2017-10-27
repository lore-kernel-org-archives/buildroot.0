From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 27 Oct 2017 09:30:33 +0200
Subject: [Buildroot] Multiple root filesystems for single
	kernel/toolchain
In-Reply-To: <d00f1836-8acf-b6ac-3d65-3836b963edb2@lynx.com>
References: <f5e13782-3ec4-1b63-ef4f-df269bfe8e9f@lynx.com>
 <43ed600f-f03b-da68-4f2d-8931b40bbe41@mind.be>
 <87po9a2ovu.fsf@dell.be.48ers.dk>
 <d00f1836-8acf-b6ac-3d65-3836b963edb2@lynx.com>
Message-ID: <f20b63cc-2140-5c5b-0eb6-d7524b6f9ac4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 [FYI on this list we don't top-post, answer in-line like I do now.]

On 26-10-17 18:32, Seamus Connor wrote:
> Unfortunately the bootloader is not an option for my system.? The bootloader we
> must use is targeted at a specific market segment, and the vendor only gave me
> two things: a binary, and an NDA.
> 
> Here is where I am ending up. I have created a script that builds a secondary
> rootfs.cpio that includes a statically compiled busybox and an init script.? I
> am currently working to integrate this new rootfs into the buildroot build
> system so that it will automatically build it into the kernel in the same way
> that the current mechanism works (linux-rebuild-with-initramfs).

 If you build your rootfs.cpio externally (i.e. if it doesn't depend on the rest
of the Buildroot build), then you don't need the linux-rebuild-with-initramfs
hack. Instead you can just configure your linux .config to point to that
archive. Note that you can still make it generic if you use a BR2_EXTERNAL by
using $(BR2_EXTERNAL_FOO_PATH)/path/to/rootfs.cpio. BR2_EXTERNAL_FOO_PATH is
exported so it is also available in the linux.config.

 If you're using the Buildroot-built busybox, that of course will not be possible.


> Again, thanks to everyone on the list who took the time to look at my question.?
> If what I end up building doesn't turn out to be a complete hack, I will send
> another message.? Maybe there would be interest in having the ability to create
> a "filtered" rootfs.cpio in usptream buildroot?

 We think that there are too many different use cases. If we do offer something,
it risks being either very complicated, or so specialised that it won't be
useable in practice. But you can try of course :-)

 Regards,
 Arnout

> 
> 
> On 10/26/2017 03:18 AM, Peter Korsgaard wrote:
>>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
>> Hi,
>>
>> ? >? However, if all you need is a to toggle a few bits and to wait until the
>> device
>> ? > is available, you might even get away with a simple C program that does that,
>> ? > mounts the rootfs, does a pivot_root(), and exec()s /sbin/init. Then you
>> make a
>> ? > cpio archive with just that executable. Perhaps more work but you're very
>> sure
>> ? > that it's small :-)
>>
>> Or alternatively do it in the boot loader if it is so simple.
>>
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
