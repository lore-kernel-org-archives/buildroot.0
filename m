From: William Wagner <will_wagner@carallon.com>
Date: Mon, 07 Mar 2011 18:52:35 +0000
Subject: [Buildroot] [PATCH 49/55] Improve handling of mdev/udev
In-Reply-To: <f92465f9de8bcd24cf2c974b158a600a84e96422.1291582352.git.thomas.petazzoni@free-electrons.com>
References: <cover.1291582350.git.thomas.petazzoni@free-electrons.com>
	<f92465f9de8bcd24cf2c974b158a600a84e96422.1291582352.git.thomas.petazzoni@free-electrons.com>
Message-ID: <4D752973.3090004@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/12/2010 20:53, Thomas Petazzoni wrote:
> Yegor Yefremov introduced udev/mdev integration, but it relies on
> devtmpfs and does not use tmpfs on /dev, which is the purpose of
> mdev/udev. This commit improves how mdev and udev are handled in
> Buildroot.
>
> At compile time, only a minimal /dev is created in the filesystem,
> with only "console" and "null". This is done thanks to a small device
> table in target/generic/device_table_mdev_udev.txt. This is done
> directly at the configuration level (fs/Config.in).
>
> Moreover, at compile time, the mounting of a tmpfs filesystem in /dev
> is enabled/disabled in /etc/inittab depending on whether udev/mdev are
> used or not. This is done in target/generic/Makefile.in, together with
> other hooks to tune the target filesystem (hostname, serial port,
> etc.).
>
> At run time, what happens is :
>
>   * inittab sysinit actions are executed. They do: remount the root
>     filesystem read/write, mount the proc filesystem, mount a tmpfs
>     filesystem in /dev, create the /dev/pts directory and then mount
>     all filesystems listed in fstab.
>
>   * initialization scripts are started, with S10mdev or S10udev being
>     at the very beginning of the list of scripts to be executed.
>
> Between the moment at which a tmpfs filesystem is mounted in /dev and
> the moment S10mdev or S10udev are executed, the /dev directory is
> empty of devices. This is why the "null" device is no longer used to
> redirect messages from sysinit actions.
>
> The kernel compilation code is improved to only enable devtmpfs in the
> configuration when the devtmpfs method is used. udev/mdev do not
> require devtmpfs, only tmpfs.
>
> Finally, the S10udev startup script is simplified, as it handled
> unnecessary things: mount sysfs, mount a tmpfs filesystem in /dev/,
> etc.
>
> Signed-off-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>

Hi Thomas/Peter,

What is the status of this patch? Will it or something similar get 
merged this development cycle. I'm looking to update to a newer 
buildroot version internally and I'll either need this patch or 
something I've written myself and would rather stay in sync with upstream.

Thanks
Will

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
