From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Oct 2018 00:54:16 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] poco: disable
 fpenvironment for soft floating point configuration
Message-ID: <20181023225329.D7F0C88706@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6bc94e5f4194f013976ce15257548fa392668253
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Many platforms don't provide all FPU features needed by Poco when
configured for soft floating point in their fenv.h header. So
disable fpenvironment for this configuration to avoid build breakage.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c735f39881cf49bc58ad1b8375fd630e8284ad21)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/poco/poco.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 3dddb435e9..fd3db6f52f 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -37,6 +37,11 @@ ifeq ($(BR2_sh4a)$(BR2_nios2),y)
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
