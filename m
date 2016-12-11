From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 11 Dec 2016 11:06:34 +0100
Subject: [Buildroot] [PATCH] usbip: add a new package
In-Reply-To: <CAFDyS3Mp5SkXG9hJwCxDnoPEK_h6Xd1B_Jp6bE6GDu0CRSnMyw@mail.gmail.com>
References: <1481272671-6491-1-git-send-email-tal.shorer@gmail.com>
 <20161210143119.778e63b1@free-electrons.com>
 <CAFDyS3Mp5SkXG9hJwCxDnoPEK_h6Xd1B_Jp6bE6GDu0CRSnMyw@mail.gmail.com>
Message-ID: <20161211100634.GA3599@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tal, All,

On 2016-12-10 20:39 +0200, Tal Shorer spake thusly:
> On Sat, Dec 10, 2016 at 3:31 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > Hello,
> >
> > On Fri,  9 Dec 2016 10:37:51 +0200, Tal Shorer wrote:
> >> Add usbip tools (usbip, usbipd) from the running linux source
> >>
> >> Signed-off-by: Tal Shorer <tal.shorer@gmail.com>
> >
> > Thanks for your contribution. However, since usbip tools is provided as
> > part of the Linux kernel source code, it should be supported by the
> > package/linux-tools/ package, which already handles similar tools (perf
> > and others).
> >
> > However, it is true that the linux-tools infrastructure currently only
> > handles tools that just need to be built/installed, and not tools that
> > use autoconf/automake. So most likely, we want to extend
> > package/linux-tools/linux-tools.mk? Or should we, because usbip is
> > different, have a separate package?
> Thanks for your reply.
> 
> I managed to compile usbip as part of linux-tools, but it's quite a
> hack, doing configuration stuff in USBIP_BUILD_CMDS before actually
> calling make. The other option I see is defining
> LINUX_TOOLS_POST_CONFIGURE_HOOKS and doing that there, but it's still
> duplicating what's already being done in pkg-autotools.

Yes, that's not clean...

However, I think it is netter to introduce this configure step in the
linux-tools infra. Then you can hand-write a configure rule for usbip.

Then, we can see whether we make this infra more like any other package
infra. But I'm warry to add even more complexity just for a single
package...

So, could you please send a patch series that;

 1- introduces LINUX_TOOLS_POST_CONFIGURE_HOOKS,
 2- adds usbip with hand-written commands, duplicated from
    pkg-autotools.

On my side, I'll see what we can do about the infra itself and see if we
can re-use the existing infra...

Regards,
Yann E. MORIN.

> Either way, I noticed I sent a silly placeholder for the help string
> in Config.in in my patch, so even if you decide to have usbip external
> to linux-tools, don't apply just yet . I'll conjure a real help string
> and send a v2 soon :)
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
