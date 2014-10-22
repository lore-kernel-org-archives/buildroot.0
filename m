From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Oct 2014 21:37:53 +0200
Subject: [Buildroot] [git commit] iptables: disable static for dynamic builds
Message-ID: <20141022193804.6B1F3B022E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9f13ddf3bab51ae762b82ce9f767ac1abcdb7b2e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It leads to ugly runtime warnings, see:
http://patchwork.ozlabs.org/patch/386215/
It's also required for xtables-addons.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/iptables/iptables.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index f059807..2ef879d 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -12,7 +12,9 @@ IPTABLES_DEPENDENCIES = host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),libnetfilter_conntrack)
 IPTABLES_LICENSE = GPLv2
 IPTABLES_LICENSE_FILES = COPYING
-IPTABLES_CONF_OPTS = --libexecdir=/usr/lib --with-kernel=$(STAGING_DIR)/usr
+# Building static causes ugly warnings on some plugins
+IPTABLES_CONF_OPTS = --libexecdir=/usr/lib --with-kernel=$(STAGING_DIR)/usr \
+	$(if $(BR2_PREFER_STATIC_LIB),,--disable-static)
 # Because of iptables-01-fix-static-link.patch
 IPTABLES_AUTORECONF = YES
 
