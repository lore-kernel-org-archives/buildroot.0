From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Nov 2013 00:07:42 +0100
Subject: [Buildroot] [git commit] Avoid toolchain download when it is
	preinstalled
Message-ID: <20131110230837.6E4AD9BB69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2873eae4df6b5d486f85afc97aedf3cadd1cc024
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For configurations using a toolchain that is preinstalled on
the host, <pkg>_SITE and <pkg>_SOURCE variables must be kept
empty to avoid downloading any toolchain package.
The actual implementation has been proposed by Thomas Petazzoni.

Signed-off-by: GONZALEZ Laurent <br2@gezedo.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-external/toolchain-external.mk |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 2722600..e2e9953 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -348,6 +348,14 @@ TOOLCHAIN_EXTERNAL_SITE = $(dir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
 TOOLCHAIN_EXTERNAL_SOURCE = $(notdir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
 endif
 
+# In fact, we don't need to download the toolchain, since it is already
+# available on the system, so force the site and source to be empty so
+# that nothing will be downloaded/extracted.
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED),y)
+TOOLCHAIN_EXTERNAL_SITE =
+TOOLCHAIN_EXTERNAL_SOURCE =
+endif
+
 TOOLCHAIN_EXTERNAL_INSTALL_STAGING = YES
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1)$(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2),y)
