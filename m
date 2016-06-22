From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Jun 2016 21:07:26 +0200
Subject: [Buildroot] [PATCH 04/24 v2] system/skeleton: update etc/mtab with
	a more sensible link
In-Reply-To: <cover.1466622379.git.yann.morin.1998@free.fr>
References: <cover.1466622379.git.yann.morin.1998@free.fr>
Message-ID: <4be6668a795a8af830d18094decfffdf18e5090f.1466622379.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, our /etc/mtab points to /proc/mounts. This was all neat so
far, and was good for a sysv-like init system.

However, the way today is to point it at /proc/self/mounts, the
per-process mount tab.

Additionnally, that's what systemd expects. If /etc/mtab is not a
symlink to ../proc/self/mounts and the rootfs is readonly, systemd would
whine loudly (and a service unit would be marked failed).

Since it works well for sysv-like init systems too, just use that.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
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
-- 
2.7.4
