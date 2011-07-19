From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 19 Jul 2011 12:33:13 +0200
Subject: [Buildroot] devtmpfs and initramfs
In-Reply-To: <201107191222.19313.arnout@mind.be> (Arnout Vandecappelle's
 message of "Tue, 19 Jul 2011 12:22:19 +0200")
References: <201107191222.19313.arnout@mind.be>
Message-ID: <87aaca4l1y.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 Arnout>  Hoi all,

 Arnout>  I'm using an initramfs as the root filesystem image, and
 Arnout> devtmpfs for the devices.  However, it turns out that devtmpfs
 Arnout> doesn't get mounted automatically if the root filesystem is an
 Arnout> initramfs (at least in 2.6.35).

Indeed, init/mainc::kernel_init() doesn't call prepare_namespace()
(which calls devtmpfs_mount()) if an initramfs with an /init is found.

 Arnout>  I ended up adding the following to my inittab:

 Arnout> null::sysinit:/bin/mount -t devtmpfs devtmpfs /dev

 Arnout>  Does anyone know a more elegant solution?

Not really - Besides adding a devtmps_mount() call in kernel_init(), but
that's kind of icky as well.

-- 
Bye, Peter Korsgaard
