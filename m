From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Nov 2013 23:32:11 +0100
Subject: [Buildroot] [git commit] pcre: add options to enable UTF and UCP
	support
Message-ID: <20131201201519.B8F1A9BE44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=49fef2fc44358df6cd5cc1c8416222ff26f00af2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Allow to compile PCRE with UTF-8/16/32 support and with
support for Unicode properties.

[Peter: whitespace fix]
Signed-off-by: Sven Neumann <neumann@teufel.de>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pcre/Config.in |   12 ++++++++++++
 package/pcre/pcre.mk   |    2 ++
 2 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/package/pcre/Config.in b/package/pcre/Config.in
index dc92274..9d3a143 100644
--- a/package/pcre/Config.in
+++ b/package/pcre/Config.in
@@ -19,4 +19,16 @@ config BR2_PACKAGE_PCRE_32
 	help
 	  This option builds the 32-bits pcre library, i.e 'libpcre32'
 
+config BR2_PACKAGE_PCRE_UTF
+	bool "UTF-8/16/32 support in pcre"
+	help
+	  This option builds the pcre library with UTF-8/16/32 support
+
+config BR2_PACKAGE_PCRE_UCP
+	bool "Unicode properties support in pcre"
+	select BR2_PACKAGE_PCRE_UTF
+	help
+	  This option builds the pcre library with Unicode properties
+	  support (implies UTF-8/16/32 support)'
+
 endif
diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index bf86a3d..2637354 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -19,5 +19,7 @@ endif
 PCRE_CONF_OPT += --enable-pcre8
 PCRE_CONF_OPT += $(if $(BR2_PACKAGE_PCRE_16),--enable-pcre16,--disable-pcre16)
 PCRE_CONF_OPT += $(if $(BR2_PACKAGE_PCRE_32),--enable-pcre32,--disable-pcre32)
+PCRE_CONF_OPT += $(if $(BR2_PACKAGE_PCRE_UTF),--enable-utf,--disable-utf)
+PCRE_CONF_OPT += $(if $(BR2_PACKAGE_PCRE_UCP),--enable-unicode-properties,--disable-unicode-properties)
 
 $(eval $(autotools-package))
