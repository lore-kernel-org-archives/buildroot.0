From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 23 Nov 2016 14:39:10 +0000
Subject: [Buildroot] [PATCH next 2/6] moarvm: use pkgconfig to find
	libraries and headers
In-Reply-To: <20161123143914.3969-1-Vincent.Riera@imgtec.com>
References: <20161123143914.3969-1-Vincent.Riera@imgtec.com>
Message-ID: <20161123143914.3969-2-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

MoarVM's Configure.pl script uses pkgconfig to find libraries and
headers, but it uses the one installed in the host machine which is
wrong and can lead to errors of unsafe include paths.

Instead, make it depend on the host-pkgconf package and specify the path
to our pkgconfig binary by using the --pkgconfig configure option.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/moarvm/moarvm.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/moarvm/moarvm.mk b/package/moarvm/moarvm.mk
index 644432e..80bd19c 100644
--- a/package/moarvm/moarvm.mk
+++ b/package/moarvm/moarvm.mk
@@ -10,7 +10,7 @@ MOARVM_SOURCE = MoarVM-$(MOARVM_VERSION).tar.gz
 MOARVM_LICENSE = Artistic-2.0
 MOARVM_LICENSE_FILES = Artistic2.txt
 MOARVM_INSTALL_STAGING = YES
-MOARVM_DEPENDENCIES = host-luajit libuv libtommath libatomic_ops
+MOARVM_DEPENDENCIES = host-luajit host-pkgconf libuv libtommath libatomic_ops
 
 MOARVM_CONF_OPTS = \
 	--build=$(GNU_HOST_NAME) \
@@ -19,6 +19,7 @@ MOARVM_CONF_OPTS = \
 	--cc="$(TARGET_CC)" \
 	--ld="$(TARGET_CC)" \
 	--prefix="/usr" \
+	--pkgconfig=$(PKG_CONFIG_HOST_BINARY) \
 	--lua=$(HOST_DIR)/usr/bin/luajit \
 	--has-libuv \
 	--has-libtommath \
-- 
2.10.1
