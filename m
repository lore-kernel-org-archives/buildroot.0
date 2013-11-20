From: Spenser Gilliland <spenser@gillilanding.com>
Date: Wed, 20 Nov 2013 08:00:11 -0600
Subject: [Buildroot] Help to fix Microblaze issues in Buildroot
In-Reply-To: <CAM+bi4sL0io7iuRA7AE_CNhs5sTTqc2oRS7As2pCEqkFwcr2Sg@mail.gmail.com>
References: <20131006185441.0d5c2397@skate>
 <CAM+bi4vGmKHRA3j0ua-dsOBzTuj-BPrM2+z3papeyfDjjazhgw@mail.gmail.com>
 <CAM+bi4t7Z4RWQ=6r=qOUOXKpqV76hRSogU0iBp12FKvN+fGviA@mail.gmail.com>
 <20131120111027.472fe84b@skate>
 <CAM+bi4sKAyBrLjAKfBBkDMVDLReBHffqUCfdDvU61X1wErLfNA@mail.gmail.com>
 <20131120114112.03abac2f@skate>
 <CAM+bi4sL0io7iuRA7AE_CNhs5sTTqc2oRS7As2pCEqkFwcr2Sg@mail.gmail.com>
Message-ID: <CAEBucnBpYJgfx8uDVUTED3-by6iJwHnPogUETxc7y7bcC_M+Ug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alvaro,
On Nov 20, 2013 7:56 AM, "Alvaro Gamez" <alvaro.gamez@hazent.com> wrote:
>
> Hi again
>
> Well, I have some good news and some bad news.
>
> I've applied Spenser's patches and after some fixes I've managed to test
the same build that caused beecrypt (and openssl and others) to break.
>
> The good news is that beecrypt has compiled succesfully, so this seems to
be definitely the way to go to support latest Xilinx devices and such.
>
> The bad news is that Spenser's patches require some work. Most of it is
easy and I've already done it myself, I can resubmit these patches with the
little changes I made to have it fully working.
>
> However, there's a detail that affects other buildroot parts.
>
>  gcc.mk file requires the source code to be downloaded as a .tar.bz2 file.
>
> However, the new github helper is only able to download .tar.gz files. I
don't think this is due to the new github helper but to github itself, that
only provides gziped versions of its files.
>
> gcc.mk defines HOST_GCC_EXTRACT_CMDS as:
>
>         $(BZCAT) $(DL_DIR)/$(GCC_SOURCE) | \
>                 $(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) \
>                 --exclude='libjava/*' \
>                 --exclude='libgo/*' \
>                 --exclude='gcc/testsuite/*' \
>                 --exclude='libstdc++-v3/testsuite/*' \
>                 $(TAR_OPTIONS) -
>         mkdir -p $(@D)/libstdc++-v3/testsuite/
>         echo "all:" > $(@D)/libstdc++-v3/testsuite/Makefile.in
>         echo "install:" >> $(@D)/libstdc++-v3/testsuite/Makefile.in
>
> So... now I have the question:
>
> Is it necessary to manually invoke bzcat? Why don't we let tar deal with
the matter of deciding which uncompresser to use, since it now by defaults
can detect it without the need to pass any 'z' or 'j' parameter?
>
>
>
> 2013/11/20 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>>
>> Dear Alvaro Gamez,
>>
>> On Wed, 20 Nov 2013 11:36:00 +0100, Alvaro Gamez wrote:
>>
>> > Now that I take the time to revisit Xilinx' website, I think maybe
>> > we're doing something wrong...
>> >
>> > Old Xilinx git repository,
>> > http://git.xilinx.com/?p=microblaze-gnu.git;a=tree;f=binaries now
>> > redirect to github: https://github.com/xilinx and seems to be quite
>> > up to date with upstream gcc.
>>
>> These repositories are exactly the repositories that Spenser patches
>> are using for the internal toolchain backend.
>>
>> See:
>>
>>   http://patchwork.ozlabs.org/patch/291045/ (binutils)
>>   http://patchwork.ozlabs.org/patch/291046/ (gcc)
>>   http://patchwork.ozlabs.org/patch/291047/ (glibc)
>>   http://patchwork.ozlabs.org/patch/291048/ (gdb)
>>
>> > There seems to be also a later version of GNU Tools available at
>> > http://www.xilinx.com/guest_resources/gnu/
>> >
>> >    - GNU Tools for MicroBlaze (gcc 4.6.4, gdb 7.6.0, binutils 2.23.2,
>> >    newlib 1.19, eglibc-2.18) -
>> > mb_gnu_20131023.tar.gz<
http://www.xilinx.com/guest_resources/member/mb_gnu/mb_gnu_20131023.tar.gz>
>> >
>> > I don't know how up to date are these downloads, but it may be worth
>> > a try? Although if we're going ahead with Spenser's patches maybe we
>> > can/(want to?) avoid Xilinx altogether?
>>
>> We are not avoiding Xilinx altogether at all, please look at Spenser
>> patches.
>>
>> *However* the tarballs you're pointing at at
>> http://www.xilinx.com/guest_resources/gnu/ look interesting for
>> pre-built external toolchains. I'm currently downloading "GNU Tools for
>> MicroBlaze (gcc 4.6.4, gdb 7.6.0, binutils 2.23.2, newlib 1.19,
>> eglibc-2.18)", and I'll have a look at what it is exactly.
>>
>> Thanks!
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Free Electrons
>> Embedded Linux, Kernel and Android engineering
>> http://free-electrons.com
>
>
>
>
> --
> ?lvaro G?mez Machado
Alvaro,

You need to apply the arc patch set as well as this set.  We harmonized the
patches to make sure there could both be applied cleanly.

Thanks,
Spenser
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131120/63a3b84c/attachment.html>
