From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Mar 2020 23:00:22 +0100
Subject: [Buildroot] [git commit] package/lxc: cgroups: initialize cpuset
 properly
Message-ID: <20200302215102.6F8628F137@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8742bf3d9bc55d41c7e5cab0ae3c5d2c2f5c567c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The tests.package.test_lxc.TestLxc failure on gitlab
is similar to the issue reported by [1] and fixed by [2].

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/454255988

[1] https://github.com/NixOS/nixpkgs/issues/75467#issuecomment-569386159
[2] https://github.com/lxc/lxc/pull/3109

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: J??r??me Pouiller <jezz@sysmic.org>
Cc: Patrick Havelange <patrick.havelange@essensium.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0004-cgroups-initialize-cpuset-properly.patch  | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/lxc/0004-cgroups-initialize-cpuset-properly.patch b/package/lxc/0004-cgroups-initialize-cpuset-properly.patch
new file mode 100644
index 0000000000..86aa708d56
--- /dev/null
+++ b/package/lxc/0004-cgroups-initialize-cpuset-properly.patch
@@ -0,0 +1,38 @@
+From 6a8a510211515824ff20699d45f6d07a84f3c02e Mon Sep 17 00:00:00 2001
+From: Christian Brauner <christian.brauner@ubuntu.com>
+Date: Sun, 28 Jul 2019 23:13:26 +0200
+Subject: [PATCH] cgroups: initialize cpuset properly
+
+Closes #3108.
+Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
+(cherry picked from commit b31d62b847a3ee013613795094cce4acc12345ef)
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ src/lxc/cgroups/cgfsng.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/lxc/cgroups/cgfsng.c b/src/lxc/cgroups/cgfsng.c
+index 87e12d2dd..7e691d7cc 100644
+--- a/src/lxc/cgroups/cgfsng.c
++++ b/src/lxc/cgroups/cgfsng.c
+@@ -496,12 +496,12 @@ static bool cg_legacy_filter_and_set_cpus(char *path, bool am_initialized)
+ 	}
+ 
+ 	if (!flipped_bit) {
+-		DEBUG("No isolated or offline cpus present in cpuset");
+-		return true;
++		cpulist = lxc_cpumask_to_cpulist(possmask, maxposs);
++		TRACE("No isolated or offline cpus present in cpuset");
++	} else {
++		cpulist = move_ptr(posscpus);
++		TRACE("Removed isolated or offline cpus from cpuset");
+ 	}
+-	DEBUG("Removed isolated or offline cpus from cpuset");
+-
+-	cpulist = lxc_cpumask_to_cpulist(possmask, maxposs);
+ 	if (!cpulist) {
+ 		ERROR("Failed to create cpu list");
+ 		return false;
+-- 
+2.24.1
+
