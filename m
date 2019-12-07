From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Dec 2019 12:06:41 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/python-brotli:
 fix build failure due to gcc bug 68485
Message-ID: <20191207110229.B127788436@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1353e0cb4ae5feff4bc1cc7ac79dd1b74a9aa228
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

The python-brotli package exhibits gcc bug 68485 when built for the
Microblaze architecture with optimization enabled, which causes a build
failure.

As done for other packages in Buildroot work around this gcc bug by
setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_68485=y.

Fixes:

http://autobuild.buildroot.net/results/24b/24b23175ab27615fb377bb4d5f6c656dccf10a86/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit dec2e0449d50d71219b4d94bc5547cce50a85163)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-brotli/python-brotli.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/python-brotli/python-brotli.mk b/package/python-brotli/python-brotli.mk
index 745255f413..2ec549ed0c 100644
--- a/package/python-brotli/python-brotli.mk
+++ b/package/python-brotli/python-brotli.mk
@@ -11,6 +11,14 @@ PYTHON_BROTLI_SETUP_TYPE = setuptools
 PYTHON_BROTLI_LICENSE = MIT
 PYTHON_BROTLI_LICENSE_FILES = LICENSE
 
+PYTHON_BROTLI_CFLAGS = $(TARGET_CFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
+PYTHON_BROTLI_CFLAGS += -O0
+endif
+
+PYTHON_BROTLI_ENV = CFLAGS="$(PYTHON_BROTLI_CFLAGS)"
+
 define PYTHON_BROTLI_EXTRACT_CMDS
 	$(UNZIP) -d $(@D) $(PYTHON_BROTLI_DL_DIR)/$(PYTHON_BROTLI_SOURCE)
 	mv $(@D)/Brotli-$(PYTHON_BROTLI_VERSION)/* $(@D)
