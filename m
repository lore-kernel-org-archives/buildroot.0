From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jul 2012 23:00:41 +0200
Subject: [Buildroot] [PATCH] gpsd: fix qt build problem
In-Reply-To: <1343161749-23289-1-git-send-email-spdawson@gmail.com>
References: <1343161749-23289-1-git-send-email-spdawson@gmail.com>
Message-ID: <20120724230041.29d9502f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 24 Jul 2012 21:29:09 +0100,
spdawson at gmail.com a ?crit :

>  GPSD_LDFLAGS = $(TARGET_LDFLAGS)
> +GPSD_CFLAGS = $(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include -I$(STAGING_DIR)/usr/include/QtCore -I$(STAGING_DIR)/usr/include/QtNetwork

I'm sorry but no, this is not the right way of fixing it. The QtCore
and QtNetwork header paths are already on the build command line. It's
just that they are wrong because they have two times the sysroot
location:

/home/test/outputs/gpsd/host/usr/bin/arm-linux-gnueabi-g++ -o gpsutils-qt.os -c -pipe -Os -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -Wextra -Wall -Wno-uninitialized -Wno-missing-field-initializers -Wcast-align -Wmissing-declarations -Wpointer-arith -Wreturn-type -O2 -fPIC -DUSE_QT -DQT_SHARED -I/home/test/outputs/gpsd/host/usr/arm-unknown-linux-gnueabi/sysroot/home/test/outputs/gpsd/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/include -I/home/test/outputs/gpsd/host/usr/arm-unknown-linux-gnueabi/sysroot/home/test/outputs/gpsd/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/QtNetwork -I/home/test/outputs/gpsd/host/usr/arm-unknown-linux-gnueabi/sysroot/home/test/outputs/gpsd/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/QtCore gpsutils.c
gpsutils.c:26:21: fatal error: QDateTime: No such file or directory
compilation terminated.

See
the /home/test/outputs/gpsd/host/usr/arm-unknown-linux-gnueabi/sysroot/home/test/outputs/gpsd/host/usr/arm-unknown-linux-gnueabi/sysroot/usr/include/QtCore
path. The problem is in the directory arguments passed to Scons.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
