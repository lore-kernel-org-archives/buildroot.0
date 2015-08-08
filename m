From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:58:05 -0000
Subject: [Buildroot] [git commit branch/next] package/upmpdcli: Add patch to
	fix OPEN_MAX build error
Message-ID: <20150808105637.EB8CC80414@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a9f99c61aa3e56073d1fcfe20d68151f074f9838
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

When building upmpdcli with certain toolchains using the compiler flag
-std=c++0x let gcc not define "linux" or "__linux", but "__linux__". Therefore,
the Linux-specific code in closefrom.cpp is not used and the build fails.

Fixes:
http://autobuild.buildroot.net/results/d66/d660a9409552b3e1ad9e3ed716386fd0a67fd8db
http://autobuild.buildroot.net/results/f19/f19e843cdcc968a72919ca3792a90dd40552bd59
http://autobuild.buildroot.net/results/a77/a776001dae51c4dae1f25b3a9bf9a9fe2ca69003
http://autobuild.buildroot.net/results/3e7/3e7590566ed3cc7a1dd412fb66b7b987e847aa25

and many more.

Pull request is open on github [1].

[1]
https://github.com/medoc92/upmpdcli/pull/15

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-Add-conditional-check-for-__linux__.patch |   32 ++++++++++++++++++++
 1 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/package/upmpdcli/0001-Add-conditional-check-for-__linux__.patch b/package/upmpdcli/0001-Add-conditional-check-for-__linux__.patch
new file mode 100644
index 0000000..910ee3c
--- /dev/null
+++ b/package/upmpdcli/0001-Add-conditional-check-for-__linux__.patch
@@ -0,0 +1,32 @@
+From 69740cf6fe35413edc4b6adc502ba70ce8de8557 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Sun, 19 Jul 2015 08:48:13 +0200
+Subject: [PATCH 1/1] Add conditional check for __linux__
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When building upmpdcli with certain toolchains using the compiler flag
+-std=c++0x let gcc not define "linux" or "__linux", but "__linux__".
+
+Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
+---
+ src/closefrom.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/closefrom.cpp b/src/closefrom.cpp
+index 4429b20..0cd7957 100644
+--- a/src/closefrom.cpp
++++ b/src/closefrom.cpp
+@@ -111,7 +111,7 @@ int libclf_closefrom(int fd0)
+ }
+ 
+ /*************************************************************************/
+-#elif (defined(linux) || defined(__linux))
++#elif (defined(linux) || defined(__linux) || defined(__linux__))
+ 
+ /* Use /proc/self/fd directory */
+ #include <sys/types.h>
+-- 
+2.4.6
+
