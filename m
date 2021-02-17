From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Wed, 17 Feb 2021 19:56:09 +0100
Subject: [Buildroot] [PATCH] package/dt-utils: add patch to fix
 barebox-state lock file
Message-ID: <20210217185609.1120677-1-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add patch from the upstream mailing list [1] that fixes
the following error when we try to execute barebox-state command:

# barebox-state
Failed to open lock-file /var/lock/barebox-state

[1] https://www.mail-archive.com/oss-tools at pengutronix.de/msg00063.html

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 ...0001-state-use-run-to-store-lockfile.patch | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 package/dt-utils/0001-state-use-run-to-store-lockfile.patch

diff --git a/package/dt-utils/0001-state-use-run-to-store-lockfile.patch b/package/dt-utils/0001-state-use-run-to-store-lockfile.patch
new file mode 100644
index 0000000000..a0b8067601
--- /dev/null
+++ b/package/dt-utils/0001-state-use-run-to-store-lockfile.patch
@@ -0,0 +1,50 @@
+From a3dfc81f886a40ebc624143cf64193ffa2619476 Mon Sep 17 00:00:00 2001
+From: Bartosz Bilas <b.bilas@grinn-global.com>
+Date: Wed, 17 Feb 2021 19:29:47 +0100
+Subject: [PATCH] state: use /run to store lockfile
+
+The current location /var/lock is considered legacy (at least by
+systemd). Just use /run to store the lockfile and append the usual .lock
+suffix.
+
+Signed-off-by: Stefan Agner <ste...@agner.ch>
+Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
+---
+ src/barebox-state.c | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/src/barebox-state.c b/src/barebox-state.c
+index f8b8df6..5c05c5b 100644
+--- a/src/barebox-state.c
++++ b/src/barebox-state.c
+@@ -38,6 +38,8 @@
+ #include <dt/dt.h>
+ #include <state.h>
+ 
++#define BAREBOX_STATE_LOCKFILE "/run/barebox-state.lock"
++
+ struct state_variable;
+ 
+ static int __state_uint8_set(struct state_variable *var, const char *val);
+@@ -501,15 +503,15 @@ int main(int argc, char *argv[])
+ 		++nr_states;
+ 	}
+ 
+-	lock_fd = open("/var/lock/barebox-state", O_CREAT | O_RDWR, 0600);
++	lock_fd = open(BAREBOX_STATE_LOCKFILE, O_CREAT | O_RDWR, 0600);
+ 	if (lock_fd < 0) {
+-		pr_err("Failed to open lock-file /var/lock/barebox-state\n");
++		pr_err("Failed to open lock-file " BAREBOX_STATE_LOCKFILE "\n");
+ 		exit(1);
+ 	}
+ 
+ 	ret = flock(lock_fd, LOCK_EX);
+ 	if (ret < 0) {
+-		pr_err("Failed to lock /var/lock/barebox-state: %m\n");
++		pr_err("Failed to lock " BAREBOX_STATE_LOCKFILE ": %m\n");
+ 		close(lock_fd);
+ 		exit(1);
+ 	}
+-- 
+2.30.1
+
-- 
2.30.1
