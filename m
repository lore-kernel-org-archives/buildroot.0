From: Andrew Pilloud <andrewpilloud@igneoussystems.com>
Date: Wed, 16 Aug 2017 10:39:35 -0700
Subject: [Buildroot] [PATCH 1/1] support/script/check-bin-arch: ignore
	/usr/lib/grub
Message-ID: <20170816173935.2361-1-andrewpilloud@igneoussystems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

/usr/lib/grub may contain binaries for the grub bootloader. These
ELF binaries may be for other platforms.

Signed-off-by: Andrew Pilloud <andrewpilloud@igneoussystems.com>
---
 support/scripts/check-bin-arch | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/support/scripts/check-bin-arch b/support/scripts/check-bin-arch
index b822cdd60d..2bb9d0a6b9 100755
--- a/support/scripts/check-bin-arch
+++ b/support/scripts/check-bin-arch
@@ -36,6 +36,12 @@ while read f; do
 		continue
 	fi
 
+	# Skip files in /usr/lib/grub, grub legitimately installs ELF
+	# binaries that are not for the target architecture
+	if [[ "${f}" =~ ^/usr/lib/grub/.* ]]; then
+		continue
+	fi
+
 	# Get architecture using readelf. We pipe through 'head -1' so
 	# that when the file is a static library (.a), we only take
 	# into account the architecture of the first object file.
-- 
2.11.0
