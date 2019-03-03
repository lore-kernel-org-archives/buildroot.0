From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 Mar 2019 22:37:51 +0100
Subject: [Buildroot] [PATCH 1/1] package/systemd: fix "Timed out waiting
 for device /dev/console."
In-Reply-To: <87a7ibk62d.fsf@dell.be.48ers.dk>
References: <20190303113052.9120-1-xruppen@gmail.com>
 <20190303115413.GG2721@scaer> <87o96rk8m0.fsf@dell.be.48ers.dk>
 <20190303204826.GL2721@scaer> <87a7ibk62d.fsf@dell.be.48ers.dk>
Message-ID: <20190303213751.GM2721@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2019-03-03 22:21 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  > Well, wecould make it simple, and use (pseudoc-ode):
>  >     if console:
>  >         SERVICE='console-getty'
>  >     elif vt:
>  >         SERVICE='getty@'
>  >     else:
>  >         SERVICE='serial-getty@'
> I don't think so, as we need both <name>@<target> and <target>:
> 
> 	ln -fs ../../../../lib/systemd/system/$${SERVICE}@.service \
> 		$(TARGET_DIR)/etc/systemd/system/getty.target.wants/$${SERVICE}@$(BR2_TARGET_GENERIC_GETTY_PORT).service
> 
> So we either end up with no @ in the symlink name, or a double @@.

Arg, I ndeed I missed that. Nice point.

> I don't know if that is problem or not for systemd.

Neither do I , but I would not wagger it isn't... ;-)

However, from what I understand, the part between the '@' and the
'.service' is used to fill in the %I placeholder in the service file.
Since the console-getty.service does not have a placeholder, it is
hopefully not a problem that we create the console-getty at console.service
file...

Xavier, if this is the case, please say so in the commit log. If I wrote
bullsh!t, then please also say so, and then explain how your patch makes
it work.

In either case, I think it would make sense to indeed do as Peter
suggested, because even if your patch works, it's probably a trick and
could break in a future systemd release...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
