From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Apr 2019 18:47:06 +0200
Subject: [Buildroot] [git commit] package/linux-tools: some selftests needs
 util-linux schedutils
Message-ID: <20190410164324.986268D518@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6af93482d782ff8ecb75fd249b645a12fd76beff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
 
