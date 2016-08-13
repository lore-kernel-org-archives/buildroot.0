From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 13 Aug 2016 17:27:53 +0200
Subject: [Buildroot] [PATCH] package/ustr: don't run ldconfig (and
 certainly not concurrently)
In-Reply-To: <28ed24c9-fb7d-e0ce-653d-993c01d1d341@mind.be>
References: <1471096801-9875-1-git-send-email-yann.morin.1998@free.fr>
 <28ed24c9-fb7d-e0ce-653d-993c01d1d341@mind.be>
Message-ID: <20160813152753.GB5734@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2016-08-13 17:00 +0200, Arnout Vandecappelle spake thusly:
>  [Back from a month in Benin with almost no Internet access - yey!]
> 
> On 13-08-16 16:00, Yann E. MORIN wrote:
> > The ustr Makefile.in (as introduced by the Debian patch we apply), is
> > probably not parallel-safe:
> [snip]
> > We fix that in three ways:
> > 
> >   - first, no need to run ldconfig at all in Buildroot, we just pass
> >     LDCONFIG=/bin/true ;
> 
>  For Buildroot purposes, this is actually sufficient, no?

Right. But while at it, just fix the things properly for upstream, hence
the following patches. Except...

> >   - second, no need to run LDCONFIG more than once, so we patch ustr to
> >     only run it once, once all libs have been installed;
> > 
> >   - third, we patch ustr to use ln -f to redo the symlink if it already
> >     exists.
> > 
> > Fixes (hopefully, since I was not even able to reproduce the failure):
> >     http://autobuild.buildroot.org/?reason=ustr-1.0.4
> >     http://autobuild.buildroot.org/results/936/93626f55625ed7900c147bfd79ff7802366639b1/
> >     http://autobuild.buildroot.org/results/18b/18b6ec537da9e9055f58a8649c0719dc64df1bcf/
> >     [...]
> > 
> > [0] http://lists.busybox.net/pipermail/buildroot/2016-May/161923.html
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> > ---
> >  package/ustr/0001-run-ldconfig-only-once.patch | 34 ++++++++++++++++++++++
> >  package/ustr/0002-ln-force.patch               | 39 ++++++++++++++++++++++++++
> >  package/ustr/ustr.mk                           |  2 ++
> >  3 files changed, 75 insertions(+)
> >  create mode 100644 package/ustr/0001-run-ldconfig-only-once.patch
> >  create mode 100644 package/ustr/0002-ln-force.patch
> > 
> > diff --git a/package/ustr/0001-run-ldconfig-only-once.patch b/package/ustr/0001-run-ldconfig-only-once.patch
> > new file mode 100644
> > index 0000000..594f985
> > --- /dev/null
> > +++ b/package/ustr/0001-run-ldconfig-only-once.patch
> > @@ -0,0 +1,34 @@
> > +Makefile: run ldconfig only once
> > +
> > +No need to run ldconfig for each library we install; we can run it once,
> > +when both libs are installed.
> > +
> > +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
>  Upstream status?
> 
>  Upstream is git so we prefer git patches.

... upstream has been dead since 2008. :-(

Besides, the Makefile.in comes from the Debian patch we apply, so it is
not upstream.

So, probably useless to send upstream.

I was going to send it to Debian, though...

[--SNIP--]
> > diff --git a/package/ustr/0002-ln-force.patch b/package/ustr/0002-ln-force.patch
> > new file mode 100644
> > index 0000000..18afe4d
> > --- /dev/null
> > +++ b/package/ustr/0002-ln-force.patch
> > @@ -0,0 +1,39 @@
> > +Makefile: forcibly create library symlinks
> > +
> > +Aboids failures when the symlink already exists (it is re-symlinked).
> > +
> > +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > +
> > +diff -durN ustr-1.0.4.orig/Makefile.in ustr-1.0.4/Makefile.in
> > +--- ustr-1.0.4.orig/Makefile.in	2016-08-13 15:54:40.220043291 +0200
> > ++++ ustr-1.0.4/Makefile.in	2016-08-13 15:55:25.600641886 +0200
> > +@@ -427,11 +427,11 @@
> > + 		install -m 644 -t $(DESTDIR)$(libdir) $(OPT_LIB_STATIC)
> > + 		install -m 755 -t $(DESTDIR)$(libdir) $(OPT_LIB_SHARED)
> > + 		-rm -f $(DESTDIR)$(libdir)/$(OPT_LIB_SHARED_NAME)
> > +-		ln -s $(OPT_LIB_SHARED) $(DESTDIR)$(libdir)/$(OPT_LIB_SHARED_NAME)
> > ++		ln -fs $(OPT_LIB_SHARED) $(DESTDIR)$(libdir)/$(OPT_LIB_SHARED_NAME)
> 
>  This is fairly useless. 'ln -f' just does stat - unlink - symlink, so almost
> the same as 'rm -f; ln -s'. There is a timing difference, so it makes the race
> condition somewhat more difficult to hit, but it still exists. There is no
> race-free way to do parallel symlinks.

But there should be no race now, since we no longer do ldconfig.

Yes, the rm -f may be supperflouous, unless the symlink was read-only [0],
in which case ln -f would not remove it.

[0] this is technically possible: fchmodat() has a AT_SYMLINK_NOFOLLOW
    flag, implying that it should be possible to do change the mode of
    a symlink without dereferencing it, but it is not yet implemented
    under Linux (others systems may be able to do so).

Of course, this is all hypotetical so far. ;-)

But the reasons I wrote it that way:
  - that's the least invasive change,
  - that's what Thomas suggested back in May.

Regards,
Yann E. MORIN.

> > + 		-rm -f $(DESTDIR)$(libdir)/$(OPT_LIB_SHAREDEV)
> > +-		ln -s $(OPT_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(OPT_LIB_SHAREDEV)
> > ++		ln -fs $(OPT_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(OPT_LIB_SHAREDEV)
> > + 		-rm -f $(DESTDIR)$(libdir)/$(OPT_LIB_SHAREDEV_BSO)
> > +-		ln -s $(OPT_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(OPT_LIB_SHAREDEV_BSO)
> > ++		ln -fs $(OPT_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(OPT_LIB_SHAREDEV_BSO)
> > + 		install -pm 644 -t $(DESTDIR)$(libdir)/pkgconfig ustr.pc
> > + 
> > + install-dbg-lib: $(DBG_LIB_STATIC) $(DBG_LIB_SHARED) ustr-debug.pc
> > +@@ -439,11 +439,11 @@
> > + 		install -m 644 -t $(DESTDIR)$(libdir) $(DBG_LIB_STATIC)
> > + 		install -m 755 -t $(DESTDIR)$(libdir) $(DBG_LIB_SHARED)
> > + 		-rm -f $(DESTDIR)$(libdir)/$(DBG_LIB_SHARED_NAME)
> > +-		ln -s $(DBG_LIB_SHARED) $(DESTDIR)$(libdir)/$(DBG_LIB_SHARED_NAME)
> > ++		ln -fs $(DBG_LIB_SHARED) $(DESTDIR)$(libdir)/$(DBG_LIB_SHARED_NAME)
> > + 		-rm -f $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV)
> > +-		ln -s $(DBG_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV)
> > ++		ln -fs $(DBG_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV)
> > + 		-rm -f $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV_BSO)
> > +-		ln -s $(DBG_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV_BSO)
> > ++		ln -fs $(DBG_LIB_SHARED_NAME) $(DESTDIR)$(libdir)/$(DBG_LIB_SHAREDEV_BSO)
> > + 		install -pm 644 -t $(DESTDIR)$(libdir)/pkgconfig ustr-debug.pc
> > + 
> > + install-common:
> > diff --git a/package/ustr/ustr.mk b/package/ustr/ustr.mk
> > index 174f055..1d629ab 100644
> > --- a/package/ustr/ustr.mk
> > +++ b/package/ustr/ustr.mk
> > @@ -23,5 +23,7 @@ USTR_INSTALL_STAGING = YES
> >  # 'all-shared' to the default 'all' rule.
> >  USTR_MAKE_OPTS = all all-shared
> >  
> > +USTR_MAKE_OPTS += LDCONFIG=/bin/true
> 
>  Perhaps on the same line as _MAKE_OPTS above?
> 
>  Regards,
>  Arnout
> 
> > +
> >  $(eval $(autotools-package))
> >  $(eval $(host-autotools-package))
> > 
> 
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
