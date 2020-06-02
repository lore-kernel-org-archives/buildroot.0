From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Jun 2020 08:13:17 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/xen: security
 bump to version 4.13.1
Message-ID: <20200602062448.5795B81DD6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6710b7f0c99b4ec5ccb602c58e0b5081958da447
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

- Fix CVE-2020-11739: An issue was discovered in Xen through 4.13.x,
allowing guest OS users to cause a denial of service or possibly gain
privileges because of missing memory barriers in read-write unlock
paths. The read-write unlock paths don't contain a memory barrier. On
Arm, this means a processor is allowed to re-order the memory access
with the preceding ones. In other words, the unlock may be seen by
another processor before all the memory accesses within the "critical"
section. As a consequence, it may be possible to have a writer executing
a critical section at the same time as readers or another writer. In
other words, many of the assumptions (e.g., a variable cannot be
modified after a check) in the critical sections are not safe anymore.
The read-write locks are used in hypercalls (such as grant-table ones),
so a malicious guest could exploit the race. For instance, there is a
small window where Xen can leak memory if XENMAPSPACE_grant_table is
used concurrently. A malicious guest may be able to leak memory, or
cause a hypervisor crash resulting in a Denial of Service (DoS).
Information leak and privilege escalation cannot be excluded.

- Fix CVE-2020-11740: An issue was discovered in xenoprof in Xen through
4.13.x, allowing guest OS users (without active profiling) to obtain
sensitive information about other guests. Unprivileged guests can
request to map xenoprof buffers, even if profiling has not been enabled
for those guests. These buffers were not scrubbed.

- Fix CVE-2020-11741: An issue was discovered in xenoprof in Xen through
4.13.x, allowing guest OS users (with active profiling) to obtain
sensitive information about other guests, cause a denial of service, or
possibly gain privileges. For guests for which "active" profiling was
enabled by the administrator, the xenoprof code uses the standard Xen
shared ring structure. Unfortunately, this code did not treat the guest
as a potential adversary: it trusts the guest not to modify buffer size
information or modify head / tail pointers in unexpected ways. This can
crash the host (DoS). Privilege escalation cannot be ruled out.

- Fix CVE-2020-11742: An issue was discovered in Xen through 4.13.x,
allowing guest OS users to cause a denial of service because of bad
continuation handling in GNTTABOP_copy. Grant table operations are
expected to return 0 for success, and a negative number for errors. The
fix for CVE-2017-12135 introduced a path through grant copy handling
where success may be returned to the caller without any action taken. In
particular, the status fields of individual operations are left
uninitialised, and may result in errant behaviour in the caller of
GNTTABOP_copy. A buggy or malicious guest can construct its grant table
in such a way that, when a backend domain tries to copy a grant, it hits
the incorrect exit path. This returns success to the caller without
doing anything, which may cause crashes or other incorrect behaviour.

- Fix CVE-2020-11743: An issue was discovered in Xen through 4.13.x,
allowing guest OS users to cause a denial of service because of a bad
error path in GNTTABOP_map_grant. Grant table operations are expected to
return 0 for success, and a negative number for errors. Some misplaced
brackets cause one error path to return 1 instead of a negative value.
The grant table code in Linux treats this condition as success, and
proceeds with incorrectly initialised state. A buggy or malicious guest
can construct its grant table in such a way that, when a backend domain
tries to map a grant, it hits the incorrect error path. This will crash
a Linux based dom0 or backend domain.

https://xenproject.org/downloads/xen-project-archives/xen-project-4-13-series/xen-project-4-13-1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 0caabc8cda933b32660867b270151451f77b6e14)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xen/xen.hash | 2 +-
 package/xen/xen.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xen/xen.hash b/package/xen/xen.hash
index 4224924652..ab5f9d9083 100644
--- a/package/xen/xen.hash
+++ b/package/xen/xen.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c69ae21b2ddeaf25532a81a448fcc6a218bc56f93c8907b2d416b2d4339c0afe  xen-4.13.0.tar.gz
+sha256  b97ce363e55b12c992063f4466c43cba0a6386ceb7a747b4dc670311f337ef01  xen-4.13.1.tar.gz
 sha256  36b91794c6d4a678137c70c41e384c03b552c7efba82c0d73e6be842e41ab3d3  COPYING
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index fa49f5996b..15742b5127 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XEN_VERSION = 4.13.0
+XEN_VERSION = 4.13.1
 XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
 XEN_LICENSE = GPL-2.0
 XEN_LICENSE_FILES = COPYING
