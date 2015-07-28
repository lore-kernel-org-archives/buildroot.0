From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 28 Jul 2015 10:23:56 +0200
Subject: [Buildroot] [PATCH 00/13] Update Freescale packages to
	3.10.53-1.1.0_GA
In-Reply-To: <9103272.Gv7pRDqVQb@sagittea>
References: <CAD7j7Q-B9NAQqVHZr+uPmFTjOa5BJ-Orc3bOKFx81UHYX8Yk0Q@mail.gmail.com>
 <CAD7j7Q_sNtMoMvD5oCbGAG8zUr1tyiPEgGNQfODXxz-z2_TVdQ@mail.gmail.com>
 <CAAMH-yuqz=JYq8Z=CuRAtzauxP3LQv4vyNGVLBpUwdB-Pt1Mjw@mail.gmail.com>
 <9103272.Gv7pRDqVQb@sagittea>
Message-ID: <CAAMH-ytPb5ftuAWbYqnotZdWPH7h8Xv9f+-axc69Bs=QNGNCVQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jerome,

On Tue, Jul 28, 2015 at 10:12 AM, J?r?me Pouiller <jezz@sysmic.org> wrote:
> Hello Gary, Carlos,
>
> On Monday 27 July 2015 19:42:08 Gary Bisson wrote:
>> Hi Carlos,
>>
>> On Sat, Jul 18, 2015 at 10:06 PM, Carlos Soto <csotoalonso@gmail.com> wrote:
>> >
>> >
>> > 2015-07-18 21:55 GMT+02:00 Thomas Petazzoni
>> > <thomas.petazzoni@free-electrons.com>:
>> >>
>> >> Dear Carlos Soto,
>> >>
>> >> On Sat, 18 Jul 2015 21:36:04 +0200, Carlos Soto wrote:
> [...]
>> >> > Anyway, they seem to work except for the fact that as soon as a program
>> >> > is
>> >> > stopped (mainly I've tried with glxgears) the xserver crashes. That's
>> >> > the
>> >> > error log:
>> >>
>> >> I'm adding Gary in Cc, he can probably help about this, at least
>> >> confirm whether he can reproduce the same problem or not.
>> >
>> >
>> > Great! I'll also try it again once I update my local copy
>>
>> Yes I confirm I've built the master branch today and I see this error
>> when closing the X app. I will let you know if I find what causes this
>> error. Note that in my case it doesn't happen all the time. I suspect
>> the vivante libraries...
> As far as remember, by default X server terminate when the last client exit.
> When you produce problem, are you closing the last client? You can try to pass
> --noreset option when you launch X.

I was actually looking at the issue to the test was quick, yes the
error disappears with the -noreset option. Seems that stopping the
server is the problem. The log was saying that swrast was missing so I
added but it didn't remove the error. The last message before the
crash is:
[3551284.259] (II) VIVANTE(0): Setting screen physical size to 338 x 211
[3551284.297] (EE)
[3551284.297] (EE) Backtrace:
[3551284.297] (EE)
[3551284.297] (EE) Segmentation fault at address 0x76fd10dc

On the swrast topic, should we add to as a select in the Config.in as
it seems to the be case in Yocto?
https://github.com/Freescale/meta-fsl-arm/blob/master/recipes-graphics/xorg-driver/xf86-video-imxfb-vivante.inc#L64

Also tried updating to latest graphics xdriver and vivante libs which
are meant for 3.14 kernels but I confirm this is also working on
3.10.53. But it didn't help though, I'll wait for next cycle to switch
packages to their 3.14 versions.

> In add, notice glxgears is not the best program to test. Indeed Vivante driver
> does not support GLX/OpenGL API very well (it normally fallback to software
> rendering provided by mesa3d). Prefer test with a GLESv2 program.

To reproduce the issue, I tried the vivante tutorial7 as well as
xterm, both crashed the server when closed although sometimes closing
xterm was ok (weird I know).

Regards,
Gary
