From: Jared Bents <jared.bents@rockwellcollins.com>
Date: Mon, 4 May 2020 08:22:06 -0500
Subject: [Buildroot] [PATCH v1 1/1] package/xerces: add disable network
 option
In-Reply-To: <20200501213613.GG15673@scaer>
References: <20200501154340.27763-1-jared.bents@rockwellcollins.com>
 <20200501213454.GF15673@scaer> <20200501213613.GG15673@scaer>
Message-ID: <CAM=7fbc89PSrzuyAeK7fSru-skHCU=TN3JqjkK7t1TUNLhQY8A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Fri, May 1, 2020 at 4:37 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Jared, All,
>
> On 2020-05-01 23:34 +0200, Yann E. MORIN spake thusly:
> > On 2020-05-01 10:43 -0500, Jared Bents spake thusly:
> > > Update to add the option to compile xerces without network
> > > support.
> > >
> > > Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
> > > ---
> > >  package/xerces/Config.in | 9 +++++++++
> > >  package/xerces/xerces.mk | 4 +++-
> > >  2 files changed, 12 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/package/xerces/Config.in b/package/xerces/Config.in
> > > index 2edc4346b5..bc5c725799 100644
> > > --- a/package/xerces/Config.in
> > > +++ b/package/xerces/Config.in
> > > @@ -6,5 +6,14 @@ config BR2_PACKAGE_XERCES
> > >
> > >       http://xerces.apache.org/xerces-c/
> > >
> > > +if BR2_PACKAGE_XERCES
> > > +
> > > +config BR2_PACKAGE_XERCES_DISABLE_NETWORK
> > > +   bool "Disable network support"
> > > +   help
> > > +     Disable network support in xerces
> >
> > We prefer positive logic, so:
> >
> >     config BR2_PACKAGE_XERCES_NETWORK
> >         bool "network support"
> >         help
> >           Enable network support
>
> I forgot to add: it should 'default y' to keep existing behaviour.

I'll update to switch to positive logic.

>
> Regards,
> Yann E. MORIN.
>
> > > +endif
> > > +
> > >  comment "xerces-c++ needs a toolchain w/ C++, wchar"
> > >     depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR)
> > > diff --git a/package/xerces/xerces.mk b/package/xerces/xerces.mk
> > > index c75a8b0d35..f98b1066a4 100644
> > > --- a/package/xerces/xerces.mk
> > > +++ b/package/xerces/xerces.mk
> > > @@ -31,7 +31,9 @@ XERCES_CONF_ENV += LIBS=-liconv
> > >  XERCES_DEPENDENCIES += libiconv
> > >  endif
> > >
> > > -ifeq ($(BR2_PACKAGE_LIBCURL),y)
> > > +ifeq ($(BR2_PACKAGE_XERCES_DISABLE_NETWORK),y)
> > > +XERCES_CONF_OPTS += -Dnetwork:BOOL=OFF
> > > +else ifeq ($(BR2_PACKAGE_LIBCURL),y)
> > >  XERCES_CONF_OPTS += -Dnetwork-accessor=curl
> > >  XERCES_DEPENDENCIES += libcurl
> > >  else
> >
> > And here you'd have something like:
> >
> >     ifeq ($(BR2_PACKAGE_XERCES_NETWORK),y)
> >     ifeq ($(BR2_PACKAGE_LIBCURL),y)
> >     XERCES_CONF_OPTS += -Dnetwork-accessor=curl
> >     XERCES_DEPENDENCIES += libcurl
> >     else
> >     XERCES_CONF_OPTS += -Dnetwork-accessor=socket
> >     endif
> >     else
> >     XERCES_CONF_OPTS += -Dnetwork:BOOL=OFF
> >     endif
> >
> > Note: why -Dnetwork:BOOL=OFF while we traditionally use -Dnetwork=OFF ?

Based on the information from their website (
https://xerces.apache.org/xerces-c/build-3.html ) and what I found
looking in their source, the option to disable is -Dnetwork:BOOL=OFF

Thank you,
Jared

> >
> > Regards,
> > Yann E. MORIN.
> >
> > > --
> > > 2.17.1
> > >
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot at busybox.net
> > > http://lists.busybox.net/mailman/listinfo/buildroot
> >
> > --
> > .-----------------.--------------------.------------------.--------------------.
> > |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> > | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> > | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> > | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> > '------------------------------^-------^------------------^--------------------'
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'



-- 
Jared M. Bents | Sr. Software Engineer | Commercial Avionics

COLLINS AEROSPACE

400 Collins Road NE, Cedar Rapids, Iowa 52498 USA

Tel: +1 319 263 3181

jared.bents at collins.com | collinsaerospace.com



CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.
