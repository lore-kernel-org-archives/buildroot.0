From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 10 May 2013 15:56:01 +0200
Subject: [Buildroot] [PATCH v2] package-infra: limit the number of // jobs
Message-ID: <1368194161-27851-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

The current code spawns as many jobs as up to twice the number of CPUs.

On small-class machines like laptops, with a limitted amount of memory,
but still a few CPUs (real or hyperthreads), the HDD becomes a bottleneck,
and it becomes almost impossible to do anythiong else while there is a
build in progress.

Limit the number of jobs to the number of CPUs plus one.

Even on fast machines with fast HDDs, this settings keeps the machine
fully busy (for those packages that can build in parallel, of course).

For example, building qemu or the linux kernel kept my hyperthreaded
hexa Core i7 with 18GiB of RAM, busy at 99% (I never ever managed to
get 100% even with more jobs, not even 200); while on my hyperthreaded
dual Core i5 with only 4GiB and a slow HDD, I still topped at 100% CPU,
while still able to do some work involving the HDD.

If the number of processors is not available, assume one.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Nathan Lynch <ntl@pobox.com>

---
Changes v1 -> v2:
  - fix the code to actually reflect the commit log
  - fix the comment (Nathan)
---
 package/Makefile.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index a449089..9ba6e8c 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -7,11 +7,12 @@ endif
 HOSTMAKE :=$(shell which $(HOSTMAKE) || type -p $(HOSTMAKE) || echo make)
 
 # If BR2_LEVEL is 0, scale the maximum concurrency with the number of
-# CPUs.  A coefficient of 2 is used in order to keep processors busy
+# CPUs. An additional job is used in order to keep processors busy
 # while waiting on I/O.
+# If the number of processors is not available, assume one.
 ifeq ($(BR2_JLEVEL),0)
 PARALLEL_JOBS:=$(shell echo \
-	$$((2 * `getconf _NPROCESSORS_ONLN 2>/dev/null || echo 1`)))
+	$$((1 + `getconf _NPROCESSORS_ONLN 2>/dev/null || echo 1`)))
 else
 PARALLEL_JOBS:=$(BR2_JLEVEL)
 endif
-- 
1.8.1.2
