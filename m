From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Date: Mon, 03 Jul 2017 21:53:43 +0200
Subject: [Buildroot]
	=?iso-8859-1?q?Systemd_no_longer_working_when_transit?=
	=?iso-8859-1?q?ioning_from_2017=2E02=2E3_to_2017=2E05?=
In-Reply-To: <CAOLz05oMkX9563v=a+Zk1Zro-EUuQaBwgfCMyvi5Ne3Lz_2dQQ@mail.gmail.com>
References: <CAOLz05oMkX9563v=a+Zk1Zro-EUuQaBwgfCMyvi5Ne3Lz_2dQQ@mail.gmail.com>
Message-ID: <d4790720-4e78-418e-9f8a-d3035440e36f@cesnet.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On ?ter? 20. ?ervna 2017 8:29:02 CEST, Amr Bekhit wrote:
> Startup log: https://pastebin.com/TtSmZF7F
> systemd-timesyncd: https://pastebin.com/qC2QMnRN
> systemd-resolved: https://pastebin.com/z0U5w98Y

You've linked to pastebin, so in case these links disappear in a few 
days/years, here's the relevant part:

> # journalctl -xe -u systemd-timesyncd
> -- Logs begin at Mon 2017-06-19 13:59:33 +03, end at Mon 2017-06-19 14:01:03 +03. --
> Jun 19 13:59:35 xplained-d4 systemd[1]: Starting Network Time Synchronization...
> -- Subject: Unit systemd-timesyncd.service has begun start-up
> -- Defined-By: systemd
> -- Support: https://lists.freedesktop.org/mailman/listinfo/systemd-devel
> --
> -- Unit systemd-timesyncd.service has begun starting up.
> Jun 19 13:59:35 xplained-d4 systemd[899]: systemd-timesyncd.service: Failed at step NAMESPACE spawning /lib/systemd/systemd-timesyncd: No such file or directory

This is https://bugs.busybox.net/show_bug.cgi?id=9926 .

Buildroot's default filesystem layout breaks those units for which systemd 
tries to use a private filesystem/mount namespace. In particular /tmp, 
/var/tmp etc are relevant here. A correct fix is to ensure that the root 
filesystem does *not* include symlinks for these directories because they 
prevent creating the overlaying mounts.

There's some work-in-progress at [1] which attempts to re-structure the 
rootfs and which also makes it more systemd-friendly. For me, it breaks 
compilation with the Linaro toolchain (one has to run one mkdir between 
`make toolchain` and `make all`), but otherwise it looks like a good thing 
to do.

I'm not updating the bug because Bugzilla won't load for me right now for 
some reason.

Cheers,
Jan

[1] 
https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/systemd-skeleton-2
