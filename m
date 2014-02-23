From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Feb 2014 15:11:59 +0100
Subject: [Buildroot] FW: [PATCH] linux-headers: cross compile fix
In-Reply-To: <884EA965490E3C4D8E66AEF41E98025006C47E@ezex10.ezchip.com>
References: <884EA965490E3C4D8E66AEF41E98025006BF4D@ezex10.ezchip.com>
 <20140223105041.414123e2@skate>
 <884EA965490E3C4D8E66AEF41E98025006C47E@ezex10.ezchip.com>
Message-ID: <20140223151159.7114b0be@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Noam Camus,

On Sun, 23 Feb 2014 12:33:42 +0000, Noam Camus wrote:
> See Inline

No need to say that. Just strip from the original message the parts
that have become irrelevant.

> Doesn't look harmful in principle, but it seems to have worked until now without CROSS_COMPILE="$(TARGET_CROSS)". Can you expand the commit log by explaining in which case you have seen errors, and which errors.
> The linux-headers package is used daily to build toolchains by all Buildroot users, so I'd like to understand how your situation is different. Is it that the ARC kernel headers need something special?
> But we are building ARC toolchains everyday in the autobuilders, with no problem. That's why I'd like to have more details.
> Thomas 
> 
> [Noam Camus]
> Sorry for long lines I am still looking for better email client than my outlook.

Aah, yes, indeed. But I've been told that it might be possible, with
some configuration, to tweak the Outlook behavior to make it more or
less reasonable for discussions on open-source mailing list. Though
I've never used Outlook myself, so I can't say much more than that.

> Just use target linux-headers-rebuild and you will get many errors that buildroot silently ignores.
> You alternatively may add intentionally BAD CROSS_COMPILE if you don't have ARC setup handy and see that
> Toolchain building is not stopped due to this error.
> For example here is my log:
> ---------------------------------------
> rm -f /home/noamc/workspace/sb/EZdk-nps/ldk/build/output_arc/build/linux-headers-custom/.stamp_rsynced
> rm -f /home/noamc/workspace/sb/EZdk-nps/ldk/build/output_arc/build/linux-headers-custom/.stamp_built
> rm -f /home/noamc/workspace/sb/EZdk-nps/ldk/build/output_arc/build/linux-headers-custom/.stamp_staging_installed
> rm -f /home/noamc/workspace/sb/EZdk-nps/ldk/build/output_arc/build/linux-headers-custom/.stamp_target_installed
> rm -f /home/noamc/workspace/sb/EZdk-nps/ldk/build/output_arc/build/linux-headers-custom/.stamp_images_installed
> rm -f /home/noamc/workspace/sb/EZdk-nps/ldk/build/output_arc/build/linux-headers-custom/.stamp_host_installed
> >>> linux-headers custom Syncing from source dir /home/noamc/workspace/sb/EZdk-nps/ldk/build/buildroot/../sources/linux-nps
> rsync -au --cvs-exclude --include core /home/noamc/workspace/sb/EZdk-nps/ldk/build/buildroot/../sources/linux-nps/ /home/noamc/workspace/sb/EZdk-nps/ldk/build/output_arc/build/linux-headers-custom
> >>> linux-headers custom Building
> >>> linux-headers custom Installing to staging directory
> (cd /home/noamc/workspace/sb/EZdk-nps/ldk/build/output_arc/build/linux-headers-custom; PATH="/home/noamc/workspace/sb/EZdk-nps/ldk/build/output_arc/host/bin:/home/noamc/workspace/sb/EZdk-nps/ldk/build/output_arc/host/usr/bin:/home/noamc/workspace/sb/EZdk-nps/ldk/build/output_arc/host/usr/sbin/:/usr/lib64/qt-3.3/bin:/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/npsdb/ezutils:/home/noamc/bin:/home/npsdb/ezutils" PERLLIB="/home/noamc/workspace/sb/EZdk-nps/ldk/build/output_arc/host/usr/lib/perl" /usr/bin/make -j9 ARCH=arc HOSTCC="/home/noamc/workspace/sb/EZdk-nps/ldk/build/output_arc/host/usr/bin/ccache /usr/bin/gcc" HOSTCFLAGS="" HOSTCXX="/home/noamc/workspace/sb/EZdk-nps/ldk/build/output_arc/host/usr/bin/ccache /usr/bin/g++" INSTALL_HDR_PATH=/home/noamc/workspace/sb/EZdk-nps/ldk/build/output_arc/host/usr/arceb-ezchip-linux-uclibc/sysroot/usr headers_install)
> /home/noamc/workspace/sb/EZdk-nps/ldk/build/output_arc/build/linux-headers-custom/scripts/gcc-version.sh: line 25: arc-linux-uclibc-gcc: command not found
> /home/noamc/workspace/sb/EZdk-nps/ldk/build/output_arc/build/linux-headers-custom/scripts/gcc-version.sh: line 26: arc-linux-uclibc-gcc: command not found
> /home/noamc/workspace/sb/EZdk-nps/ldk/build/output_arc/build/linux-headers-custom/scripts/gcc-version.sh: line 25: arc-linux-uclibc-gcc: command not found
> /home/noamc/workspace/sb/EZdk-nps/ldk/build/output_arc/build/linux-headers-custom/scripts/gcc-version.sh: line 26: arc-linux-uclibc-gcc: command not found
> /home/noamc/workspace/sb/EZdk-nps/ldk/build/output_arc/build/linux-headers-custom/scripts/gcc-version.sh: line 25: arc-linux-uclibc-gcc: command not found
> /home/noamc/workspace/sb/EZdk-nps/ldk/build/output_arc/build/linux-headers-custom/scripts/gcc-version.sh: line 26: arc-linux-uclibc-gcc: command not found
> /home/noamc/workspace/sb/EZdk-nps/ldk/build/output_arc/build/linux-headers-custom/scripts/gcc-version.sh: line 25: arc-linux-uclibc-gcc: command not found
> /home/noamc/workspace/sb/EZdk-nps/ldk/build/output_arc/build/linux-headers-custom/scripts/gcc-version.sh: line 26: arc-linux-uclibc-gcc: command not found

Ah, right. The problem is that our linux-headers package does not
depend on any cross-compiler, not even gcc-initial. It happens that
since host-gcc-initial is before linux-headers in the alphabetical
order, you normally have a cross-compiler available by the time the
linux-headers package is installed, but this is not explicitly
guaranteed by the package dependencies.

This problem was already raised on the LKML a number of years ago:
https://lkml.org/lkml/2007/10/10/140, with apparently no solution
coming up.

A possible solution is to adjust your patch so that it explicitly adds
host-gcc-initial as a dependency of linux-headers.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
