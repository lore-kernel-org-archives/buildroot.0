From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 6 Mar 2021 16:46:46 +0100
Subject: [Buildroot] [git commit] package/belle-sip: fix build failure due
 to gcc bug 99410
Message-ID: <20210306152449.2F6188026C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bf89616368ce8eb3212aea5212145e9e4ed8c0cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The belle-sip package exhibits gcc bug 99410 when built for the Nios2
architecture with optimization enabled, which causes a build failure.

As done for other packages in Buildroot work around this gcc bug by
setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_99410=y.

Fixes:
http://autobuild.buildroot.net/results/71f26fd81db8e9b19b3f18f3f3cefd9c768f094f/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/belle-sip/belle-sip.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/belle-sip/belle-sip.mk b/package/belle-sip/belle-sip.mk
index b5169be488..23b60e51f5 100644
--- a/package/belle-sip/belle-sip.mk
+++ b/package/belle-sip/belle-sip.mk
@@ -32,4 +32,12 @@ else ifeq ($(BR2_SHARED_LIBS),y)
 BELLE_SIP_CONF_OPTS += -DENABLE_SHARED=ON -DENABLE_STATIC=OFF
 endif
 
+BELLE_SIP_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_99140),y)
+BELLE_SIP_CFLAGS += -O0
+endif
+
+BELLE_SIP_CONF_OPTS += -DCMAKE_C_FLAGS="$(BELLE_SIP_CFLAGS)"
+
 $(eval $(cmake-package))
