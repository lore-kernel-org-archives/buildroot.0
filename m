From: Alexander Dahl <post@lespocky.de>
Date: Wed, 11 Sep 2019 10:40:39 +0200
Subject: [Buildroot] [PATCH] package: qemu: Make dependency to nettle
 explicit
Message-ID: <20190911084039.16983-1-post@lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For the fli4l router distribution we had problems building 'qemu', some
builds failed complaining when checking dynamic linking of the package:

>>> qemu 2.12.1 Error: Library libnettle.so.6 referenced by usr/libexec/qemu-bridge-helper belongs to package nettle which is not a dependency of qemu

https://web.nettworks.org/ci/job/fli4l/job/buildroot/job/4.0/job/trunk-x86_64/495/console

Making the dependency explicit, by calling ./configure with
--enable-nettle or --disable-nettle depending on the activation status
of package nettle, solves the issue.

For fli4l the fix is still based on buildroot 2018.02.x, but the problem
is the same in recent version of buildroot, and the fix works for master
as well.

Cc: Florian Wolters <florian@florian-wolters.de>
Signed-off-by: Alexander Dahl <post@lespocky.de>
---
 package/qemu/qemu.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 05d16560f7..1d3759a850 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -97,6 +97,13 @@ else
 QEMU_OPTS += --disable-libssh2
 endif
 
+ifeq ($(BR2_PACKAGE_NETTLE),y)
+QEMU_OPTS += --enable-nettle
+QEMU_DEPENDENCIES += nettle
+else
+QEMU_OPTS += --disable-nettle
+endif
+
 # Override CPP, as it expects to be able to call it like it'd
 # call the compiler.
 define QEMU_CONFIGURE_CMDS
-- 
2.11.0
