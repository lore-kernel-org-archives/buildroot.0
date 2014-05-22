From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 22 May 2014 21:22:46 +0200
Subject: [Buildroot] How to use the TZ selection ?
In-Reply-To: <F979DDABBA2E48ADB211714423219F77@JohanW7>
References: <F979DDABBA2E48ADB211714423219F77@JohanW7>
Message-ID: <20140522192245.GA9460@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sagaert, All,

On 2014-05-22 21:01 +0200, Sagaert Johan spake thusly:
> How is the TZ menu option intended to be used ?
> In my older builds I had a file /etc/TZ, but using the TZ menu
> options creates a symlink to a directory so /etc/TZ is a directory
> Containing al timezone definitions.
> This does not seem to work since uClibc expects a file /etc/TZ
> Am I missing something ?

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

So, this is indeed a symlink, but it points to a file, which contains a
valid uClibc timezone spec.

What is your BR2_TARGET_LOCALTIME set to? This should be set to a valid
location, usually a big city in an area.

The valid list is somewhere in the tzdata source tree (I'll leave as an
exercise to you to find where! ;-) )

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
