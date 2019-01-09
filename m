From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 8 Jan 2019 20:29:10 -0600
Subject: [Buildroot] [PATCH 1/1] Provides puredata package
In-Reply-To: <CANQCQpYPu1sLNjLuG3-D5F33oMmqJ6Rt_txt4_Sqh9zR1PHvdg@mail.gmail.com>
References: <20190108032658.25220-1-Mitchell.Dokken@gmail.com>
 <6684_1546932025_5C344F39_6684_470_3_20190108072023.GN5181@r-lnx-nyma7486-2>
 <CA+DDqPcP+raeuF--1PB74oZGD6Tg67SfrxNb=N9XpnEt7WE-tA@mail.gmail.com>
 <CANQCQpYPu1sLNjLuG3-D5F33oMmqJ6Rt_txt4_Sqh9zR1PHvdg@mail.gmail.com>
Message-ID: <CANQCQpZNvfUHLGGeE1JqXnT3sAn1+O7x4YCjgawCo_=uBMrdFQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mitchell,

On Tue, Jan 8, 2019 at 8:27 PM Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
>
> Mitchell,
>
>
> On Tue, Jan 8, 2019 at 7:36 PM Mitchell Dokken
> <mitchell.dokken@gmail.com> wrote:
> >
> > Thank you, to both of you!
> >
> > These are very helpful. I do have a question: when I fix all these issues, should I do exactly the same thing for the next patch review, or should I somehow reference this conversation?
>
> No need to reference this conversation directly, patchwork has
> recorded this first version of the patch
> (http://patchwork.ozlabs.org/patch/1021690/) with all the
> conversation.  One of the maintainers will mark it superseded once
> your v2 patch is sent out.  For the new patch as it's a version 2,
> it's suggested to include a change log of changes from v1 to v2
> (Manual Section 21.5.4 - Patch revision changelog).  That manual
> section also has examples of how to use format patch to generate your
> v2.
>

I forgot to mention.  I'd suggest renaming the commit title to be
"package/puredata: new package"

>
> >
> > On Tue, Jan 8, 2019 at 1:20 AM <yann.morin@orange.com> wrote:
> >>
> >> Mitchell, All,
> >>
> >> Thanks for this submission. :-)
> >>
> >> In addition to Matt's review, see a few comments below...
> >>
> >> On 2019-01-07 21:26 -0600, Mitchell Dokken spake thusly:
> >> > Signed-off-by: Mitchell Dokken <Mitchell.Dokken@gmail.com>
> >> > ---
> >> [--SNIP--]
> >> > diff --git a/package/puredata/Config.in b/package/puredata/Config.in
> >> > new file mode 100644
> >> > index 0000000000..c8bafe8885
> >> > --- /dev/null
> >> > +++ b/package/puredata/Config.in
> >> > @@ -0,0 +1,12 @@
> >> > +config BR2_PACKAGE_PUREDATA
> >> > +     bool "puredata"
> >> > +     select BR2_PACKAGE_TK
> >> > +     select BR2_PACKAGE_TCL
> >> > +     select BR2_PACKAGE_ALSA_LIB
> >> > +     select BR2_PACKAGE_ALSA_UTILS
> >> > +     select BR2_PACKAGE_XORG7
> >>
> >> Do not select Xorg, but depend on it.
> >>
> >> > +     select BR2_PACKAGE_XAPP_XAUTH
> >>
> >> ... but you can select individual X package.
> >>
> >> > +
> >>
> >> No empty line before the help.
> >>
> >> > +     help
> >> > +             Graphic realtime audio programming language
> >> > +             http://msp.ucsd.edu/software.htm
> >>
> >> Indentation for the help text is TAB-space-space. As suggested by Matt,
> >> use:
> >>
> >>     ./utils/check-package package/puredata/*
> >>
> >> Also, there is a better-looking homepage for Pure Data, maybe we can use
> >> it instead: http://puredata.info/ ?
> >>
> >> [--SNIP--]
> >> > diff --git a/package/puredata/puredata.mk b/package/puredata/puredata.mk
> >> > new file mode 100644
> >> > index 0000000000..842970b983
> >> > --- /dev/null
> >> > +++ b/package/puredata/puredata.mk
> >> > @@ -0,0 +1,34 @@
> >> > +################################################################################
> >> > +#
> >> > +# puredata
> >> > +#
> >> > +################################################################################
> >> > +
> >> > +PUREDATA_VERSION =  0.49-0
> >> > +PUREDATA_SOURCE = pd-$(PUREDATA_VERSION).src.tar.gz
> >> > +PUREDATA_SITE = http://msp.ucsd.edu/Software
> >> > +PUREDATA_INSTALL_STAGING = YES
> >>
> >> Why does it need to be installed in staging? Is this providing a
> >> library?
> >>
> >> > +PUREDATA_INSTALL_TARGET = YES
> >> > +PUREDATA_AUTORECONF = YES
> >> > +PUREDATA_CONF_OPTS = --no-recursion --disable-locales
> >> > +
> >> > +PUREDATA_DEPENDENCIES = alsa-utils tcl tk
> >> > +
> >> > +ifeq ($(BR2_PACKAGE_PORTAUDIO),y)
> >> > +PUREDATA_CONF_OPTS += --enable-portaudio
> >> > +else
> >> > +PUREDATA_CONF_OPTS += --disable-portaudio
> >> > +endif
> >> > +
> >> > +ifeq ($(BR2_PACKAGE_JACK2),y)
> >> > +PUREDATA_CONF_OPTS += --enable-jack
> >> > +else
> >> > +PUREDATA_CONF_OPTS += --disable-jack
> >> > +endif
> >> > +
> >> > +define PUREDATA_RUN_AUTOGEN
> >> > +     cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
> >> > +endef
> >>
> >> Why do you need to run autogen.sh since you already have
> >> PUREDATA_AUTORECONF=YES ?
> >>
> >> autogen.sh basically does just the same as PUREDATA_AUTORECONF=YES
> >> anyway. The only delta is that it also creates a directory, so your hook
> >> should just do that: create the m4/generated directory. Also, make it a
> >> post-extract hook.
> >>
> >> Regards,
> >> Yann E. MORIN.
> >>
> >> > +PUREDATA_PRE_CONFIGURE_HOOKS += PUREDATA_RUN_AUTOGEN
> >> > +
> >> > +$(eval $(autotools-package))
> >> > --
> >> > 2.11.0
> >> >
> >> > _______________________________________________
> >> > buildroot mailing list
> >> > buildroot at busybox.net
> >> > http://lists.busybox.net/mailman/listinfo/buildroot
> >>
> >> --
> >>                                         ____________
> >> .-----------------.--------------------:       _    :------------------.
> >> |  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
> >> | +33 534.541.179 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
> >> | +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
> >> |      yann.morin (at) orange.com      |_="    ,--' | / \ HTML MAIL    |
> >> '--------------------------------------:______/_____:------------------'
> >>
> >>
> >> _________________________________________________________________________________________________________________________
> >>
> >> Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
> >> pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
> >> a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
> >> Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.
> >>
> >> This message and its attachments may contain confidential or privileged information that may be protected by law;
> >> they should not be distributed, used or copied without authorisation.
> >> If you have received this email in error, please notify the sender and delete this message and its attachments.
> >> As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
> >> Thank you.
> >>
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
>
>
> --
>
> Matthew Weber | Pr. Software Engineer | Commercial Avionics
>
> COLLINS AEROSPACE
>
> 400 Collins Road NE, Cedar Rapids, Iowa 52498, USA
>
> Tel: +1 319 295 7349 | FAX: +1 319 263 6099
>
> matthew.weber at collins.com | collinsaerospace.com
>
>
>
> CONFIDENTIALITY WARNING: This message may contain proprietary and/or
> privileged information of Collins Aerospace and its affiliated
> companies. If you are not the intended recipient, please 1) Do not
> disclose, copy, distribute or use this message or its contents. 2)
> Advise the sender by return email. 3) Delete all copies (including all
> attachments) from your computer. Your cooperation is greatly
> appreciated.
>
>
> Any export restricted material should be shared using my
> matthew.weber at corp.rockwellcollins.com address.



-- 

Matthew Weber | Pr. Software Engineer | Commercial Avionics

COLLINS AEROSPACE

400 Collins Road NE, Cedar Rapids, Iowa 52498, USA

Tel: +1 319 295 7349 | FAX: +1 319 263 6099

matthew.weber at collins.com | collinsaerospace.com



CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.


Any export restricted material should be shared using my
matthew.weber at corp.rockwellcollins.com address.
