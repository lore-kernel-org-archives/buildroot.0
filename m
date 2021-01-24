From: Joachim Wiberg <troglobit@gmail.com>
Date: Sun, 24 Jan 2021 16:22:17 +0100
Subject: [Buildroot] [PATCH 1/3] package/sysklogd: bump to verson 2.2.0
In-Reply-To: <20210124093641.GJ926565@scaer>
References: <20210122154333.1927190-1-troglobit@gmail.com>
 <20210122154333.1927190-2-troglobit@gmail.com>
 <20210124093641.GJ926565@scaer>
Message-ID: <87zh0yuzpy.fsf@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Sun, Jan 24, 2021 at 10:36, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> On 2021-01-22 16:43 +0100, Joachim Wiberg spake thusly:
> This patch does four different things;
>  1. bumps the version, switching to maintainer's archive
>  2. removes the --without-logger configure option
>  3. changes the ./configure options for prefix et al. (more on that later)
>  4. extends the systemd service unit to include the environment
> This should have been four patches.

Aha, splitting it up even furhter makes sense, thank you!

> However, as already discussed in a review for mrouted, the --prefix,
> --sysconfdir, and --localstatedir are already the value passed by the
> autotools-package infra, so aer not needed. But wy do you want to switch
> the logger from / to /usr ?

Possibly I got confused by /sbin vs /usr/sbin for system daemons/tools,
in particular with BR2_ROOTFS_MERGED_USR.  I went about it backwards and
thought it applied to all non-BusyBox tools.  Sorry about that.

I realize now that I was completely wrong and for tools/daemons that
replece functionality that BusyBox provides the package must install
each tool and daemon to the BusyBox path.

I apologize for the confusion and head scratching this has caused!

> See commit 33642d8d959 (package/sysklogd: fix installation path of the
> daemons), where the installation path was changed:
>  1. to match the paths tht are used in the init scripts
>  2. to match the location where busybox would install its applet
> So your patch breaks that, because it does not update the two init
> scripts, and will let busybox install its applet in /sbin.

I see, for past sysklogd that worked.  Now we provide the logger tool
as well, and --exec-prefix=/ changes to /bin/logger and /sbin/syslogd.
Since BusyBox logger is in /usr/bin, I believe we need to change the
SYSKLOGD_CONF_OPTS to use --bindir and --sbindir instead.

I'll post another patch shortly.

> Granted, there should have been a comment above the _CONF_OPTS line to
> explain that was intentional.

I understand.  Thank yhou for explaining.

> Finally, why is the --without-logger option removed entirely in this
> patch, when your patch 2 makes it a configurable option?

Yes, that was sloppy.

> I've applied the version bump and the systemd stuff as two separate
> patches, and dropped the rest.

It looks great!


Best regards
 /Joachim
 
