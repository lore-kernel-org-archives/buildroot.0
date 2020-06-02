From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 02 Jun 2020 08:14:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/xen: security bump to version
 4.13.1
In-Reply-To: <20200530122532.3477185-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 30 May 2020 14:25:32 +0200")
References: <20200530122532.3477185-1-fontaine.fabrice@gmail.com>
Message-ID: <87lfl6dmfb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix CVE-2020-11739: An issue was discovered in Xen through 4.13.x,
 > allowing guest OS users to cause a denial of service or possibly gain
 > privileges because of missing memory barriers in read-write unlock
 > paths. The read-write unlock paths don't contain a memory barrier. On
 > Arm, this means a processor is allowed to re-order the memory access
 > with the preceding ones. In other words, the unlock may be seen by
 > another processor before all the memory accesses within the "critical"
 > section. As a consequence, it may be possible to have a writer executing
 > a critical section at the same time as readers or another writer. In
 > other words, many of the assumptions (e.g., a variable cannot be
 > modified after a check) in the critical sections are not safe anymore.
 > The read-write locks are used in hypercalls (such as grant-table ones),
 > so a malicious guest could exploit the race. For instance, there is a
 > small window where Xen can leak memory if XENMAPSPACE_grant_table is
 > used concurrently. A malicious guest may be able to leak memory, or
 > cause a hypervisor crash resulting in a Denial of Service (DoS).
 > Information leak and privilege escalation cannot be excluded.

 > - Fix CVE-2020-11740: An issue was discovered in xenoprof in Xen through
 > 4.13.x, allowing guest OS users (without active profiling) to obtain
 > sensitive information about other guests. Unprivileged guests can
 > request to map xenoprof buffers, even if profiling has not been enabled
 > for those guests. These buffers were not scrubbed.

 > - Fix CVE-2020-11741: An issue was discovered in xenoprof in Xen through
 > 4.13.x, allowing guest OS users (with active profiling) to obtain
 > sensitive information about other guests, cause a denial of service, or
 > possibly gain privileges. For guests for which "active" profiling was
 > enabled by the administrator, the xenoprof code uses the standard Xen
 > shared ring structure. Unfortunately, this code did not treat the guest
 > as a potential adversary: it trusts the guest not to modify buffer size
 > information or modify head / tail pointers in unexpected ways. This can
 > crash the host (DoS). Privilege escalation cannot be ruled out.

 > - Fix CVE-2020-11742: An issue was discovered in Xen through 4.13.x,
 > allowing guest OS users to cause a denial of service because of bad
 > continuation handling in GNTTABOP_copy. Grant table operations are
 > expected to return 0 for success, and a negative number for errors. The
 > fix for CVE-2017-12135 introduced a path through grant copy handling
 > where success may be returned to the caller without any action taken. In
 > particular, the status fields of individual operations are left
 > uninitialised, and may result in errant behaviour in the caller of
 > GNTTABOP_copy. A buggy or malicious guest can construct its grant table
 > in such a way that, when a backend domain tries to copy a grant, it hits
 > the incorrect exit path. This returns success to the caller without
 > doing anything, which may cause crashes or other incorrect behaviour.

 > - Fix CVE-2020-11743: An issue was discovered in Xen through 4.13.x,
 > allowing guest OS users to cause a denial of service because of a bad
 > error path in GNTTABOP_map_grant. Grant table operations are expected to
 > return 0 for success, and a negative number for errors. Some misplaced
 > brackets cause one error path to return 1 instead of a negative value.
 > The grant table code in Linux treats this condition as success, and
 > proceeds with incorrectly initialised state. A buggy or malicious guest
 > can construct its grant table in such a way that, when a backend domain
 > tries to map a grant, it hits the incorrect error path. This will crash
 > a Linux based dom0 or backend domain.

 > https://xenproject.org/downloads/xen-project-archives/xen-project-4-13-series/xen-project-4-13-1

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
