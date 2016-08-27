From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Aug 2016 23:48:49 +0200
Subject: [Buildroot] [PATCH] package/systemd: importd broken on Sourcery
 CodeBench ARM 2014.05
In-Reply-To: <20160827233227.27f54621@free-electrons.com>
References: <1468187781-7497-1-git-send-email-yann.morin.1998@free.fr>
 <20160711110225.19dfaa5f@free-electrons.com>
 <20160711171630.GD3734@free.fr>
 <20160827233227.27f54621@free-electrons.com>
Message-ID: <20160827214849.GI5755@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-08-27 23:32 +0200, Thomas Petazzoni spake thusly:
> On Mon, 11 Jul 2016 19:16:30 +0200, Yann E. MORIN wrote:
> > > So is the problem a kernel headers problem, or a glibc version problem ?  
> > Both. O_TMPFILE was introduced in Linux 3.11, so we need at least those
> > headers. Also, glibc-2.18 did not provide it in fcntl.h; it only
> > appeared in glibc-2.19.
> 
> I'm still not sure to understand why both are needed.

Well, indeed, both are not needed. glibc-2.19 is enough, as it does
provide it if not defined by the kernel headers.

And if the kernel headers provide it but not glibc, then it is not
available. (Weird).

> In any case, this fix is not correct, since the issue appears with
> other toolchains as well:
> 
>  http://autobuild.buildroot.net/results/e6f/e6f8189029487155a784b4e664178adfd92f8884/build-end.log
> 
>  This one is an ARM toolchain, that uses 3.12 kernel headers, so most
>  likely it's a glibc version issue.

glibc-2.18, so too old.

>  http://autobuild.buildroot.net/results/339/33912eebb5f4ee3f73be078ba2035f48d76a6a46/build-end.log
> 
>  This one is a PowerPC toolchain.

glibc-2.18 too.

> I see two possibilities only:
> 
>  * Introduce some glibc version dependency config knobs.

That's unfortunately the only sane solution, I'm araid.

But that just for systemd is big a gun... :-/

>  * Add a workaround in the systemd code to define O_TMPFILE to the
>    proper value when not provided by the C library.

At the same time, I'm not really happy with patching systemd...

O_TMPFILE is not the same value on all archs: generic, alpha, parisc and
sparc.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
