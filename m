From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue, 11 Dec 2018 08:18:59 +0100
Subject: [Buildroot] [PATCH] package/eudev: fix build with kernel < 3.11
Message-ID: <20181211071859.19451-1-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As explained in issue 6267 of systemd [1], Linux < 3.11 does not provide
definitions for BTN_DPAD_{UP,RIGHT}, which were introduced in [2].

So, add a patch to fix this issue.

[1] https://github.com/systemd/systemd/pull/6267
[2] https://github.com/torvalds/linux/commit/9ee27487127461b5cf71670b708ed5b2b8da568c

Fixes:

- http://autobuild.buildroot.net/results/e9d94084be8ed3296ba63cffdb9d69ffcc3b7140/
- http://autobuild.buildroot.net/results/d9c5ec07bfbde1fab62991bb509c2f90af1cb3f4/

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 .../0003-missing.h-add-BTN_DPAD_UP.patch      | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/eudev/0003-missing.h-add-BTN_DPAD_UP.patch

diff --git a/package/eudev/0003-missing.h-add-BTN_DPAD_UP.patch b/package/eudev/0003-missing.h-add-BTN_DPAD_UP.patch
new file mode 100644
index 0000000000..08e5fd2b71
--- /dev/null
+++ b/package/eudev/0003-missing.h-add-BTN_DPAD_UP.patch
@@ -0,0 +1,35 @@
+From 981b8b997e119a117fada2731eeeb0475c511c8a Mon Sep 17 00:00:00 2001
+From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+Date: Tue, 11 Dec 2018 07:56:20 +0100
+Subject: [PATCH] missing.h: add BTN_DPAD_UP
+
+As explained in issue 6267 of systemd [1], Linux < 3.11 does not
+provide definitions for BTN_DPAD_{UP,RIGHT}, which were introduced in
+[2].
+
+This patch fixes this issue.
+
+[1] https://github.com/systemd/systemd/pull/6267
+[2] https://github.com/torvalds/linux/commit/9ee27487127461b5cf71670b708ed5b2b8da568c
+
+Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
+---
+ src/shared/missing.h | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/shared/missing.h b/src/shared/missing.h
+index b5b2e1194..3a83c91a6 100644
+--- a/src/shared/missing.h
++++ b/src/shared/missing.h
+@@ -183,3 +183,8 @@ static inline int name_to_handle_at(int fd, const char *name, struct file_handle
+ #ifndef KEY_ALS_TOGGLE
+ #define KEY_ALS_TOGGLE 0x7a
+ #endif
++
++#ifndef BTN_DPAD_UP
++#define BTN_DPAD_UP 0x220
++#define BTN_DPAD_RIGHT 0x223
++#endif
+-- 
+2.17.2
+
-- 
2.17.2
