From: Ciro Santilli <ciro.santilli@gmail.com>
Date: Thu, 3 May 2018 22:58:23 +0100
Subject: [Buildroot] [RFC PATCH 1/1] core: add option to disable RPATH
 sanitation in target tree
In-Reply-To: <eb7da061-cbc0-a22d-5023-c3cd8780faf2@mind.be>
References: <20180503191531.15549-1-ciro.santilli@gmail.com>
 <7eb9b866-3ba4-2cbb-e4e0-8e2540469ec8@mind.be>
 <CAFXrp_dR2x2L+Eh+q+_zu49=RXBOUk1AOkjjZkggtV+WyW9WBg@mail.gmail.com>
 <eb7da061-cbc0-a22d-5023-c3cd8780faf2@mind.be>
Message-ID: <CAFXrp_fE8HtAC4FV5=5fyK4U5D4JyS+NKTvE-btt-SRQ2qJiYg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, May 3, 2018 at 10:27 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> On 03-05-18 23:21, Ciro Santilli wrote:
>> On Thu, May 3, 2018 at 10:16 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>>
>>>
>>> On 03-05-18 21:15, Ciro Santilli wrote:
>>>> Signed-off-by: Ciro Santilli <ciro.santilli@gmail.com>
>>>> ---
>>>> As explained on the Config, the rationale is to speed up BR2_EXTERNAL
>>>> package development build iteration.
>>>
>>>  I don't see what this has to do with package development. Anyway, when you're
>>> developing package foo, wouldn't you run 'make foo' rather than just 'make' (and
>>> thus never even hit that code path)?
>>>
>>
>> How to test the modification without rebuilding the image to run it on
>> the target?
>
>  Ah, I usually just scp or rsync the (unstripped) binaries to the target system.
> I'll typically write a little script that does something like 'make
> FOO_OVERRIDE_SRCDIR=... foo; ssh target rm -f /usr/bin/foo; scp
> output/target/usr/bin/foo target:/usr/bin; ssh target killall foo; ssh -f target
> foo"
>

That is a possibility.

But I feel it is simpler and more reliable if can just let Buildroot do
exactly what it normally does, especially if a package installs many
files in different directories, and since reboot is so fast.

Otherwise we force users to come up with those setups themselves for
every new package they want to modify.

Even cooler would be if QEMU could Build a separate image with just a
single package (automatically for all OVERRIDE_SRCIDR ?), and then if
I found out how to overlay mount it on root:
https://stackoverflow.com/questions/41119656/how-can-i-overlayfs-the-root-filesystem-on-linux

But OK, let's start simple :-)

>>
>>>> This would make users targetting virtual machines happy.
>>>
>>>  Huh? Or you mean building in virtual machines?
>>>
>>
>> No, cross compiling for VMs from host as opposed to real hardware.
>
>  What difference does it make whether your target is a VM or real hardware?
>

Just the idea that real embedded HW has more limited disk space, and
therefore RPATH fixup time will be small.

But true, now that I think about it this should be annoying for real
embedded boards hardware as well, 4Gb on a RPI is more than enough.

>  Regards,
>  Arnout
>
> [snip]
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
