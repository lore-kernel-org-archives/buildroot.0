From: Brendan Heading <brendanheading@gmail.com>
Date: Tue,  1 Sep 2015 13:39:02 +0100
Subject: [Buildroot] [PATCH 1/1] package/dhrystone: fix musl compilation
	issue
Message-ID: <1441111142-8561-1-git-send-email-brendanheading@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/1b6cb1b40431bf484db2d99bfdc8237cbae6a9d7/
http://autobuild.buildroot.net/results/20e669d6e4bc3d872a355ef658ddad8f34676624/

Include a more appropriate header file to pick up the definition of HZ
from the kernel headers.

Signed-off-by: Brendan Heading <brendanheading@gmail.com>

---
v1 - This looks a bit hacky, but it seems to compile fine against
the uclibc, glibc and musl toolchain combos without any other packages
enabled. Comments welcome.
---
 package/dhrystone/0002-HZ.patch | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/dhrystone/0002-HZ.patch b/package/dhrystone/0002-HZ.patch
index e3b8a0e..9572b59 100644
--- a/package/dhrystone/0002-HZ.patch
+++ b/package/dhrystone/0002-HZ.patch
@@ -2,6 +2,11 @@ Get HZ value from system rather than requiring via CPPFLAGS
 
 Patch by Robin Getz <rgetz@blackfin.uclinux.org>
 
+Tweaked by Brendan Heading <brendanheading@gmail.com> - musl
+doesn't define HZ within sys/param.h (and strictly speaking
+it's not wise to depend on the glibc def either). Changed it
+here to grab the kernel version.
+
 --- a/dhry.h
 +++ b/dhry.h
 @@ -359,6 +359,10 @@
@@ -9,7 +14,7 @@ Patch by Robin Getz <rgetz@blackfin.uclinux.org>
  #endif
  
 +#ifndef HZ
-+#include <sys/param.h>
++#include <linux/param.h>
 +#endif
 +
  #define Mic_secs_Per_Second     1000000.0
-- 
2.4.3
