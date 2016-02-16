From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Feb 2016 21:30:23 +0100
Subject: [Buildroot] [PATCH 1/1] package/iputils: patch ping to link
 against libm
In-Reply-To: <CAFGQKxdemRmCT51fvTuTOeYWeOv9y3Tv2nY=wUdpVKtePUf0bQ@mail.gmail.com>
References: <1455541206-18200-1-git-send-email-martin@barkynet.com>
 <20160215231703.2052c7e0@free-electrons.com>
 <20160216190329.GO14809@waldemar-brodkorb.de>
 <CAFGQKxdemRmCT51fvTuTOeYWeOv9y3Tv2nY=wUdpVKtePUf0bQ@mail.gmail.com>
Message-ID: <20160216213023.14b06e86@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 16 Feb 2016 19:58:13 +0000, Martin Bark wrote:

> I can't reproduce the issues you see.  I just ran some more tests and
> for me iputils fails with undefined reference to `__finite' when built
> against uClibc regardless of BR2_ENABLE_DEBUG=y.  I had a defconfig
> with only BR2_PACKAGE_IPUTILS=y.
> 
> I looked at the autobuild fails for iputils from here
> http://autobuild.buildroot.org/?reason=iputils-c8ff6feaf0442f8efd96ccb415770c54f9e84d47
> and there are lots of fails without BR2_ENABLE_DEBUG=y

All failures occur with the internal toolchain backend, i.e when using
the latest uClibc-ng version. So it seems to me that the failure
started to exist in a recent uClibc-ng version: the pre-built uClibc
toolchains that are based on uClibc-ng 1.0.9 do not exhibit the problem.

> > The finite macros where added here:
> > http://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/include/math.h?id=21902b578e96fd6b85b9bcda8a0e929fc844ec51
> > So 1.0.10 is the first release containing this BSD specific
> > functions in a usable way.

Which would probably match with Waldemar's change in 1.0.10.

Waldemar, can you conrfirm? If those functions are only available
starting in 1.0.10, how can iputils build with 1.0.9 ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
