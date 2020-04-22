From: Romain Naour <romain.naour@smile.fr>
Date: Wed, 22 Apr 2020 15:00:13 +0200
Subject: [Buildroot] SH Port Status
In-Reply-To: <CAF9ehCXmmFs+NTjSb7g2A-5SNMtK1uyr9J-AzE6ibR64MNJaEw@mail.gmail.com>
References: <CAF9ehCXFhAvfwaPL9Pdp-+vafA0TpM-A5dZ0irxRkqxtRUa9EA@mail.gmail.com>
 <ee297063d45cc7e42c2921e3104181061e442b51.camel@redhat.com>
 <CAF9ehCXY5ZjxhiZyhaz0Kj4=j97kT292s_RzhjtA0omQR907zw@mail.gmail.com>
 <89e921ab10716484e68e830c635ed57b49ea749d.camel@redhat.com>
 <CAFiYyc0=8nm-ufe_-zxAHUiU4AYC6PtG8u_9w16oqoAB_Z9gMg@mail.gmail.com>
 <CAF9ehCXmmFs+NTjSb7g2A-5SNMtK1uyr9J-AzE6ibR64MNJaEw@mail.gmail.com>
Message-ID: <2bb8a010-03e1-9f94-a88b-8dbad60824ab@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

Le 21/04/2020 ? 17:18, Joel Sherrill a ?crit?:
> On Tue, Apr 21, 2020 at 4:04 AM Richard Biener <richard.guenther@gmail.com>
> wrote:
> 
>> On Mon, Apr 20, 2020 at 11:05 PM Jeff Law via Gcc <gcc@gcc.gnu.org> wrote:
>>>
>>> On Mon, 2020-04-20 at 15:29 -0500, Joel Sherrill wrote:
>>>>
>>>>
>>>> On Mon, Apr 20, 2020, 3:13 PM Jeff Law <law@redhat.com> wrote:
>>>>> On Mon, 2020-04-20 at 14:47 -0500, Joel Sherrill wrote:
>>>>>> Hi
>>>>>>
>>>>>> Over at RTEMS, we were discussing ports to deprecate/obsolete
>>>>>> and the SH seems to be on everyone's candidate list. I can't seem
>>>>>> to find any gcc test results sh-unknown-elf since 2009 and none
>>>>>> for sh-rtems. I know I posted some but when, I can't say. But the
>>>>>> new  mailing list  setup may be messing that up. I expected more
>>>>>> recent results.
>>>>>>
>>>>>> (1) Is my search right? Have there been no test results in 10
>> years?
>>>>>>
>>>>>> (2) Is the toolchain in jeopardy?
>>>>>>
>>>>>> (3) I know there was an effort to do an open implementation with
>>>>>> j-core.org but there is no News or download item newer than 2016.
>>>>>> Is this architecture effectively dead except for legacy hardware
>> out
>>>>>> in the field (Sega?)
>>>>>>
>>>>>> I'm leaning to RTEMS dropping support for the SH after we branch
>>>>>> a release and wondering if the GCC community knows anything that
>>>>>> I don't.
>>>>> I'm not aware of the SH toolchain being in any jeopardy.
>>>>>
>>>>>
>>>>> I'm doing weekly bootstrap (yes, really) & regression tests for
>> {sh4,sh4eb}-
>>>>> linux-gnu and daily builds of {sh3,sh3b}-linux-gnu.  See
>>>>>
>>>>> http://gcc.gnu.org/jenkins
>>>>
>>>> Awesome!
>>>>>
>>>>> The Linux kernel is currently broken, but I suspect it's a transient
>> issue as
>>>>> it
>>>>> was fine until a week ago -- my tester usually builds the kernel
>> too, but
>>>>> that's
>>>>> been temporarily disabled for SH targets.
>>>>
>>>> Thanks Jeff! Are you using the simulator in gdb? That's what we have a
>> BSP for?
>>> I'm using qemu -- it's user mode emulation is strong enough that I can
>> create a
>>> little sh4 native root filesystem and bootstrap GCC within it.
>>>
>>>
>>>>
>>>> We build the cross RTEMS tools regularly on Linux, Mac, FreeBSD,
>> Mingw, and
>>>> Cygwin. All of our BSPs build including sh1 and the odd sh2e.
>>>>
>>>> Our BSP status for the gdb simulator is unknown. We replaced a lot of
>> testing
>>>> infrastructure scripting and the SH hasn't gotten to the top of the
>> list.
>>> ACK.  In general, if there's a qemu solution, that's my preference these
>> days.
>>> For the *-elf targets I usually have to fall back to the old gdb-sim
>> bits.
>>>
>>>>
>>>> So we both are building a lot and making sure rot hasn't set in. But in
>>>> practice, is this worth the trouble anymore?
>>> I'm not sure about that ;-)  I haven't seen anyone suggest removal of
>> the port or
>>> anything like that.  The port doesn't use CC0, so there's essentially
>> zero chance
>>> it'll be deprecated for gcc-11.  I believe the port is not using LRA, so
>> if/when
>>> we move on deprecating reload, SH might be at some degree of risk.
>>
>> There's two listed maintainers as well (albeit at their anonymous
>> gcc.gnu.org domain).
>>
> 
> Thanks to everyone. This has been an interesting discussion. I am
> concluding that
> the SH look pretty healthy especially considering it is a secondary port
> without
> hardware in production
> 
>  + Linux
>     - kernel.org git still has the architecture with multiple boards
>     - Debian SuperH mailing list has some recent (light) activity
> 
> + RTEMS
>    - Tools and all BSPs regularly built for SH1 - SH4 (gcc 9 and 10)
>    - We have no hardware to test on. Rely on gdb sim. Haven't tested
> recently
> 
> + GCC Testing
>    - SH Linux User space is regularly tested on Qemu
>    - I did not find recent sh-elf test reports
>    - I did build sh-elf from master of gcc, binutils, newlib and can report
>      it works well enough to run hello world.
> 
> + GCC Maintainer activity
>    - maintainer Oleg Endo last committed an SH patch in October 2019
>    - maintainer Alexandre Oliva last committed an SH patch in Dec 2017
> 
> + GCC Port activity
>    - Handful of patches since 1 Oct 2019. Most are actually to fix bugs
>      that are SH specific and have ticket numbers.
> 
> Overall, I've seen ports in a lot worse shape. :)
> 
> Thanks to everyone for the help. I don't know whether RTEMS will keep
> the SH port after our release but the tools shape won't be a factor.

I would like to add the Buildroot project where sh4 targets are still available [1].

Buildroot provide two defconfig to build a rootfs to be used with Qemu
(qemu_sh4_r2d_defconfig and qemu_sh4eb_r2d_defconfig).
Those defconfig are runtime tested in gitlab-ci [2] (we only do a boot test).

The sh4 toolchain is used in Buildroot's autobuilders [3] to detect build issues
related to sh4 port.

There is also the toolchain-builder [4] project from Bootlin that provide sh4
prebuilt toolchains.

So, the sh4 toolchain and kernel port looks ok.

[1] https://git.buildroot.net/buildroot/tree/arch/Config.in.sh?h=2020.02.1
[2] https://gitlab.com/buildroot.org/buildroot/-/jobs/517918231
[3] http://autobuild.buildroot.net/?arch=sh4
[4] https://toolchains.bootlin.com

Best regards,
Romain

> 
> --joel
> RTEMS
> 
> 
>>
>> Richard.
>>
>>> jeff
>>>>
>>>
>>
