From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Feb 2014 09:18:35 +0100
Subject: [Buildroot] [git commit] netsnmp: fix static linking with openssl
Message-ID: <20140215081906.C209C9CA3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4b9a294e1c332a489298ca7ce865ea5f06d69c28
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/084/0845bde5d234bd00d23c7a1b7e18746882dcdde4/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netsnmp/netsnmp.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 6bb6fe2..4830c00 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -40,6 +40,10 @@ ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	NETSNMP_DEPENDENCIES += openssl
 	NETSNMP_CONF_OPT += \
 		--with-openssl=$(STAGING_DIR)/usr/include/openssl
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+	# openssl uses zlib, so we need to explicitly link with it when static
+	NETSNMP_CONF_ENV += LIBS=-lz
+endif
 else
 	NETSNMP_CONF_OPT += --without-openssl
 endif
