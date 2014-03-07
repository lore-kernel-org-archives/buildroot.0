From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Mar 2014 21:46:51 +0100
Subject: [Buildroot] luajit package fails to build on x86_64 for x86
In-Reply-To: <CAHkwnC8GuQJaRaqw_0A1KNNaFyz4scJBzsALRGx0ounsg7Y5mQ@mail.gmail.com>
References: <CAHkwnC9NzMx8kE4KdBjnAys7Xj5n0sQS6AHa=ZrzLqQQtkFZUg@mail.gmail.com>
 <20140306213113.GH3625@free.fr>
 <CAHkwnC9tLUTAVHnGNyPkPxNFFFMTiqPyAvhtahGEWZAPbY0BgQ@mail.gmail.com>
 <20140307172121.GC3384@free.fr>
 <CAHkwnC92VGYqeUSNsAiyuFQgErZtLwYyFJ89qa8bYrAoZ8mRkw@mail.gmail.com>
 <20140307174903.GE3384@free.fr> <20140307204055.2d0a4b23@skate>
 <CAHkwnC8GuQJaRaqw_0A1KNNaFyz4scJBzsALRGx0ounsg7Y5mQ@mail.gmail.com>
Message-ID: <20140307214651.1cb85457@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Fri, 7 Mar 2014 21:37:14 +0100, Fabio Porcedda wrote:

> diff --git a/package/luajit/Config.in b/package/luajit/Config.in
> index 9c4ecc3..d0c1512 100644
> --- a/package/luajit/Config.in
> +++ b/package/luajit/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_LUAJIT
>         # Luajit is only available for some target architectures, and
>         # has some complexity wrt 32/64. See luajit.mk for details.
>         depends on BR2_i386 || (BR2_x86_64 && BR2_HOSTARCH='x86_64')
> || BR2_powerpc || BR2_arm || BR2_armeb
> +       select BR2_HOSTARCH_NEEDS_IA32_COMPILER if !BR2_x86_64

This will prevent building Luajit for ARM, while running Buildroot on
an ARM platform. It's fairly unlikely, but still. "gcc -m32" will only
work on x86, or x86-64 with the 32 bits development files installed.
While in fact Luajit can build in situation where the bitness of the
target and the bitness of the arch match.

For example, Peter has one PowerPC build server: a "gcc -m32" test
would fail on it, even though it would be perfectly capable of building
the ARM 32 bits, PowerPC or x86 Luajit.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
