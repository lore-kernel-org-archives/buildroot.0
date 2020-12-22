From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 Dec 2020 11:51:22 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/opkg-utils: needs
 Python3 on the host
Message-ID: <20201222103555.F22F7884F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10a8c7a0caf9b7e11d01bf4e0a37d73ce631d18d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

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
index 38137bc67b..68876b874f 100644
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
