From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 Mar 2019 21:48:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/systemd: fix "Timed out waiting
 for device /dev/console."
In-Reply-To: <87o96rk8m0.fsf@dell.be.48ers.dk>
References: <20190303113052.9120-1-xruppen@gmail.com>
 <20190303115413.GG2721@scaer> <87o96rk8m0.fsf@dell.be.48ers.dk>
Message-ID: <20190303204826.GL2721@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2019-03-03 21:26 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  > On 2019-03-03 12:30 +0100, Xavier Ruppen spake thusly:
>  >> Buildroot built with systemd fails to open a login prompt on the
>  >> serial port when /dev/console is specified as BR2_TARGET_GENERIC_GETTY_PORT
[--SNIP--]
>  >> +	elif echo $(BR2_TARGET_GENERIC_GETTY_PORT) | egrep -q 'console'; \
>  >> +	then \
>  >> +		SERVICE="console-getty"; \
> 
>  > Actually, I think we should check for 'console' first, and since this is
>  > a literal, we do not need grep, just a test for equality:
> 
>  >     if [ $(BR2_TARGET_GENERIC_GETTY_PORT) = /dev/console ]; \
> 
> We don't specify the /dev/ part, so this should be just '= console'.

Yes, I just wrote it to hint at Xavier.

> I was going to commit this, but then I noticed that there isn't a
> console-getty at .service file, so this doesn't seem right:
> 
> ls -lah ../../../../lib/systemd/system/|grep getty
> lrwxrwxrwx  1 peko peko   49 Mar  3 21:13 autovt at .service -> ../../../../usr/lib/systemd/system/getty at .service
> -rw-r--r--  1 peko peko 1.1K Mar  3 21:13 console-getty.service

> -rw-r--r--  1 peko peko 1.2K Mar  3 21:13 container-getty at .service
> -rw-r--r--  1 peko peko  506 Dec 21 19:53 getty-pre.target
> -rw-r--r--  1 peko peko 1.8K Mar  3 21:13 getty at .service
> -rw-r--r--  1 peko peko  500 Dec 21 19:53 getty.target
> -rw-r--r--  1 peko peko 1.5K Mar  3 21:13 serial-getty at .service
> 
> I guess we need to introduce a TARGET variable that is
> $${SERVICE}.service for console-getty, and $${SERVICE}@.service for
> everything else, but I know next to nothing about systemd, so I will let
> someone who can actually test this send a patch.

Well, wecould make it simple, and use (pseudoc-ode):

    if console:
        SERVICE='console-getty'
    elif vt:
        SERVICE='getty@'
    else:
        SERVICE='serial-getty@'

No?

Regards,
Yann E. MORIN.

> Xavier, will you send an updated patch please?
> 
> -- 
> Bye, Peter Korsgaard

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
