From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Sep 2019 15:22:35 +0200
Subject: [Buildroot] [git commit] package/network-manager: fix legal-info
 following the 1.20.0 bump
Message-ID: <20190907132130.BECBA8C697@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a1d95ce2f448edc749029d79a5342b41a373498b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit aee34c479a5f845ed84ca0fac60250843742bec6, network-manager
was bumped to 1.20.0. As part of this bump, the libnm-util/ subfolder
was removed, and therefore libnm-util/COPYING no longer exists,
breaking the legal-info of this package.

The only remaining COPYING file is at the top-level. However, it
documents only the GPL-2.0 license, while in fact many parts of
network-manager, especially libraries, are under LGPL-2.0. This is
well explained in the CONTRIBUTING file, which states:

"""
Legal
-----

NetworkManager is partly licensed under terms of GNU Lesser General Public License
version 2 or later (LGPL-2.0+). That is for example the case for libnm.
For historical reasons, the daemon itself is licensed under terms of GNU General
Public License, version 2 or later (GPL-2.0+). See the license comment in the source
files.
Note that all new contributions to NetworkManager MUST be made under terms of
LGPL-2.0+, that is also the case for parts that are currently licensed GPL-2.0+.
The reason for that is that we might eventually relicense everything as LGPL and
new contributions already must agree with that future change.
"""

So, we keep GPL-2.0 and LGPL-2.0 as license, drop libnm-util/COPYING
from the LICENSE_FILES variable, and instead add the CONTRIBUTING
file. We also add a comment above the LICENSE variable.

Fixes:

  http://autobuild.buildroot.net/results/44ce11d110a508821f76aae7ce996c1814c6a453/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/network-manager/network-manager.hash | 2 +-
 package/network-manager/network-manager.mk   | 7 +++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
index c0692b594b..b2e7c749e4 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -2,4 +2,4 @@
 sha256 b7e605055491ea8ef433bc149d55349111b9c789ad1cd0578f19ece39b1ac7c4  NetworkManager-1.20.0.tar.xz
 # Locally computed
 sha256 49d9659a4f9a09747c320d51d3cf9dfde210de67b70862acf849890f6477b00d  COPYING
-sha256 3a2968e3abb4fea464cd8dc1146d71996f9544af91a5f687bc4f3a2932df49b4  libnm-util/COPYING
+sha256 64a6d38d1b551a1bfd8509e732cdc9202d2681b61f5b39298f488674d3466fc9  CONTRIBUTING
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 1b2321f9d2..e13042c7d4 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -11,8 +11,11 @@ NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWO
 NETWORK_MANAGER_INSTALL_STAGING = YES
 NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev dbus-glib libnl gnutls \
 	libgcrypt wireless_tools util-linux host-intltool readline libndp libgudev
-NETWORK_MANAGER_LICENSE = GPL-2.0+ (app), LGPL-2.0+ (libnm-util)
-NETWORK_MANAGER_LICENSE_FILES = COPYING libnm-util/COPYING
+# Even though the COPYING file only contains the GPL-2.0 text, many
+# parts of network-manager are under LGPL-2.0. See the "Legal" section
+# of the CONTRIBUTING file for details.
+NETWORK_MANAGER_LICENSE = GPL-2.0+ (app), LGPL-2.0+ (libnm)
+NETWORK_MANAGER_LICENSE_FILES = COPYING CONTRIBUTING
 
 NETWORK_MANAGER_CONF_ENV = \
 	ac_cv_path_LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config \
