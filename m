From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Thu, 22 May 2014 21:52:10 +0200
Subject: [Buildroot] How to use the TZ selection ?
In-Reply-To: <20140522192245.GA9460@free.fr>
References: <F979DDABBA2E48ADB211714423219F77@JohanW7>
 <20140522192245.GA9460@free.fr>
Message-ID: <637714E3940F4DD484ECB3AC585815CF@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Dear Yann;

I had entered BR2_TARGET_LOCALTIME="Europe" ,
It did not resolve "Europe" and maybe that's why it created a symlink to a directory instead.
Perhaps it might be better to yield a build error in case the timezone could not be found.


-----Oorspronkelijk bericht-----
Van: Yann E. MORIN [mailto:yann.morin.1998 at gmail.com] Namens Yann E. MORIN
Verzonden: donderdag 22 mei 2014 21:23
Aan: Sagaert Johan
CC: buildroot at busybox.net
Onderwerp: Re: How to use the TZ selection ?

Sagaert, All,

On 2014-05-22 21:01 +0200, Sagaert Johan spake thusly:
> How is the TZ menu option intended to be used ?
> In my older builds I had a file /etc/TZ, but using the TZ menu options 
> creates a symlink to a directory so /etc/TZ is a directory Containing 
> al timezone definitions.
> This does not seem to work since uClibc expects a file /etc/TZ Am I 
> missing something ?

I've just tried it here with:
    BR2_TARGET_TZ_INFO=y
    BR2_TARGET_TZ_ZONELIST="default"
    BR2_TARGET_LOCALTIME="Europe/Paris"

And it gives me:
    $ stat -c '%N' target/etc/TZ
    'target/etc/TZ' -> '../usr/share/zoneinfo/uclibc/Europe/Paris'
    $ file target/etc/../usr/share/zoneinfo/uclibc/Europe/Paris
    target/etc/../usr/share/zoneinfo/uclibc/Europe/Paris: ASCII text
    $ cat target/etc/../usr/share/zoneinfo/uclibc/Europe/Paris
    # Europe/Paris
    CET-1CEST,M3.5.0,M10.5.0/3

So, this is indeed a symlink, but it points to a file, which contains a valid uClibc timezone spec.

What is your BR2_TARGET_LOCALTIME set to? This should be set to a valid location, usually a big city in an area.

The valid list is somewhere in the tzdata source tree (I'll leave as an exercise to you to find where! ;-) )

Regards,
Yann E. MORIN.

--
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' 
| conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
