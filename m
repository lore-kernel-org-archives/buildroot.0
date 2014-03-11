From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Mar 2014 23:02:13 +0100
Subject: [Buildroot] [git commit] ipsec-tools: fix static linking
Message-ID: <20140311220647.7ECBF9BF05@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=caccb8bf32d2ef9c52712f377fd9c3fcc0a52b94
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As with other packages that use openssl and don't use pkg-config to
pick up the deps it fails to build for static scenarios.
So fix it by adding the zlib link option to LIBS.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ipsec-tools/ipsec-tools.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

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
