From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 19 Nov 2019 21:22:34 +0100
Subject: [Buildroot] [PATCH] system: allow not setting a default,
 system-wide time zone
In-Reply-To: <b074a89e-682a-76a1-d704-36fb0634311b@mind.be>
References: <20191116091004.23726-1-yann.morin.1998@free.fr>
 <b074a89e-682a-76a1-d704-36fb0634311b@mind.be>
Message-ID: <20191119202234.GL32494@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2019-11-17 15:41 +0100, Arnout Vandecappelle spake thusly:
> On 16/11/2019 10:10, Yann E. MORIN wrote:
> > It is valid that there is no system-wide default time zone defined, in
> > which case Etc/UTC is assumed.
> > 
> > Fixes: #12316
> > 
> > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> > Cc: Martin Bark <martin@barkynet.com>
> > Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Cc: Richard Braun <rbraun@sceen.net>
> > Cc: Andrew Trapani <andrew.trapani@ontera.bio>
> [snip]
> > diff --git a/system/Config.in b/system/Config.in
> > index c87266f431..c8c5be40e0 100644
> > --- a/system/Config.in
> > +++ b/system/Config.in
> > @@ -494,6 +494,8 @@ config BR2_TARGET_LOCALTIME
> >  	    Pacific/Wallis
> >  	    ...
> >  
> > +	  Set to empty to not install a default time zone.
> 
>  Maybe we should then also change the default to empty?

I disagree. I prefer there is an explicit default, which makes it
obvious what it means, rather than use an implicit setting.

> Then at least this use
> case gets tested in the autobuilders. Oh, maybe adding a few possible values for
> this config in genrandconfig would be nice as well...

If you enable the randomisation in genrandconfig, then there is no
longer any reason to set the default to empty, is there?

>  BTW, I notice now that BR2_TARGET_TZ_ZONELIST is not used for uClibc (tz). Is
> that expected? Maybe it should depend on !UCLIBC then?

I think this should be done in a further patch. Having a value that is
not used in the uClibc case is not a regression: it's been like that for
years now, since 2014 with commit 337fbd549c.

On the other hand, this patch fixes an existing issue (#12316).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
