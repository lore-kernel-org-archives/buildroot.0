From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 5 Jan 2021 17:20:39 +0100
Subject: [Buildroot] [PATCHv2 1/2] package/zstd: build multithreaded
 library if supported
In-Reply-To: <20210102184926.2e28fd81@windsurf>
References: <20201204095703.4714-1-patrickdepinguin@gmail.com>
 <20210102184926.2e28fd81@windsurf>
Message-ID: <CAAXf6LVEVD=be-_HK8rq+-ybAh=7B_PPqBCjjkZih6mGgy9WoQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

El s?b, 2 ene 2021 a las 18:49, Thomas Petazzoni
(<thomas.petazzoni@bootlin.com>) escribi?:
>
> Hello Thomas,
>
> On Fri,  4 Dec 2020 10:57:01 +0100
> Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:
>
> > From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> >
> > libzstd.so is built without multi-threading support by default.
> > The 'HAVE_THREAD' flag is not respected by lib/Makefile, only by
> > programs/Makefile.
> >
> > Use the %-mt recipe in lib/Makefile to enable multithreading.
> >
> > Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>
> Your patch is fixing this for the target variant of zstd, but to me it
> seems like the host variant also builds the library and programs
> separately, so it is probably affected by the same issue, isn't it ?

The main driver for this series was the ever-expanding size of zstd,
worsened by the fact that the binary was using static linking.
For host, there is generally no size restriction, at least not of this order.

I'm not sure about host-mtd, and host-squashfs, but for the host-zstd
command-line tool itself, it is important that the binary and library
are either both built for single-threaded or both for multi-threaded.
This means that we'd have to pass HAVE_THREAD=1 for the host
compilation of zstd as well. Probably possible, not sure why it is not
done today.

>
> Also, in your PATCH 2/2 you mention that zstd also supports cmake and
> meson. Would switching to cmake-package or meson-package simplify a bit
> this issue and generally what zstd.mk looks like ?

The developers mention in certain issues that 'make' is the official
build system, and that the other ones (like cmake and meson) are
'community supported'.
So while their make logic is not clean at all, I would not necessarily
trust non-official solutions better.

Meanwhile, a FreeBSD developer proposed an alternative patch on the
corresponding issue:
https://github.com/facebook/zstd/issues/2261#issuecomment-753632465

So I suggest to hold this patch for a while, I'll try to get it moving upstream.

Thanks,
Thomas


>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
