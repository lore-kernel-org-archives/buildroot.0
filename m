From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 7 Mar 2018 23:03:52 +0100
Subject: [Buildroot] [git commit] support/check-bin-arch: exclude kernel
 modules for merged /usr
Message-ID: <20180307220510.77A7F826CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1b9a57442d0a234b03585235f516d755372f29b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When using a merged /usr, the kernel module path is really
/usr/lib/modules, as /lib is a symlink to usr/lib .

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-generic.txt | 4 ++--
 support/scripts/check-bin-arch          | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index eecf6e2ec0..521d6d50c7 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -457,8 +457,8 @@ information is (assuming the package name is +libfoo+) :
   to the target directory) to ignore when checking that the package
   installs correctly cross-compiled binaries. You seldom need to set this
   variable, unless the package installs binary blobs outside the default
-  locations, `/lib/firmware`, `/usr/lib/firmware`, `/lib/modules`, and
-  `/usr/share`, which are automatically excluded.
+  locations, `/lib/firmware`, `/usr/lib/firmware`, `/lib/modules`,
+  `/usr/lib/modules`, and `/usr/share`, which are automatically excluded.
 
 The recommended way to define these variables is to use the following
 syntax:
diff --git a/support/scripts/check-bin-arch b/support/scripts/check-bin-arch
index d8385b4fcf..7f97696735 100755
--- a/support/scripts/check-bin-arch
+++ b/support/scripts/check-bin-arch
@@ -14,6 +14,7 @@ declare -a IGNORES=(
 	# and its modules may still be 64-bit. To keep the basic
 	# check-bin-arch logic simple, just skip this directory.
 	"/lib/modules"
+	"/usr/lib/modules"
 
 	# Skip files in /usr/share, several packages (qemu,
 	# pru-software-support) legitimately install ELF binaries that
