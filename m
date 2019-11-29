From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Nov 2019 16:57:49 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/kvm-unit-tests:
 really fix build on Arch Linux x86_64
Message-ID: <20191129155044.E08A282A39@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=16b368d80e31b2eb7e3fc70d90eb9c04e3af7906
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

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

Commit c0ffd16e4 tried to do this, but got the condition wrong:
-fno-stack-protector was passed in all cases *except* for x86_64. This
commit fixes that, by inverting the condition and moving the
--cross-prefix part to the else branch.

Fixes:
http://autobuild.buildroot.net/results/ca9576721214ecdce5622f2b7ec4fd4fc3699ac0/

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
Reviewed-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Tested-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b8b7bd18ed8e47c38063559b3d2c4ef4859185e2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kvm-unit-tests/kvm-unit-tests.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/kvm-unit-tests/kvm-unit-tests.mk b/package/kvm-unit-tests/kvm-unit-tests.mk
index bb08c0603d..2637066701 100644
--- a/package/kvm-unit-tests/kvm-unit-tests.mk
+++ b/package/kvm-unit-tests/kvm-unit-tests.mk
@@ -35,13 +35,14 @@ KVM_UNIT_TESTS_CONF_OPTS =\
 # compiler. However, for x86-64, we use the host compiler, as
 # kvm-unit-tests builds 32 bit code, which Buildroot toolchains for
 # x86-64 cannot do.
-ifneq ($(BR2_x86_64),y)
-KVM_UNIT_TESTS_CONF_OPTS += --cross-prefix="$(TARGET_CROSS)"
+ifeq ($(BR2_x86_64),y)
 # Arch Linux adds -fstack-protector even when building with -ffreestanding, but
 # it doesn't link with the stack-protector library when -nostdlib is passed,
 # which leads to a link error. Therefore, disable it explicitly to work around
 # this bug in Arch Linux. https://bugs.archlinux.org/task/64270
 KVM_UNIT_TESTS_MAKE_OPTS += EXTRA_CFLAGS=-fno-stack-protector
+else
+KVM_UNIT_TESTS_CONF_OPTS += --cross-prefix="$(TARGET_CROSS)"
 endif
 
 define KVM_UNIT_TESTS_CONFIGURE_CMDS
