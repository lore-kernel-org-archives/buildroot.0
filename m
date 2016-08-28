From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Aug 2016 09:29:04 +0200
Subject: [Buildroot] [PATCH] package/systemd: importd broken on Sourcery
 CodeBench ARM 2014.05
In-Reply-To: <20160827214849.GI5755@free.fr>
References: <1468187781-7497-1-git-send-email-yann.morin.1998@free.fr>
 <20160711110225.19dfaa5f@free-electrons.com>
 <20160711171630.GD3734@free.fr>
 <20160827233227.27f54621@free-electrons.com>
 <20160827214849.GI5755@free.fr>
Message-ID: <20160828092904.2a7d4e0e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 27 Aug 2016 23:48:49 +0200, Yann E. MORIN wrote:

> >  * Introduce some glibc version dependency config knobs.  
> 
> That's unfortunately the only sane solution, I'm araid.
> 
> But that just for systemd is big a gun... :-/

Yes, it sucks :-/

> >  * Add a workaround in the systemd code to define O_TMPFILE to the
> >    proper value when not provided by the C library.  
> 
> At the same time, I'm not really happy with patching systemd...
> 
> O_TMPFILE is not the same value on all archs: generic, alpha, parisc and
> sparc.

I must say I still don't understand the overlap of the kernel headers
and glibc here. 

In the kernel, we have:

include/uapi/asm-generic/fcntl.h:#define __O_TMPFILE    020000000

In glibc, we have:

sysdeps/unix/sysv/linux/bits/fcntl-linux.h:# define __O_TMPFILE   (020000000 | __O_DIRECTORY)

Which is not even the same value.

Same for SPARC.

I'd still say that patching systemd is the easiest solution, and we
will be able to remove this patch once we get rid of those too old
toolchains (which we will have to do at some point, when they become
too annoying / irrelevant).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
