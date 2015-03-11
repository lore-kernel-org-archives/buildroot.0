From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 11 Mar 2015 18:29:35 +0100
Subject: [Buildroot] [RFC v3 00/30] Add per-package staging feature
In-Reply-To: <20150303152121.408c2733@free-electrons.com>
References: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
 <20150303142901.5998a72c@free-electrons.com>
 <CAHkwnC94xHciiK2n8X0Gr7=PVTs_LWoqQ-bG1bg20jO1ygd0Gw@mail.gmail.com>
 <20150303152121.408c2733@free-electrons.com>
Message-ID: <CAHkwnC_tYQgKA1qY9_zS3Q8m1oNEjxBfZu5zA3xAcYSn+WY_Pw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 3, 2015 at 3:21 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Fabio Porcedda,
>
> On Tue, 3 Mar 2015 15:03:46 +0100, Fabio Porcedda wrote:
>
>> > Could you give some hints about the performance impact of those copies
>> > of the staging directory? Does it continue to make the top-level
>> > parallel build thing useful?
>>
>> IMHO the per-package staging feature is useful even without taking in
>> consideration the top-level parallel build, the unspecified optional
>> dependency issue are not common, they can generate build faulres or
>> just binary with unexpected behavior.
>
> Yes, correct, this is indeed another benefit of this approach.
>
>> > Preferably something with a fairly deep dependency tree, i.e lots of
>> > small packages that depend on each other. A X.org stack + gtk2 would be
>> > a good example.
>>
>> The most complete selection of package that i've tested is the
>> defconfig + allyespacakgeconfig (693 targets), i've tried to enable a
>> wider range of packages, defconfig + glibc + allyespackageconfig but
>> even without using the pps they fail to build.
>> So i will provide build times of the configuration defconfig +
>> allyespackageconfig.
>
> Ok.
>
>> If you provide a defconfig on the release 2015.02, i can try to build that.
>
> Something like:
>
> BR2_arm=y
> BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
> BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
> BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
> BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_XORG7=y
> BR2_PACKAGE_XSERVER_XORG_SERVER=y
> BR2_PACKAGE_LIBGTK3=y

I've used a system with: i5-3470 (4 core @ 3.2GHz); RAM: 8GB; SSD.
Using you defconfig:

normal:                 20m
with parallel:          13m
with parallel & pps: 15m

Using a defconfig + allyespacakgeconfig:
normal:   85m
parallel:  40m
pps:       42m

I've repeated the test few times and taken the minimum value, but i
was still using the system so maybe the real values can change a bit.

I was surprised that the pps doesn't affect too much the build times,
but probably the ssd helps a lot.

BR
-- 
Fabio Porcedda
