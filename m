From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 8 May 2020 21:59:03 +0200
Subject: [Buildroot] [PATCH] release: don't include temp files
In-Reply-To: <CANxTyt633VUb9bREaU8mq6wPwxXtMA2CkZwtkNufzH75fCK5gA@mail.gmail.com>
References: <20200508083220.18927-1-yann.morin.1998@free.fr>
 <CANxTyt633VUb9bREaU8mq6wPwxXtMA2CkZwtkNufzH75fCK5gA@mail.gmail.com>
Message-ID: <20200508195903.GO12536@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Danomi, All,

On 2020-05-08 09:59 -0400, Danomi Manchego spake thusly:
> On Fri, May 8, 2020 at 4:32 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > When we prepare the release, we generate the manual in various formats,
> > so that it can be consulted locally without needing the miriads of tools
> > needed to generate it.
> >
> > However, this creates the temporary .br2-external.* files in the output
> > directory, and those end up in the release tarball.
> >
> > This is not a problem in practice, but is not clean.
> >
> > Run 'distclean' in the output directory, to get rid of everything but
> > the generated documentation.
> >
> > Reported-by: Danomi Manchego <danomimanchego123@gmail.com>
> > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> > Cc: Peter Korsgaard <peter@korsgaard.com>
> > ---
> >  Makefile | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 3aa4ba4532..2da34b5305 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1190,7 +1190,7 @@ release: OUT = buildroot-$(BR2_VERSION)
> >  release:
> >         git archive --format=tar --prefix=$(OUT)/ HEAD > $(OUT).tar
> >         $(MAKE) O=$(OUT) manual-html manual-text manual-pdf
> > -       $(MAKE) O=$(OUT) clean
> > +       $(MAKE) O=$(OUT) distclean
> 
> I downloaded the latest rc1,

2020.02-rc1 does not have the fix.

> just to do "make distclean", see the
> files disappear, and add my Tested-by - but I found that the files
> were not deleted.  The distclean target does this:
> 
>     rm -rf $(TOPDIR)/dl $(BR2_CONFIG) $(CONFIG_DIR)/.config.old
> $(CONFIG_DIR)/..config.tmp \
>         $(CONFIG_DIR)/.auto.deps $(BASE_DIR)/.br2-external.*
> 
> And BASE_DIR is set to $(CANONICAL_O) - but the .br2-external.* are
> *not* in the output directory, they are the buildroot directory
> itself.  Maybe it should delete $(CONFIG_DIR)/.br2-external.* instead
> (or also)?

If you want to test, you should not use a released tarball; instead, you
should try to generate one:

    $ make relase
    $ tar tzf buildroot-2020.05-rc1.tar.gz |grep -E '\.br2-external'
    [empty]

So the temporary files will no longer be part of the next releases.

As for 2020.05-rc1, distclean does not remove them, because they are not
created where they appear in the release. In the release, they appear at
the top of buildroot's directory, becasue when we make the release, we
use a hack to include the generated documentatio in the archive; see the
rule used to generate the release:

    https://git.buildroot.org/buildroot/tree/Makefile#n1186

and subsequent lines...

Regards,
Yann E. MORIN.

> Danomi -
> 
> 
> 
> >         tar rf $(OUT).tar $(OUT)
> >         gzip -9 -c < $(OUT).tar > $(OUT).tar.gz
> >         bzip2 -9 -c < $(OUT).tar > $(OUT).tar.bz2
> > --
> > 2.20.1
> >

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
