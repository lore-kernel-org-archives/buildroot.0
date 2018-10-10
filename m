From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 10:47:44 +0200
Subject: [Buildroot] [git commit] poco: disable fpenvironment for soft
 floating point configuration
Message-ID: <20181010084636.75758820E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c735f39881cf49bc58ad1b8375fd630e8284ad21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Many platforms don't provide all FPU features needed by Poco when
configured for soft floating point in their fenv.h header. So
disable fpenvironment for this configuration to avoid build breakage.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/poco/poco.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 018344d5c7..aa96d5127b 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -42,6 +42,11 @@ ifeq ($(BR2_sh4a)$(BR2_nios2),y)
 POCO_CONF_OPTS += --no-fpenvironment
 endif
 
+# disable fpenvironment for soft floating point configuration
+ifeq ($(BR2_SOFT_FLOAT),y)
+POCO_CONF_OPTS += --no-fpenvironment
+endif
+
 ifeq ($(BR2_STATIC_LIBS),y)
 POCO_MAKE_TARGET = static_release
 else ifeq ($(BR2_SHARED_LIBS),y)
