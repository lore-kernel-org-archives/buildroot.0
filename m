From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Dec 2020 22:21:53 +0100
Subject: [Buildroot] [PATCH 1/1] package/sysklogd: bump to version 2.1.2
In-Reply-To: <20200812160843.24064-1-andreas.hilse@googlemail.com>
References: <20200812160843.24064-1-andreas.hilse@googlemail.com>
Message-ID: <20201205222153.75769040@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Andreas,

On Wed, 12 Aug 2020 18:08:43 +0200
Andreas Hilse <andreas.hilse@googlemail.com> wrote:

> - fixes: sysklogd 1.6 klogd with newer glibcs: kernel messages are logged to user facility
> - sysklogd removed klogd, functionality has been moved to syslogd
> - now supports config fragments in /etc/syslog.d
> - disabled sysklogd logger to not interfere with other loggers
> 
> Signed-off-by: Andreas Hilse <andreas.hilse@googlemail.com>

I think the commit log should mention that the license has changed,
with a link to https://github.com/troglobit/sysklogd/releases/tag/v2.1.

However, I was about to apply, but got a build failure:

syslogd.c: In function ?opensys?:
syslogd.c:486:42: error: ?O_CLOEXEC? undeclared (first use in this function)
  fd = open(file, O_RDONLY | O_NONBLOCK | O_CLOEXEC, 0);
                                          ^
syslogd.c:486:42: note: each undeclared identifier is reported only once for each function it appears in
make[3]: *** [Makefile:646: syslogd-syslogd.o] Error 1
make[3]: *** Waiting for unfinished jobs....
syslog.c: In function ?vsyslogp_r?:
syslog.c:448:27: error: ?O_CLOEXEC? undeclared (first use in this function)
   O_WRONLY | O_NONBLOCK | O_CLOEXEC, 0)) >= 0) {
                           ^

which happens with the following defconfig:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2020.02.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_SYSKLOGD=y
# BR2_TARGET_ROOTFS_TAR is not set

Could you have a look ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
