From: Norbert Lange <nolange79@gmail.com>
Date: Wed, 5 Aug 2020 16:08:14 +0200
Subject: [Buildroot] [PATCH 4/5] package/systemd: remove util-linux
 nologin dependency
In-Reply-To: <20200805155247.0d39b511@windsurf.home>
References: <20200731215345.19212-1-nolange79@gmail.com>
 <20200731215345.19212-5-nolange79@gmail.com>
 <20200805155247.0d39b511@windsurf.home>
Message-ID: <CADYdroP2Py-mB7GWxLU=CPr2zFKSCZ-6zFH3ZjcdZG+bcoc8TA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mi., 5. Aug. 2020 um 15:52 Uhr schrieb Thomas Petazzoni
<thomas.petazzoni@bootlin.com>:
>
> On Fri, 31 Jul 2020 23:53:44 +0200
> Norbert Lange <nolange79@gmail.com> wrote:
>
> > +ifeq ($(BR2_PACKAGE_UTIL_LINUX_NOLOGIN),y)
> > +SYSTEMD_CONF_OPTS += -Dnologin-path=/usr/sbin/nologin
>
> nologin is in fact installed in /sbin in a non-merged /usr
> configuration. I know in the case of systemd, merged /usr is always
> enabled so that is not a big deal, but I nevertheless changed to
> /sbin/nologin since it seems to be the canonical location for nologin.
>
> Applied with this change. Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Hello,

I am not terribly concerned with the change, but what happened until now,
is that meson picked either the host binary or the "default" one from
systemd (see [1], where this is addressed).
I'd prefer to pick the default settings from systemd (favoring /usr
being self-contained), following:

-----------------
# if -Dxxx-path option is found, use that. Otherwise, check in $PATH,
# /usr/sbin, /sbin, and fall back to the default from middle column.
progs = [['quotaon',    '/usr/sbin/quotaon'    ],
         ['quotacheck', '/usr/sbin/quotacheck' ],
         ['kmod',       '/usr/bin/kmod'        ],
         ['kexec',      '/usr/sbin/kexec'      ],
         ['sulogin',    '/usr/sbin/sulogin'    ],
         ['mount',      '/usr/bin/mount',      'MOUNT_PATH'],
         ['umount',     '/usr/bin/umount',     'UMOUNT_PATH'],
         ['loadkeys',   '/usr/bin/loadkeys',   'KBD_LOADKEYS'],
         ['setfont',    '/usr/bin/setfont',    'KBD_SETFONT'],
         ['nologin',    '/usr/sbin/nologin',   ],
-----------------

Regards, Norbert

[1] - https://patchwork.ozlabs.org/project/buildroot/patch/20200710234150.185609-2-nolange79 at gmail.com/
