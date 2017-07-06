From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 6 Jul 2017 11:54:51 +0200
Subject: [Buildroot] [git commit] xvisor: fix bogus check on XVISOR_ARCH
Message-ID: <20170706095212.CBDB981DD3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=27ce235cdb996dc691c28a95f6acc9c479ef1fb8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The XVISOR_ARCH check added in commit
117fd5dfbc756c4f2b4aef97fc2b568528c66df7 ("xvisor: fix build on
AArch64") broke Buildroot entirely on all architectures except ARM,
AArch64 and x86-64, because the $(error ...) test was not enclosed
inside a condition that made sure the xvisor package was enabled.

This commit fixes that, and allows Buildroot to be usable again on all
architectures.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xvisor/xvisor.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/xvisor/xvisor.mk b/package/xvisor/xvisor.mk
index 8be4be9..addd7e6 100644
--- a/package/xvisor/xvisor.mk
+++ b/package/xvisor/xvisor.mk
@@ -30,9 +30,13 @@ ifeq ($(BR2_x86_64),y)
 XVISOR_ARCH = x86
 else ifeq ($(BR2_arm)$(BR2_aarch64),y)
 XVISOR_ARCH = arm
-else
+endif
+
+ifeq ($(BR2_PACKAGE_XVISOR)$(BR_BUILDING),yy)
+ifeq ($(XVISOR_ARCH),)
 $(error "Architecture not supported by XVisor")
 endif
+endif
 
 XVISOR_MAKE_ENV = \
 	ARCH=$(XVISOR_ARCH) \
