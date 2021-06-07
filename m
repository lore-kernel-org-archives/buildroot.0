From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 07 Jun 2021 15:17:44 -0000
Subject: [Buildroot] [git commit] package/poke: add optional json-c
 dependency
Message-ID: <20210607144653.831C68B398@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5ee77341114fec8d0e35bf9069898713822449e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From [1]:
"The poke machine-interface uses a protocol to communicate with
clients, which is based on JSON.  poke uses the json-c library to
parse and build JSON strings.
If this library is not found, poke will build without machine-interface
support."

[1] https://git.savannah.nongnu.org/cgit/poke.git/tree/DEPENDENCIES?h=releases/poke-1.2#n55

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Jose E. Marchesi <jemarch@gnu.org>
Cc: Luca Saiu <positron@gnu.org>
Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/poke/poke.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/poke/poke.mk b/package/poke/poke.mk
index c0217b6fad..7c3c81d93c 100644
--- a/package/poke/poke.mk
+++ b/package/poke/poke.mk
@@ -19,7 +19,13 @@ POKE_DEPENDENCIES = host-flex host-bison host-pkgconf bdwgc readline
 POKE_CONF_OPTS = \
 	--disable-gui \
 	--disable-libnbd \
-	--disable-mi \
 	--with-libreadline-prefix=$(STAGING_DIR)
 
+ifeq ($(BR2_PACKAGE_JSON_C),y)
+POKE_DEPENDENCIES += json-c
+POKE_CONF_OPTS += --enable-mi
+else
+POKE_CONF_OPTS += --disable-mi
+endif
+
 $(eval $(autotools-package))
