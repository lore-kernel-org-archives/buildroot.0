From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  3 Dec 2018 23:38:55 +0100
Subject: [Buildroot] [PATCH v2,2/2] lxc: fix build without stack protector
In-Reply-To: <20181203223855.10152-1-fontaine.fabrice@gmail.com>
References: <20181203223855.10152-1-fontaine.fabrice@gmail.com>
Message-ID: <20181203223855.10152-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stack protector has been added in version 3.0.3 by
https://github.com/lxc/lxc/commit/2268c27754152aa538db2c9e3753d72d19bcd17a

Disable it through
ax_cv_check_cflags__Werror__fstack_protector_strong=no

Fixes:
 - http://autobuild.buildroot.org/results/0b90e7dca2984652842832a41abad93ac49a9b86

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Drop patch to add a new option, instead use 
   ax_cv_check_cflags__Werror__fstack_protector_strong=no

 package/lxc/lxc.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index 48d5b20329..0b7b03bcac 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -11,6 +11,8 @@ LXC_LICENSE_FILES = COPYING
 LXC_DEPENDENCIES = host-pkgconf
 LXC_INSTALL_STAGING = YES
 
+LXC_CONF_ENV = ax_cv_check_cflags__Werror__fstack_protector_strong=no
+
 LXC_CONF_OPTS = --disable-apparmor --with-distro=buildroot \
 	--disable-werror \
 	$(if $(BR2_PACKAGE_BASH),,--disable-bash)
-- 
2.14.1
