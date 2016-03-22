From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Mar 2016 22:34:46 +0100
Subject: [Buildroot] [git commit] package/util-linux: fix lsipc segfault
Message-ID: <20160322213452.7304080256@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7e4dab488594021b012b1ef3b49772eece97b760
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lsipc segfault when no option is given.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...don-t-free-shm-data-if-no-shm-id-is-found.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/util-linux/0008-lsipc-don-t-free-shm-data-if-no-shm-id-is-found.patch b/package/util-linux/0008-lsipc-don-t-free-shm-data-if-no-shm-id-is-found.patch
new file mode 100644
index 0000000..58e422a
--- /dev/null
+++ b/package/util-linux/0008-lsipc-don-t-free-shm-data-if-no-shm-id-is-found.patch
@@ -0,0 +1,42 @@
+From cb8e8ecc800a1a8536fe5507ae7d09a8c1c442a8 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Tue, 22 Mar 2016 11:25:09 +0100
+Subject: [PATCH] lsipc: don't free shm data if no shm id is found
+
+There is a segfault in do_shm_global() when ipc_shm_get_info() return 0 and
+ipc_shm_free_info() is called.
+
+When no shm id is found, the memory allocated in shmds by ipc_shm_get_info() is
+already free when ipc_shm_free_info() is called.
+
+Move ipc_shm_free_info(shmds) inside the if statement where at least one shm id
+is found.
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ sys-utils/lsipc.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/sys-utils/lsipc.c b/sys-utils/lsipc.c
+index 523859c..fa5d99c 100644
+--- a/sys-utils/lsipc.c
++++ b/sys-utils/lsipc.c
+@@ -1072,14 +1072,13 @@ static void do_shm_global(struct libscols_table *tb)
+ 			++nsegs;
+ 			sum_segsz += shmdsp->shm_segsz;
+ 		}
++		ipc_shm_free_info(shmds);
+ 	}
+ 
+ 	global_set_data(tb, "SHMMNI", _("Shared memory segments"), nsegs, lim.shmmni, 1);
+ 	global_set_data(tb, "SHMALL", _("Shared memory pages"), sum_segsz / getpagesize(), lim.shmall, 1);
+ 	global_set_data(tb, "SHMMAX", _("Max size of shared memory segment (bytes)"), 0, lim.shmmax, 0);
+ 	global_set_data(tb, "SHMMIN", _("Min size of shared memory segment (bytes)"), 0, lim.shmmin, 0);
+-
+-	ipc_shm_free_info(shmds);
+ }
+ 
+ int main(int argc, char *argv[])
+-- 
+2.1.4
+
