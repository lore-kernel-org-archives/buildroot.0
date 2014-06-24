From: Sven Neumann <neumann@teufel.de>
Date: Tue, 24 Jun 2014 14:01:43 +0200
Subject: [Buildroot] [PATCH] Makefile: do not purge locale-archive from
 target
In-Reply-To: <20140622222751.07fb50a7@free-electrons.com>
References: <1403083410-4278-1-git-send-email-neumann@teufel.de>
 <20140622222751.07fb50a7@free-electrons.com>
Message-ID: <1403611303.18201.21.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On So, 2014-06-22 at 22:27 +0200, Thomas Petazzoni wrote:

> On Wed, 18 Jun 2014 11:23:30 +0200, Sven Neumann wrote:
> > The rules to purge unwanted locales from the target also removed
> > the locale-archive file from /usr/lib/locale which contains the
> > locale definitions explicitly generated for the target.
> > 
> > Signed-off-by: Sven Neumann <neumann@teufel.de>
> > ---
> >  Makefile | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Makefile b/Makefile
> > index 14fca2b..d7590ef 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -516,7 +516,7 @@ LOCALE_NOPURGE = $(call qstrip,$(BR2_ENABLE_LOCALE_WHITELIST))
> >  
> >  define TARGET_PURGE_LOCALES
> >  	rm -f $(LOCALE_WHITELIST)
> > -	for i in $(LOCALE_NOPURGE); do echo $$i >> $(LOCALE_WHITELIST); done
> > +	for i in $(LOCALE_NOPURGE) locale-archive; do echo $$i >> $(LOCALE_WHITELIST); done
> 
> Hum, right, but isn't 'locale-archive' an archive of many locales?
> Shouldn't we get rid of the locales we don't want from this archive?

Well, as far as I can see only the locales selected by
BR2_GENERATE_LOCALE should have been generated into the archive. So I
don't think it makes sense to purge locales from this archive. It would
be possible to do this though using "locale-def --delete-from-archiv".

> Which toolchain have you used to get a locale-archive file?

glibc 2.18


Greetings,
Sven

-- 
Sven Neumann
Senior System Architect

Lautsprecher Teufel GmbH
Gewerbehof B?lowbogen, Aufgang D1
B?lowstr. 66
10783 Berlin
Germany

Direkt   +49 (0) 30 / 300 930-153
Telefon  +49 (0) 30 / 300 930-0

neumann at teufel.de

Registernummer HRB 20271 beim Amtsgericht Berlin-Charlottenburg
Gesch?ftsf?hrer: J?rgen Schneider, Edgar van Velzen
Umsatzsteuer-ID: DE136745959

www.teufel.de - www.teufelaudio.com - www.raumfeld.com
