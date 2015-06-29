From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 29 Jun 2015 19:47:37 +0200
Subject: [Buildroot] [PATCH] uclibc: deprecate locale support
In-Reply-To: <20150628150822.46f6861e@free-electrons.com>
References: <20150628071417.GA13377@waldemar-brodkorb.de>
 <20150628140153.4a657fdd@free-electrons.com>
 <20150628125837.GX31780@waldemar-brodkorb.de>
 <20150628150822.46f6861e@free-electrons.com>
Message-ID: <20150629174736.GE2778@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Thomas Petazzoni wrote,

> Hello,
> 
> On Sun, 28 Jun 2015 14:58:37 +0200, Waldemar Brodkorb wrote:
> 
> > I think no package really needs locale support in the C library.
> > 
> > May be there is some misunderstanding about the locale stuff.
> > Here is how I understand the stuff.
> > 
> > I think we have mixed up two different things here:
> > - iconv: perform character set conversion, needed for a lot of
> >   packages, f.e. Kodi. Is included in Glibc and Musl. Libiconv can
> >   be used with uClibc-ng/uClibc.
> > - locale: defines the user's language, country, ..
> >   If you want f.e. german error messages on your embedded system
> >   you would need locale support and locale data.
> >   env LC_ALL=de_DE ls foo
> 
> Fully agreed here. But in uClibc, enabling locale support actually
> gives both: the iconv functions *and* the locale support itself.

Yeah, unfortunately both is coupled together as another research has
proofed.
 
So the best option for 1.0.x to fix the build issue.
I tracked it down to a parallel build issue. When number of jobs
is set to 1, the error does not happen.
I thought using the make target pregen instead of header would 
be a good workaround, but the problem still exist in Xtensa builds.
The ARM builds work after this change.

Any parallel make gurus available?
It only happens hen LOCALE support is activated.

best regards
 Waldemar
