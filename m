From: Ronny Meeus <ronny.meeus@gmail.com>
Date: Wed, 3 Oct 2012 17:18:47 +0200
Subject: [Buildroot] Question about 64Bit kernel and 32Bit applications
In-Reply-To: <CAMJ=MEcQ510+eF7qa6WEJrN-4M2uu+9cejXO9cwwsgwMNCiiHQ@mail.gmail.com>
References: <CAMJ=MEd+eR2Z1yUKu541TQzQJOhu-fpa6HDLD0e-0+n-Jt-6WA@mail.gmail.com>
 <20121002160254.3b94fe25@skate>
 <CAMJ=MEe-AfvoQ9tx5z3Wo2=w3tTbsorqCmcSp6trkxMmwpusZg@mail.gmail.com>
 <20121002194921.5fb92a46@skate>
 <CAMJ=MEf59P7U5hFc43kqNwBJg-O1narSbvjvRO5cGfueps+vcw@mail.gmail.com>
 <CAMJ=MEcQ510+eF7qa6WEJrN-4M2uu+9cejXO9cwwsgwMNCiiHQ@mail.gmail.com>
Message-ID: <CAMJ=MEcP3GrDMRc6+CQwhG5qYJtMoc2XiLKqXAGvq_S_SX__VA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

to be able to use the Cavium toolchain I had to do some manual things.
Since now the buildroot will be used by more people I want to get rid
of these manual actions.
I will explain what needs to be done...

This is what is included in the Cavium toolchain:

$ ls -l /repo/meeusr/buildroot-cavium-6/output/host/opt/ext-toolchain/mips64-octeon-linux-gnu/sys-root/
total 28
drwxr-xr-x  2 meeusr we2 4096 Sep 11 15:34 etc/
drwxr-xr-x  2 meeusr we2 4096 Feb 24  2012 lib/
drwxr-xr-x  3 meeusr we2 4096 Sep 11 15:34 lib32/
drwxr-xr-x  3 meeusr we2 4096 Sep 11 15:34 lib64/
drwxr-xr-x  2 meeusr we2 4096 Sep 11 15:34 sbin/
drwxr-xr-x  5 meeusr we2 4096 Sep 11 15:34 uclibc/
drwxr-xr-x 13 meeusr we2 4096 Sep 11 15:34 usr/

The lib directory is empty:

$ ls -l /repo/meeusr/buildroot-cavium-6/output/host/opt/ext-toolchain/mips64-octeon-linux-gnu/sys-root/lib
total 0


Because of this I get following error in buildroot:

mkdir -p /repo/meeusr/buildroot-cavium-6/output/host/opt/ext-toolchain
gzip -d -c /repo/meeusr/buildroot-cavium-6/dl/OCTEON-SDK-2.3-tools.tgz | \

/repo/meeusr/buildroot-cavium-6/output/host/usr/bin/tar
--strip-components=1 --exclude='usr/lib/locale/*' -C
/repo/meeusr/buildroot-cavium-6/output/host/opt/ext-toolchain  -xf -
Checking external toolchain settings
Incorrect selection of the C library
make: *** [/repo/meeusr/buildroot-cavium-6/output/stamps/ext-toolchain-checked]
Error 255


To be able to use the external toolchain I need to create a link from
lib to lib32.

$ rmdir /repo/meeusr/buildroot-cavium-6/output/host/opt/ext-toolchain/mips64-octeon-linux-gnu/sys-root/lib
$ ln -s lib32 /repo/meeusr/buildroot-cavium-6/output/host/opt/ext-toolchain/mips64-octeon-linux-gnu/sys-root/lib
$ ls -l /repo/meeusr/buildroot-cavium-6/output/host/opt/ext-toolchain/mips64-octeon-linux-gnu/sys-root/
total 24
drwxr-xr-x  2 meeusr we2 4096 Sep 11 15:34 etc/
lrwxrwxrwx  1 meeusr we2    5 Oct  3 16:25 lib -> lib32/
drwxr-xr-x  3 meeusr we2 4096 Oct  3 16:25 lib32/
drwxr-xr-x  3 meeusr we2 4096 Sep 11 15:34 lib64/
drwxr-xr-x  2 meeusr we2 4096 Sep 11 15:34 sbin/
drwxr-xr-x  5 meeusr we2 4096 Sep 11 15:34 uclibc/
drwxr-xr-x 13 meeusr we2 4096 Sep 11 15:34 usr/

After doing this buildroot is happy and starts to compile busybox.
During the linking of bosybox I get:

/repo/meeusr/buildroot-cavium-6/output/host/opt/ext-toolchain/bin/../lib/gcc/mips64-octeon-linux-gnu/4.3.3/../../../../mips64-octeon-linux-gnu/bin/ld:
cannot find /lib32/libc.so.6 inside
/repo/meeusr/buildroot-cavium-6/output/host/usr/mips-unknown-linux-gnu/sysroot
collect2: ld returned 1 exit status
make[1]: *** [busybox_unstripped] Error 1
make[1]: Leaving directory
`/repo/meeusr/buildroot-cavium-6/output/build/busybox-1.20.1'

When I create a link lib32 to lib in
output/host/usr/mips-unknown-linux-gnu/sysroot

$ ls -l output/host/usr/mips-unknown-linux-gnu/sysroot
total 16
drwxr-xr-x 2 meeusr we2 4096 Oct  3 16:16 bin/
drwxr-xr-x 4 meeusr we2 4096 Oct  3 16:34 lib/
lrwxrwxrwx 1 meeusr we2    3 Oct  3 16:34 lib32 -> lib/
drwxr-xr-x 3 meeusr we2 4096 Oct  3 16:27 repo/
drwxr-xr-x 5 meeusr we2 4096 Oct  3 16:16 usr/

The problem is still not solved.


I start all over again, but this time creating a copy instead of
working with links.
make clean
make
[failure: Incorrect selection of the C library]
rmdir /repo/meeusr/buildroot-cavium-6/output/host/opt/ext-toolchain/mips64-octeon-linux-gnu/sys-root/lib
cp -R /repo/meeusr/buildroot-cavium-6/output/host/opt/ext-toolchain/mips64-octeon-linux-gnu/sys-root/lib32
/repo/meeusr/buildroot-cavium-6/output/host/opt/ext-toolchain/mips64-octeon-linux-gnu/sys-root/lib
make
[now failure (Incorrect selection of the C library) is again gone]
[now link failure in busybox]

$ cp -R /repo/meeusr/buildroot-cavium-6/output/host/opt/ext-toolchain/mips64-octeon-linux-gnu/sys-root/lib32
 /repo/meeusr/buildroot-cavium-6/output/host/usr/mips-unknown-linux-gnu/sysroot

Now I have a different error during the link of busybox:
cannot find /usr/lib32/libc_nonshared.a inside
/repo/meeusr/buildroot-cavium-6/output/host/usr/mips-unknown-linux-gnu/sysroot]

Now I copy usr/lib32:
$ cp -R /repo/meeusr/buildroot-cavium-6/output/host/opt/ext-toolchain/mips64-octeon-linux-gnu/sys-root/usr/lib32
/repo/meeusr/buildroot-cavium-6/output/host/usr/mips-unknown-linux-gnu/sysroot/usr

After this the compilation of busybox and the rest of the modules is
working well.
To be able to use the resulting image on the target, I also need to
copy the lib32 directory into the target/output.

So it looks like if the structure of the external toolchain is
organised with lib32 and lib64 buildroot is not able to handle this
correctly.


Any suggestions on how to solve this issue would be welcome.

Thanks.

On Tue, Oct 2, 2012 at 10:46 PM, Ronny Meeus <ronny.meeus@gmail.com> wrote:
> Another solution would be to have 2 buildroot environments, 1 for the
> 32bit applications and 1 for the 64bit applications.
> For example the 64bit could be "the master" one. In this a directory
> of the slave buildroot can be specified and this master will merge the
> 32bit applications together with its libraries from the slave
> output/target into its own target/output and remake the rootfs.
>
> This might not be a nice solution, but I think it will work.
>
> It can be considered similar to BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS
> where a copy is made of certain things into the root-fs.
>
> On Tue, Oct 2, 2012 at 9:21 PM, Ronny Meeus <ronny.meeus@gmail.com> wrote:
>> On Tue, Oct 2, 2012 at 7:49 PM, Thomas Petazzoni
>> <thomas.petazzoni@free-electrons.com> wrote:
>>> Ronny,
>>>
>>> Please keep the list Cc'ed for Buildroot related discussions.
>>>
>>> On Tue, 2 Oct 2012 19:43:46 +0200, Ronny Meeus wrote:
>>>
>>>> The toolchain is available from cnusers.org.
>>>> You need to register first but once registered (can take 1 day or so), go to:
>>>> Downloads -> Downloads for registered users -> Octeon Software
>>>> development kit -> SDK 2.3
>>>> This is the complete octeon SDK including an installed toochain, Linux
>>>> source code, example code, uboot etc for the Cavium reference boards.
>>>> This is the direct link:
>>>> http://www.cnusers.org/index.php?option=com_remository&Itemid=32&func=fileinfo&id=165
>>>
>>> Ok, thanks, I'll have a look. However, if registration is required,
>>> integrating the toolchain in Buildroot will be difficult.
>>>
>>>> > And my opinion is that we should not try to support this. Unless I'm
>>>> > missing something, it is a really bizarre use case, and adding support
>>>> > for it would create an horrible additional complexity in Buildroot.
>>>>
>>>> In my opinion this usecase is not so bizarre. New applications can be
>>>> compiled in 64Bit mode while legacy applications (coming from a 32Bit
>>>> machine) can be compiled with the -mabi=n32 compiler option. If we
>>>> would not do this and just compile in 64Bit mode, the impact in the
>>>> application can be big (size of several types changes from 4 to 8
>>>> bytes, impact on the size of data-types, alignment issues etc).
>>>>
>>>> What about the support to compile the userland with a different ABI
>>>> than the kernel?
>>>
>>> Sure. Do you know what changes we should do to make this possible?
>>
>> What I have done is the following:
>> - pass following flags to the compiler (CC and CPP), for 32Bit
>> applications/libraries: -mabi=n32 -march=octeon2
>> - pass following flags to the linker, for 32Bit
>> applications/libraries:  -melf32btsmipn32
>> - copy the lib32 and lib64 directories of the sysroot directory of the
>> toolchain to buildroot and the target/output directory.
>> - do not pass the -mtune, -mabi and -m64 in
>> "toolchain/toolchain-external/ext-toolchain-wrapper.c"
>>
>> With the last step I take the assumption that the default mode for the
>> toolchain is 64Bit.
>>
>> I do not know how exactly to fit it into buildroot.
>> One suggestion could be to use the current buildroot flags for the
>> application space and introduce a new set of flags for the kernel.
>> This is under the assumption that all libraries/packages work will for
>> the n32 ABI.
>>
>> In the meantime I tried to compile with the target ABI set to n32 and
>> all code seems to after manually copying following directories:
>> cp -R /tmp/tools/mips64-octeon-linux-gnu/sys-root/usr/lib64
>> /repo/meeusr/buildroot-cavium-5/output/host/usr/mips-unknown-linux-gnu/sysroot/usr/
>> cp -R /tmp/tools/mips64-octeon-linux-gnu/sys-root/usr/lib32
>> /repo/meeusr/buildroot-cavium-5/output/host/usr/mips-unknown-linux-gnu/sysroot/usr/
>> cp -R /tmp/tools/mips64-octeon-linux-gnu/sys-root/lib
>> /repo/meeusr/buildroot-cavium-5/output/host/usr/mips-unknown-linux-gnu/sysroot
>> cp -R /tmp/tools/mips64-octeon-linux-gnu/sys-root/lib32
>> /repo/meeusr/buildroot-cavium-5/output/host/usr/mips-unknown-linux-gnu/sysroot
>> cp -R /tmp/tools/mips64-octeon-linux-gnu/sys-root/lib64
>> /repo/meeusr/buildroot-cavium-5/output/host/usr/mips-unknown-linux-gnu/sysroot
>> (the toolchain is also installed in /tmp/tools)
>>
>> After doing this, I'm able to build everything and I see that all
>> applications/libraries are in the correct ABI (N32).
>> Even the kernel is correctly compiled (64Bit). After some grepping in
>> the kernel code I found:
>>
>> $ grep -r "\-mabi\=64" *
>> arch/mips/Makefile:cflags-y             += -mabi=64
>> drivers/staging/rt2860/config.mk:
>> -mabi=64 $(WFLAGS)
>>
>> So it looks like the model were the complete userspace is compiled
>> with n32 works correctly.
>> [I still had to copy the lib32 directory myself to the "target/output"
>> directory make the system boot.]
>>
>>>> > The change you did for libfuse cannot be integrated: it is MIPS
>>>> > specific, and we also have no way of specifying on a per-package basis
>>>> > whether it should be built for 32 bits or 64 bits.
>>>>
>>>> I just included this code to give you an indication of the changes I
>>>> needed to do ...
>>>
>>> Sure, that's the way I took your code, I just highlighted the reason
>>> why we couldn't accept this type of modification.
>>>
>>> Thanks!
>>>
>>> Thomas
>>> --
>>> Thomas Petazzoni, Free Electrons
>>> Kernel, drivers, real-time and embedded Linux
>>> development, consulting, training and support.
>>> http://free-electrons.com
