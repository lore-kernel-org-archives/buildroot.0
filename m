From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Oct 2018 01:50:35 +0200
Subject: [Buildroot] [git commit] nss-mdns: do not unconditionally override
 hosts: line in nsswitch.conf
Message-ID: <20181020234904.F40A788085@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=27d22993baf6738f39bc74bebb17fd2256d0a4a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead, add mdns4_minimal / mdns4 around the dns entry if missing.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nss-mdns/nss-mdns.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/nss-mdns/nss-mdns.mk b/package/nss-mdns/nss-mdns.mk
index 63f40e718a..1512ea2e7f 100644
--- a/package/nss-mdns/nss-mdns.mk
+++ b/package/nss-mdns/nss-mdns.mk
@@ -9,8 +9,9 @@ NSS_MDNS_SITE = http://0pointer.de/lennart/projects/nss-mdns
 NSS_MDNS_LICENSE = LGPL-2.1+
 NSS_MDNS_LICENSE_FILES = LICENSE
 
+# add mdns4_minimal / mdns around the dns provider if missing
 define NSS_MDNS_INSTALL_CONFIG
-	sed -r -i -e 's/^(hosts:[[:space:]]+).*/\1files mdns4_minimal [NOTFOUND=return] dns mdns4/' \
+	$(SED) '/^hosts:/ {/mdns4/! s/dns/mdns4_minimal [NOTFOUND=return] dns mdns4/}' \
 		$(TARGET_DIR)/etc/nsswitch.conf
 endef
 
