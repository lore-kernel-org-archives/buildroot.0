From: Carlos Santos <casantos@datacom.com.br>
Date: Fri, 12 Oct 2018 08:50:49 -0300 (BRT)
Subject: [Buildroot] [PATCH v3 0/8] init scripts: rewrite S01logging
In-Reply-To: <20181011170948.3594d391@windsurf>
References: <20181007114605.18153-1-casantos@datacom.com.br>
 <20181011170948.3594d391@windsurf>
Message-ID: <1677556181.2913340.1539345049511.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
> To: "DATACOM" <casantos@datacom.com.br>
> Cc: "buildroot" <buildroot@buildroot.org>, "ratbert90" <aduskett@gmail.com>, "Arnout Vandecappelle" <arnout@mind.be>,
> "Peter Korsgaard" <peter@korsgaard.com>, "Yann Morin" <yann.morin.1998@free.fr>
> Sent: Thursday, October 11, 2018 12:09:48 PM
> Subject: Re: [Buildroot] [PATCH v3 0/8] init scripts: rewrite S01logging

> Hello,
> 
> On Sun,  7 Oct 2018 08:45:57 -0300, Carlos Santos wrote:
>> Continuing our effort to improve daemon startup scripts, this series
>> focuses on S01logging, which starts the logging daemon. Common features
>> are:
>> 
>> - Indent with tabs, not spaces.
>> - Implement start, stop, restart and reload as functions.
>> - Use start-stop-daemon.
>> - Correctly detect and report start/stop/restart/reload errors.
>> - Support a configuration file at /etc/default (example files for each
>>   package are provided in individual patches).
>> - Support a configuration variable that completely disables the service
>>   and issues a warning message on any invocation.
> 
> Thanks a lot for working on this, much appreciated. Overall, I am happy
> with the proposal you're making and the consistency between init
> scripts that your proposal is bringing.
> 
> The only thing that I'm not entirely sure about is specific to these
> logging init scripts:
> 
> (1) Do we really want that Busybox, syslog-ng, rsyslog, sysklogd all
>     install a file of the same name, S01logging ? Isn't this
>     contradicting our goal of not having one package overwrite files
>     installed by another package ?
> 
>     Wouldn't it make more sense to install S01syslog-ng, S01rsyslog,
>     S01sysklogd ? This way, we also have a mapping between the init
>     script name and the daemon/package being started ?

I don't know why it was decided to use the same name for all packages.
Looks like the original intention was to prevent multiple logging damons
from running at the same time.

Perhaps we should add an item to the "System configuration" menu allowing
the user to choose a logging provider, just like the "Init system" item,
and convert rsyslog/sysklogd/syslog-ng to virtual packages.

> (2) For the Busybox case, do we want to keep a single init script that
>     starts both klogd and syslogd ? Or should we have one init script
>     per daemon, so that again the init script name matches the daemon
>     being started ? So S01klogd, S01syslogd ?

There is also sysklogd, from which Busyox borrowed the code (or at least
the idea) a long time ago. I think we should keep klogd and syslogd tied
to each other, since klogd does not make much sense without syslogd.

> Note: the above points are really proposals/discussion items. Do not
> rework your series according to those comments until there has been
> some discussion/agreement with other developers.
> 
> Another point, but which can definitely be handled separately, is
> documenting in the manual what the init scripts should look like, by at
> least pointing to the "good" init scripts, so that people know which
> ones are good to use as a template.

It's already in my endless to-do list. :-)

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?Marched towards the enemy, spear upright, armed with the certainty
that only the ignorant can have.? ? Epitaph of a volunteer
