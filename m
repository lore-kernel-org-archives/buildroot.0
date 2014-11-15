From: =?ISO-8859-1?Q?J=F6rg?= Krause <jkrause@posteo.de>
Date: Sat, 15 Nov 2014 15:05:35 +0100
Subject: [Buildroot] [PATCH 1/1] package/dnsmasq: cleanup run-time files
 in init script
In-Reply-To: <1416057928.2386.2.camel@posteo.de>
References: <1416000618-32273-1-git-send-email-jkrause@posteo.de>
 <5466868C.9040108@mind.be> <1416057928.2386.2.camel@posteo.de>
Message-ID: <1416060335.2386.5.camel@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sa, 2014-11-15 at 14:25 +0100, J?rg Krause wrote:
> On Fr, 2014-11-14 at 23:47 +0100, Arnout Vandecappelle wrote:
> > On 14/11/14 22:30, J?rg Krause wrote:
> > > dnsmasq does not clean its run-times its run-time files after stopping with
> > > /etc/init.d/S80dnsmasq stop. Do this manually.
> > > 
> > > Signed-off-by: J?rg Krause <jkrause@posteo.de>
> > > ---
> > >  package/dnsmasq/S80dnsmasq | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/package/dnsmasq/S80dnsmasq b/package/dnsmasq/S80dnsmasq
> > > index 587751e..b29fff4 100755
> > > --- a/package/dnsmasq/S80dnsmasq
> > > +++ b/package/dnsmasq/S80dnsmasq
> > > @@ -13,6 +13,9 @@ case "$1" in
> > >  		echo -n "Stopping dnsmasq: "
> > >  		start-stop-daemon -K -q -x /usr/sbin/dnsmasq
> > >  		[ $? = 0 ] && echo "OK" || echo "FAIL"
> > > +		# dnsmasq does not clean its run-time files
> > > +		rm -f /var/run/dnsmasq.pid
> > > +		rm -f /var/run/dnsmasq.leases
> > 
> >  The leases file is read again by dnsmasq when it starts, so it can give the
> > same addresses. So it shouldn't be removed. In fact, in my setup I even put the
> > leases file in persistent storage.
> 
> For any reason dnsmasq duplicates the leases file. I have a copy
> in /var/lib/misc/ and one in /var/run/. Not sure why the latter one
> exists.

Ouch! /var/run and /var/lib/misc both symlinks to /tmp. That's why! So I
will remove the removing of the leases file.
