From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 2 Oct 2012 20:39:49 +0200
Subject: [Buildroot] Question about 64Bit kernel and 32Bit applications
In-Reply-To: <20121002194921.5fb92a46@skate>
References: <CAMJ=MEd+eR2Z1yUKu541TQzQJOhu-fpa6HDLD0e-0+n-Jt-6WA@mail.gmail.com>
 <20121002160254.3b94fe25@skate>
 <CAMJ=MEe-AfvoQ9tx5z3Wo2=w3tTbsorqCmcSp6trkxMmwpusZg@mail.gmail.com>
 <20121002194921.5fb92a46@skate>
Message-ID: <CAAXf6LV03Oqs7Snmcn1jMybn=dZeqkVEK+h7JvtzePq6Qo0aAQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, Oct 2, 2012 at 7:49 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Ronny,
>
> Please keep the list Cc'ed for Buildroot related discussions.
>
> On Tue, 2 Oct 2012 19:43:46 +0200, Ronny Meeus wrote:
>
>> The toolchain is available from cnusers.org.
>> You need to register first but once registered (can take 1 day or so), go to:
>> Downloads -> Downloads for registered users -> Octeon Software
>> development kit -> SDK 2.3
>> This is the complete octeon SDK including an installed toochain, Linux
>> source code, example code, uboot etc for the Cavium reference boards.
>> This is the direct link:
>> http://www.cnusers.org/index.php?option=com_remository&Itemid=32&func=fileinfo&id=165
>
> Ok, thanks, I'll have a look. However, if registration is required,
> integrating the toolchain in Buildroot will be difficult.
>
>> > And my opinion is that we should not try to support this. Unless I'm
>> > missing something, it is a really bizarre use case, and adding support
>> > for it would create an horrible additional complexity in Buildroot.
>>
>> In my opinion this usecase is not so bizarre. New applications can be
>> compiled in 64Bit mode while legacy applications (coming from a 32Bit
>> machine) can be compiled with the -mabi=n32 compiler option. If we
>> would not do this and just compile in 64Bit mode, the impact in the
>> application can be big (size of several types changes from 4 to 8
>> bytes, impact on the size of data-types, alignment issues etc).

(note: I'm working together with Ronny so my opinions are biased)

I also think that this use case is valid: on a 64 bit systems you may
need to support 32-bit legacy applications. The end goal obviously is
to fix the applications so that they truly support 64-bit, but this is
not a quick fix. In the short term, a mixed approach would be needed.
It's true that this may be a new use case for Buildroot, and I also
understand and agree that we shouldn't support this if it makes the
implementation ugly or overcomplicated. However, I hope that it's
possible with a clean and simple implementation, which ideally is also
integrateable in mainline Buildroot. If not possible, we'll have to
keep it in our local tree.

>>
>> What about the support to compile the userland with a different ABI
>> than the kernel?
>
> Sure. Do you know what changes we should do to make this possible?
>
>> > The change you did for libfuse cannot be integrated: it is MIPS
>> > specific, and we also have no way of specifying on a per-package basis
>> > whether it should be built for 32 bits or 64 bits.

In fact, if we are to support a mixed 32/64 bit system, there are
several levels:
- specify for some packages/libraries whether it should be built for
this or that bitness/ABI but only build one combination in a given
environment.
- build certain libraries for more than one bitness/ABI combination in
the same environment, e.g. 32 and 64-bit. This way, the same library
can be used by both 32- as 64-bit applications.
- build all libraries for more than one bitness/ABI if a given global
option is selected

The first option is probably the easiest. One could envision a global
option that specifies the deviant CFLAGS and LDFLAGS to use, and
another option to list the packages that should use these deviant
flags.
Or another solution would be inspired by the local.mk feature: in this
case one could create a single file that specifies entries like
<PKG>_DEVIANT_FLAGS="..."
The impact of such a solution in the central infrastructure is limited.

>>
>> I just included this code to give you an indication of the changes I
>> needed to do ...
>
> Sure, that's the way I took your code, I just highlighted the reason
> why we couldn't accept this type of modification.
>

Aside from the selection of bitness/ABI for certain packages built by
buildroot, there is the question of libraries part of the (external)
sysroot. The C library would obviously need to be present on the
rootfs in both 32- and 64-bit versions.

Best regards,
Thomas
