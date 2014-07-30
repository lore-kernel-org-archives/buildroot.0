From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Jul 2014 23:51:51 +0200
Subject: [Buildroot] [git commit] bind: fix static openssl linking
Message-ID: <20140730215158.385389D348@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=26aefa672c96caefc17adf59a9ab3d327114ad36
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Apparently LIBS (environment) isn't pushed to LIBS (autoconf) for the
tests, hence when static linking openssl it misses libz and assumes some
basic digests required for ecdsa support are missing, which is false. Fixes:
http://autobuild.buildroot.net/results/204/20411901d1bc6811e1ef8fa39457257d6bf1a146/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bind/bind.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index d6707d2..e0784e6 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -41,6 +41,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 	BIND_DEPENDENCIES += openssl
+	BIND_CONF_ENV += ac_cv_func_EVP_sha256=yes \
+		ac_cv_func_EVP_sha384=yes ac_cv_func_EVP_sha512=yes
 	BIND_CONF_OPT += --with-openssl=$(STAGING_DIR)/usr LIBS="-lz" \
 		--with-ecdsa=yes
 # GOST cipher support requires openssl extra engines
