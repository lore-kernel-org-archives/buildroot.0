From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Nov 2016 13:39:26 +0100
Subject: [Buildroot] [git commit] kvm-unit-tests: really use
	KVM_UNIT_TESTS_ARCH and fix value on x86-64
Message-ID: <20161106124046.37C1681844@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9f9903eaa6bde38fe449efeda3f546388a031fa6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The kvm-unit-tests package defines a KVM_UNIT_TESTS_ARCH variable, but
never used it. Due to this, on PowerPC64, we were passing an incorrect
value, causing a build failure.

In addition, once the KVM_UNIT_TESTS_ARCH is used, it appeared that
its value for x86_64 was incorrect, due a typo: it was x86_84 instead
of x86_64.

Fixes:

  http://autobuild.buildroot.net/results/16836c02f4d1ab5df6b2e21a4fcdbbf4a7542f22/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kvm-unit-tests/kvm-unit-tests.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kvm-unit-tests/kvm-unit-tests.mk b/package/kvm-unit-tests/kvm-unit-tests.mk
index 1b5ce78..6e1c2df 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.mk
+++ b/package/kvm-unit-tests/kvm-unit-tests.mk
@@ -17,7 +17,7 @@ KVM_UNIT_TESTS_ARCH = i386
 else ifeq ($(BR2_powerpc64)$(BR2_powerpc64le),y)
 KVM_UNIT_TESTS_ARCH = ppc64
 else ifeq ($(BR2_x86_64),y)
-KVM_UNIT_TESTS_ARCH = x86_84
+KVM_UNIT_TESTS_ARCH = x86_64
 endif
 
 ifeq ($(BR2_ENDIAN),"LITTLE")
@@ -27,7 +27,7 @@ KVM_UNIT_TESTS_ENDIAN = big
 endif
 
 KVM_UNIT_TESTS_CONF_OPTS =\
-	--arch="$(KERNEL_ARCH)" \
+	--arch="$(KVM_UNIT_TESTS_ARCH)" \
 	--endian="$(KVM_UNIT_TESTS_ENDIAN)"
 
 # For all architectures but x86-64, we use the target
