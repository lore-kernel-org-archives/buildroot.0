From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 22 Aug 2016 10:51:01 +0200
Subject: [Buildroot] systemd-timesyncd doesn't start with default config
 and skeleton
In-Reply-To: <e487aac1-f199-42d0-1211-4add9c5718bf@gmail.com>
References: <e487aac1-f199-42d0-1211-4add9c5718bf@gmail.com>
Message-ID: <20160822085101.GA5779@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Zoltan, All,

On 2016-08-22 10:41 +0200, Zoltan Gyarmati spake thusly:
> Dear All,
> with version 2016.08-rc2, with the default systemd configuration the
> systemd-timesyncd start fails with the error msg:
> 
> buildroot systemd[115]: systemd-timesyncd.service: Failed at step
> NAMESPACE spawning /lib/systemd/systemd-timesyncd: No such file or directory
> 
>  It seems that the problem is that in the default rootfs skeleton the
> /var/tmp dir is a symlink to /tmp, and in
> /usr/lib/systemd/system/systemd-timesyncd.service the PrivateTmp
> variable is set.
> Either removing the PrivateTmp=yes or making /var/tmp a directory on its
> own solves the issue. What solution would be preferable to fix this?

The best solution is that I get to finish my skeleton-revamp series and
get it merged( first was submitted on the lkist, second is WIP taking
into account the comments that were made on the first):
    https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/systemd-skeleton
    https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/systemd-skeleton-2

Unfortunately, that won't be in 2016.08, as I haven't had time to finish
it properly before rc1. So it will only go in for next cycle... :-/

In the meantime, just use a post-build script that cleans up the mess,
like tweaking the unit file to not require PrivateTmp, or to remove the
/var/tmp symlink and make it a directory.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
