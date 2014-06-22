From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Jun 2014 19:29:56 +0200
Subject: [Buildroot] [PATCH] package/knock: fix static build with libusb
In-Reply-To: <20140622190830.5b997d32@free-electrons.com>
References: <1403456696-8122-1-git-send-email-yann.morin.1998@free.fr>
 <20140622190830.5b997d32@free-electrons.com>
Message-ID: <20140622172956.GB21768@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-06-22 19:08 +0200, Thomas Petazzoni spake thusly:
> On Sun, 22 Jun 2014 19:04:56 +0200, Yann E. MORIN wrote:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > 
> > knock depends on libpcap, that has an optional dependency on libusb.
> > Alas, libpcap does not install a .pc file, so knock does not know
> > that it should link with -lusb-1.0.
> > 
> > When linking dynamically, this is not an issue, since the linker does
> > follow the DT_NEEDED tags of libpcap, and thus pulls libusb-1.0 in at
> > the same time. And since linusb uses threads, libpthread is pulled in
> > as well.
> > 
> > However, when linking statically, all of this fails.
> > 
> > Fix that by telling knock's ./configure what libraries to link with
> > when doing a static build and libusb is enabled.
> > 
> > Fixes:
> >     http://autobuild.buildroot.net/results/1eb/1eb877ebd9469c9261bf114fc7733819ae3fd562/
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> > ---
> >  package/knock/knock.mk | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/package/knock/knock.mk b/package/knock/knock.mk
> > index 8d2b41e..ace23fa 100644
> > --- a/package/knock/knock.mk
> > +++ b/package/knock/knock.mk
> > @@ -10,4 +10,8 @@ KNOCK_LICENSE = GPLv2+
> >  KNOCK_LICENSE_FILES = COPYING
> >  KNOCK_DEPENDENCIES = libpcap
> >  
> > +ifeq ($(BR2_PREFER_STATIC_LIB)$(BR2_PACKAGE_LIBUSB),yy)
> > +KNOCK_CONF_OPT = LIBS="-lusb-1.0 -pthread"
> > +endif
> 
> Thanks. However, I've already stated that before, but I continue to
> wonder if this is the right way to fix this. Shouldn't we instead fix
> libcap by adding a .pc file and submit that upstream, instead of adding
> more and more LIBS="-lblah" all over the place? Of course, that's not
> a comment targeted specifically at your patch (we're doing the same
> thing for many other packages), but I'm wondering if that's the right
> thing to do.

Well, in an ideal world, that'd be good. But even if libpcap did provide
a .pc file, then we'd need to patch knock to use pkg-config, which it
currently does not.

But I anyway withdraw this patch, in favour to the one recently sent by
Baruch:
    http://patchwork.ozlabs.org/patch/362567/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
