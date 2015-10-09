From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Oct 2015 15:23:23 +0200
Subject: [Buildroot] [git commit] webkitgtk24: use the correct Config.in
	option for NEON
Message-ID: <20151009132327.17B8481F4D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=543969e5ef9f6a5f585b2945c80a4d989cada440
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order to enable JIT support on ARM, webkitgtk24 currently looks at
BR2_ARM_ENABLE_NEON, which is not correct: BR2_ARM_CPU_HAS_NEON should
be used instead.

The BR2_ARM_ENABLE_NEON is only visible for cores that select
BR2_ARM_CPU_MAYBE_HAS_NEON, in order to allow to specify if his
particular SoC has chosen to integrate NEON or not. And if so,
BR2_ARM_CPU_HAS_NEON gets selected.

BR2_ARM_CPU_HAS_NEON is in fact selected in two different ways:

 - Either directly by the CPU core selection, if NEON is mandatory in
   this CPU core.

 - Or by BR2_ARM_ENABLE_NEON, for CPU cores where NEON support is
   optional.

So really, BR2_ARM_CPU_HAS_NEON is what should be used by packages.

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/webkitgtk24/webkitgtk24.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/webkitgtk24/webkitgtk24.mk b/package/webkitgtk24/webkitgtk24.mk
index a58fed3..3be1cc7 100644
--- a/package/webkitgtk24/webkitgtk24.mk
+++ b/package/webkitgtk24/webkitgtk24.mk
@@ -88,7 +88,7 @@ endif
 
 # ARM needs NEON for JIT
 # i386 & x86_64 don't seem to have any special requirements
-ifeq ($(BR2_ARM_ENABLE_NEON)$(BR2_i386)$(BR2_x86_64),y)
+ifeq ($(BR2_ARM_CPU_HAS_NEON)$(BR2_i386)$(BR2_x86_64),y)
 WEBKITGTK24_CONF_OPTS += --enable-jit
 else
 WEBKITGTK24_CONF_OPTS += --disable-jit
