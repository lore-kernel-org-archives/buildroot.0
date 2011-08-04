From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  4 Aug 2011 21:38:59 +0200
Subject: [Buildroot] [PATCH] initramfs/init: make sure that 0, 1,
	2 fds are available
Message-ID: <1312486739-29747-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As the kernel doesn't automatically mount devtmpfs when an initramfs
is used, commit 424888e47431db738f5f9b3c6392435bfce7a842 has
introduced a small wrapper script that mounts devtmpfs before starting
the real init.

Unfortunately, the problem is that in this case, the init process runs
without any 0, 1 and 2 file descriptors, so none of the
messages/errors printed by the various initialization scripts can be
seen. This is due to the fact the init process relies on 0, 1 and 2
being opened by the kernel before init is started. However, as
/dev/console isn't present on the filesystem at the time the kernel
tries to open the console to create the 0, 1 and 2 file descriptors,
the kernel fails on this and prints the famous "Warning: unable to
open an initial console".

The proposed workaround is to actually open 0, 1 and 2 to /dev/console
in the wrapper script, right after mounting the devtmpfs filesystem,
and before starting the real init. The "Warning" from the kernel is
still shown, but at least the messages from the init scripts are
visible.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 fs/initramfs/init |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/fs/initramfs/init b/fs/initramfs/init
index 751cb27..a275482 100755
--- a/fs/initramfs/init
+++ b/fs/initramfs/init
@@ -1,4 +1,7 @@
 #!/bin/sh
 # devtmpfs does not get automounted for initramfs
 /bin/mount -t devtmpfs devtmpfs /dev
+exec 0</dev/console
+exec 1>/dev/console
+exec 2>/dev/console
 exec /sbin/init $*
-- 
1.7.4.1
