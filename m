From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Oct 2015 15:34:28 +0200
Subject: [Buildroot] [git commit] skeleton: fix absence of /dev/shm on
	static, read-only systems
Message-ID: <20151003133557.4B9677FF5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bfd969d29f669722af3a92868731aa4bb4dbf786
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

/dev/shm is needed for systems using shared memory. On init-based systems
this directory is usually created in the inittab along with /dev/pts, by
the lines:

package/busybox/inittab:
  ::sysinit:/bin/mkdir -p /dev/pts
  ::sysinit:/bin/mkdir -p /dev/shm

package/sysvinit/inittab:
  si2::sysinit:/bin/mkdir -p /dev/pts
  si3::sysinit:/bin/mkdir -p /dev/shm

However this is broken when static /dev management is selected and the root
filesystem is read-only, showing during boot the error:

  mkdir: can't create directory '/dev/shm': Read-only file system

Fix it by creating the empty /dev/shm directory, just like /dev/pts.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 0 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/system/skeleton/dev/shm/.empty b/system/skeleton/dev/shm/.empty
new file mode 100644
index 0000000..e69de29
