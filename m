From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 Dec 2020 11:51:09 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/opkg-utils: needs
 Python3 on the host
Message-ID: <20201222103541.08B31825CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=14f4742bf18e894929d0ae39f7bd88c2d7c9e686
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

The 'opkg.py' script installed by host-opkg-utils has as shebang:
    #!/usr/bin/env python3

which may not be available on all host machines.
Add a potential dependency on host-python3 via BR2_PYTHON3_HOST_DEPENDENCY,
which will only add the host-python3 dependency if no python3 is already
available on the host.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 7dcd20f9d5cca7dba2c510988b457c93532108cd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opkg-utils/opkg-utils.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/opkg-utils/opkg-utils.mk b/package/opkg-utils/opkg-utils.mk
index fa14053f65..a94a4cd5cd 100644
--- a/package/opkg-utils/opkg-utils.mk
+++ b/package/opkg-utils/opkg-utils.mk
@@ -10,6 +10,8 @@ OPKG_UTILS_SITE_METHOD = git
 OPKG_UTILS_LICENSE = GPL-2.0+
 OPKG_UTILS_LICENSE_FILES = COPYING
 
+HOST_OPKG_UTILS_DEPENDENCIES += $(BR2_PYTHON3_HOST_DEPENDENCY)
+
 define HOST_OPKG_UTILS_BUILD_CMDS
 	$(MAKE) -C $(@D) $(HOST_CONFIGURE_OPTS)
 endef
