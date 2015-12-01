From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Tue, 1 Dec 2015 08:17:56 -0200
Subject: [Buildroot] [PATCH] musl: add a sys/queue.h implementation
In-Reply-To: <20151201043806.GA2193@tarshish>
References: <1448924535-8093-1-git-send-email-sergio.prado@e-labworks.com>
 <20151201043806.GA2193@tarshish>
Message-ID: <CANu7NGvZavDSGeeYLrn_K_zo0J8+Zr1WCVYshU+EJ=p4jAkG9g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

2015-12-01 2:38 GMT-02:00 Baruch Siach <baruch@tkos.co.il>:

> Hi Sergio,
>
> On Mon, Nov 30, 2015 at 09:02:15PM -0200, Sergio Prado wrote:
> > Musl does not provide a 'sys/queue.h' implementation, and this has been
> > a problem for packages that depend on it.
> >
> > So lets create a package called sys-queue that will install 'sys/queue.h'
> > in the staging directory when enabled.
> >
> > Musl toolchain and external toolchain packages will depend on this
> > package, so that 'sys/queue.h' will be always installed when compiling
> > with a musl based toolchain.
> >
> > Tested on ARM and x86 in the following cases:
> >   - Buildroot musl toolchain.
> >   - External musl toolchain without 'sys/queue.h'.
> >   - External musl toolchain with 'sys/queue.h'.
> >
> > Fixes:
> >
> http://autobuild.buildroot.net/results/24bad2d06ab40024dacf136bee722072d587f84e
> >
> > And possibly many others.
> >
> > Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
>
> Thanks for working on this.
>
> > +define SYS_QUEUE_INSTALL_STAGING_CMDS
> > +     if [ ! -f $(STAGING_DIR)/usr/include/sys/queue.h ]; then \
>
> We generally don't check for existence of files in target/staging, just
> overwrite them. Is there a reason to do this here? As I understand
> sys-queue
> is now a dependency of the toolchain, so if the toolchain provides
> sys/queue.h
> it will overwrite this one anyway.
>

You are right. Initially, sys-queue would be installed after the external
toolchain package, so this would prevents from overriding the toolchain's
sys/queue.h implementation. But that's not the case anymore, so I'm OK with
removing this check.

Thanks!


>
> > +             $(INSTALL) -D -m 0644 package/sys-queue/queue.h \
> > +                     $(STAGING_DIR)/usr/include/sys/queue.h; \
> > +     fi
> > +endef
>
> baruch
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open
> Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151201/dc644e9e/attachment.html>
