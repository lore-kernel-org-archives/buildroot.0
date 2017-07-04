From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Tue,  4 Jul 2017 12:01:04 -0700
Subject: [Buildroot] [PATCH] fs/cpio/init: remout / as read-only as a first
	step
Message-ID: <20170704190104.24703-1-andrew.smirnov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When /init is present on root file system kernel does not take into
accout kernel arguments such as "ro" and does not remount root as
read-only. So prior to this commit the system would continue booting
with "rw" root filesystem until corresponding line in /etc/fstab to
remount it as "ro" was processed.

Change the code to immediately remount / as read-only and rely on
/etc/fstab processing to remount it as "rw" if that is what's selected
in Buildroot configuration.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---

Hi everyone,

Here's a little bit of a backstory for this patch:

I have a PowerPC, systemd based system that is set up to build and boot
from a compressed CPIO image. The system is build using stock
Buildroot with a number of patches from
https://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/systemd-skeleton
on top of it (to fix bug 7892).

Running against systemd 232 (not reproducable with 233), I would
occasionally see "systemd-remount-fs.service" fail to start because it
would try to re-mount '/' as read-only and fail due to '/' being
busy (I never figured out exactly what process was writing
there). That particular failure, being not very critical on my setup,
would leave my system in a state where everything worked as before,
but root filesystem would be accessible for writing.

Since all of the above run contrary to my expectaions (I expected
rootfs to be read-only to begin with) I went onto reading kernel
source to see if all of this was because I somehow misconfigured my
kernel boot paramters. As I mentioned in commit message, doing so
revealed that, when "/init" is present in the system, kernel would
mount root as R/W and pass control onto "/init" without trying to
honor "ro" bootflag. So, as far I can tell, in setup like this, it is
the responsiblity of "/init" script/executable to set things up
"correctly".

Needless to say that applying the change made my original problem --
"systemd-remount-fs.service" failing -- not reproducable.

I am not sure if this is a geniunly good fix or if I missed something
blatantly obvious and all of the above is my fault, so please let me
know what you think.

Thanks,
Andrey Smirnov

 fs/cpio/init | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/cpio/init b/fs/cpio/init
index a275482..349f98b 100755
--- a/fs/cpio/init
+++ b/fs/cpio/init
@@ -1,5 +1,6 @@
 #!/bin/sh
 # devtmpfs does not get automounted for initramfs
+/bin/mount -o remount,ro /dev/root
 /bin/mount -t devtmpfs devtmpfs /dev
 exec 0</dev/console
 exec 1>/dev/console
-- 
2.9.4
