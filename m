From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 10 Jul 2017 20:51:22 +0200
Subject: [Buildroot] [PATCH v1] pcre2: enable no MMU build
Message-ID: <20170710185122.16031-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use '--disable-pcre2grep-callout' for !BR2_USE_MMU, disables
fork usage.

Fixes [1]:

    CCLD     pcre2grep
  src/pcre2grep-pcre2grep.o: In function `pcre2grep_callout':
  pcre2grep.c:(.text+0x402): undefined reference to `fork'
  collect2: error: ld returned 1 exit status

[1] http://autobuild.buildroot.net/results/2c2/2c2665844748a3bdb010315200eea70aa3504b95

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/pcre2/pcre2.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
index 5b7a163255..b7da1ed991 100644
--- a/package/pcre2/pcre2.mk
+++ b/package/pcre2/pcre2.mk
@@ -16,5 +16,10 @@ PCRE2_CONF_OPTS += --enable-pcre2-8
 PCRE2_CONF_OPTS += $(if $(BR2_PACKAGE_PCRE2_16),--enable-pcre2-16,--disable-pcre2-16)
 PCRE2_CONF_OPTS += $(if $(BR2_PACKAGE_PCRE2_32),--enable-pcre2-32,--disable-pcre2-32)
 
+# disable fork usage if not available
+ifeq ($(BR2_USE_MMU),)
+PCRE2_CONF_OPTS += --disable-pcre2grep-callout
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.11.0
