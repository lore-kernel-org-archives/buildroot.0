From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 22:09:34 +0100
Subject: [Buildroot] [git commit] support/cmake: impersonate a Linux system
	even more
Message-ID: <20170302210958.3AD838229C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=56aaef5533f396b6d7ec89fcd608f22c6297de38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some packages test the system name to decide whether to enable/disable
features or link with specific libs.

So we forcefully set the system name form our custom system file, so
that packagses still believe they are running on Linux rather than
Buildroot.

Fixes:
    fastd      : http://autobuild.buildroot.net/results/f1d/f1dfe90068ad62e733f17a22202235415bda3974/
    paho-mqtt-c: http://autobuild.buildroot.net/results/457/457d76279e16247bf58c838a2c5dd0a4f3962c21/
    libiio     : http://autobuild.buildroot.net/results/281/2812b008a0ab6bab5fe4d45eb9ffe4e9496a8cb4/
    and so on...

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reported-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Baruch Siach <baruch@tkos.co.il>
Cc: Ben Boeckel <mathstuf@gmail.com>
Cc: J??rg Krause <joerg.krause@embedded.rocks>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Cc: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/misc/Buildroot.cmake | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/support/misc/Buildroot.cmake b/support/misc/Buildroot.cmake
index b0046b3..9f5f565 100644
--- a/support/misc/Buildroot.cmake
+++ b/support/misc/Buildroot.cmake
@@ -1,3 +1,7 @@
+# Impersonate a Linux system. Afterall, that's what we are...
+set(CMAKE_SYSTEM_NAME Linux)
 include(Platform/Linux)
+
+# Override problematic settings, to avoid RPATH against host lib directories.
 set_property(GLOBAL PROPERTY FIND_LIBRARY_USE_LIB32_PATHS FALSE)
 set_property(GLOBAL PROPERTY FIND_LIBRARY_USE_LIB64_PATHS FALSE)
