From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Nov 2016 22:41:58 +0100
Subject: [Buildroot] [git commit] moarvm: use pkgconfig to find libraries
	and headers
Message-ID: <20161201222139.B6A177FD88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=40cbdf6de070db116e44a52b4a232d24ce850186
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

MoarVM's Configure.pl script uses pkgconfig to find libraries and
headers, but it uses the one installed in the host machine which is
wrong and can lead to errors of unsafe include paths.

Instead, make it depend on the host-pkgconf package and specify the path
to our pkgconfig binary by using the --pkgconfig configure option.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
