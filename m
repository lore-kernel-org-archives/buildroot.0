From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Wed, 14 May 2014 12:26:53 +0200
Subject: [Buildroot] [PATCH 3/4] udev: replace "echo -en" with printf
In-Reply-To: <1400063214-29462-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1400063214-29462-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1400063214-29462-4-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

printf is POSIX-compliant, echo -e/n is not.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/udev/S10udev | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/udev/S10udev b/package/udev/S10udev
index 2c7b7e9..cf825b4 100755
--- a/package/udev/S10udev
+++ b/package/udev/S10udev
@@ -27,8 +27,8 @@ test -r $UDEV_CONFIG || exit 6
 
 case "$1" in
     start)
-        echo -n "Populating ${udev_root:-/dev} using udev: "
-        echo -e '\000\000\000\000' > /proc/sys/kernel/hotplug
+        printf "Populating ${udev_root:-/dev} using udev: "
+        printf '\000\000\000\000' > /proc/sys/kernel/hotplug
         $UDEV_BIN -d || (echo "FAIL" && exit 1)
         udevadm trigger
         echo "done"
-- 
2.0.0.rc0
