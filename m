From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 7 Sep 2020 19:58:57 +0200
Subject: [Buildroot] package/strace --enable-mpers=no
In-Reply-To: <87k0x72z34.fsf@tarshish>
References: <CAEyMn7a8hML1-mFD11YMWoZ7VM+YHLNJQyBJEpg5x2jJx2qXRw@mail.gmail.com>
 <87k0x72z34.fsf@tarshish>
Message-ID: <CAEyMn7bJqaJAg9OLbCmYxY4rQkMxRqA5uMAWJanZeuPHjBoQog@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

Am So., 6. Sept. 2020 um 08:34 Uhr schrieb Baruch Siach <baruch@tkos.co.il>:
>
> Hi Heiko,
>
> On Sun, Sep 06 2020, Heiko Thiery wrote:
> > I faced an issue when building strace for aarch64 on my host where a
> > 32bit arm toolchain is installed. As discussed with Brandon on IRC
> > strace seems to find the 32bit toolchain because of the
> > --enable-mpers=check option and fails with that.
> >
> > Do you think it makes sense to set --enable-mpers=no since buildroot
> > does not support multi personality toolchains?
> >
> > [1] https://pastebin.com/8uaFHgyP
> > [2] https://pastebin.com/GeSYYvnB
>
> I never really got around to fully understand strace mpers handling. I
> have been bitten by mpers in the past (commit fc0d31caeedb).

I also do not fully understand the mpers but I would like to
understand a little bit more.

> Buildroot built strace might run on external executable binaries. If
> this functionality is useful, I don't think we should just disable it.
>
> Why didn't the autobuilders catch this failure?

As far as I can see from the strace configure.ac [1]. In case the
target arch is aarch64 they try to figure out if there are additional
compilers available in the PATH.
For the autobuilders there seems to be no other crosscompilers be
installed host wide. In my case the build server has an arm32 compiler
installed so the configure.ac will
find the corresponding CC. But the host wide kernel headers do not
match. That is what I understand from the comment from Levin (strace
maintainer) [2].


>
> James' autobuilder does show a different mpers related build failure:
>
>   http://autobuild.buildroot.net/?reason=strace-5.7

D="" \
READELF="/tmp/instance-1/output-1/host/bin/aarch64_be-linux-gnu-readelf" \
CC="arm-linux-gnueabihf-gcc" \
CFLAGS="-DHAVE_CONFIG_H   -I./linux/aarch64 -I./linux/aarch64
-I./linux -I./linux -I. -I.      -DMPERS_IS_m32" \
CPP="/tmp/instance-1/output-1/host/bin/aarch64_be-linux-gnu-cpp" \
CPPFLAGS="-DHAVE_CONFIG_H   -I./linux/aarch64 -I./linux/aarch64
-I./linux -I./linux -I. -I.      -DIN_MPERS -DMPERS_IS_m32" \
./mpers.sh m32 "-std=gnu99 " $f || exit; \

The issue on James' autobuilder seems to be similar, because the CC is
also set differently than the target one.

[1] https://github.com/strace/strace/blob/master/configure.ac#L791
[2] https://github.com/strace/strace/issues/150

-- 
Heiko
