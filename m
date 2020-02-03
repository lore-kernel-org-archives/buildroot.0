From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Feb 2020 15:26:03 +0100
Subject: [Buildroot] [PATCH 1/1] package/openssh: improve init script
In-Reply-To: <20200203141253.tzh3kwfsy5yhmsor@zenon.in.qult.net>
References: <20200123121755.vp2n7mx3xxpbrbyz@zenon.in.qult.net>
 <20200203142721.5b143c0e@windsurf>
 <20200203141253.tzh3kwfsy5yhmsor@zenon.in.qult.net>
Message-ID: <20200203152603.496bb507@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 3 Feb 2020 15:12:53 +0100
Ignacy Gaw?dzki <ignacy.gawedzki@green-communications.fr> wrote:

> > > Improve the init script in the following ways:
> > > 
> > >   Use start-stop-daemon to avoid running the daemon more than once and
> > >   to safely send termination signals to the right process.
> > > 
> > >   Add a proper reload action, by sending the daemon the SIGHUP signal.  
> > 
> > This should ideally be done in a separate patch.
> >   
> > >   During restart, check that the daemon has properly terminated and if
> > >   not, wait one second before sending it the SIGKILL signal.  
> > 
> > We never do that in any of our other init scripts, I'm not sure we want
> > to do that here. Is there any reason to do that?  
> 
> Of course, if start-stop-daemon -S finds a matching running process,
> it returns an error.  Sending a SIGTERM to the running process during
> the stop phase doesn't guarantee that the process will have already terminated
> during the start phase, even after sleeping.  If I could use
> the --retry option of standalone start-stop-daemon, I would.  But with
> the assumption of Busybox, I need to make sure that the daemon has
> terminated by the time I attempt to start it again.

The problem that you're exposing here doesn't seem to be specific to
openssh, so I think we don't want to solve it specifically for openssh.

> > Overall, could you look at package/busybox/S01syslogd, and use it as a
> > template for S50openssh ?  
> 
> If you mean that I should be testing for start-stop-daemon's return
> code explicitly by setting status=$? and using if-then-else-fi
> constructs, then sure, yes.

I meant to make sure the init script looks as much as possible like
S01syslogd, i.e same indentation, same organization, same logic. As I
said, Carlos started an effort to try to make our init scripts more
consistent between each other, so let's try to go in that direction :-)

> > I am a bit confused by this touch /var/lock/sshd. Is it really
> > necessary? The git history was not very helpful on this, as it has been
> > in Buildroot since the init script was introduced years ago. The fact
> > that it is created *after* the sshd daemon is started makes it really
> > weird.
> > 
> > Do you have any comment/insight on this ?  
> 
> Quite frankly, I have no idea why it's there and by keeping it, I just
> wanted stay compatible with whatever is possibly using it.

We had a brief look at it with Peter Korsgaard, we don't see why it
would be needed. Could you include a preparation patch in your series
that drops this touch+rm of /var/lock/sshd ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
