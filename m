From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 27 Mar 2018 09:15:25 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-03-26
In-Reply-To: <20180327064509.n3kp4rdolibyqwud@sapphire.tkos.co.il>
References: <20180327060026.543B0206F3@mail.bootlin.com>
 <20180327064509.n3kp4rdolibyqwud@sapphire.tkos.co.il>
Message-ID: <20180327091525.7e785751@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 27 Mar 2018 09:45:10 +0300, Baruch Siach wrote:
> Hi Thomas,
> 
> On Tue, Mar 27, 2018 at 08:00:26AM +0200, Thomas Petazzoni wrote:
> > Build statistics for 2018-03-26
> > ===============================
> > 
> >       branch |  OK | NOK | TIM | TOT |
> >    2018.02.x | 194 |  10 |   0 | 204 |  
> 
> No reports on master. The web interface is also not showing recent master 
> builds. The last master build report is from 2018-03-25 22:43:51 
> (http://autobuild.buildroot.net/results/990/990732326160144b71f30938beb3f208cb882ea4/).

Well spotted.

This is due to commit ea9669fffae7d807ccb3810eb6c662cbb9e8f96f, which
removed the core-dependencies target. This target is explicit used by
autobuild-run to check if the system has all necessary dependencies,
and if not, simply move on to the next build. Due to this, all master
configurations fail on "core-dependencies does not exist".

The correct target to use now is "dependencies".

However, in 2018.02.x, it's still "core-dependencies" that should be
used. Using "dependencies" in 2018.02.x would not be good, because
"dependencies" triggers the build of host-{tar,xz,ccache,lzip}, and
therefore a failure in the build of those packages would not be
reported on autobuild.b.o.

So I see two options:

 (1) Re-introduce a "core-dependencies" target, that is the same as the
     "dependencies" target

 (2) Tweak the autobuild-run script, and make a special case depending
     on the branch name: if we're on 2018.02.x, use "core-dependencies",
     otherwise use "dependencies".

Arnout, Peter, any preference ? I'm leaning towards (2) since that's
the solution that doesn't pollute Buildroot with unnecessary stuff.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
