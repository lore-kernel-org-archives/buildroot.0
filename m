From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 15:24:38 +0200
Subject: [Buildroot] [git commit] system/skeleton: update etc/mtab with a
	more sensible link
Message-ID: <20160705132812.D3DCB7FE17@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=25a503272366b8a0bc07a09ca493d25577579c92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, our /etc/mtab points to /proc/mounts. This was all neat so
far, and was good for a sysv-like init system.

However, the way today is to point it at /proc/self/mounts, the
per-process mount tab.

Additionnally, that's what systemd expects. If /etc/mtab is not a
symlink to ../proc/self/mounts and the rootfs is readonly, systemd would
whine loudly (and a service unit would be marked failed).

Since it works well for sysv-like init systems too, just use that.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 system/skeleton/etc/mtab | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/system/skeleton/etc/mtab b/system/skeleton/etc/mtab
index 4c0a094..5c4677a 120000
--- a/system/skeleton/etc/mtab
+++ b/system/skeleton/etc/mtab
@@ -1 +1 @@
-/proc/mounts
\ No newline at end of file
+../proc/self/mounts
\ No newline at end of file
