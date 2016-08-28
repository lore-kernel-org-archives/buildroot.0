From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 28 Aug 2016 16:36:47 +0200
Subject: [Buildroot] [PATCH] package/systemd: importd broken on Sourcery
 CodeBench ARM 2014.05
In-Reply-To: <20160828092904.2a7d4e0e@free-electrons.com>
References: <1468187781-7497-1-git-send-email-yann.morin.1998@free.fr>
 <20160711110225.19dfaa5f@free-electrons.com>
 <20160711171630.GD3734@free.fr>
 <20160827233227.27f54621@free-electrons.com>
 <20160827214849.GI5755@free.fr>
 <20160828092904.2a7d4e0e@free-electrons.com>
Message-ID: <20160828143647.GB5758@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-08-28 09:29 +0200, Thomas Petazzoni spake thusly:
> > >  * Add a workaround in the systemd code to define O_TMPFILE to the
> > >    proper value when not provided by the C library.  
> > 
> > At the same time, I'm not really happy with patching systemd...
> > 
> > O_TMPFILE is not the same value on all archs: generic, alpha, parisc and
> > sparc.
> 
> I must say I still don't understand the overlap of the kernel headers
> and glibc here. 
> 
> In the kernel, we have:
> 
> include/uapi/asm-generic/fcntl.h:#define __O_TMPFILE    020000000
> 
> In glibc, we have:
> 
> sysdeps/unix/sysv/linux/bits/fcntl-linux.h:# define __O_TMPFILE   (020000000 | __O_DIRECTORY)
> 
> Which is not even the same value.

Ah, I got the answer to that one! :-)

O_TMPFILE is defined as such to be sure to break at runtime on old
kernels that do not have O_TMPFILE, becasue open() silently ignores
unknown flags. So, a userland app may request O_TMPFILE but silently not
get it:

    https://lwn.net/Articles/558940/

> I'd still say that patching systemd is the easiest solution, and we
> will be able to remove this patch once we get rid of those too old
> toolchains (which we will have to do at some point, when they become
> too annoying / irrelevant).

Fact is, upstream has a missing.h header that defines O_TMPFILE if not
already defined.

But they do it only for __i386__ and __x86_64__:

    https://github.com/systemd/systemd/blob/master/src/basic/missing.h#L540

So the fix will be two-fold:

  - use missing.h from importd, 

  - enhance missing.h to also define O_TMPFILE for other archs.

I'll be doing that shortly (first already done).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
