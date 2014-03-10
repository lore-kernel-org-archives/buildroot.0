From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 10 Mar 2014 17:26:25 -0300
Subject: [Buildroot] [PATCH 05/14] ipsec-tools: fix static linking
In-Reply-To: <1394483194-17592-1-git-send-email-gustavo@zacarias.com.ar>
References: <1394483194-17592-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1394483194-17592-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As with other packages that use openssl and don't use pkg-config to
pick up the deps it fails to build for static scenarios.
So fix it by adding the zlib link option to LIBS.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ipsec-tools/ipsec-tools.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/ipsec-tools/ipsec-tools.mk b/package/ipsec-tools/ipsec-tools.mk
index d5521ac..44c3380 100644
--- a/package/ipsec-tools/ipsec-tools.mk
+++ b/package/ipsec-tools/ipsec-tools.mk
@@ -15,6 +15,11 @@ IPSEC_TOOLS_DEPENDENCIES = openssl flex host-flex
 # configure hardcodes -Werror, so override CFLAGS on make invocation
 IPSEC_TOOLS_MAKE_OPT = CFLAGS='$(TARGET_CFLAGS)'
 
+# openssl uses zlib, so we need to explicitly link with it when static
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+IPSEC_TOOLS_CONF_ENV += LIBS=-lz
+endif
+
 IPSEC_TOOLS_CONF_OPT = \
 	  --disable-hybrid \
 	  --without-libpam \
-- 
1.8.3.2
