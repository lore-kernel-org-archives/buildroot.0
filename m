From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Dec 2018 17:24:14 +0100
Subject: [Buildroot] [git commit] package/pkg-rebar.mk: fix
 remove-rebar-config-dependencies
Message-ID: <20181209162058.A9309883A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab60ea293916dc61e6e2e4ffaa4ff0555386e02c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Handle the case where there is only one dependency described in
rebar.config, so when the line starts by '{deps' and ends by '}.'.
Before it was deleting this line but also all next lines until finding
a line that ends by '}.'.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
 
 
