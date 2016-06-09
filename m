From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jun 2016 22:00:27 +0200
Subject: [Buildroot] [git commit] package/mpd: fetch upstream patch to fix
	GCC 6 issue
Message-ID: <20160609200442.F365D802F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=725ff29fb7290de6467f9df462b48378552410a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fetch a patch from upstream to fix a build issue with GCC 6:

'''
In file included from /home/joerg/Development/git/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/include/c++/6.1.0/bits/stl_algo.h:59:0,
                 from /home/joerg/Development/git/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/include/c++/6.1.0/algorithm:62,
                 from ./src/queue/IdTable.hxx:25,
                 from ./src/queue/Queue.hxx:24,
                 from src/queue/Playlist.hxx:23,
                 from src/Partition.hxx:23,
                 from src/Instance.cxx:22:
/home/joerg/Development/git/buildroot/output/host/usr/arm-buildroot-linux-gnueabi/include/c++/6.1.0/cstdlib:75:25: fatal error: stdlib.h: No such file or directory
 #include_next <stdlib.h>
'''

Bug report: https://bugs.musicpd.org/view.php?id=4524
Fetch from: aa5d05eaa4d482aa8f8df954335d0aba151eeff9

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mpd/mpd.hash | 1 +
 package/mpd/mpd.mk   | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index 2d35aae..f817a3a 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,2 +1,3 @@
 # Locally calculated after checking pgp signature
 sha256  0cb9a223894b038ce966ce6d651d9b3ea3bdc7d7b9bec8d1e9e7e091cbc29b8b  mpd-0.19.15.tar.xz
+sha256  cb9a31889a3d01f373ad154dc4c0d13ca866d69bc02b3acd9f18727a756e78cb  aa5d05eaa4d482aa8f8df954335d0aba151eeff9.patch
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 6247d15..9b054ff 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -13,6 +13,9 @@ MPD_LICENSE = GPLv2+
 MPD_LICENSE_FILES = COPYING
 MPD_AUTORECONF = YES
 
+# Fix GCC 6 issue (https://bugs.musicpd.org/view.php?id=4524)
+MPD_PATCH = https://github.com/MaxKellermann/MPD/commit/aa5d05eaa4d482aa8f8df954335d0aba151eeff9.patch
+
 # Some options need an explicit --disable or --enable
 
 # Zeroconf support depends on libdns_sd from avahi.
