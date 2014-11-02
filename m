From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 02 Nov 2014 23:51:15 +0100
Subject: [Buildroot] [PATCH 1/1] package/avahi: enable libavahi-client
	support
In-Reply-To: <1414800623-7721-1-git-send-email-jkrause@posteo.de>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Sat, 1 Nov 2014 01:10:23 +0100")
References: <1414800623-7721-1-git-send-email-jkrause@posteo.de>
Message-ID: <87ioix43oc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <jkrause@posteo.de> writes:

 > Some packages needs libavahi-client support which is autobuild by avahi if
 > avahi-daemon and dbus is selected. To select libavahi-client explicitly makes
 > this dependency more obvious for dependent packages.

 > libdns_sd is only build by avahi if libavahi-client is present (and 
 > `--enable-compat-libdns_sd` is set as configure option). So it's safe to 
 > depend on libavahi-client instead of avahi-daemon.

Having a user visible option for this is a bit odd as it cannot be used
to DISABLE the library.

Perhaps it should just be a hidden helper option for other packages
instead? (so drop the bool and help text)

 > Signed-off-by: J?rg Krause <jkrause@posteo.de>
 > ---
 >  package/avahi/Config.in | 10 ++++++++--
 >  1 file changed, 8 insertions(+), 2 deletions(-)

 > diff --git a/package/avahi/Config.in b/package/avahi/Config.in
 > index b52cc78..56b372e 100644
 > --- a/package/avahi/Config.in
 > +++ b/package/avahi/Config.in
 > @@ -35,11 +35,17 @@ config BR2_PACKAGE_AVAHI_DAEMON
 >  	  The daemon registers local IP addresses and services using
 >  	  mDNS/DNS-SD.
 
 > -config BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY
 > -	bool "libdns_sd compatibility (Bonjour)"
 > +config BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT
 > +	bool "libavahi-client"
 >  	depends on BR2_PACKAGE_AVAHI_DAEMON
 >  	select BR2_PACKAGE_DBUS
 >  	help
 > +	  Enable the Avahi client library.
 > +
 > +config BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY
 > +	bool "libdns_sd compatibility (Bonjour)"
 > +	depends on BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT
 > +	help
 >  	  Enable the libdns_sd (Bonjour) compatibility library support
 >  	  for legacy applications.
 
 > -- 
 > 2.1.3

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
