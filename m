From: Dan Moulding <dan.moulding@rackwareinc.com>
Date: Tue, 29 Apr 2014 09:12:57 -0600
Subject: [Buildroot] [PATCH] Create /dev/null along with /dev/console when
	building cpio rootfs
Message-ID: <1398784378-20251-1-git-send-email-dan.moulding@rackwareinc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am currently forced to support an older kernel (2.6.18). That kernel
does not have devtmpfs support. However, I'd still like to be able to
use mdev for automatic /dev management. mdev seems to be more than
happy to work on top of just plain tmpfs (well, technically, in my
case it is the special rootfs instance of tmpfs). However, init is
unhappy because /dev/null hasn't been created by the time init
runs. This patch creates /dev/null in addition to /dev/console when
building the cpio rootfs, so that /dev/null will be there when init
runs. Afterward, mdev is able to take care of the rest.

Dan Moulding (1):
  Create /dev/null device node when building a cpio rootfs

 fs/cpio/cpio.mk | 1 +
 1 file changed, 1 insertion(+)

-- 
1.8.2.1
