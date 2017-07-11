From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Jul 2017 21:38:43 +0200
Subject: [Buildroot] [git commit] pcre2: enable no MMU build
Message-ID: <20170711193642.B083D80767@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2ab924213d3d50b176f1b8efaecb5fcaef28dae4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use '--disable-pcre2grep-callout' for !BR2_USE_MMU, disables
fork usage.

Fixes [1]:

    CCLD     pcre2grep
  src/pcre2grep-pcre2grep.o: In function `pcre2grep_callout':
  pcre2grep.c:(.text+0x402): undefined reference to `fork'
  collect2: error: ld returned 1 exit status

[1] http://autobuild.buildroot.net/results/2c2/2c2665844748a3bdb010315200eea70aa3504b95

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pcre2/pcre2.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
index 5b7a163..b7da1ed 100644
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
