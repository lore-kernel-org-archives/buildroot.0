From: Ronny Meeus <ronny.meeus@gmail.com>
Date: Tue, 2 Oct 2012 22:46:31 +0200
Subject: [Buildroot] Question about 64Bit kernel and 32Bit applications
In-Reply-To: <CAMJ=MEf59P7U5hFc43kqNwBJg-O1narSbvjvRO5cGfueps+vcw@mail.gmail.com>
References: <CAMJ=MEd+eR2Z1yUKu541TQzQJOhu-fpa6HDLD0e-0+n-Jt-6WA@mail.gmail.com>
 <20121002160254.3b94fe25@skate>
 <CAMJ=MEe-AfvoQ9tx5z3Wo2=w3tTbsorqCmcSp6trkxMmwpusZg@mail.gmail.com>
 <20121002194921.5fb92a46@skate>
 <CAMJ=MEf59P7U5hFc43kqNwBJg-O1narSbvjvRO5cGfueps+vcw@mail.gmail.com>
Message-ID: <CAMJ=MEcQ510+eF7qa6WEJrN-4M2uu+9cejXO9cwwsgwMNCiiHQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Another solution would be to have 2 buildroot environments, 1 for the
32bit applications and 1 for the 64bit applications.
For example the 64bit could be "the master" one. In this a directory
of the slave buildroot can be specified and this master will merge the
32bit applications together with its libraries from the slave
output/target into its own target/output and remake the rootfs.

This might not be a nice solution, but I think it will work.

It can be considered similar to BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS
where a copy is made of certain things into the root-fs.

On Tue, Oct 2, 2012 at 9:21 PM, Ronny Meeus <ronny.meeus@gmail.com> wrote:
> On Tue, Oct 2, 2012 at 7:49 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Ronny,
>>
>> Please keep the list Cc'ed for Buildroot related discussions.
>>
>> On Tue, 2 Oct 2012 19:43:46 +0200, Ronny Meeus wrote:
>>
>>> The toolchain is available from cnusers.org.
>>> You need to register first but once registered (can take 1 day or so), go to:
>>> Downloads -> Downloads for registered users -> Octeon Software
>>> development kit -> SDK 2.3
>>> This is the complete octeon SDK including an installed toochain, Linux
>>> source code, example code, uboot etc for the Cavium reference boards.
>>> This is the direct link:
>>> http://www.cnusers.org/index.php?option=com_remository&Itemid=32&func=fileinfo&id=165
>>
>> Ok, thanks, I'll have a look. However, if registration is required,
>> integrating the toolchain in Buildroot will be difficult.
>>
>>> > And my opinion is that we should not try to support this. Unless I'm
>>> > missing something, it is a really bizarre use case, and adding support
>>> > for it would create an horrible additional complexity in Buildroot.
>>>
>>> In my opinion this usecase is not so bizarre. New applications can be
>>> compiled in 64Bit mode while legacy applications (coming from a 32Bit
>>> machine) can be compiled with the -mabi=n32 compiler option. If we
>>> would not do this and just compile in 64Bit mode, the impact in the
>>> application can be big (size of several types changes from 4 to 8
>>> bytes, impact on the size of data-types, alignment issues etc).
>>>
>>> What about the support to compile the userland with a different ABI
>>> than the kernel?
>>
>> Sure. Do you know what changes we should do to make this possible?
>
> What I have done is the following:
> - pass following flags to the compiler (CC and CPP), for 32Bit
> applications/libraries: -mabi=n32 -march=octeon2
> - pass following flags to the linker, for 32Bit
> applications/libraries:  -melf32btsmipn32
> - copy the lib32 and lib64 directories of the sysroot directory of the
> toolchain to buildroot and the target/output directory.
> - do not pass the -mtune, -mabi and -m64 in
> "toolchain/toolchain-external/ext-toolchain-wrapper.c"
>
> With the last step I take the assumption that the default mode for the
> toolchain is 64Bit.
>
> I do not know how exactly to fit it into buildroot.
> One suggestion could be to use the current buildroot flags for the
> application space and introduce a new set of flags for the kernel.
> This is under the assumption that all libraries/packages work will for
> the n32 ABI.
>
> In the meantime I tried to compile with the target ABI set to n32 and
> all code seems to after manually copying following directories:
> cp -R /tmp/tools/mips64-octeon-linux-gnu/sys-root/usr/lib64
> /repo/meeusr/buildroot-cavium-5/output/host/usr/mips-unknown-linux-gnu/sysroot/usr/
> cp -R /tmp/tools/mips64-octeon-linux-gnu/sys-root/usr/lib32
> /repo/meeusr/buildroot-cavium-5/output/host/usr/mips-unknown-linux-gnu/sysroot/usr/
> cp -R /tmp/tools/mips64-octeon-linux-gnu/sys-root/lib
> /repo/meeusr/buildroot-cavium-5/output/host/usr/mips-unknown-linux-gnu/sysroot
> cp -R /tmp/tools/mips64-octeon-linux-gnu/sys-root/lib32
> /repo/meeusr/buildroot-cavium-5/output/host/usr/mips-unknown-linux-gnu/sysroot
> cp -R /tmp/tools/mips64-octeon-linux-gnu/sys-root/lib64
> /repo/meeusr/buildroot-cavium-5/output/host/usr/mips-unknown-linux-gnu/sysroot
> (the toolchain is also installed in /tmp/tools)
>
> After doing this, I'm able to build everything and I see that all
> applications/libraries are in the correct ABI (N32).
> Even the kernel is correctly compiled (64Bit). After some grepping in
> the kernel code I found:
>
> $ grep -r "\-mabi\=64" *
> arch/mips/Makefile:cflags-y             += -mabi=64
> drivers/staging/rt2860/config.mk:
> -mabi=64 $(WFLAGS)
>
> So it looks like the model were the complete userspace is compiled
> with n32 works correctly.
> [I still had to copy the lib32 directory myself to the "target/output"
> directory make the system boot.]
>
>>> > The change you did for libfuse cannot be integrated: it is MIPS
>>> > specific, and we also have no way of specifying on a per-package basis
>>> > whether it should be built for 32 bits or 64 bits.
>>>
>>> I just included this code to give you an indication of the changes I
>>> needed to do ...
>>
>> Sure, that's the way I took your code, I just highlighted the reason
>> why we couldn't accept this type of modification.
>>
>> Thanks!
>>
>> Thomas
>> --
>> Thomas Petazzoni, Free Electrons
>> Kernel, drivers, real-time and embedded Linux
>> development, consulting, training and support.
>> http://free-electrons.com
