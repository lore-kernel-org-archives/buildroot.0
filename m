From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Aug 2017 15:52:06 +0200
Subject: [Buildroot] [PATCH] avahi: create missing "services" directory
In-Reply-To: <20170704163533.13923-1-maxime.hadjinlian@gmail.com>
References: <20170704163533.13923-1-maxime.hadjinlian@gmail.com>
Message-ID: <20170817155206.7621496b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  4 Jul 2017 18:35:32 +0200, Maxime Hadjinlian wrote:
> Fixes a warning in avahi-daemon startup log:
> "Failed to read /etc/avahi/services."
> 
> This directory can contain services files that you want avahi to
> advertise.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

I don't understand why this patch is necessary. Indeed, with the
following defconfig:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2017.05-1078-g95b1dae.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_PACKAGE_AVAHI=y
BR2_PACKAGE_AVAHI_DAEMON=y

I do get the /etc/avahi/services directory created by the avahi
Makefiles, during the installation step:

>>> avahi 0.6.32 Installing to target
[...]
 /usr/bin/mkdir -p '/home/thomas/projets/buildroot/output/target/etc/avahi/services'
 /usr/bin/mkdir -p '/home/thomas/projets/buildroot/output/target/etc/avahi'
  /bin/sh ../libtool   --mode=install /usr/bin/install -c avahi-daemon '/home/thomas/projets/buildroot/output/target/usr/sbin'
 /usr/bin/install -c -m 644 ssh.service sftp-ssh.service '/home/thomas/projets/buildroot/output/target/etc/avahi/services'

Two files are even installed in this folder.

Of course, if you disable BR2_PACKAGE_AVAHI_DAEMON=y, this folder is
not created, but there's also no S50avahi-daemon init script installed,
and therefore no daemon launched at boot time.

Could you check that your patch is still really needed, and if it is,
extend the commit log to explain under which configuration you're
seeing the problem ?

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
