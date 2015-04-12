From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Apr 2015 15:56:43 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/exim: Add optional OpenSSL
 support
In-Reply-To: <XnsA47AA092866DAberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <1428837942-24631-1-git-send-email-bernd.kuhls@t-online.de>
 <20150412132302.GF4218@free.fr> <20150412134418.GA21018@free.fr>
 <XnsA47AA092866DAberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <20150412135643.GB21018@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2015-04-12 15:47 +0200, Bernd Kuhls spake thusly:
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote in 
> news:20150412134418.GA21018 at free.fr:
> 
> >> A further fix would be to remove use of libnsl when the C library is not
> >> glibc.
> > 
> > Woops, wrong, uClibc also has libnsl...
> 
> Hi,
> 
> but it is only a stub library without any function:
> 
> http://git.uclibc.org/uClibc/tree/docs/Glibc_vs_uClibc_Differences.txt
> 
> "uClibc provides a stub libnsl, but has no actual support for Network 
> Information Service (NIS)."
> 
> Right now I am testing something like this:
> 
> -# this specific toolchain lacks libnsl
> -ifeq ($(BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_2014_12),y)
> +# only (e)glibc provides libnsl, remove -lnsl for all other toolchains
> +# http://bugs.exim.org/show_bug.cgi?id=1564
> +ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
> 
> which fixes your compile bug, just to find another one...
> 
> smtp_in.c: In function ?smtp_start_session?:
> smtp_in.c:1976:36: error: invalid application of ?sizeof? to incomplete type 
> ?struct options?
>      EXIM_SOCKLEN_T optlen = sizeof(struct ip_options) + MAX_IPOPTLEN;
>                                     ^
> smtp_in.c:2023:42: error: dereferencing pointer to incomplete type
>        uschar *optstart = (uschar *)(ipopt->__data);
>                                           ^
> smtp_in.c:2053:54: error: dereferencing pointer to incomplete type
>                 inet_ntoa(*((struct in_addr *)(&(ipopt->faddr))))))

Yup, got the same while investigating, too.

> which I am trying to solve right now.

Well, would it not be much simpler to just ditch support for static
builds in exim? I.e. mark it as depends on !static .

Surely, static is for those few fronge architecures, and I doubt running
a mail server on those is a common use-case...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
