From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 26 Jan 2017 16:39:31 -0500
Subject: [Buildroot] [V2 2/2] sngrep: fix error if gnutls and openssl are
	both enabled.
In-Reply-To: <20170126213931.9987-1-aduskett@codeblue.com>
References: <20170126213931.9987-1-aduskett@codeblue.com>
Message-ID: <20170126213931.9987-2-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the changes applied by thomas I noticed that sngrep will now
fail to configure if both openssl and gnutls are selected
(both can't be enabled at the same time.)  I set openssl to take
precidence over gnutls, mainly because it's the larger of the two
dependencies, and if the user has selected it they probably want
to use it.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
v1 -> v2:
  - Changed else to else ifeq ($(BR2_PACKAGE_GNUTLS),y)
  
 package/sngrep/sngrep.mk | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/package/sngrep/sngrep.mk b/package/sngrep/sngrep.mk
index 5b51762..0008c1d 100644
--- a/package/sngrep/sngrep.mk
+++ b/package/sngrep/sngrep.mk
@@ -14,17 +14,14 @@ SNGREP_DEPENDENCIES = libpcap ncurses libgcrypt
 # our ncurses wchar support is not properly detected
 SNGREP_CONF_OPTS += --disable-unicode
 
-ifeq ($(BR2_PACKAGE_GNUTLS),y)
-SNGREP_DEPENDENCIES += gnutls
-SNGREP_CONF_OPTS += --with-gnutls
-else
-SNGREP_CONF_OPTS += --without-gnutls
-endif
-
+# openssl and gnutls can't be enable at the same time.
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 SNGREP_DEPENDENCIES += openssl
 SNGREP_CONF_OPTS += --with-openssl
-else
+SNGREP_CONF_OPTS += --without-gnutls
+else ifeq ($(BR2_PACKAGE_GNUTLS),y)
+SNGREP_DEPENDENCIES += gnutls
+SNGREP_CONF_OPTS += --with-gnutls
 SNGREP_CONF_OPTS += --without-openssl
 endif
 
-- 
2.9.3
