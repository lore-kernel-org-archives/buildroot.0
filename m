From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Tue, 29 Mar 2016 15:52:23 +0200
Subject: [Buildroot] [PATCH] package/libxslt: fix static build
In-Reply-To: <20160329145214.6a434016@free-electrons.com>
References: <1459199363-28640-1-git-send-email-joerg.krause@embedded.rocks>
 <20160329030113.55474130@free-electrons.com>
 <20160329145214.6a434016@free-electrons.com>
Message-ID: <1459259543.5308.10.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Di, 2016-03-29 at 14:52 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 29 Mar 2016 03:01:13 +0200, Thomas Petazzoni wrote:
> 
> > 
> > I've applied because it indeed works, but to be honest, I don't
> > understand why: I don't quite understand how this can fix the
> > build.
> > All what this option does is:
> > 
> > AC_ARG_WITH(libxml-libs-prefix,
> > ????????[??--with-libxml-libs-prefix=[PFX]??????Specify location of
> > libxml libs],
> > ????????LIBXML_LIBS="-L$withval"
> > )
> > 
> > I.e, it will add -L$(STAGING_DIR)/usr/lib to the gcc options. But
> > that
> > is completely useless because $(STAGING_DIR)/usr/lib is already the
> > default search path for libraries. So why does it fix the build? I
> > don't know.
> Baruch has posted another patch that I believe is supposed to fix the
> same problem: http://patchwork.ozlabs.org/patch/602529/.

Sorry, I was not aware of this patch.

> Baruch, J?rg, could you have a closer look at this problem, and see
> which solution, between the one from J?rg and the one from Baruch is
> actually correct ?

The problem is that xml2-config does not work for cross-compilation:

$ ./output/host/usr/bfin-buildroot-uclinux-clibc/sysroot/usr//bin/xml2-
config --libs
-lxml2 -lm

> I must say I remain surprised that the version proposed by J?rg
> actually works, but it does. The version posted by Baruch seems more
> correct to me.

I am not quite sure why it works either. I guess it has something todo
with how libtool works, as libtool sets the correct dependency_libs in
libxslt.la if '--with-libxml-libs-prefix' is used:

# Libraries that this one depends upon.
dependency_libs=' -L/home/joerg/git/buildroot/output/host/usr/bfin-
buildroot-uclinux-uclibc/sysroot/usr/lib
/home/joerg/git/buildroot/output/host/usr/bfin-buildroot-uclinux-
uclibc/sysroot/usr/lib/libxml2.la
/home/joerg/git/buildroot/output/host/usr/bfin-buildroot-uclinux-
uclibc/sysroot/usr/lib/liblzma.la -lm'

.. whereas, whithout '--with-libxml-libs-prefix:

# Libraries that this one depends upon.
dependency_libs=' -lxml2 -lm'

> However, one drawback of the solution proposed by Baruch is that even
> when doing dynamic linking, the application linking against libxml2
> will
> be directly linking against liblzma, which is not necessary. But
> that's
> already what happens for libz, libpthread, and the other libraries
> listed in XML_LIBS, so from that point of view, Baruch solution is in
> line with what libxml2 is already doing.
> 
> Ideally, xml2-config should have a --static option, or even better,
> drop xml2-config entirely and use pkg-config :-)
> 

Patching libxlst to use pkg-config is what OE and yocto are doing [1]
as libxml2 does have a correct .pc file.

[1]?http://git.yoctoproject.org/cgit.cgi/poky/plain/meta/recipes-suppor
t/libxslt/libxslt

Best regards
J?rg Krause
