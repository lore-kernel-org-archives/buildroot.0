From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 May 2015 17:23:14 +0200
Subject: [Buildroot] [PATCH 29/30] package/matchbox-panel: add support
 for dnotify
In-Reply-To: <5543F3C2.4020004@mind.be>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
 <39072254f3d646691a8c637e551ffaede7b9928c.1429725549.git.yann.morin.1998@free.fr>
 <5543F3C2.4020004@mind.be>
Message-ID: <20150502152314.GH13701@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-05-01 23:44 +0200, Arnout Vandecappelle spake thusly:
> On 22/04/15 20:09, Yann E. MORIN wrote:
> > Using dnotify, matchbox-panel can automatically reload its menu.
> > 
> > dnotify requires a kernel >=2.4, which we can consider to be
> > virtually for granted.
> 
>  So, why not enable this unconditionally?

Well... OK, done.

Regards,
Yann E. MORIN.

> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > ---
> >  package/matchbox/matchbox-panel/Config.in         | 7 +++++++
> >  package/matchbox/matchbox-panel/matchbox-panel.mk | 6 ++++++
> >  2 files changed, 13 insertions(+)
> > 
> > diff --git a/package/matchbox/matchbox-panel/Config.in b/package/matchbox/matchbox-panel/Config.in
> > index 93241f0..6daf2db 100644
> > --- a/package/matchbox/matchbox-panel/Config.in
> > +++ b/package/matchbox/matchbox-panel/Config.in
> > @@ -18,4 +18,11 @@ config BR2_PACKAGE_MATCHBOX_PANEL_ACPI
> >  	  otherwise the battery monitor mini-applet is not
> >  	  built.
> >  
> > +config BR2_PACKAGE_MATCHBOX_PANEL_DNOTIFY
> > +	bool "use dnotify"
> > +	help
> > +	  Using dnotify allows matchbox-panel to automatically reload
> > +	  its menu when entries are changed (e.g. when a new application
> > +	  is installed).
> > +
> >  endif # BR2_PACKAGE_MATCHBOX_PANEL
> > diff --git a/package/matchbox/matchbox-panel/matchbox-panel.mk b/package/matchbox/matchbox-panel/matchbox-panel.mk
> > index aa9018c..dedbab6 100644
> > --- a/package/matchbox/matchbox-panel/matchbox-panel.mk
> > +++ b/package/matchbox/matchbox-panel/matchbox-panel.mk
> > @@ -26,6 +26,12 @@ else
> >  MATCHBOX_PANEL_CONF_OPTS += --disable-acpi-linux
> >  endif
> >  
> > +ifeq ($(BR2_PACKAGE_MATCHBOX_PANEL_DNOTIFY),y)
> > +MATCHBOX_PANEL_CONF_OPTS += --enable-dnotify
> > +else
> > +MATCHBOX_PANEL_CONF_OPTS += --disable-dnotify
> > +endif
> > +
> >  ifeq ($(BR2_PACKAGE_WIRELESS_TOOLS),y)
> >  MATCHBOX_PANEL_DEPENDENCIES += wireless_tools
> >  endif
> > 
> 
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
