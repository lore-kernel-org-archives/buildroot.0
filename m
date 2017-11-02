From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 2 Nov 2017 23:18:47 +0100
Subject: [Buildroot] [PATCH 1/2] dhcpcd: add SysV start-up script
In-Reply-To: <20171102230602.3c61e8d2@windsurf>
References: <20171031223659.6831-1-code@mmayer.net>
 <20171031223659.6831-2-code@mmayer.net>
 <20171102230602.3c61e8d2@windsurf>
Message-ID: <20171102221847.GA23314@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-11-02 23:06 +0100, Thomas Petazzoni spake thusly:
> On Tue, 31 Oct 2017 15:36:58 -0700, Markus Mayer wrote:
> > From: Markus Mayer <mmayer@broadcom.com>
> > 
> > Add System V start-up script for dhcpcd that is run after the network
> > has been brought up.
> > 
> > Signed-off-by: Markus Mayer <mmayer@broadcom.com>
> 
> I've applied, just two comments.
> 
> > +DAEMON=/sbin/dhcpcd
> > +CONFIG=/etc/dhcpcd.conf
> > +PIDFILE=/var/run/dhcpcd.pid
> > +
> > +[ -x $DAEMON ] || exit 0
> > +[ -f $CONFIG ] || exit 0
> 
> We have these in a lot of init scripts, so I kept them. But I find
> those tests pretty silly in fact:
> 
>  - The daemon should definitely be there, as it's installed by the same
>    package. And if it turns out not to be there, I'd prefer a loud
>    failure than an init script that silently ignores the problem.

Agreed.

>  - Same for the configuration file: I prefer a loud error than an init
>    script that ignores the problem.

Agreed, too.

However:

  - if the config file is mandatory, then this should be a failure.

  - if the config file is optional, then it missing should be silently
    ignored and the service started nonetheless.

> Yann, Peter, Arnout, can we agree that such tests should be removed
> entirely, and we let the init script fail if the daemon does not exist,
> and the daemon fail if its configuration file does not exist ?

Yes, except for the above.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
