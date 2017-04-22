From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 23 Apr 2017 00:49:17 +0200
Subject: [Buildroot] [PATCH v9 5/7] e2fsprogs: avoid conflict with
	util-linux fsck wrapper
In-Reply-To: <20170422224919.3257-1-arnout@mind.be>
References: <20170422224919.3257-1-arnout@mind.be>
Message-ID: <20170422224919.3257-6-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <casantos@datacom.ind.br>

The fsck wrapper from util-linux is better maintained, so it should be
preferred. In particular, systemd relies on features in the util-linux
fsck wrapper that don't exist in the e2fsprogs one. However, since
e2fsprogs depends on util-linux, the one from e2fsprogs currently has
precedence. So in order to have e2fsck from e2fsprogs and the fsck
wrapper from util-linux, we disable e2fsprogs' fsck if the one from
util-linux is selected.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
CC: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
[Arnout: don't add comment]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/e2fsprogs/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
index 23c4db5329..b3d12b4a63 100644
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -45,6 +45,7 @@ comment "e4defrag needs a glibc or musl toolchain"
 config BR2_PACKAGE_E2FSPROGS_FSCK
 	bool "fsck"
 	default y
+	depends on !BR2_PACKAGE_UTIL_LINUX_FSCK
 	help
 	  Check and repair a Linux file system. This is a wrapper around
 	  the filesystem-specific fsck tools.
-- 
2.11.0
