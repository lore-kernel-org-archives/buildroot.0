From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Feb 2018 23:16:05 +0100
Subject: [Buildroot] [git commit] check-bin-arch: skip /lib/modules to allow
 32-bit userland on 64-bit arch
Message-ID: <20180225221607.DD6B48821B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=78ec4bd9e639616480d3e024a2bd6b2e52b4072d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The script check-bin-arch fails as follows on a config for PowerPC e6500
(64-bit CPU) with BR2_ARCH="powerpc" (32-bit userland desired):

ERROR: architecture for "/lib/modules/..../lib/libcrc32c.ko"
            is "PowerPC64", should be "PowerPC"

This situation is perfectly acceptable: the kernel is 64-bit and so are its
modules, even though userland is 32-bit.

To keep check-bin-arch and its caller simple, just skip /lib/modules/
entirely, like is done for /lib/firmware and some others.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/check-bin-arch | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/support/scripts/check-bin-arch b/support/scripts/check-bin-arch
index 887b6613cd..f6a4569c62 100755
--- a/support/scripts/check-bin-arch
+++ b/support/scripts/check-bin-arch
@@ -29,6 +29,14 @@ while read f; do
 		continue
 	fi
 
+	# Skip kernel modules
+	# When building a 32-bit userland on 64-bit architectures, the kernel
+	# and its modules may still be 64-bit. To keep the basic
+	# check-bin-arch logic simple, just skip this directory.
+	if [[ "${f}" =~ ^/lib/modules/.* ]]; then
+		continue
+	fi
+
 	# Skip files in /usr/share, several packages (qemu,
 	# pru-software-support) legitimately install ELF binaries that
 	# are not for the target architecture
