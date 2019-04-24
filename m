From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Apr 2019 17:23:11 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/linux-tools: some
 selftests needs util-linux schedutils
Message-ID: <20190424152605.4F42581270@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=058c89f1e6dca25638c0d91444630b6db5e5ea54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Some kernel-selftests are using taskset program, so make sure that
BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS is selected.

[linux-4.19 selftests]$ git grep taskset
bpf/test_progs.c:       assert(system("taskset 0x1 ./urandom_read 100000") == 0);
cpu-hotplug/cpu-on-off-test.sh: taskset -p 01 $$
cpufreq/main.sh:        taskset -p 01 $$
netfilter/nft_trans_stress.sh:        ip netns exec "$testns" taskset $mask ping -4 127.0.0.1 -fq > /dev/null &
netfilter/nft_trans_stress.sh:        ip netns exec "$testns" taskset $mask ping -6 ::1 -fq > /dev/null &
rcutorture/bin/jitter.sh:       if ! taskset -p $cpumask $$ > /dev/null 2>&1

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6af93482d782ff8ecb75fd249b645a12fd76beff)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-tools/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index f4199fd618..6aa09d14a3 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -85,6 +85,8 @@ config BR2_PACKAGE_LINUX_TOOLS_SELFTESTS
 	select BR2_PACKAGE_BASH # runtime
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_LIBCAP_NG
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS # runtime (taskset)
 	help
 	  Build and install (to /usr/lib/kselftests) kernel selftests.
 
