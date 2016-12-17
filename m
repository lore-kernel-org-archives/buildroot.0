From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat, 17 Dec 2016 14:40:02 +0100
Subject: [Buildroot] [Patch v2 1/9] skalibs: new package
In-Reply-To: <20161213225402.37334028@free-electrons.com>
References: <1481397650-14664-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1481397650-14664-2-git-send-email-eric.le.bihan.dev@free.fr>
 <20161210214641.05e6af92@free-electrons.com>
 <20161211181827.GA23661@itchy>
 <20161213225402.37334028@free-electrons.com>
Message-ID: <20161217134002.GA727@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16-12-13 22:54:02, Thomas Petazzoni wrote:

[...]

> > > What is this static lib dir thing? If skalibs installs its static
> > > libraries in $(STAGING_DIR)/usr/lib/skalibs/ instead of the default
> > > $(STAGING_DIR)/usr/lib, then the linker will not find them.
> >
> > The skarnet libraries are installed in a subdirectory of /usr/lib and
> > the skarnet build system is able to find them properly. But they won't
> > be found when cleaning up the target file system, hence the custom hook.
>
> OK (it would be good to mention that in the commit log perhaps).
>
> And so it's really only the static library that needs to be removed:
> the shared library is really not built/installed when shared libraries
> are not enabled in the Buildroot configuration?

Yes. When shared libraries are disabled in Buildroot configuration, they
are not built.

[...]

> > Besides, some execline helpers use hardcoded paths containing the
> > prefix.
> >
> > Hence the trick to use --prefix=/usr and DESTDIR at installation time,
> > which would lead s6-rc-compile to generate proper scripts and avoid
> > helpers location problems (though that would lead to other host variants
> > of skarnet programs not working, but we are not interesting in those).
> >
> > Anyway, it looks like --prefix=$(HOST_DIR)/usr can be used, as I've
> > noticed a very interesting --shebangdir= option in the ./configure
> > script of execline. So, I'll rework this part.
>
> Ah, exactly what I was proposing earlier :-)

I've modified the package Makefiles for skalibs, execline, s6 and s6-rc
to use --prefix=$(HOST_DIR)/usr when building the host variants:

 - for execline: adding --shebangdir=/usr/bin makes it generates correct
   scripts for the target.
 - for s6-rc: adding --libexecdir=/usr/libexec makes it generates
   correct scripts/helpers for the target (thought some programs are not
   usable on the host, but they are not used, so they will not be
   installed).

So, I can get rid of the $(DESTDIR) trick in host variants.

> Do you think you can respin soon those patches? Your previous iteration
> was from August this year. I know we are also not very fast at applying
> patches, so it's hard to criticize anything here. But when there are
> 5-6 months between two iterations of a series, we completely lose the
> context, and it's almost as-if the review restart from scratch. So if
> you can post the new iterations a bit faster, the context is still
> fresh, and there's a higher chance that it will get merged soon.

There has been a long delay between iterations because it allowed the
maintainer to add proper support for uclibc-ng. And there are few
releases during a year. So I waited until the "Fall 2016 release", so I
could remove the libc limitations set in the previous patch series.

Next respin will be availble before Christmas :-D

Best regards,

--
ELB
