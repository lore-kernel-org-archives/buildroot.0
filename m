From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Feb 2014 20:16:20 +0100
Subject: [Buildroot] [PATCH] legal-info: extract even no-redistribute
 packages
In-Reply-To: <1393605956-18133-1-git-send-email-yann.morin.1998@free.fr>
References: <1393605956-18133-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140228201620.1f4b13ba@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri, 28 Feb 2014 17:45:56 +0100, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> If a package is marked _REDISTRIBUTE = NO, then legal-info will not
> try to extract it first.
> 
> If that package also declares some _LICENSE_FILES, legal-info fails
> if it is the only action we're trying to run:
> 
>     $ cat defconfig
>     BR2_INIT_NONE=y
>     BR2_PACKAGE_LIBFSLCODEC=y
>     $ make BR2_DEFCONFIG=$(pwd)/defconfig defconfig
>     $ make libfslcodec-legal-info
>     /bin/sh: /home/ymorin/dev/buildroot/O/legal-info/licenses.txt: No such file or directory
>     make[1]: *** [libfslcodec-legal-info] Error 1
> 
> Fix this by always having legal-info extract the archives if one or
> more _LICENSE_FILES are specified.
> 
> Fixes:
>     http://autobuild.buildroot.net/results/884/884ba13bb024fd9a4818f3184495b2cccc3f595e/
>     http://autobuild.buildroot.net/results/b6e/b6e152ce117764337c243a9f356b32064106f5c3/
>     http://autobuild.buildroot.net/results/a58/a588b3b535a1259f7bc110a6323e5f33830bcd94/
>     http://autobuild.buildroot.net/results/6d5/6d5da7fe5aee871d98fd5503875453556ccbf854/
>     [...]

While I agree with the patch you're proposing, I was wondering which
patch was introducing the regression. And I didn't find where the
regression could be coming from. Looking more closely at one of the
build results, you see that the tarballs are only extracted at the
make legal-info invocation, which doesn't make any sense: "make" is
executed before "make legal-info" in the autobuilders. So apparently,
nothing gets built at all during "make", and it's only at the "make
legal-info" step that packages are extracted.

So indeed your patch looks good, but it will not solve the autobuilders
problems I believe.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
