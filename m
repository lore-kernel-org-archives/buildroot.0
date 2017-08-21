From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Aug 2017 23:10:04 +0200
Subject: [Buildroot] [PATCH] glibc: needs kernel headers >= 4.5 on
 mips(64)
In-Reply-To: <20170821162846.GA3412@scaer>
References: <20170820144154.15347-1-romain.naour@gmail.com>
 <20170820222602.1f51bd7c@windsurf> <20170821162846.GA3412@scaer>
Message-ID: <20170821231004.0deded59@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 21 Aug 2017 18:28:46 +0200, Yann E. MORIN wrote:

> > Yann is specifically working on a mechanism to allow architectures to
> > describe what minimum gcc version they need. Perhaps we should use that
> > to express this dependency as well. Adding Yann in Cc :)  
> 
> And indeed, it was pretty trivial to do so with my changes:
>     https://git.buildroot.org/~ymorin/git/buildroot/commit/?h=yem/aarch64-cpus-2&id=96c77a38f423fd1745ea5601b71d3ac63c7ea11e

I am not sure this patch is correct. Indeed, in the choice you have two
options: NaN 2008 and NaN legacy. With your patch, it's only when NaN
2008 is chosen that you indicate the architecture needs at least gcc
4.9.

But in fact, even if NaN legacy is chosen, you need gcc 4.9, because
-mnan=legacy also only works with gcc 4.9: the -mnan option didn't
exist at all before gcc 4.9 (at least that's my understanding).

However, I believe the current code is already bogus. Indeed,
BR2_MIPS_CPU_MIPS32 selects BR2_MIPS_NAN_LEGACY, which means
BR2_GCC_TARGET_NAN is set to legacy, so -mnan=legacy will be passed...
which will break the build for gcc < 4.9.

There is definitely something to double check here.

> Also, I think we should rename BR2_TOOLCHAIN_HAS_MNAN_OPTION to include
> the fact that it is mips, like: BR2_TOOLCHAIN_HAS_MIPS_MNAN_OPTION.

Also what I thought when reviewing Vicente patches, but then I decided
to not do it, because the gcc option is really named -mnan and not
-mmips-nan or something like that.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
