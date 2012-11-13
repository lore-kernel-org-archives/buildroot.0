From: Joe Lorenz <joe.lorenz@plexxi.com>
Date: Tue, 13 Nov 2012 18:24:24 -0500
Subject: [Buildroot] grub problems since upgrading build host to CentOS
	6.3
In-Reply-To: <50A2BC2B.2000607@mind.be>
References: <50A17C01.1010109@plexxi.com>
	<50A2BC2B.2000607@mind.be>
Message-ID: <CAP6P6SWiYCTzjmSGmGSPqqSfK=uBosDkhbwyOhrVAFECB0QZTQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Nov 13, 2012 at 4:31 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 12/11/12 23:45, Joe Lorenz wrote:
>>
>> We updated our build host to CentOS 6.3 which apparently has a newer host
>> gcc.
>>
>> Our crosstools are set for x86_64 target, and we know about grub not being
>> supported for 64-bit compiler (Bug 5024).
>> This newer gcc and/or binutils might be to blame.
>>
>> The problem shows when we try to install it - we see this:
>>
>> grub> device (hd0) /dev/sdb
>> grub> root (hd0,1)
>> Filesystem type is ext2fs, partition type 0x83
>> grub> setup (hd0)
>> Checking if "/boot/grub/stage1" exists... no
>> Checking if "/grub/stage1" exists... no
>>
>> Error 15: File not found
>> grub>
>>
>> But 'stage1' and all the others are indeed present on the root partition
>> at /boot/grub/.
>
>
>  Let me try to understand what you're doing.
>
> - You have a buildroot config that includes grub.
> - You build on a pre-6.3 machine, boot the resulting image, run grub.
> - grub finds /boot/grub/stage1 on /dev/sdb
>
> - You build on a 6.3 machine, boot the resulting image, run grub.
> - grub doesn't find /boot/grub/stage1 on /dev/sdb
>
>  Is that correct?  Sounds weird...  Can grub find any files on
> (hd0,1)?
>
>
Close. Grub is not finding files in /dev/sda2, when it did just fine
when built on pre-6.3. In another setting we have /dev/sda1 (hd0,0) as
the root partition and it does the same thing.
It is extremely weird. And to top it off, I'd say about once every 30
or so attempts, it *does* find the files and installs OK. I'm not a
grub expert and haven't yet tried to trace or step through to see why
this is happening.

We did have to make a change to the objcopy flags because the objcopy
in the 6.3 binutils was somehow creating HUGE files (several hundred
MB) when objcopy'ing the stage* files and grub binary itself. That
seems resolved (I don't have the link to where we found that
solution), but now we're left with this. I was hoping somebody out
there is using CentOS 6.3 and might have run into this.

>>
>> It's important to us to be able to build grub as needed in case we have to
>> modify any networking hardware support, so
>> falling back to using older binaries is not optimal. We're wondering if
>> anyone else has gotten around this in a CentOS
>> 6.3 build environment.
>
>
>  You could add grub2 to your local buildroot - see
> http://patchwork.ozlabs.org/patch/191813/
>
>  Needs work, of course, but worked for me.  grub2 is much better at cross-
> compiling than grub.
>
Yes, we're considering that as a possibility. Grub fits our needs
though - just wish it would work :-/
Thanks for the response - let me know if you think of anything to try.

>
>  Regards,
>  Arnout
>
> --
> Arnout Vandecappelle                               arnout at mind be
> Senior Embedded Software Architect                 +32-16-286540
> Essensium/Mind                                     http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
