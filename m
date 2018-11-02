From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 2 Nov 2018 22:25:18 +0100
Subject: [Buildroot] [PATCH v3 0/8] init scripts: rewrite S01logging
In-Reply-To: <1901226171.9682.1541193229814.JavaMail.zimbra@datacom.com.br>
References: <20181007114605.18153-1-casantos@datacom.com.br>
 <20181011170948.3594d391@windsurf>
 <1677556181.2913340.1539345049511.JavaMail.zimbra@datacom.com.br>
 <20181013145512.6a135309@windsurf>
 <1901226171.9682.1541193229814.JavaMail.zimbra@datacom.com.br>
Message-ID: <20181102222518.24d7bb60@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Carlos,

On Fri, 2 Nov 2018 19:13:49 -0200 (BRST), Carlos Santos wrote:

> >> Perhaps we should add an item to the "System configuration" menu allowing
> >> the user to choose a logging provider, just like the "Init system" item,
> >> and convert rsyslog/sysklogd/syslog-ng to virtual packages.  
> > 
> > I don't think we want to do that, because then we need to do this for
> > "what mail server do you want?", "what http server do you want?", "what
> > SSH server do you want?", etc.
> > 
> > If you enable two SSH servers, the second to start will fail. If you
> > enable two HTTP servers, the second to start will fail, etc. Similarly,
> > if you enable two logging daemons, it will not work nicely.
> > 
> > I don't think we should solve that problem, and just leave it up to the
> > user to do a configuration that makes sense. If you enable two SSH
> > servers or two logging daemons, your configuration doesn't make sense,
> > and it should be fixed.  
> 
> Did I ever suggest adding menus to select HTTP and SSH servers? Let's stick
> to what was said, please.

I'm not sure why you felt the need to become angry here, there really
was no such need. I was just commenting on why I thought adding a menu
for selecting the logging solution was IMO not appropriate, because it
was in my opinion a direction that could lead to doing the same for
tons of other packages that have conflicting functionality. So yes, the
comparison with HTTP and SSH servers made sense: I was not implying
*you* were suggesting to add menus for HTTP and SSH servers, but rather
that if we start adding more and more system configuration menus to
select between potentially conflicting packages, we may have people
proposing patches to select HTTP/SSH servers.

E-mail communication probably didn't communicate my feeling very well
here. Because overall, I am *really* happy with you taking the lead on
this init script cleanup discussion. It's long overdue, and I'm very
happy that someone like you has decided to do something about it,
knowing that doing something about it includes getting through the
usual bikeshedding that the Buildroot community is so good at.

So please take my comments in this discussion as nice comments from
someone who is really happy to see you help cleaning up our init
scripts! :-)

> The problem here is Busybox. If we name each init script after the
> corresponding daemon and select syslog-ng we will have both S01syslogd
> and S01syslog-ng installed unless we have some configuration and/or
> put some logic like this in busybox.mk:

To me, this is exactly like what happens if you enable both Dropbear
and OpenSSH. It installs two init scripts with different names, even if
in practice, only one SSH server will start. We don't handle this
"conflict" for the SSH servers, I don't see why we should have some
special thing to handle it for logging daemons.

> Is that OK for you?

Yes, I think this downside is OK for me, because it's a downside we
already have for lots of other packages in Buildroot, and fixing it
requires way too much complexity compared to the benefits.

Of course, this is only my opinion, and other BR developers can share
their possibly different view on this.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
