From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 Oct 2019 09:16:24 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/kvm-unit-tests:
 fix build on Arch Linux x86_64
Message-ID: <20191031084113.D19E28E159@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ca629c77ea46d86b1855ea76f2fe33f472fc31f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

On x86_64, we use the host compiler instead of the target compiler to
build kvm-unit-tests, because it is built with -m32 and our target
compiler doesn't support that.

However, the compiler on Arch Linux is broken: it *always* builds with
-fstack-protector, even when -ffreestanding is passed. However, when
-fnostdlib is passed at link time (which is normally the case when
building with -ffreestanding), it is not linked with the stack-protector
library. This leads to a link time error:

/usr/bin/ld: x86/realmode.o: in function `print_serial_u32':
.../x86/realmode.c:104: undefined reference to `__stack_chk_fail'

Since the entire package is built with -ffreestanding, it doesn't
support stack-protector at all. Therefore, simply pass
-fno-stack-protector explicitly on x86_64 to work around the bug in Arch
Linux.

Bug reported upstream: https://bugs.archlinux.org/task/64270

Fixes:
 - http://autobuild.buildroot.org/results/e6f767755ffdb5ecc014eb5ad7519814f075a60e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Tested-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit c0ffd16e40f15938f4a440a1048fc3d7fba2f7c4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kvm-unit-tests/kvm-unit-tests.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/kvm-unit-tests/kvm-unit-tests.mk b/package/kvm-unit-tests/kvm-unit-tests.mk
index 92d67fb34b..bb08c0603d 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.mk
+++ b/package/kvm-unit-tests/kvm-unit-tests.mk
@@ -37,6 +37,11 @@ KVM_UNIT_TESTS_CONF_OPTS =\
 # x86-64 cannot do.
 ifneq ($(BR2_x86_64),y)
 KVM_UNIT_TESTS_CONF_OPTS += --cross-prefix="$(TARGET_CROSS)"
+# Arch Linux adds -fstack-protector even when building with -ffreestanding, but
+# it doesn't link with the stack-protector library when -nostdlib is passed,
+# which leads to a link error. Therefore, disable it explicitly to work around
+# this bug in Arch Linux. https://bugs.archlinux.org/task/64270
+KVM_UNIT_TESTS_MAKE_OPTS += EXTRA_CFLAGS=-fno-stack-protector
 endif
 
 define KVM_UNIT_TESTS_CONFIGURE_CMDS
@@ -44,11 +49,12 @@ define KVM_UNIT_TESTS_CONFIGURE_CMDS
 endef
 
 define KVM_UNIT_TESTS_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) standalone
+	$(TARGET_MAKE_ENV) $(MAKE) $(KVM_UNIT_TESTS_MAKE_OPTS) -C $(@D) \
+		standalone
 endef
 
 define KVM_UNIT_TESTS_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+	$(TARGET_MAKE_ENV) $(MAKE) $(KVM_UNIT_TESTS_MAKE_OPTS) -C $(@D) \
 		DESTDIR=$(TARGET_DIR)/usr/share/kvm-unit-tests/ \
 		install
 endef
