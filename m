From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Dec 2011 14:39:18 +0100
Subject: [Buildroot] Question about using mdev for /dev management
In-Reply-To: <201112130939.34100.arnout@mind.be>
References: <4EDD1149.8060104@carallon.com> <201112130939.34100.arnout@mind.be>
Message-ID: <20111213143918.2790f6e4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 13 Dec 2011 09:39:34 +0100,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

>  If you ask me, it's OK to add /dev entries in the
> BR2_ROOTFS_DEVICE_TABLE. In fact, I think /dev/console and /dev/null
> should be put in there.  But I've never gotten around to roll a patch
> for it.

FWIW, when I initially introduced (based on prior patches) this
static /dev vs. devtmpfs vs. mdev vs. udev selection, the mdev and udev
choices were independent of devtmpfs, i.e there were using a minimal
device tables with /dev/null and /dev/console. But after discussion on
the mailing-list, it was decided that it was better to make devtmpfs a
requirement when mdev and udev were choosen.

See

  Message-Id: <f92465f9de8bcd24cf2c974b158a600a84e96422.1291582352.git.thomas.petazzoni@free-electrons.com>

for the initial patch I proposed on December, 5th 2010.

And

 Message-ID: <87r5dgfldw.fsf@macbook.be.48ers.dk>

for Peter's answer (December, 17th 2010), saying :

"""
 Thomas> At compile time, only a minimal /dev is created in the filesystem,
 Thomas> with only "console" and "null". This is done thanks to a small device
 Thomas> table in target/generic/device_table_mdev_udev.txt. This is done
 Thomas> directly at the configuration level (fs/Config.in).  

While I agree we need the minimal device table for /etc/shadow and
similar permissions, do we really need to support mdev/udev without
devtmpfs? It's been in the kernel now for close to 2 years, it's very
small and it simplifies (and speeds up) the boot sequence quite a lot.
"""

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
