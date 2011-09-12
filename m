From: Will Moore <will.moore@beraninstruments.com>
Date: Mon, 12 Sep 2011 15:01:00 +0100
Subject: [Buildroot] Dropbear reports errors in system log
In-Reply-To: <201109120807.25749.minimod@morethan.org>
References: <76CD2217761740AF8C8566A85C51B906@beraninstruments.com.local>
 <201109120745.46424.minimod@morethan.org>
 <201109120807.25749.minimod@morethan.org>
Message-ID: <3FD39A29228D431BAA9A3E615AF7A7E7@beraninstruments.com.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] On
> Behalf Of Michael S. Zick
> Sent: 12 September 2011 14:07
> To: buildroot at busybox.net
> Subject: Re: [Buildroot] Dropbear reports errors in system log
> 
> On Mon September 12 2011, Michael S. Zick wrote:
> > On Mon September 12 2011, Will Moore wrote:
> > > Buildroot dropbear is configured to log ssh access to /var/log/lastlog and
> > > /var/log/wtmp as well as /var/log/utmp.  It successfully logs to
> /var/log/utmp
> > > but reports the following entries in the /var/log/messages system log:
> > >
> > > Sep 12 06:42:43 buildroot authpriv.warn dropbear[1019]:
> lastlog_perform_login:
> > > Couldn't stat /var/log/lastlog: No such file or directory
> > > Sep 12 06:42:43 buildroot authpriv.warn dropbear[1019]: lastlog_openseek:
> > > /var/log/lastlog is not a file or directory!
> > > Sep 12 06:42:43 buildroot authpriv.warn dropbear[1019]: wtmp_write:
> problem
> > > writing /var/log/wtmp: No such file or directory
> > >
> > > I believe these errors can be stopped either by creating /var/log/lastlog
> and
> > > /var/log/wtmp (but this would seem to just duplicate logging) or by
> configuring
> > > dropbear --disable-lastlog and --disable-wtmp (better).  Is there
> something I am
> > > missing?
> > >
> > > I note that other login accesses are reported to /var/log/utmp too.  Is
> there
> > > anything stopping /var/log/utmp growing over time?
> > >
> >
> > A diligent administrator who does not want the default *nix behavior.
> >
> > Seriously -
> > The utmp file was designed to be very small in *nix systems because
> > it was intended to grow over the life of the software installation.
> >
> > For instance, the system on which I am writing this, that gets multiple
> > logins each and every day for seven years: 3,072 bytes.
> >
> > So yes, it does grow over time, unless you do something about it.
> > Like, maybe delete it once a decade or when it reaches 4K bytes (one memory
> page).
> >
> 
> My bad, I just read the manual (man utmp, man wtmp) -

Having read the man page for utmp/wtmp/lastlog and had a play I believe:

utmp records who is currently logged in to the system and so it should not to
continue to grow in a big way; when you ssh log on and off repeatedly there is
only one entry in utmp.

wtmp records all logins and so will continue to grow, albeit at a "slow" rate;
when you ssh log on and off repeatedly there are multiple entries in wtmp.
Rather than create wtmp I believe dropbear should be configured --disable-wtmp
to avoid the warnings.  Other than "last" does anything use wtmp?

lastlog records the last login for each user and so should not continue to grow;
when you ssh log on and off repeatedly there is only one entry in lastlog.  We
could create lastlog but does anything or anybody use it?  Busybox does not seem
to have a "lastlog"...

> 
> According to the manual entry on this system (which may not be typical of
> yours) -
> If the wtmp does not exist, then nothing makes it and that logging is turned
> off.
> 
> The story is different about utmp, it is a requirement for Linux operation.
> Which does not prevent you from deleting/creating it at each reboot.

I believe these are all tmpfs files and so will be/will need to be created a
fresh each boot. 

> 
> Mike
> > Mike
> >
> > > Regards,
> > >
> > >
> > >
> > > Will
> > >
> > >
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot at busybox.net
> > > http://lists.busybox.net/mailman/listinfo/buildroot
> > >
> > >
> >
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> >
> >
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
