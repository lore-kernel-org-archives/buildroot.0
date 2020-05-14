From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 14 May 2020 13:28:06 -0500
Subject: [Buildroot] [Next] package/kmod: modinfo support of signature
 details
Message-ID: <20200514182806.56592-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add conditional support to allow the module tools to use openssl
on target to inspect the signature of signed modules. If openssl
is not enabled the modinfo will show a hash algo as unknown.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
Prior to this patch the kmod series for compressed modules should
be applied. No functionality dependency, I just identified them as
patching conflicts.

http://patchwork.ozlabs.org/project/buildroot/list/?series=174301
---
 package/kmod/kmod.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index 979c3e87e6..69615452cf 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -46,6 +46,13 @@ else
 KMOD_CONF_OPTS += --without-xz
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+KMOD_DEPENDENCIES += openssl
+KMOD_CONF_OPTS += --with-openssl
+else
+KMOD_CONF_OPTS += --without-openssl
+endif
+
 ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
 KMOD_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON),python,python3)
 KMOD_CONF_OPTS += --enable-python
-- 
2.17.1
