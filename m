From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 30 Aug 2016 11:48:10 +0200
Subject: [Buildroot] [PATCHv2] package/systemd: fix build with old
 toolchains
In-Reply-To: <20160830093511.ykvjhugty2xhg4rf@tarshish>
References: <1472549377-22268-1-git-send-email-yann.morin.1998@free.fr>
 <20160830093511.ykvjhugty2xhg4rf@tarshish>
Message-ID: <20160830094810.GC5815@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2016-08-30 12:35 +0300, Baruch Siach spake thusly:
> Hi Yann,
> 
> On Tue, Aug 30, 2016 at 11:29:37AM +0200, Yann E. MORIN wrote:
> > Toolchains using glibc-2.18 or older do not define O_TMPFILE, which
> > causes build failures on some archs.
> > 
> > systemd has a definition for O_TMPFILE if it is missing, but only
> > defines it for i386 or x86_64. Furthermore, the header defining it is
> > not included everywhere O_TMPFILE is used.
> > 
> > Fix that with three patches backported from upstream:
> >   - include the needed header where it is needed (he!),
> >   - define O_TMPFILE for all archs, according to linux-4.8rc3,
> >   - no longer guard against undefined O_TMPFILE in fileio.
> 
> This last patch is not a pure build fix, but more of a feature enhancement. 
> Don't know if it fits in master.

Well, it's indeed not a _pure_ bug fix, but given that O_TMPFILE is now
always defined, the guards are no longer needed at all: they will never
be guarding anything now.

Besides, using O_TMPFILE is way better than not using it; it makes the
thing a little bit more secure.

> Also, your patches are missing sign-off.

Damn. Upstream is not using SoB lines (Lennart asked me to remove them
[0] and I fiorgot to re-add them when adding them in Buildroot; the
previosu iteration did have my SoB lines).

> An autobuild reference in the commit log would also be nice.

Damn, I also forgot that... :-/

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
