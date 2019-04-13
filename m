From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 13 Apr 2019 16:22:23 +0200
Subject: [Buildroot] [git commit] package/pure-ftpd: fix static build with
 openssl and latomic
Message-ID: <20190413143605.856EE8E168@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ff5504b4daea7e3979980a61b62dcd3c68f0eb30
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use pkg-config to find openssl dependencies such as lz or latomic

Fixes:
 - http://autobuild.buildroot.org/results/eba8d344446b0db6327c0588c456c14594984f76

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pure-ftpd/pure-ftpd.mk | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index 93ad57c3f3..2d69efe3f9 100644
--- a/package/pure-ftpd/pure-ftpd.mk
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -46,10 +46,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 PURE_FTPD_CONF_OPTS += --with-tls
-PURE_FTPD_DEPENDENCIES += openssl
-ifeq ($(BR2_STATIC_LIBS),y)
-PURE_FTPD_CONF_ENV += LIBS='-lssl -lcrypto -lz'
-endif
+PURE_FTPD_DEPENDENCIES += host-pkgconf openssl
+PURE_FTPD_CONF_ENV += LIBS=`$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 else
 PURE_FTPD_CONF_OPTS += --without-tls
 endif
