From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 29 Aug 2015 09:46:35 +0200
Subject: [Buildroot] [PATCH] openssh: fix static compilation
Message-ID: <20150829074635.GA14683@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

PIE and static doesn't work on Linux.

Fixes:
http://autobuild.buildroot.net/results/dce/dce0202e039f4636d68532c4aab8738938b76650/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/openssh/openssh.mk |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index b95914b..fb5779e 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -26,6 +26,10 @@ endef
 ifeq ($(BR2_arc),y)
 OPENSSH_CONF_OPTS += --without-pie
 endif
+# PIE and static does not work on Linux
+ifeq ($(BR2_STATIC_LIBS),y)
+OPENSSH_CONF_OPTS += --without-pie
+endif
 
 OPENSSH_DEPENDENCIES = zlib openssl
 
-- 
1.7.10.4
