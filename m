From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Aug 2016 15:39:42 +0200
Subject: [Buildroot] [git commit branch/next] system/skeleton: use uid/gid
	65534 for nobody/nogroup
Message-ID: <20160826140036.02A7B80840@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c67af2c524ad2b6585af2f5e43f76dacd7cc109
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

As recently discussed on lwn.net: https://lwn.net/Articles/695478/

The kernel has special behaviour for uid/gid 65534:

1. The kernel maps UIDs > 65535 to it when some subsystem/API/fs
   only supports 16bit UIDs, but a 32bit UID is passed to it.

2. it's used by the kernel's user namespacing as the internal UID
   that external UIDs are mapped to that don't have any local mapping.

3. It's used by NFS for all user IDs that cannot be mapped locally if
   UID mapping is enabled.

Most distributions already map (or are in the progress of changing)
nobody/nogroup to the 65534 uid/gid, so lets do so as well.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 system/skeleton/etc/group  | 2 +-
 system/skeleton/etc/passwd | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/system/skeleton/etc/group b/system/skeleton/etc/group
index c813da2..76346b3 100644
--- a/system/skeleton/etc/group
+++ b/system/skeleton/etc/group
@@ -22,5 +22,5 @@ plugdev:x:46:
 staff:x:50:
 lock:x:54:
 netdev:x:82:
-nogroup:x:99:
 users:x:100:
+nogroup:x:65534:
diff --git a/system/skeleton/etc/passwd b/system/skeleton/etc/passwd
index 883265a..d8281d2 100644
--- a/system/skeleton/etc/passwd
+++ b/system/skeleton/etc/passwd
@@ -6,4 +6,4 @@ sync:x:4:100:sync:/bin:/bin/sync
 mail:x:8:8:mail:/var/spool/mail:/bin/false
 www-data:x:33:33:www-data:/var/www:/bin/false
 operator:x:37:37:Operator:/var:/bin/false
-nobody:x:99:99:nobody:/home:/bin/false
+nobody:x:65534:65534:nobody:/home:/bin/false
