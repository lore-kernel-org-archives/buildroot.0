From: Romain Naour <romain.naour@smile.fr>
Date: Mon,  8 Apr 2019 18:43:31 +0200
Subject: [Buildroot] [PATCH 1/3] package/linux-tools: some selftests needs
 util-linux schedutils
In-Reply-To: <20190408164333.26942-1-romain.naour@smile.fr>
References: <20190408164333.26942-1-romain.naour@smile.fr>
Message-ID: <20190408164333.26942-2-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
 
-- 
2.20.1
