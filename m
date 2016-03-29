From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Tue, 29 Mar 2016 20:35:15 +0200
Subject: [Buildroot] [PATCH] package/libxslt: fix static build
In-Reply-To: <20160329195651.4d02a33f@free-electrons.com>
References: <1459199363-28640-1-git-send-email-joerg.krause@embedded.rocks>
 <20160329030113.55474130@free-electrons.com>
 <20160329145214.6a434016@free-electrons.com>
 <20160329174453.GS2637@tarshish>
 <20160329195651.4d02a33f@free-electrons.com>
Message-ID: <1459276515.4376.7.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Di, 2016-03-29 at 19:56 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 29 Mar 2016 20:44:53 +0300, Baruch Siach wrote:
> 
> > 
> > On Tue, Mar 29, 2016 at 02:52:14PM +0200, Thomas Petazzoni wrote:
> > > 
> > > On Tue, 29 Mar 2016 03:01:13 +0200, Thomas Petazzoni wrote:
> > > > 
> > > > I've applied because it indeed works, but to be honest, I don't
> > > > understand why: I don't quite understand how this can fix the
> > > > build.
> > > > All what this option does is:
> > > > 
> > > > AC_ARG_WITH(libxml-libs-prefix,
> > > > ????????[??--with-libxml-libs-prefix=[PFX]??????Specify
> > > > location of libxml libs],
> > > > ????????LIBXML_LIBS="-L$withval"
> > > > )
> > > > 
> > > > I.e, it will add -L$(STAGING_DIR)/usr/lib to the gcc options.
> > > > But that
> > > > is completely useless because $(STAGING_DIR)/usr/lib is already
> > > > the
> > > > default search path for libraries. So why does it fix the
> > > > build? I
> > > > don't know.
> > > Baruch has posted another patch that I believe is supposed to fix
> > > the
> > > same problem: http://patchwork.ozlabs.org/patch/602529/.
> > > 
> > > Baruch, J?rg, could you have a closer look at this problem, and
> > > see
> > > which solution, between the one from J?rg and the one from Baruch
> > > is
> > > actually correct ?
> > The libxml2 patch fixes a bug in xml2-config generation. It fixes
> > static build?
> > also for raptor, and possibly other libxml2 users (for which
> > libxml2 is only?
> > an optional dependency, so we don't see hard failures). So I think
> > that the?
> > libxml2 patch should be applied regardless of this one.
> Could one of you check if, after the xml2 patch has been applied, the
> libxslt fix from J?rg is still needed?
> 

It builds successfully with xml2 patch applied (without xlst fix).

The difference between the building?libxslt with fix (after applying
libxml2 patch) is the value for?LIBXML_LIBS:

.. without:
S["LIBXML_LIBS"]=" -lxml2
-L/home/joerg/Development/git/buildroot/output/host/usr/arm-buildroot-
linux-uclibcgnueabi/sysroot/usr/lib -llzma -pthread -lm"

.. with:
S["LIBXML_LIBS"]="-
L/home/joerg/Development/git/buildroot/output/host/usr/arm-buildroot-
linux-uclibcgnueabi/sysroot/usr/lib -lxml2
-L/home/joerg/Development/git/build"\
"root/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib 
-llzma -pthread -lm"

But I'm not sure if it makes any difference.

J?rg
