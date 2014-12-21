From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Dec 2014 22:04:59 +0100
Subject: [Buildroot] [git commit] toolchain: get rid of -pipe from
	optimisations
Message-ID: <20141221210546.62BD4805F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=01c34b38a4181a3b82f7507546dc97619b4246ed
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

-pipe is causing some build failures in Linux kernel >= 3.17.

Also, nowadays, using -pipe does not gain as much as it used to back in
the days:

Measurements made with a 3.16.7 Linux kernel:
    make linux-depends
    time sh -c 'make linux-build >/dev/null 2>&1'

Without -pipe:
    716.32user 54.44system 3:42.12elapsed 346%CPU
    721.22user 54.47system 3:41.81elapsed 349%CPU
    722.44user 54.00system 3:42.13elapsed 349%CPU
    721.03user 53.81system 3:41.92elapsed 349%CPU
    713.21user 53.63system 3:40.51elapsed 347%CPU
    706.67user 52.42system 3:38.40elapsed 347%CPU
    714.40user 53.18system 3:40.16elapsed 348%CPU
    706.01user 53.09system 3:37.87elapsed 348%CPU
    705.98user 53.01system 3:38.03elapsed 348%CPU
    714.17user 53.55system 3:39.98elapsed 348%CPU
Average:                   3:40.29elapsed

With -pipe:
    720.13user 53.90system 3:41.98elapsed 348%CPU
    713.38user 53.69system 3:40.44elapsed 347%CPU
    711.60user 52.81system 3:39.06elapsed 348%CPU
    708.66user 53.09system 3:38.59elapsed 348%CPU
    711.76user 53.00system 3:38.48elapsed 350%CPU
    717.85user 53.97system 3:41.77elapsed 348%CPU
    716.77user 53.77system 3:40.91elapsed 348%CPU
    717.48user 53.65system 3:41.24elapsed 348%CPU
    721.44user 55.67system 3:43.45elapsed 347%CPU
    724.61user 55.63system 3:43.35elapsed 349%CPU
Average:                   3:40.93elapsed

The delta is well in the measurement noise.

Just get rid of it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@openwide.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-common.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index b246834..2ee2019 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -122,7 +122,7 @@ config BR2_USE_MMU
 
 config BR2_TARGET_OPTIMIZATION
 	string "Target Optimizations"
-	default "-pipe"
+	default ""
 	help
 	  Optimizations to use when building for the target host.
 	  NOTE: gcc optimization level is defined in build options.
