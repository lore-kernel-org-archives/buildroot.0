From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 14 Sep 2011 12:06:40 +0200
Subject: [Buildroot] [PATH 0/1] package/ncurses: disable use of the GPM
	library
In-Reply-To: <20110914092105.78c61a10@skate>
References: <1315958717-9861-1-git-send-email-yann.morin.1998@anciens.enib.fr>
 <20110914092105.78c61a10@skate>
Message-ID: <201109141206.40645.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 14 September 2011 09:21:05 Thomas Petazzoni wrote:
> Le Wed, 14 Sep 2011 02:05:16 +0200,
> "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr> a ?crit :
> 
> > That host-ldd is then installed as $(HOST_DIR)/usr/bin/ldd, which is
> > first in the PATH.
> 
> When you build uClibc for ARM, uClibc installs an host-ldd ?

Well, this time it was for MIPS. 

> Why is this ldd necessary ?

Probably not `necessay' for buildroot, but this host-ldd tries to be the
Holy Grail of cross-compilation: an ldd that can interpret the target
ELF files, and behaves the same as if it was run on the target.

> I don't criticize the --without-gpm fix,

Well, it's not a fix per-se, I prefer to view it as a workaround that is
also beneficial by explicitly stating that we do not need gpm just to
build tic.

> but I'm just wondering if that
> ldd in $(HOST_DIR) could create other problems with other packages.

Well, I'm surprised to be the first to notice and report this issue.
Probably not many people have the libgpm-dev package installed. So, I
can understand that _this_ error went unnoticed for years.

But with the number of packages in buildroot, I can hardly think that a
similarly broken combination did not appear yet.

But you're right. The proper way to fix this is to decide whether that
host-ldd is usefull or not.

Well, I can tell it could be usefull for at least one situation: when we
build the ncurses for the target, which happens every time we want gdb on
the target. But, as we do not package the GPM library in buildroot, we do
not currently benefit from this host-ldd.

To be noted, ncurses would still be broken, as it uses plain 'ldd' to do
the check, and does not even try with 'tuple-ldd'. It's hardcoded (all on
one line initially):

    cf_cv_gpm_soname=`ldd conftest$ac_exeext 2>/dev/null    \
                      | sed -e 's,^.*/,,' -e 's, .*$,,'     \
                      | fgrep libgpm.`

To be noted also, crosstool-NG also provides a kind of host-ldd (calls it
the cross-ldd), but only installs it tuple-prefixed; and it is consistent
with the glibc's ldd in terms of output (or it is a bug), so should not be
an issue for host packages.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
