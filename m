From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Wed, 16 Oct 2019 23:34:25 +0200
Subject: [Buildroot] [PATCH] package/bluez-alsa: bump to version 2.0.0
In-Reply-To: <20191016213139.0eddf928@windsurf.home>
References: <20191016095501.3829-1-joerg.krause@embedded.rocks>
 <20191016213139.0eddf928@windsurf.home>
Message-ID: <72d2461bcc01cb360c9a5f027821499b0a60f13e.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, 2019-10-16 at 21:31 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 16 Oct 2019 11:55:01 +0200
> J?rg Krause <joerg.krause@embedded.rocks> wrote:
> 
> > Add the bluealsa-aplay client application as a config option, as it does
> > not use libglib2 anymore (like the server application bluealsa), but libdbus.
> 
> I am confused by this statement. Did bluealsa-aplay exist before? Why
> was it a problem that it was using libglib2 ?

Sorry for the confusion! Yes, bluealsa-aplay existed before and was
unconditionally built. For client applications (like bluealsa-aplay),
the maintainer switched from libglib2 to libdbus "in order to minimize
library footprint" [1].

> The current bluez-alsa package anyway already selects libglib2, so what
> is the problem ? I am a bit confused.

You're right, bluez-alsa still needs libglibs for its server
application named "bluealsa". In fact, there is no problem with the
dependencies. I thought in might be a good idea to allow not building
bluealsa-aplay, e.g. when using one of the other client applications
like rfcomm.

> > Furthermore, bluealsa can be used without bluealsa-aplay.
> 
> And?

See above.

> >  if BR2_PACKAGE_BLUEZ_ALSA
> >  
> > +config BR2_PACKAGE_BLUEZ_ALSA_APLAY
> > +	bool "aplay"
> > +	select BR2_PACKAGE_DBUS
> 
> The main BR2_PACKAGE_BLUEZ_ALSA option selects bluez5_utils, which
> already selects dbus. Is that just for correctness that you added the
> select here ?

Yes.

[1] https://github.com/Arkq/bluez-alsa/commit/5c8dcce999297bfa91345c034de6083773307f5a#diff-69f2fc2be0364f0621a94936a1ecac53

J?rg
