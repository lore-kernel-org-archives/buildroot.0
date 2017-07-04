From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 Jul 2017 18:36:50 +0200
Subject: [Buildroot] Systemd no longer working when transitioning from
 2017.02.3 to 2017.05
In-Reply-To: <d4790720-4e78-418e-9f8a-d3035440e36f@cesnet.cz>
References: <CAOLz05oMkX9563v=a+Zk1Zro-EUuQaBwgfCMyvi5Ne3Lz_2dQQ@mail.gmail.com>
 <d4790720-4e78-418e-9f8a-d3035440e36f@cesnet.cz>
Message-ID: <20170704163650.GA3499@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jan, Amr, All,

On 2017-07-03 21:53 +0200, Jan Kundr?t spake thusly:
> On ?ter? 20. ?ervna 2017 8:29:02 CEST, Amr Bekhit wrote:
> >Startup log: https://pastebin.com/TtSmZF7F
> >systemd-timesyncd: https://pastebin.com/qC2QMnRN
> >systemd-resolved: https://pastebin.com/z0U5w98Y
> 
> You've linked to pastebin, so in case these links disappear in a few
> days/years, here's the relevant part:
> 
> ># journalctl -xe -u systemd-timesyncd
> >-- Logs begin at Mon 2017-06-19 13:59:33 +03, end at Mon 2017-06-19 14:01:03 +03. --
> >Jun 19 13:59:35 xplained-d4 systemd[1]: Starting Network Time Synchronization...
> >-- Subject: Unit systemd-timesyncd.service has begun start-up
> >-- Defined-By: systemd
> >-- Support: https://lists.freedesktop.org/mailman/listinfo/systemd-devel
> >--
> >-- Unit systemd-timesyncd.service has begun starting up.
> >Jun 19 13:59:35 xplained-d4 systemd[899]: systemd-timesyncd.service: Failed at step NAMESPACE spawning /lib/systemd/systemd-timesyncd: No such file or directory
> 
> This is https://bugs.busybox.net/show_bug.cgi?id=9926 .
> 
> Buildroot's default filesystem layout breaks those units for which systemd
> tries to use a private filesystem/mount namespace. In particular /tmp,
> /var/tmp etc are relevant here. A correct fix is to ensure that the root
> filesystem does *not* include symlinks for these directories because they
> prevent creating the overlaying mounts.
> 
> There's some work-in-progress at [1] which attempts to re-structure the
> rootfs and which also makes it more systemd-friendly.

I've done quite some progress on this branch during the (extended)
week-end, but it is still not 100% ready yet.

> For me, it breaks
> compilation with the Linaro toolchain (one has to run one mkdir between
> `make toolchain` and `make all`), but otherwise it looks like a good thing
> to do.

Yup, I have your earlier mail still in my inbox about this, sorry I did
not follow up on it. It plan on stabiolising this work, and when it is
stable I'll address your issue as well. Thanks for the reminder! ;-)

> I'm not updating the bug because Bugzilla won't load for me right now for
> some reason.

Yup, it seems there have been a few hiccups on the server in the recent
past... :-/

Regards,
Yann E. MORIN.

> Cheers,
> Jan
> 
> [1]
> https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/systemd-skeleton-2
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
