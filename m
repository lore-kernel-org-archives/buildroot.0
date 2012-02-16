From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Thu, 16 Feb 2012 09:31:51 +0100
Subject: [Buildroot] [PATCH] DOWNLOAD: change $1=DIRECTORY_URL,
 $2=FILE_NAME to $1=FULL_FILE_URL, $2=FILE_NAME
In-Reply-To: <201202160040.17980.arnout@mind.be>
References: <CAM+bi4s6tQ0RpfqgjGtqpT0ym=WMPvROgyVsxdzKsx0GeKwtHg@mail.gmail.com>
 <1329339938-14441-1-git-send-email-arnout@mind.be>
 <201202160040.17980.arnout@mind.be>
Message-ID: <CAM+bi4vnNpcZoHmPBVvoxT_NSan+JJw2wgTpGuUBzAi14jtf8g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I like your suggestions. I'll get into it this afternoon and send the new
patch.

I've just learned that wget has the option --content-disposition which
manages to set the right filename even in URLs like that from Xilinx.
Although it seems to have some drawbacks, maybe it could be used whenever
the second argument of DOWNLOAD is not defined. Should I set it then?

           If this is set to on, experimental (not fully-functional) support
           for "Content-Disposition" headers is enabled. This can currently
           result in extra round-trips to the server for a "HEAD" request,
and
           is known to suffer from a few bugs, which is why it is not
           currently enabled by default.

           This option is useful for some file-downloading CGI programs that
           use "Content-Disposition" headers to describe what the name of a
           downloaded file should be.


Thanks for the send-email tip!

2012/2/16 Arnout Vandecappelle <arnout@mind.be>

> On Wednesday 15 February 2012 22:05:38 Arnout Vandecappelle
> (Essensium/Mind) wrote:
> > From: "Alvaro G. M" <alvaro.gamez@hazent.com>
> >
> > This patch modifies the definition of DOWNLOAD to receive two arguments.
> >
> > I think this is the generic solution to the problem, even though it is a
> > change to the API.
> >
> > However, by making the second parameter optional, it could be possible
> to reduce
> > code. To keep the more generic way, the .mk files that needed to be
> changed
> > to the new API are kept with both arguments to the call of the function.
>
>  It would indeed be a good idea to make the second parameter optional.  And
> in that case, I would leave out the second parameter whenever possible.
>
>
> > Same thing with the, to my knowledge, unused SOURCE_CHECK_WGET and SCP
> functions.
>
>  It is used for 'make source-check'.
>
>
> > The difference is that now $1 stores the full URL of the file, whereas $2
> > stores the name of the file as we want it to be named after download
> > complets.
>          ^completes
>
>
> > For example, a full copy-paste from Xilinx git:
> > URL='
> http://git.xilinx.com/?p=xldk/microblaze_v2.0_le.git;a=blob;f=microblazeel-unknown-linux-gnu.tgz;h=d7b493c5dbcc24ba9cc3be2e4c14d6d9701e6805;hb=HEAD
> '
> > FILE='microblazeel-unknown-linux-gnu.tgz'
> >
> > $(call DOWNLOAD,$(URL),$(FILE))
> >
> > In case we know for sure the downloaded file is going to have the name we
> > want, we can omit the second parameter:
> >
> > URL=
> ftp://ftp.idsoftware.com/idstuff/doom/doom-$(DOOM_WAD_VERSION).wad.gz
> > $(call DOWNLOAD,$(URL))
>
>  Sounds like a great plan!
>
>
>
> [snip]
> > diff --git a/docs/buildroot.html b/docs/buildroot.html
> > index ddfb20a..e0f6ad8 100644
> > --- a/docs/buildroot.html
> > +++ b/docs/buildroot.html
>  The manually maintained buildroot.html is deprecated and should be
> removed Real Soon Now (Peter?).
>
> > --- a/docs/manual/adding-packages-handwritten.txt
> > +++ b/docs/manual/adding-packages-handwritten.txt
> > @@ -22,7 +22,7 @@ existing manual makefiles and to help understand how
> they work.*
> >  11: LIBFOO_TARGET_BINARY:=usr/bin/foo
> >  12:
> >  13: $(DL_DIR)/$(LIBFOO_SOURCE):
> > -14:  $(call DOWNLOAD,$(LIBFOO_SITE),$(LIBFOO_SOURCE))
> > +14:  $(call DOWNLOAD,$(LIBFOO_SITE)/$(LIBFOO_SOURCE),$(LIBFOO_SOURCE))
>
>  Leave out the second parameter in the example here.
>
> >  15:
> >  16: $(LIBFOO_DIR)/.source: $(DL_DIR)/$(LIBFOO_SOURCE)
> >  17:  $(ZCAT) $(DL_DIR)/$(LIBFOO_SOURCE) | tar -C $(BUILD_DIR)
> $(TAR_OPTIONS) -
> > diff --git a/linux/linux.mk b/linux/linux.mk
> > index ae236d4..d1a05a1 100644
> > --- a/linux/linux.mk
> > +++ b/linux/linux.mk
> > @@ -98,7 +98,7 @@ define LINUX_DOWNLOAD_PATCHES
> >       $(if $(LINUX_PATCHES),
> >               @$(call MESSAGE,"Download additional patches"))
> >       $(foreach patch,$(filter ftp://% http://%,$(LINUX_PATCHES)),\
> > -             $(call DOWNLOAD,$(dir $(patch)),$(notdir $(patch)))$(sep))
> > +             $(call DOWNLOAD,$(patch),$(notdir $(patch)))$(sep))
>
>  So this could become
>        $(call DOWNLOAD,$(patch))$(sep))
> right?  That's a
> tremendous improvement!
>
> >  endef
> >
> >  LINUX_POST_DOWNLOAD_HOOKS += LINUX_DOWNLOAD_PATCHES
> > diff --git a/package/Makefile.package.in b/package/Makefile.package.in
> > index 33461b4..3714de0 100644
> > --- a/package/Makefile.package.in
> > +++ b/package/Makefile.package.in
> > @@ -203,11 +203,11 @@ endef
> >  # to prepend the path with a slash: scp://[user@]host:/absolutepath
> >  define DOWNLOAD_SCP
> >       test -e $(DL_DIR)/$(2) || \
> > -     $(SCP) $(call stripurischeme,$(call qstrip,$(1)))/$(2) $(DL_DIR)
> > +     $(SCP) $(call stripurischeme,$(call qstrip,$(1))) $(DL_DIR)/$(2)
>
>  While you're at it, maybe you can add quotes, i.e.
>         $(SCP) '$(call stripurischeme,$(call qstrip,$(1)))' $(DL_DIR)/$(2)
>
>  Note that the second parameter doesn't have to be quoted - we do this
> precisely to make sure it's a safe file.
>
> >  endef
> >
> >  define SOURCE_CHECK_SCP
> > -     $(SSH) $(call domain,$(1),:) ls $(call notdomain,$(1)/$(2),:) >
> /dev/null
> > +     $(SSH) $(call domain,$(1),:) ls $(call notdomain,$(1),:) >
> /dev/null
> >  endef
> >
> >  define SHOW_EXTERNAL_DEPS_SCP
> > @@ -237,12 +237,16 @@ endef
> >
> >
> >  define DOWNLOAD_WGET
> > -     test -e $(DL_DIR)/$(2) || \
> > -     $(WGET) -P $(DL_DIR) $(call qstrip,$(1))/$(2)
> > +     if test -n "$(2)"; then \
> > +             test -e $(DL_DIR)/$(2) || \
> > +             $(WGET) -O $(DL_DIR)/$(2) $(call qstrip,$(1)); \
> > +     else \
> > +             $(WGET) $(call qstrip,$(1)) ;\
> > +     fi
>
>  The test should be there also when defaulting $(2).  So, to make
> life easier, the default should be set in the DOWNLOAD macro itself.
>
>  Also, the call to the DOWNLOAD macro in the GENTARGETS wasn't updated.
> You should replace the , with a / there.
>
> >  endef
> >
> >  define SOURCE_CHECK_WGET
> > -  $(WGET) --spider $(call qstrip,$(1))/$(2)
> > +  $(WGET) --spider $(call qstrip,$(1))
> >  endef
> >
> >  define SHOW_EXTERNAL_DEPS_WGET
> > diff --git a/package/cups/cups.mk b/package/cups/cups.mk
> > index 4e8db71..ed2e72c 100644
> > --- a/package/cups/cups.mk
> > +++ b/package/cups/cups.mk
> > @@ -65,7 +65,7 @@ else
> >  endif
> >
> >  $(DL_DIR)/$(CUPS_SOURCE):
> > -      $(call DOWNLOAD,$(CUPS_SITE),$(CUPS_SOURCE))
> > +      $(call DOWNLOAD,$(CUPS_SITE)/$(CUPS_SOURCE),$(CUPS_SOURCE))
>
>  As I mentioned before: use the default, remove the second $(CUPS_SOURCE).
> And the same for all other packages, of course.
>
> [snip]
>
>
>  Regards,
>  Arnout
>
> --
> Arnout Vandecappelle                               arnout at mind be
> Senior Embedded Software Architect                 +32-16-286540
> Essensium/Mind                                     http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR
> Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
>



-- 
?lvaro G?mez Machado
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120216/f92eb632/attachment.html>
