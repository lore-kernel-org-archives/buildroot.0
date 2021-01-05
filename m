From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 5 Jan 2021 17:47:57 +0100
Subject: [Buildroot] [PATCHv2 1/2] package/zstd: build multithreaded
 library if supported
In-Reply-To: <20210105173624.43134419@windsurf.home>
References: <20201204095703.4714-1-patrickdepinguin@gmail.com>
 <20210102184926.2e28fd81@windsurf>
 <CAAXf6LVEVD=be-_HK8rq+-ybAh=7B_PPqBCjjkZih6mGgy9WoQ@mail.gmail.com>
 <20210105173624.43134419@windsurf.home>
Message-ID: <CAAXf6LVcck=EA8SQZ5QGKgQgE_oO4WV8XWbaEPqX50JtJ4Wsmw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jan 5, 2021, 17:36 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
wrote:

> Hello,
>
> On Tue, 5 Jan 2021 17:20:39 +0100
> Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:
>
> > > Your patch is fixing this for the target variant of zstd, but to me it
> > > seems like the host variant also builds the library and programs
> > > separately, so it is probably affected by the same issue, isn't it ?
> >
> > The main driver for this series was the ever-expanding size of zstd,
> > worsened by the fact that the binary was using static linking.
> > For host, there is generally no size restriction, at least not of this
> order.
>
> Right, but my point was not about size here but
> correctness/functionality.
>
> > I'm not sure about host-mtd, and host-squashfs, but for the host-zstd
> > command-line tool itself, it is important that the binary and library
> > are either both built for single-threaded or both for multi-threaded.
> > This means that we'd have to pass HAVE_THREAD=1 for the host
> > compilation of zstd as well. Probably possible, not sure why it is not
> > done today.
>
> This is the point I missed: the host variant is not built with any
> HAVE_THREAD= value, so I suppose it's built single-threaded, which is
> why it works fine as it is today.
>
> So your patch is correct in fixing just the target package to use the
> %-mt make targets, because only the target package is built with thread
> support when available.
>
> Optionally, we could have a separate patch that turns on building with
> HAVE_THREAD=1 for the host package, but it's a separate matter.
>
> Makes sense.
>
> > > Also, in your PATCH 2/2 you mention that zstd also supports cmake and
> > > meson. Would switching to cmake-package or meson-package simplify a bit
> > > this issue and generally what zstd.mk looks like ?
> >
> > The developers mention in certain issues that 'make' is the official
> > build system, and that the other ones (like cmake and meson) are
> > 'community supported'.
> > So while their make logic is not clean at all, I would not necessarily
> > trust non-official solutions better.
> >
> > Meanwhile, a FreeBSD developer proposed an alternative patch on the
> > corresponding issue:
> > https://github.com/facebook/zstd/issues/2261#issuecomment-753632465
> >
> > So I suggest to hold this patch for a while, I'll try to get it moving
> upstream.
>
> OK. This is for PATCH 2/2, right ?
>

Yes, sorry for the confusion. Patch 1 can proceed, and patch 2 to be held.

Thanks,
Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210105/a2148658/attachment.html>
