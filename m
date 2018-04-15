From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 15 Apr 2018 20:58:28 +0200
Subject: [Buildroot] [PATCH 1/2] modem-manager: fix test of unset
 variable in init script
In-Reply-To: <20180415201808.013e84f3@windsurf.numericable.fr>
References: <20180413162521.7078-1-casantos@datacom.ind.br>
 <20180413162521.7078-2-casantos@datacom.ind.br>
 <20180414180725.4964d59d@windsurf>
 <650761555.1610.1523806309320.JavaMail.zimbra@datacom.ind.br>
 <20180415201808.013e84f3@windsurf.numericable.fr>
Message-ID: <20180415185828.GD21958@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-04-15 20:18 +0200, Thomas Petazzoni spake thusly:
> On Sun, 15 Apr 2018 12:31:49 -0300 (BRT), Carlos Santos wrote:
> > >> +MODEMMANAGER_BIN=/usr/sbin/ModemManager
> > >>  PIDFILE=/var/run/ModemManager.pid
> > >>  
> > >>  [ -x $MODEMMANAGER_BIN ] || exit 0  
> > > 
> > > In fact, I think this test doesn't make sense. It just exits without
> > > any error if the binary doesn't exists, which is silly.
> > > 
> > > I'm advocating for removing such tests altogether, which would make the
> > > MODEMMANAGER_BIN variable unnecessary.  
> > 
> > I think the original purpose of these test was allowing the user to
> > disable the service by chmod'ing -x the executable file. We discussed
> > a similar situation in
> > 
> >    https://patchwork.ozlabs.org/patch/818897/
> > 
> > [which by the way is still in my endless to-do list]
> 
> Well, if you look at my feedback on this patch, I was already saying
> that the test to check whether radvd was executable or not was not
> useful.
> 
> I don't think making a binary program non-executable as a way of
> disabling its startup at boot time is very common. Probably a
> ENABLED=true/false variable in /etc/default/<service> is more common.
> 
> So, I think we should remove all those [ -x /usr/sbin/<foo> ] checks in
> our init scripts.
> 
> Cc'ing Peter, Arnout and Yann to gather additional opinions on this.

I agree with Thomas.

This is a position we already stated quite a few times in the past.

If one does not want the daemon, then just remove it and the init script
from a post-build script. If it is about debugging, just remove the
startup script on the target, or just 'exit 0' at the top of it.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
