From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Mar 2017 21:35:16 +0100
Subject: [Buildroot] [PATCH] support/script/check-bin-arch: ignore /usr/share
Message-ID: <1490128516-31437-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

/usr/share normally should not contain binaries executable for the
target platform. However, it might contain ELF binaries for other
platforms, such as firmware files installed by Qemu or
pru-software-support.

Instead of special-casing each package, let's simply ignore /usr/share.

Fixes:

  http://autobuild.buildroot.net/results/6f3fea9f6adaef1573fbb0dd6903b5d99e470610/
  (pru-software-support)

  http://autobuild.buildroot.net/results/fe8892bc22a03299fc41e30bfea5e42166838f88/
  (qemu)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/check-bin-arch | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/support/scripts/check-bin-arch b/support/scripts/check-bin-arch
index 2c619ad..be2f371 100755
--- a/support/scripts/check-bin-arch
+++ b/support/scripts/check-bin-arch
@@ -27,6 +27,13 @@ for f in ${pkg_files} ; do
 		continue
 	fi
 
+	# Skip files in /usr/share, several packages (qemu,
+	# pru-software-support) legitimately install ELF binaries that
+	# are not for the target architecture
+	if [[ "${f}" =~ ^\./usr/share/.* ]]; then
+		continue
+	fi
+
 	# Get architecture using readelf. We pipe through 'head -1' so
 	# that when the file is a static library (.a), we only take
 	# into account the architecture of the first object file.
-- 
2.7.4
