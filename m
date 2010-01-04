From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Mon, 4 Jan 2010 14:29:12 +0100
Subject: [Buildroot] [PATCH] Permit building grub with an external
	toolchain.
In-Reply-To: <1262611334.3853.11.camel@venture>
References: <1262472376.23927.19.camel@venture>
	<1262477625.23193.2.camel@coalu.atr>
	<1262484948.23927.25.camel@venture>
	<1262491694.23193.10.camel@coalu.atr>
	<1262526218.23927.27.camel@venture> <1262610104.3853.6.camel@venture>
	<4d28d4b51001040509o5b4bde2i630e2d46c9747a2@mail.gmail.com>
	<1262611334.3853.11.camel@venture>
Message-ID: <4d28d4b51001040529x5a9ae432rbe467128701d1fde@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry, I didn't catch the --prefix=/

On Mon, Jan 4, 2010 at 2:22 PM, Clark Rawlins <clark.rawlins@escient.com>wrote:

> On Mon, 2010-01-04 at 14:09 +0100, Lionel Landwerlin wrote:
> > Why didn't you remove :
> > define GRUB_CONFIGURE_CMDS
> >       (cd $(GRUB_SRCDIR) && rm -rf config.cache && \
> >       $(TARGET_CONFIGURE_OPTS) \
> >       $(TARGET_CONFIGURE_ARGS) \
> >       $(GRUB_CONF_ENV) \
> >       ./configure \
> >
> >               --target=$(GNU_TARGET_NAME) \
> >               --host=$(GNU_TARGET_NAME) \
> >               --build=$(GNU_HOST_NAME) \
> >               --prefix=/ \
> >               --mandir=/usr/man \
> >               --infodir=/usr/info \
> >               $(DISABLE_DOCUMENTATION) \
> >               $(DISABLE_NLS) \
> >
> >               $(DISABLE_LARGEFILE) \
> >               $(DISABLE_IPV6) \
> >               $(QUIET) $(GRUB_CONF_OPT) \
> >       )
> > endef
> > This might be handled by the autotool infrastructure.
> > Otherwise it looks good, thx !
>
> I would have but I didn't see a way to override the --prefix argument to
> configure.  Also the TARGET_CONFIGURE_ENV needed to be modified to
> include GRUB_CFLAGS defined earlier in the make fragment.  Modifying the
> CFLAGS also caused the config.cache to not match the global
> configuration cache so I couldn't use that either.
>
> Of course if I missed a better way of handling these issues I am open to
> it.
>
> >
> > --
> > Lionel Landwerlin
> >
> > On Mon, Jan 4, 2010 at 2:01 PM, Clark Rawlins
> > <clark.rawlins@escient.com> wrote:
> >         Here is my attempt to use the autotools macros.
> >         I look forward to any discussion, suggestions for improvement
> >         etc.
> >
> >         I attach the whole file since it is effectively a rewrite.  If
> >         it is
> >         acceptable I will submit as a git diff against head.
> >
> >
> >         On Sun, 2010-01-03 at 08:43 -0500, Clark Rawlins wrote:
> >         > Okay,
> >         >
> >         > I've started looking at this but it isn't clear to me how to
> >         handle the
> >         > following:
> >         >
> >         > $(GRUB_DIR)/$(GRUB_BINARY): $(GRUB_DIR)/.configured
> >         >       $(MAKE) CC=$(TARGET_CC) -C $(GRUB_DIR)
> >         >       rm -f $(GRUB_DIR)/$(GRUB_BINARY)
> >         >       $(MAKE) CC=$(TARGET_CC) CFLAGS+=-static -C
> >         $(GRUB_DIR)/grub grub
> >         >       mkdir -p $(dir $(STAGING_DIR)/$(GRUB_TARGET_BINARY))
> >         >       mv $(GRUB_DIR)/$(GRUB_BINARY)
> >         $(STAGING_DIR)/$(GRUB_TARGET_BINARY).static
> >         >       $(MAKE) CC=$(TARGET_CC) -C $(GRUB_DIR)/grub
> >         >
> >         > This builds everything dynamically linked first then builds
> >         the grub binary statically.
> >         > Is the right way to do this to override the target
> >         after/before calling the autotools macro?
> >         >
> >         >
> >         > On Sun, 2010-01-03 at 05:08 +0100, Lionel Landwerlin wrote:
> >         > > Here is one example :
> >         > >
> >         > >
> >
> http://git.buildroot.org/buildroot/commit/?id=21bab8862f3c2906af347e5a993ce4cd36c1b063
> >         > >
> >         > > You can find a lot like this in the recent git history.
> >         > > I'm think to the new infrastructure because it provides
> >         all the glue to
> >         > > configure the package, especially the 2 lines you added.
> >         > >
> >         > > Regards,
> >         > >
> >         > >
> >         > > Le samedi 02 janvier 2010 ? 21:15 -0500, Clark Rawlins a
> >         ?crit :
> >         > > > I could give that a shot.  I thought as a start I would
> >         go with the
> >         > > > smallest change possible.  Any suggestions for an
> >         example to look at for
> >         > > > switching grub to the autotools macros?
> >         > > >
> >         > > >
> >         > > > On Sun, 2010-01-03 at 01:13 +0100, Lionel Landwerlin
> >         wrote:
> >         > > > > Le samedi 02 janvier 2010 ? 17:46 -0500, Clark Rawlins
> >         a ?crit :
> >         > > > > > Grub build failed at the link stage because it
> >         > > > > > couldn't find libcurses. Adding these variable
> >         > > > > > invocations to the configure line make it work.
> >         > > > > >
> >         > > > > > Signed-off-by: Clark Rawlins
> >         <clark.rawlins@escient.com>
> >         > > > > > ---
> >         > > > > >  target/x86/grub/grub.mk |    2 ++
> >         > > > > >  1 files changed, 2 insertions(+), 0 deletions(-)
> >         > > > > >
> >         > > > > > diff --git a/target/x86/grub/grub.mk
> >         b/target/x86/grub/grub.mk
> >         > > > > > index af46244..21f089f 100644
> >         > > > > > --- a/target/x86/grub/grub.mk
> >         > > > > > +++ b/target/x86/grub/grub.mk
> >         > > > > > @@ -81,6 +81,8 @@ $(GRUB_DIR)/.unpacked:
> >         $(DL_DIR)/$(GRUB_SOURCE) $(DL_DIR)/$(GRUB_PATCH)
> >         > > > > >  $(GRUB_DIR)/.configured: $(GRUB_DIR)/.unpacked
> >         > > > > >       (cd $(GRUB_DIR); rm -rf config.cache; \
> >         > > > > >               $(TARGET_CONFIGURE_OPTS) \
> >         > > > > > +             $(TARGET_CONFIGURE_ARGS) \
> >         > > > > > +             $(TARGET_CONFIGURE_ENV) \
> >         > > > > >               CFLAGS="$(TARGET_CFLAGS)" \
> >         > > > > >               CPPFLAGS="$(GRUB_CFLAGS)" \
> >         > > > > >               ./configure $(QUIET) \
> >         > > > >
> >         > > > > Maybe you should consider switching grub to the
> >         autotool infrastructure.
> >         > > > >
> >         > > > > --
> >         > > > > Lionel Landwerlin
> >         > > > >
> >         > > > > _______________________________________________
> >         > > > > buildroot mailing list
> >         > > > > buildroot at busybox.net
> >         > > > > http://lists.busybox.net/mailman/listinfo/buildroot
> >         > > >
> >         > >
> >         >
> >         > _______________________________________________
> >         > buildroot mailing list
> >         > buildroot at busybox.net
> >         > http://lists.busybox.net/mailman/listinfo/buildroot
> >
> >
> >
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100104/584b8233/attachment-0001.htm>
