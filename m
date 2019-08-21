From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Aug 2019 14:37:19 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] qemu: fix host virtfs
 option
Message-ID: <20190821123344.096C483FBA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6fee778121d325df174b5fe6dab664cfb0065f9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fix the build of host-qemu with virtfs enabled: fix a typo in makefile
conditional and add a dependency on host-libcap as that is a dependency of
virtfs support:

    if test "$virtfs" != no && test "$cap" = yes && test "$attr" = yes ; then
      virtfs=yes

The virtfs configuration option was added by commit e0f49e648401
("package/qemu: add option to enable virtual filesystem in host qemu").

Signed-off-by: Vincent Stehl?? <vincent.stehle@arm.com>
Cc: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 499dfc941036b16a7bf615112b0a24e0daac9c41)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qemu/qemu.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index b858efe3f7..ca4a6656b9 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -257,8 +257,11 @@ HOST_QEMU_OPTS += --enable-vde
 HOST_QEMU_DEPENDENCIES += host-vde2
 endif
 
-ifdef ($(BR2_PACKAGE_HOST_QEMU_VIRTFS),y)
+ifeq ($(BR2_PACKAGE_HOST_QEMU_VIRTFS),y)
 HOST_QEMU_OPTS += --enable-virtfs
+HOST_QEMU_DEPENDENCIES += host-libcap
+else
+HOST_QEMU_OPTS += --disable-virtfs
 endif
 
 # Override CPP, as it expects to be able to call it like it'd
