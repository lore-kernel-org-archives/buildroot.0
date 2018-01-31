From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Jan 2018 13:16:52 +0100
Subject: [Buildroot] [git commit branch/2017.02.x] eudev: fix error handling
 init script
Message-ID: <20180131123647.BF8F886848@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a2da909cab3964db8d263e8c450609dbb9eb0fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Replace (echo "msg" && exit 1) by { echo "msg"; exit 1; }.

The (list) compound command runs in a subshell, so the "exit" interrupts
the subshell, not the main script. Examples:

    $ sh -c "echo 1; (exit 1); echo 2"
    1
    2
    $ sh -c "echo 1; { exit 1; }; echo 2"
    1
    $

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 3f568fe09948369831c36a713f5a47fe4c2d19b6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/eudev/S10udev | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/eudev/S10udev b/package/eudev/S10udev
index 8382bec2bb..654a04df36 100755
--- a/package/eudev/S10udev
+++ b/package/eudev/S10udev
@@ -29,7 +29,7 @@ case "$1" in
     start)
         printf "Populating ${udev_root:-/dev} using udev: "
         printf '\000\000\000\000' > /proc/sys/kernel/hotplug
-        $UDEV_BIN -d || (echo "FAIL" && exit 1)
+        $UDEV_BIN -d || { echo "FAIL"; exit 1; }
         udevadm trigger --type=subsystems --action=add
         udevadm trigger --type=devices --action=add
         udevadm settle --timeout=30 || echo "udevadm settle failed"
