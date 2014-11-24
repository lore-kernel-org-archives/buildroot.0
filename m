From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 24 Nov 2014 07:24:19 -0300
Subject: [Buildroot] [PATCH 2/2] samba: Add support for libnss_win*.so*
 installation
In-Reply-To: <20141122213359.2628a10e@free-electrons.com>
References: <1407176057-13180-1-git-send-email-benoit.thebaudeau@advansee.com>	<1407176057-13180-2-git-send-email-benoit.thebaudeau@advansee.com>
 <20141122213359.2628a10e@free-electrons.com>
Message-ID: <54730753.3030108@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/22/2014 05:33 PM, Thomas Petazzoni wrote:

> Hello Gustavo,
> 
> Could you have a look at the below patch? It would be useful to have
> some review from a person knowing Samba better than I do.

Hi, let's see.

> I must say I'm a bit skeptical about two things (about which probably
> Beno?t can give some details) :
> 
>  * The usefulness of enabling the NSS libraries in non-glibc
>    environments. Even though I agree that technically, nothing prevents
>    some program from using them, in practice, the NSS libraries are
>    basically only used by the glibc name resolution logic. So I would
>    personally prefer to make those NSS libraries visible only in glibc
>    configurations.

Even if they can be built they really are intended for (e)glibc so we agree.
If you need to access/use wbclient functionality you could just use the
wbclient (winbind) api by enabling samba install to staging, that's the
public way of accessing it.

>  * The fact that the winbindd daemon is not actually needed on the
>    target to get libnss_wins/libnss_winbind working. My understanding
>    is that winbindd is a daemon that will answer to the name resolution
>    requests of libnss_wins/libnss_winbind, so I don't see how they can
>    work without the daemon running.

AFAIK you need winbind running in order to use libwbclient and/or
libnss_winbind/wins. I think libnss_wins has a fallback to DNS-only mode
but it's probably not very useful.

Also please note that Samba 3 is very likely going EOL as soon as Samba
4.2.x is released which even though delayed a bit in the RC phase is
coming along pretty soon, so adding feature to the samba3 package isn't
very wise IMHO (it's in security-only fixes now).
See: https://wiki.samba.org/index.php/Samba_Release_Planning

Regards.
