From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 Feb 2016 18:15:53 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/numactl: Fix uClibc compile
 breakage after musl compile fix
In-Reply-To: <20160213173119.0aa5f7c9@free-electrons.com>
References: <1455304949-16808-1-git-send-email-bernd.kuhls@t-online.de>
 <20160212224934.32cd9661@free-electrons.com>
 <6vu3pcxqnk.ln2@ID-313208.user.individual.net>
 <20160213173119.0aa5f7c9@free-electrons.com>
Message-ID: <20160213181553.2e05bb6d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 13 Feb 2016 17:31:19 +0100, Thomas Petazzoni wrote:

> Then I don't really understand. The original problem was:
> 
> syscall.c:118:41: error: missing binary operator before token "("
>  #if defined(__GLIBC__) && __GLIBC_PREREQ(2, 11)
> 
> But musl doesn't defined __GLIBC__. So I don't see how it would be
> different to do:
> 
>  #if defined(__GLIBC__) && __GLIBC_PREREQ(2, 11)
> 
> or
> 
>  #if defined(__GLIBC_PREREQ) && __GLIBC_PREREQ(2, 11)
> 
> When neither __GLIBC__ nor __GLIBC_PREREQ are defined (which is the
> case with musl).

And indeed, with your new patch applied, the build still fails with
musl:

syscall.c:118:46: error: missing binary operator before token "("
 #if defined(__GLIBC_PREREQ) && __GLIBC_PREREQ(2, 11)

This really needs to be within a #if defined(__GLIBC__).

Can you submit a patch that fixes this, and test it with glibc, uclibc
and musl?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
