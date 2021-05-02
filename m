From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  2 May 2021 23:49:18 +0200
Subject: [Buildroot] [PATCH 4/5] package/poke: add optional json-c dependency
In-Reply-To: <20210502214919.1826571-1-romain.naour@gmail.com>
References: <20210502214919.1826571-1-romain.naour@gmail.com>
Message-ID: <20210502214919.1826571-5-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 package/poke/poke.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/poke/poke.mk b/package/poke/poke.mk
index ecf2221acd..268b9598d7 100644
--- a/package/poke/poke.mk
+++ b/package/poke/poke.mk
@@ -17,7 +17,13 @@ POKE_DEPENDENCIES = host-flex host-bison host-pkgconf bdwgc readline
 
 POKE_CONF_OPTS = --disable-gui \
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
-- 
2.30.2
