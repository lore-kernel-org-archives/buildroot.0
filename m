From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Mar 2014 19:14:11 +0100
Subject: [Buildroot] [PATCH] i2c-tools: Add i2c-dev.h to staging
 directory for userspace i2c drivers.
In-Reply-To: <20140303221028.09ea1b18@skate>
References: <1380017924-20072-1-git-send-email-jouko.nikula@espotel.com>
 <20140303221028.09ea1b18@skate>
Message-ID: <20140304191411.1e2a3899@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 3 Mar 2014 22:10:28 +0100, Thomas Petazzoni wrote:
> Dear Jouko Nikula,
> 
> On Tue, 24 Sep 2013 13:18:43 +0300, Jouko Nikula wrote:
> > Signed-off-by: Jouko Nikula <jouko.nikula@espotel.com>
> > ---
> >  package/i2c-tools/i2c-tools.mk |    5 +++++
> >  1 file changed, 5 insertions(+)
> 
> Applied, thanks.

In fact, I will revert it: the modified i2c-dev.h by the i2c-tools
has some definitions that conflicts with the i2c.h normally provided by
the kernel headers. Therefore, if a userspace program or library
includes both, it fails to build. This is the case with libsoc, see
http://autobuild.buildroot.org/results/1f4/1f451a338487a2a3c8a8f9b18540d41b90ee5aac/build-end.log:

In file included from ../lib/include/libsoc_i2c.h:2:0,
                 from i2c.c:11:
/home/test/test/1/output/host/usr/sh4-buildroot-linux-uclibc/sysroot/usr/include/linux/i2c-dev.h:38:8: error: redefinition of 'struct i2c_msg'
In file included from ../lib/include/libsoc_i2c.h:1:0,
                 from i2c.c:11:
/home/test/test/1/output/host/usr/sh4-buildroot-linux-uclibc/sysroot/usr/include/linux/i2c.h:68:8: note: originally defined here
In file included from ../lib/include/libsoc_i2c.h:2:0,
                 from i2c.c:11:
/home/test/test/1/output/host/usr/sh4-buildroot-linux-uclibc/sysroot/usr/include/linux/i2c-dev.h:90:7: error: redefinition of 'union i2c_smbus_data'
In file included from ../lib/include/libsoc_i2c.h:1:0,
                 from i2c.c:11:
/home/test/test/1/output/host/usr/sh4-buildroot-linux-uclibc/sysroot/usr/include/linux/i2c.h:128:7: note: originally defined here
make[2]: *** [libsoc_la-i2c.lo] Error 1

Apparently, it is well-known to the i2c-tools developers that their
i2c-dev.h is broken, and not really usable in practice.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
