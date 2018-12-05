From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Wed,  5 Dec 2018 17:06:16 +0100
Subject: [Buildroot] [PATCH 1/3] package/pkg-rebar.mk: Fix
 remove-rebar-config-dependencies
Message-ID: <20181205160618.6884-1-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Handle the case where there is only one dependency described in
rebar.config, so when the line starts by '{deps' and ends by '}.'.
Before it was deleting this line but also all next lines until finding
a line that ends by '}.'.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/pkg-rebar.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pkg-rebar.mk b/package/pkg-rebar.mk
index b6b095929c..838e7681de 100644
--- a/package/pkg-rebar.mk
+++ b/package/pkg-rebar.mk
@@ -96,7 +96,8 @@ endef
 
 # Remove the "deps" statement from a rebar.config file
 define remove-rebar-config-dependencies
-	$(SED) '/^{deps/,/}\.$$/d' $($(PKG)_DIR)/rebar.config
+	$(SED) '/^{deps.*}\.$$/d' -e '/^{deps/,/}\.$$/d' \
+		$($(PKG)_DIR)/rebar.config
 endef
 
 
-- 
2.17.1
