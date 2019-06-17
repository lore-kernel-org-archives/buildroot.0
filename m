From: Jared Bents <jared.bents@rockwellcollins.com>
Date: Mon, 17 Jun 2019 12:56:08 -0500
Subject: [Buildroot] [External] Re: [PATCH v2 1/1] package/hostapd: add
 debug information options
In-Reply-To: <20190617194121.64c14291@windsurf>
References: <20190617153533.26255-1-jared.bents@rockwellcollins.com>
 <20190617194121.64c14291@windsurf>
Message-ID: <CAM=7fbd717PmwGE5Dh4Wi4AGhY14Pb7tabG7qrxCsgdCgDQ-LQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas

On Mon, Jun 17, 2019 at 12:41 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Mon, 17 Jun 2019 10:35:33 -0500
> jared.bents at rockwellcollins.com wrote:
>
> > From: Jared Bents <jared.bents@rockwellcollins.com>
> >
> > hostapd 2.7 added compile time options to include
> > redirecting the output from stdout to a file or syslog
> > like wpa_supplicant
> >
> > Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
> > ---
> >  package/hostapd/Config.in  | 5 +++++
> >  package/hostapd/hostapd.mk | 8 +++++++-
> >  2 files changed, 12 insertions(+), 1 deletion(-)
> >
> > diff --git a/package/hostapd/Config.in b/package/hostapd/Config.in
> > index 37c1126859..00a9ade95f 100644
> > --- a/package/hostapd/Config.in
> > +++ b/package/hostapd/Config.in
> > @@ -81,6 +81,11 @@ config BR2_PACKAGE_HOSTAPD_WPS
> >       help
> >         Enable support for Wi-Fi Protected Setup.
> >
> > +config BR2_PACKAGE_HOSTAPD_DEBUG_SYSLOG
> > +     bool "Enable syslog support"
> > +     help
> > +       Enable support for sending debug messages to syslog.
> > +
> >  config BR2_PACKAGE_HOSTAPD_VLAN
> >       bool "Enable VLAN support"
> >       default y
> > diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
> > index 550f887206..abc9fc97ad 100644
> > --- a/package/hostapd/hostapd.mk
> > +++ b/package/hostapd/hostapd.mk
> > @@ -31,7 +31,9 @@ HOSTAPD_LICENSE = BSD-3-Clause
> >  HOSTAPD_LICENSE_FILES = README
> >  HOSTAPD_CONFIG_SET =
> >
> > -HOSTAPD_CONFIG_ENABLE = CONFIG_INTERNAL_LIBTOMMATH
> > +HOSTAPD_CONFIG_ENABLE = \
> > +     CONFIG_INTERNAL_LIBTOMMATH \
> > +     CONFIG_DEBUG_FILE
>
> So you're now enabling this unconditionally, while syslog logging is
> conditional.
>
> Could you explain what CONFIG_DEBUG_FILE is doing compared to
> CONFIG_DEBUG_SYSLOG, and why one is conditional and not the other ? Do
> we really want CONFIG_DEBUG_FILE unconditionally ?

I based it off of wpa_supplicant's implementation for each.  In
wpa_supplicant, CONFIG_DEBUG_FILE is turned on unconditionally while
CONFIG_DEBUG_SYSLOG is optional.  CONFIG_DEBUG_FILE enables a runtime
option (-f) to specify a file to direct the hostapd output to instead
of stdout.  CONFIG_DEBUG_SYSLOG enables a runtime option (-s) to have
the output go to syslog instead of stdout.  These are purely optional
at runtime as if neither of the -f or -s command line arguments are
used, the output will go to stdout as before.

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://urldefense.proofpoint.com/v2/url?u=https-3A__bootlin.com&d=DwICAg&c=ilBQI1lupc9Y65XwNblLtw&r=04jwxyh4njdMBVpO4oXKRLEInKSiF8pfOjV75AsF1bU&m=z5QbCYjVAa1WSSiRX6UTcQMhQ9cm6gf6pMNwqFX6bwo&s=_2gcAZgIP5VPAyjBu9TaBaGgGX_QpkqjkPDfYxXBLY8&e=
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.busybox.net_mailman_listinfo_buildroot&d=DwICAg&c=ilBQI1lupc9Y65XwNblLtw&r=04jwxyh4njdMBVpO4oXKRLEInKSiF8pfOjV75AsF1bU&m=z5QbCYjVAa1WSSiRX6UTcQMhQ9cm6gf6pMNwqFX6bwo&s=5s5wYWn0myL65OzgVEbh9ZrOvRG5Tkc9GuBQI5jlW4A&e=

Thank you,
Jared



CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.
