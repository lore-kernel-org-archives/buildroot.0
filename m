From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 10 May 2013 18:53:56 +0200
Subject: [Buildroot] Bizarre things on the allyespackageconfig build
In-Reply-To: <20130510175133.13d3fc6f@skate>
References: <20130510175133.13d3fc6f@skate>
Message-ID: <20130510165356.GA19822@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-05-10 17:51 +0200, Thomas Petazzoni spake thusly:
> Following the allyespackageconfig, I did explore the generated
> output/target filesystem, and noticed a number of bizarre things that
> probably should be fixed:
[--SNIP--]
>  * There is a usr/arm-buildroot-linux-gnueabi directory, which contains
>    just a 'bin' subdirectory, which contains ar, as, ld, nm, etc.
> 
>    $ ls usr/arm-buildroot-linux-gnueabi/bin/
>    ar  as  ld  ld.bfd  nm  objcopy  objdump  ranlib  strip
> 
>    That's a strange installation location for binutils.

These should be hard-links to their fully-qualified counterparts in
/usr/bin:
    arm-buildroot-linux-gnueabi-{ar,as,ld,ld,bfd,nm,objcopy,ranlib,strip}

That's typical of a binutils installation.

[--SNIP--]
>  * There a bunch of libraries that don't have the executable bit set in
>    usr/lib. I don't think it's a big problem, but it makes them
>    different from the others.

Shared libraries do not need to be executable, except the dynamic linker
ld.so which is both a progrm and a library.

Also, libc.so from {,e}glibc is also executable, but not he libc.so from
uClibc.

I think it is not a problem per-se, and I think shared libraries should
not be executable at all.

>  * Some packages seem to confuse /var with /usr/var: cups, netatalk,
>    squid, polkit-1, vtund, stunnel. Here's what I have in usr/var/ :
[--SNIP--]

Two options here:
  - ./configure --localstatedir=/var
    Some packages do set it in their .mk, eg. (=/var unless specified):
        avahi, sed, directfb, NM, lighttpd, dhcp (=/var/lib/dhcp),
        php, oprofile, xserver_xorg-server, samba, dbus, collectd,
        proftpd (=/var/run), sqlite, bind, dbus-glib, ndisc6, sql_net,
        sqlcipher, connman, pulseaudio
    Probably usefull to set it in the pkg-infra?

[--SNIP--]
>  * usr/share represents 428 MB, which includes 121 MB of locales (I
>    didn't select the removal of locales in my configuration)

Not a problem if locales where not /disabled/ in your config.

> If people are interested in fixing some of those issues, reply to this
> e-mail saying which issue you're going to have a look at.

I'll look at the /var issue.
Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
