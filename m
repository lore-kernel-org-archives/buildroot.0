From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 15 May 2020 22:24:19 +0200
Subject: [Buildroot] [git commit] package/kmod: modinfo support of signature
 details
Message-ID: <20200515200819.4F37991966@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=564d9bdad83402068eaf26e37f6fd711ade4e282
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add conditional support to allow the module tools to use openssl
on target to inspect the signature of signed modules. If openssl
is not enabled the modinfo will show a hash algo as unknown.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Tested-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/kmod/kmod.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index e2dfea5c7b..0a79b2cf4d 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -42,6 +42,13 @@ KMOD_DEPENDENCIES += xz
 KMOD_CONF_OPTS += --with-xz
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
